/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.billing.web.controller.billingqueuedia;

import java.awt.Font;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.collections.ListUtils;
import org.apache.commons.lang.math.NumberUtils;

import org.openmrs.Concept;
import org.openmrs.ConceptClass;
import org.openmrs.ConceptSet;

import org.openmrs.OrderType;
import org.openmrs.Patient;
import org.openmrs.PersonAttribute;
import org.openmrs.User;
import org.openmrs.api.context.Context;
import org.openmrs.module.billing.util.BillingConstants;
import org.openmrs.module.hospitalcore.BillingService;
import org.openmrs.module.hospitalcore.LabService;
import org.openmrs.module.hospitalcore.MedisunService;
import org.openmrs.module.hospitalcore.RadiologyCoreService;
import org.openmrs.module.hospitalcore.concept.TestTree;
import org.openmrs.module.hospitalcore.model.BillableService;
import org.openmrs.module.hospitalcore.model.DiaBarcodeGroup;
import org.openmrs.module.hospitalcore.model.DiaLabSampleid;
import org.openmrs.module.hospitalcore.model.DiaPatientServiceBill;
import org.openmrs.module.hospitalcore.model.DiaPatientServiceBillItem;
import org.openmrs.module.hospitalcore.model.DiaRmpName;
import org.openmrs.module.hospitalcore.model.DocDetail;
import org.openmrs.module.hospitalcore.model.Lab;
import org.openmrs.module.hospitalcore.model.PatientSearch;
import org.openmrs.module.hospitalcore.model.RadiologyDepartment;
import org.openmrs.module.hospitalcore.util.GlobalPropertyUtil;
import org.openmrs.module.hospitalcore.util.HospitalCoreConstants;
import org.openmrs.module.hospitalcore.util.PatientUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author khairul
 */
@Controller("BillPrintController")
public class BillPrint {

    @RequestMapping(value = "/module/billing/billprint.htm", method = RequestMethod.GET)
    public String billPrintView(@RequestParam("patientId") Integer patientId,
            @RequestParam(value = "refDocId", required = false) Integer refDocId,
            @RequestParam(value = "refRmpId", required = false) Integer refRmpId,
            @RequestParam(value = "billId", required = false) Integer billId,
            @RequestParam(value = "orderId", required = false) Integer orderId,
            @RequestParam(value = "date", required = false) String dStr, HttpServletRequest request, Model model) throws Exception {
        Patient patient = Context.getPatientService().getPatient(patientId);

        MedisunService ms = Context.getService(MedisunService.class);

        PatientSearch patientSearch = ms.getPatientSerachByID(patientId);
        model.addAttribute("patientSearch", patientSearch);

        BigDecimal paidAmount = NumberUtils.createBigDecimal(request.getParameter("paid"));
        model.addAttribute("paid", paidAmount);

        DiaPatientServiceBill dpsb = ms.getDiaPatientServiceBillId(billId);
        model.addAttribute("dpsb", dpsb);

        DocDetail docInfo = ms.getDocInfoById(refDocId);
        model.addAttribute("docInfo", docInfo);
        
        DiaRmpName rmpInfo = ms.getDiaRmpById(refRmpId);
        model.addAttribute("rmpInfo", rmpInfo);

        List<BillableService> diaBillOrderList = ms.getDiaBillingOrderandPatientId(orderId, patientId);
        model.addAttribute("billOrderList", diaBillOrderList);

        List<DiaPatientServiceBillItem> diaBillItemList = ms.getDiaBillItemByBillId(billId);
        model.addAttribute("diaBillItemList", diaBillItemList);

        List<DiaLabSampleid> diaSam = ms.getSampleIdByBillId(billId);
        model.addAttribute("diaSam", diaSam);

        PersonAttribute phone = patient.getAttribute("Phone Number");
        if (phone != null) {
            model.addAttribute("phone", phone.getValue());
        }

        //////// Barcode Print 
        Set<Integer> labConceptIds = getLabConceptIds();
        Set<Integer> radiologyConceptIds = getRadiologyConceptIds();

        Integer medicalExaminationClassId = GlobalPropertyUtil.getInteger(HospitalCoreConstants.PROPERTY_MEDICAL_EXAMINATION, 9);
        ConceptClass medicalExaminationClass = Context.getConceptService().getConceptClass(medicalExaminationClassId);

        List<Integer> cId = new ArrayList<Integer>();
        List<String> cn = new ArrayList<String>();

        for (DiaPatientServiceBillItem item : dpsb.getBillItems()) {
            Concept concept = Context.getConceptService().getConcept(item.getService().getConceptId());
            // If item is a medical examination set
            if (concept.getConceptClass().equals(medicalExaminationClass)) {
                Collection<ConceptSet> conceptSets = concept.getConceptSets();
                if (conceptSets != null && conceptSets.size() > 0) {
                    for (ConceptSet con : conceptSets) {
                        if (labConceptIds.contains(con.getConcept().getConceptId())) {
                            cId.add(con.getId());
                            cn.add(con.getConcept().getName().getName());
                        } else if (radiologyConceptIds.contains(con.getConcept().getConceptId())) {
                        }
                    }
                }
            } else {
                if (labConceptIds.contains(concept.getConceptId())) {
                    cId.add(concept.getId());
                    cn.add(concept.getName().getName());

                } else if (radiologyConceptIds.contains(concept.getConceptId())) {

                }
            }
        }

        model.addAttribute("con", cId);
        model.addAttribute("cn", cn);
        List<String> a = new ArrayList<String>();
        for (int i = 0; i < diaSam.size(); i++) {
            a.add(diaSam.get(i).getSampleId());
        }

        List<Integer> conceptId = new ArrayList<Integer>();
        for (int i = 0; i < cId.size(); i++) {
            conceptId.add(cId.get(i));
        }

        Map<String, String> map = new HashMap();

        List<TestModel> tmn = new ArrayList<TestModel>();
        List<TestModelTest> tmt = new ArrayList<TestModelTest>();

        for (int i = 0; i < cn.size(); i++) {
            TestModel tm = new TestModel();
            tm.setName(cn.get(i));
            tm.setSampleId(a.get(i));
            tm.setConceptId(conceptId.get(i));

            tmn.add(tm);
        }

        /////////////////// date  17 july
        List<Integer> listConceptAll = new ArrayList<Integer>();

        for (int i = 0; i < tmn.size(); i++) {
            Integer ci = tmn.get(i).getConceptId();
            listConceptAll.add(ci);
        }

        model.addAttribute("conId", conceptId);
        model.addAttribute("listConceptAll", listConceptAll);

        List<Integer> group1 = new ArrayList();
        List<Integer> group2 = new ArrayList<Integer>();
        List<Integer> group3 = new ArrayList<Integer>();
        List<Integer> group4 = new ArrayList<Integer>();
        List<Integer> group5 = new ArrayList<Integer>();

        List<DiaBarcodeGroup> dbg = ms.listDiaBarcodeGroup();
        for (int i = 0; i < dbg.size(); i++) {
            Integer g1 = dbg.get(i).getGroup1();
            Integer g2 = dbg.get(i).getGroup2();
            Integer g3 = dbg.get(i).getGroup3();
            Integer g4 = dbg.get(i).getGroup4();
            Integer g5 = dbg.get(i).getGroup5();

            group1.add(g1);
            group2.add(g2);
            group3.add(g3);
            group4.add(g4);
            group5.add(g5);

        }
     //   group1.retainAll(listConceptAll);
        // group2.retainAll(listConceptAll);

        model.addAttribute("group1", group1);
        model.addAttribute("group2", group2);
        model.addAttribute("group3", group3);
        model.addAttribute("group4", group4);
        model.addAttribute("group5", group5);

        String conceptNameWithComma1 = new String();
        String conceptNameWithComma2 = new String();
        String conceptNameWithComma3 = new String();
        String conceptNameWithComma4 = new String();

        for (int i = 0; i < tmn.size(); i++) {
            String conceptName = tmn.get(i).getName();
            Integer cid = tmn.get(i).getConceptId();

            if (group1.contains(cid)) {
                conceptNameWithComma1 += conceptName + "<br>"; // group one
            }else if (group2.contains(cid)) {  // Individual
                TestModelTest tm = new TestModelTest();
                tm.setName(conceptName);
                tmt.add(tm);
            } 
            else if (group3.contains(cid)) {  // group three
                conceptNameWithComma2 +=conceptName + "<br>";
            }
            else if (group4.contains(cid)) {  // group four
                conceptNameWithComma3 +=conceptName + "<br>";
            }
            else if (group5.contains(cid)) {  // group five
                conceptNameWithComma4 +=conceptName + "<br>";
            }
        }
        TestModelTest tm = new TestModelTest();
        tm.setName(conceptNameWithComma1);
        tm.setName1(conceptNameWithComma2);
        tm.setName2(conceptNameWithComma3);
        tm.setName3(conceptNameWithComma4);
        tmt.add(tm);

        model.addAttribute("tmt", tmt);
        model.addAttribute("tmn", tmn);
        model.addAttribute("c2", conceptNameWithComma2);
        model.addAttribute("c3", conceptNameWithComma3);
        model.addAttribute("c4", conceptNameWithComma4);
         

        //////////////////// End Barcode Print ////////////////
        model.addAttribute("patient", patient);
        Date birthday = patient.getBirthdate();
        model.addAttribute("age", PatientUtils.estimateAge(birthday));
        model.addAttribute("billId", billId);
        User user = Context.getAuthenticatedUser();
        model.addAttribute("billOfficer", user);

        return "module/billing/private/printBill";
    }

    @RequestMapping(value = "/module/billing/billprint.htm", method = RequestMethod.POST)
    public String billPrintSubmit(@RequestParam("patientId") Integer patientId,
            @RequestParam(value = "billId", required = false) Integer billId,
            @RequestParam(value = "date", required = false) String dStr, HttpServletRequest request, Model model) throws Exception {
        Patient patient = Context.getPatientService().getPatient(patientId);
        MedisunService ms = Context.getService(MedisunService.class);
        BillingService billingService = (BillingService) Context.getService(BillingService.class);

        DiaPatientServiceBill diaPatSerBill = ms.getDiaPatientServiceBillId(billId);

        if (diaPatSerBill != null && !diaPatSerBill.getPrinted()) {
            diaPatSerBill.setPrinted(Boolean.TRUE);

            Map<String, String> attributes = PatientUtils.getAttributes(diaPatSerBill.getPatient());

            ms.saveBillEncounterAndOrder(diaPatSerBill);
        }

        // return "redirect:/module/billing/directbillingqueue.form";
        return "redirect:/findPatient.htm";
        // module/billing/directbillingqueue.form
    }

    private Set<Integer> getRadiologyConceptIds() {
        Set<Integer> conceptIdSet = new HashSet<Integer>();
        RadiologyCoreService rcs = (RadiologyCoreService) Context.getService(RadiologyCoreService.class);
        List<RadiologyDepartment> departments = rcs.getAllRadiologyDepartments();
        for (RadiologyDepartment department : departments) {
            conceptIdSet.addAll(getConceptIdSet(department.getInvestigations()));
        }
        return conceptIdSet;
    }

    private Set<Integer> getLabConceptIds() {
        Set<Integer> conceptIdSet = new HashSet<Integer>();
        LabService ls = (LabService) Context.getService(LabService.class);
        List<Lab> labs = ls.getAllLab();
        for (Lab lab : labs) {
            conceptIdSet.addAll(getConceptIdSet(lab.getInvestigationsToDisplay()));
        }
        return conceptIdSet;
    }

    private Set<Integer> getConceptIdSet(Set<Concept> concepts) {
        Set<Integer> conceptIdSet = new HashSet<Integer>();
        for (Concept concept : concepts) {
            TestTree tree = new TestTree(concept);
            conceptIdSet.addAll(tree.getConceptIDSet());
        }
        return conceptIdSet;
    }

}
