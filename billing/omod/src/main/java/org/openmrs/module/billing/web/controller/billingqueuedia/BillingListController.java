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
import java.math.RoundingMode;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.krysalis.barcode4j.HumanReadablePlacement;
import org.krysalis.barcode4j.impl.code128.Code128Bean;
import org.krysalis.barcode4j.output.bitmap.BitmapCanvasProvider;
import org.krysalis.barcode4j.tools.UnitConv;

import org.openmrs.Concept;
import org.openmrs.ConceptClass;
import org.openmrs.ConceptSet;
import org.openmrs.Encounter;
import org.openmrs.EncounterType;
import org.openmrs.Location;
import org.openmrs.Patient;
import org.openmrs.PersonAddress;
import org.openmrs.PersonAttribute;
import org.openmrs.User;
import org.openmrs.api.ConceptService;
import org.openmrs.api.context.Context;
import org.openmrs.module.hospitalcore.MedisunService;
import org.openmrs.module.hospitalcore.model.BillableService;
import org.openmrs.module.hospitalcore.model.DiaBillingOrder;
import org.openmrs.module.hospitalcore.util.PatientUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.openmrs.module.hospitalcore.model.DiaBillingQueue;
import org.openmrs.module.hospitalcore.model.DiaReceipt;
import org.openmrs.module.hospitalcore.model.DocDetail;
import org.openmrs.module.hospitalcore.model.MarDetails;
import org.openmrs.module.hospitalcore.util.GlobalPropertyUtil;
import org.openmrs.module.billing.util.BillingConstants;
import org.openmrs.module.hospitalcore.BillingService;
import org.openmrs.module.hospitalcore.LabService;
import org.openmrs.module.hospitalcore.RadiologyCoreService;
import org.openmrs.module.hospitalcore.concept.TestTree;
import org.openmrs.module.hospitalcore.model.DiaCommissionCal;
import org.openmrs.module.hospitalcore.model.DiaLabSampleid;
import org.openmrs.module.hospitalcore.model.DiaPatientServiceBill;
import org.openmrs.module.hospitalcore.model.DiaPatientServiceBillCollect;
import org.openmrs.module.hospitalcore.model.DiaPatientServiceBillItem;
import org.openmrs.module.hospitalcore.model.Lab;
import org.openmrs.module.hospitalcore.model.PatientSearch;
import org.openmrs.module.hospitalcore.model.RadiologyDepartment;
import org.openmrs.module.hospitalcore.util.HospitalCoreConstants;

/**
 *
 * @author khairul
 */
@Controller("BillingListController")
public class BillingListController {

    @RequestMapping(value = "/module/billing/billorder.form", method = RequestMethod.GET)
    public String billList(@RequestParam("patientId") Integer patientId,
            @RequestParam(value = "refDocId", required = false) Integer refDocId,
            @RequestParam(value = "refMarId", required = false) Integer refMarId,
            @RequestParam(value = "orderId", required = false) Integer orderId,
            @RequestParam(value = "refRmpId", required = false) Integer refRmpId,
            @RequestParam(value = "date", required = false) String dStr, Model model) {
        Patient patient = Context.getPatientService().getPatient(patientId);

        Date birthday = patient.getBirthdate();
        model.addAttribute("age", PatientUtils.estimateAge(birthday));

        MedisunService ms = Context.getService(MedisunService.class);

        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        Date date = null;
        try {
            date = sdf.parse(dStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        if (refDocId != null) {
            DocDetail docInfo = ms.getDocInfoById(refDocId);
            model.addAttribute("docInfo", docInfo);
        }

        if (refMarId != null) {
            MarDetails marInfo = ms.getMarInfoById(refMarId);
            model.addAttribute("marInfo", marInfo);
        }

        PatientSearch patientSearch = ms.getPatientSerachByID(patientId);
        model.addAttribute("patientSearch", patientSearch);

        String dateStr = sdf.format(new Date());
        model.addAttribute("currentDate", dateStr);
        model.addAttribute("patient", patient);

        if (refDocId == null) {
            model.addAttribute("refDocId", "0");
        } else {
            model.addAttribute("refDocId", refDocId);
        }

        if (refMarId == null) {
            model.addAttribute("refMarId", "0");
        } else {
            model.addAttribute("refMarId", refMarId);
        }

        if (orderId == null) {
            model.addAttribute("orderId", "0");
        } else {
            model.addAttribute("orderId", orderId);
        }

        PersonAddress add = patient.getPersonAddress();
        model.addAttribute("add", add);

        PersonAttribute phone = patient.getAttribute("Phone Number");
        if (phone != null) {
            model.addAttribute("phone", phone.getValue());
        }

        if (refRmpId == null) {
            model.addAttribute("refRmpId", "0");
        } else {
            model.addAttribute("refRmpId", refRmpId);
        }

        // PersonAttribute relationTypeattr = admission.getPatient().getAttribute("Relative Name Type");
        return "module/billing/private/billOrder";
    }

    @RequestMapping(value = "/module/billing/billService.form", method = RequestMethod.POST)
    public String billServiceGet(ServiceResultCommand command, HttpServletRequest request,
            @RequestParam("patientId") Integer patientId,
            @RequestParam(value = "refDocId", required = false) Integer refDocId,
            @RequestParam(value = "refMarId", required = false) Integer refMarId,
            @RequestParam(value = "orderId", required = false) Integer orderId,
            @RequestParam(value = "refRmpId", required = false) Integer refRmpId,
            // @RequestParam(value = "selectedTestId", required = false) String drugOrder,
            // @RequestParam(value = "selectedTestId", required = false) Integer selectedTestId,
            Model model) throws Exception {
        Patient patient = Context.getPatientService().getPatient(patientId);

        ConceptService cs = Context.getConceptService();
        MedisunService ms = Context.getService(MedisunService.class);

        List<String> encounterList = new ArrayList();

        User creator = Context.getAuthenticatedUser();

        if (!ArrayUtils.isEmpty(command.getSelectedTestId())) {

            //Encounter encounter = createEncounter(patient, parameters);
            //encounter = Context.getEncounterService().saveEncounter(encounter);
            EncounterType encounterType = null;
            String encounterTypeName = GlobalPropertyUtil.getString(BillingConstants.PROPERTY_ENCOUNTER_TYPE_DIRECT, "BILLINGENCOUNTER");
            encounterType = Context.getEncounterService().getEncounterType(encounterTypeName);

            // get location
            Location location = new Location(Integer.valueOf(1));

            // create encounter
            Encounter encounter = new Encounter();
            encounter.setEncounterType(encounterType);
            encounter.setCreator(Context.getAuthenticatedUser());
            encounter.setProvider(Context.getAuthenticatedUser().getPerson());
            encounter.setEncounterDatetime(new Date());
            encounter.setPatient(patient);
            encounter.setLocation(location);
            encounter = Context.getEncounterService().saveEncounter(encounter);
            encounterList.add(encounter.getEncounterId().toString());

            for (Integer pId : command.getSelectedTestId()) {
                DiaBillingOrder dbo = new DiaBillingOrder();
                dbo.setPatientId(patientId);
                dbo.setOrderId(orderId);
                dbo.setCreator(creator.getId());
                dbo.setCreatedDate(new Date());
                dbo.setConceptId(pId);
                dbo.setEncounterId(encounter.getEncounterId());

                Concept c = cs.getConcept(pId);
                String a = c.getName().getName();
                dbo.setServiceName(a);

                ms.saveDiaBillingOrder(dbo);

            }
        }
        String d = StringUtils.join(encounterList, ",");

        //return "redirect:/module/billing/patientServiceBillForBD.list?patientId=" + patientId;
        return "redirect:/module/billing/orderStore.form?patientId=" + patientId
                + "&refDocId=" + refDocId + "&refMarId=" + refMarId + "&orderId=" + orderId
                + "&encounterId=" + d + "&refRmpId=" + refRmpId;

    }
}
