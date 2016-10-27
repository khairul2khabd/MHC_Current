/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.billing.web.controller.billingqueuedia;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.openmrs.Concept;
import org.openmrs.Patient;
import org.openmrs.PersonAttribute;
import org.openmrs.User;
import org.openmrs.api.ConceptService;
import org.openmrs.api.context.Context;
import org.openmrs.module.hospitalcore.BillingService;
import org.openmrs.module.hospitalcore.MedisunService;
import org.openmrs.module.hospitalcore.model.BillableService;
import org.openmrs.module.hospitalcore.model.DiaBillingOrder;
import org.openmrs.module.hospitalcore.model.DiaBillingQueue;
import org.openmrs.module.hospitalcore.model.DiaCommissionCal;
import org.openmrs.module.hospitalcore.model.DiaPatientServiceBill;
import org.openmrs.module.hospitalcore.util.PatientUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.openmrs.module.hospitalcore.model.DiaPatientServiceBillItem;
import org.openmrs.module.hospitalcore.model.DiaPatientServiceBillCollect;
import org.openmrs.module.hospitalcore.model.DocDetail;
import org.openmrs.module.hospitalcore.model.PatientSearch;

/**
 *
 * @author khairul
 */
@Controller("BillingDetailsController")
public class BillingDetailsPayment {

    @RequestMapping(value = "/module/billing/billdetails.form", method = RequestMethod.GET)
    public String billAddEdit(@RequestParam(value="patientId", required = false) Integer patientId,
            @RequestParam(value = "refDocId", required = false) Integer refDocId,
            @RequestParam(value = "refMarId", required = false) Integer refMarId,
            @RequestParam(value = "orderId", required = false) Integer orderId,
            @RequestParam(value = "encounterId", required = false) Integer enocounterId,
            @RequestParam(value = "date", required = false) String dStr, Model model) {
        
        MedisunService ms = Context.getService(MedisunService.class);
        List<BillableService> diaBillOrderList = ms.getDiaBillingOrderandPatientId(orderId, patientId);
        model.addAttribute("billOrderList", diaBillOrderList);
        
        List<DiaBillingOrder> dbo=ms.getDiaBillOrderByPatientIdOrderId(patientId, orderId);
        model.addAttribute("dbo", dbo);
        ConceptService cs = Context.getConceptService();
      //  Concept c=cs.getConcept(2215);
      //  model.addAttribute("c", c);
//        List<String> cn = new ArrayList();
//           
//        for (int i = 0; i < dbo.size(); i++) {
//             Concept c=cs.getConcept(dbo.get(i).getConceptId()); 
//             String a = c.getName().getName();
//      }     model.addAttribute("cn", cn);
//        
        PatientSearch patientSearch = ms.getPatientSerachByID(patientId);
        model.addAttribute("patientSearch", patientSearch);

        model.addAttribute("patientId", patientId);
        model.addAttribute("orderId", orderId);
        model.addAttribute("encounterId", enocounterId);
        
        return "module/billing/private/addedit";
    }
    
    @RequestMapping(value = "/module/billing/removeSer.htm", method = RequestMethod.GET)
    public String serviceReomve( //@RequestParam("patientId") Integer patientId,
            
            @RequestParam(value = "id", required = false) Integer id,
            @RequestParam(value = "patientId", required = false) Integer patientId,
            @RequestParam(value = "orderId", required = false) Integer orderId,
            @RequestParam(value = "date", required = false) String dStr, Model model) {
        
        MedisunService ms = Context.getService(MedisunService.class);
        
        DiaBillingOrder d=ms.getDiaBillOrderById(id);
        ms.removeDiaBillOrder(d);
        model.addAttribute("patientId",patientId);
        model.addAttribute("orderId",orderId);
        model.addAttribute("encounterId",d.getEncounterId());
        return "redirect:/module/billing/billdetails.form";               
    }
    @RequestMapping(value = "/module/billing/serviceUpdate.htm", method = RequestMethod.POST)
    public String serviceUpdate( //@RequestParam("patientId") Integer patientId,
            
            //@RequestParam(value = "id", required = false) Integer id,
            ServiceResultCommandNew command,
            @RequestParam(value = "patientId", required = false) Integer patientId,
            @RequestParam(value = "orderId", required = false) Integer orderId,
            @RequestParam(value = "encounterId", required = false) Integer encounterId,      
            @RequestParam(value = "date", required = false) String dStr, Model model) {
        
        MedisunService ms = Context.getService(MedisunService.class);
        ConceptService cs=Context.getService(ConceptService.class);
        
         for (Integer pId : command.getSelectedTestDetails()) {
                DiaBillingOrder dbo = new DiaBillingOrder();
                dbo.setPatientId(patientId);
                dbo.setOrderId(orderId);
                dbo.setCreator(Context.getAuthenticatedUser().getId());
                dbo.setCreatedDate(new Date());
                dbo.setConceptId(pId);
                dbo.setEncounterId(encounterId);
                Concept c=cs.getConcept(pId);
                String a = c.getName().getName();
                dbo.setServiceName(a);
                ms.saveDiaBillingOrder(dbo);
            }
        return "module/billing/thickbox/success";           
    }
    //Due Bill Collect 
    @RequestMapping(value = "/module/billing/searchBill.htm", method = RequestMethod.GET)
    public String searchBill(@RequestParam("billId") String billId, Model model) {
        MedisunService ms = Context.getService(MedisunService.class);
        int bId = 0;
        try {
            bId = Integer.parseInt(billId);
        } catch (NumberFormatException e) {
            model.addAttribute("Found", "Cannot find bill");
            return "redirect:/module/billing/directbillingqueue.form";
        }
        DiaPatientServiceBill dpsb = ms.getDiaPatientServiceBillId(bId);
        if (null != dpsb) {
            return "redirect:/module/billing/dueBill.htm?patientId=" + dpsb.getPatient().getId()
                    + "&billId=" + dpsb.getBillId() + "&refDocId=" + dpsb.getRefDocId();
        } else {
            model.addAttribute("Found", "Cannot find bill");
            return "redirect:/module/billing/directbillingqueue.form";
        }
    }

    @RequestMapping(value = "/module/billing/dueBill.htm", method = RequestMethod.GET)
    public String billSave(@RequestParam("patientId") Integer patientId,
            @RequestParam("billId") Integer billId,
            @RequestParam(value = "refDocId", required = false) Integer refDocId,
            @RequestParam(value = "refMarId", required = false) Integer refMarId,
            @RequestParam(value = "orderId", required = false) Integer orderId,
            @RequestParam(value = "encounterId", required = false) String encounterId,
            Model model) {

        Patient patient = Context.getPatientService().getPatient(patientId);
        model.addAttribute("patient", patient);
        Date birthday = patient.getBirthdate();
        model.addAttribute("age", PatientUtils.estimateAge(birthday));

        MedisunService ms = Context.getService(MedisunService.class);

        PatientSearch patientSearch = ms.getPatientSerachByID(patientId);
        model.addAttribute("patientSearch", patientSearch);

        DiaPatientServiceBill dpsb = ms.getDiaPatientServiceBillId(billId);
        model.addAttribute("dpsb", dpsb);
        model.addAttribute("image", dpsb.getImage());
        
        PersonAttribute phone = patient.getAttribute("Phone Number");
        if (phone != null) {
            model.addAttribute("phone", phone.getValue());
        }

        DocDetail docInfo = ms.getDocInfoById(refDocId);
        model.addAttribute("docInfo", docInfo);

        List<DiaPatientServiceBillItem> diaBillItemList = ms.getDiaBillItemByBillId(billId);
        model.addAttribute("diaBillItemList", diaBillItemList);
        model.addAttribute("diaBillItemListSize", diaBillItemList.size());

        List<DiaPatientServiceBillCollect> diaBillICollectList = ms.getBillCollectListByBillId(billId);
        model.addAttribute("diaBillICollectList", diaBillICollectList);

        List<BillableService> serviceOrderList = ms.listOfServiceOrder(patientId, (NumberUtils.createInteger(encounterId)));
        model.addAttribute("serviceOrderList", serviceOrderList);
        model.addAttribute("serviceOrderSize", serviceOrderList.size());
        User user = Context.getAuthenticatedUser();
        model.addAttribute("billOfficer", user);

        //return "redirect:/module/billing/patientServiceBillForBD.list?patientId=" + patientId;
        return "module/billing/due/dueCollect";
    }

    @RequestMapping(value = "/module/billing/dueCollect.htm", method = RequestMethod.POST)
    public String dueCollect(@RequestParam("patientId") Integer patientId,
            @RequestParam(value = "refDocId", required = false) Integer refDocId,
            @RequestParam(value = "rmpId", required = false) Integer rmpId,
            @RequestParam("billId") Integer billId,
            @RequestParam("indCount") Integer indCount,
            @RequestParam(value = "encounterId", required = false) String encounterId,
            HttpServletRequest request, Model model) throws ParseException {

        Patient patient = Context.getPatientService().getPatient(patientId);

        MedisunService ms = Context.getService(MedisunService.class);
        BillingService billingService = Context.getService(BillingService.class);

        User user = Context.getAuthenticatedUser();

        BillableService service;

        BigDecimal totalBill = NumberUtils.createBigDecimal(request.getParameter("totalBill"));
        BigDecimal payableAmount = NumberUtils.createBigDecimal(request.getParameter("payableamount"));
        BigDecimal paidAmount = NumberUtils.createBigDecimal(request.getParameter("paidamount"));
        BigDecimal dueAmount = NumberUtils.createBigDecimal(request.getParameter("dueamount"));

        String due = null;
        if (dueAmount.signum() < 1) {
            due = "PAID";
        } else {
            due = "DUE";
        }

        DiaPatientServiceBill dpsb = ms.getDiaPatientServiceBillId(billId);
        dpsb.setDueAmount(dueAmount);
        dpsb.setBillingStatus(due);
        ms.reSaveDia(dpsb);

        model.addAttribute("billId", dpsb.getBillId());
        model.addAttribute("paid", paidAmount);

        model.addAttribute("refDocId", refDocId);

        DiaPatientServiceBillCollect dBillColl = new DiaPatientServiceBillCollect();
        dBillColl.setPatientId(patientId);
        dBillColl.setDiaPatientServiceBill(dpsb);
        dBillColl.setUser(user);
        dBillColl.setCreatedDate(new Date());
        dBillColl.setActualAmount(totalBill);
        dBillColl.setPaidAmount(paidAmount);
        dBillColl.setPayableAmount(payableAmount);
        dBillColl.setDueAmount(dueAmount);
        dBillColl.setDuePaidStatus(true);
        ms.saveDiaPatientServiceBillCollect(dBillColl);

        model.addAttribute("dBillCollect", dBillColl);

        /// Due collect amount, get commission calculation save in Dia Commission Cal
        BigDecimal discountAmount = NumberUtils.createBigDecimal(request.getParameter("disAmounut"));

        for (Integer i = 1; i <= indCount; i++) {

            //    String servicename = request.getParameter("service");
            BigDecimal unitPrice = NumberUtils.createBigDecimal(request.getParameter(i.toString() + "unitprice")); // Quantity * unitPrice

            String servicename = request.getParameter(i.toString() + "service");
            service = billingService.getServiceByConceptName(servicename);

           // BigDecimal ind = NumberUtils.createBigDecimal(indCount.toString());
            //BigDecimal da = discountAmount.divide(ind, 2, RoundingMode.CEILING);

            if (dpsb.getBillingStatus() == "PAID") {

                BigDecimal oneHundred = new BigDecimal(100);
                BigDecimal le = null;
                if (discountAmount.signum() > 0) {
                    
                    BigDecimal disPer=((discountAmount).divide(totalBill,4,RoundingMode.CEILING).multiply(oneHundred));
                    
                    BigDecimal less = (unitPrice.multiply(disPer)).divide(oneHundred, 0, RoundingMode.HALF_EVEN);
                    le = less;
                } else {
                    le = new BigDecimal(0);
                }

                DiaCommissionCal diaComCal = new DiaCommissionCal();
                diaComCal.setDiaPatientServiceBill(dpsb);
                diaComCal.setPatient(patient);
                diaComCal.setServiceName(service.getName());
                diaComCal.setServiceId(service.getServiceId());
                diaComCal.setServicePrice(unitPrice);
                //diaComCal.setLessAmount(discountAmount);
                diaComCal.setLessAmount(le);
                diaComCal.setCommission(service.getCommission());
                diaComCal.setCreatedDate(new Date());
                diaComCal.setCreator(user.getId());
                diaComCal.setRefId(refDocId);  ////
                diaComCal.setRefRmpId(rmpId);
                ms.saveDiaComCal(diaComCal);
            }

        }

        return "redirect:/module/billing/dueprint.htm?patientId=" + patientId;
        //module/billing/directbillingqueue.form

    }

    @RequestMapping(value = "/module/billing/dueprint.htm", method = RequestMethod.GET)
    public String duePrintView(@RequestParam("patientId") Integer patientId,
            @RequestParam(value = "refDocId", required = false) Integer refDocId,
            @RequestParam("billId") Integer billId,
            @RequestParam(value = "date", required = false) String dStr, HttpServletRequest request, Model model) {
        Patient patient = Context.getPatientService().getPatient(patientId);

        MedisunService ms = Context.getService(MedisunService.class);

        PatientSearch patientSearch = ms.getPatientSerachByID(patientId);
        model.addAttribute("patientSearch", patientSearch);

        BigDecimal paidAmount = NumberUtils.createBigDecimal(request.getParameter("paid"));
        model.addAttribute("paid", paidAmount);

        DiaPatientServiceBill dpsb = ms.getDiaPatientServiceBillId(billId);
        model.addAttribute("dpsb", dpsb);

        if (refDocId != null) {
            DocDetail docInfo = ms.getDocInfoById(refDocId);
            model.addAttribute("docInfo", docInfo);
        }

        PersonAttribute phone = patient.getAttribute("Phone Number");
        if (phone != null) {
            model.addAttribute("phone", phone.getValue());
        }

        List<DiaPatientServiceBillCollect> diaBillICollectList = ms.getBillCollectListByBillId(billId);
        model.addAttribute("diaBillICollectList", diaBillICollectList);

        List<DiaPatientServiceBillItem> diaBillItemList = ms.getDiaBillItemByBillId(billId);
        model.addAttribute("diaBillItemList", diaBillItemList);

        model.addAttribute("patient", patient);
        Date birthday = patient.getBirthdate();
        model.addAttribute("age", PatientUtils.estimateAge(birthday));
        model.addAttribute("billId", billId);
        User user = Context.getAuthenticatedUser();
        model.addAttribute("billOfficer", user);

        return "module/billing/due/duePrintBill";
    }

}
