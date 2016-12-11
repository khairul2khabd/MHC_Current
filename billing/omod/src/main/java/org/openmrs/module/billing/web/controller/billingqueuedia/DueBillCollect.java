/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.billing.web.controller.billingqueuedia;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.openmrs.Patient;
import org.openmrs.PersonAttribute;
import org.openmrs.User;
import org.openmrs.api.context.Context;
import org.openmrs.module.hospitalcore.MedisunService;
import org.openmrs.module.hospitalcore.model.BillableService;
import org.openmrs.module.hospitalcore.model.DiaCommissionCal;
import org.openmrs.module.hospitalcore.model.DiaCommissionCalAll;
import org.openmrs.module.hospitalcore.model.DiaPatientServiceBill;
import org.openmrs.module.hospitalcore.model.DiaPatientServiceBillCollect;
import org.openmrs.module.hospitalcore.model.DiaPatientServiceBillItem;
import org.openmrs.module.hospitalcore.model.DocDetail;
import org.openmrs.module.hospitalcore.model.PatientSearch;
import org.openmrs.module.hospitalcore.util.PatientUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Khairul
 */
@Controller("DueBillCollectandPrint")
public class DueBillCollect {

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
            @RequestParam(value = "per", required = false) String discount,
            @RequestParam(value = "encounterId", required = false) String encounterId,
            HttpServletRequest request, Model model) throws ParseException {

        Patient patient = Context.getPatientService().getPatient(patientId);

        MedisunService ms = Context.getService(MedisunService.class);
        org.openmrs.module.hospitalcore.BillingService billingService = Context.getService(org.openmrs.module.hospitalcore.BillingService.class);

        User user = Context.getAuthenticatedUser();

        BillableService service;

        BigDecimal totalBill = NumberUtils.createBigDecimal(request.getParameter("totalBill"));
        BigDecimal payableAmount = NumberUtils.createBigDecimal(request.getParameter("payableamount"));
        BigDecimal paidAmount = NumberUtils.createBigDecimal(request.getParameter("paidamount"));
        BigDecimal dueAmount = NumberUtils.createBigDecimal(request.getParameter("dueamount"));
        BigDecimal discountAmount = NumberUtils.createBigDecimal(request.getParameter("disAmounut"));
        BigDecimal secLess = NumberUtils.createBigDecimal(request.getParameter("secLess"));

        BigDecimal totDis = (discountAmount.add(secLess));

        String due = null;
        if (dueAmount.signum() < 1) {
            due = "PAID";
        } else {
            due = "DUE";
        }

        DiaPatientServiceBill dpsb = ms.getDiaPatientServiceBillId(billId);
        dpsb.setDueAmount(dueAmount);
        dpsb.setBillingStatus(due);
        dpsb.setDiscountAmount(totDis);
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
        dBillColl.setDiscountAmount(secLess);
        dBillColl.setDuePaidStatus(true);
        ms.saveDiaPatientServiceBillCollect(dBillColl);

        model.addAttribute("dBillCollect", dBillColl);

        BigDecimal totCom = BigDecimal.ZERO;
        BigDecimal servicePrice = BigDecimal.ZERO;
        String sername = null;

        /// Due collect amount, get commission calculation save in Dia Commission Cal
        for (Integer i = 1; i <= indCount; i++) {

            //    String servicename = request.getParameter("service");
            BigDecimal unitPrice = NumberUtils.createBigDecimal(request.getParameter(i.toString() + "unitprice")); // Quantity * unitPrice

            String servicename = request.getParameter(i.toString() + "service");
            service = billingService.getServiceByConceptName(servicename);

            if (((!StringUtils.equalsIgnoreCase(service.getCategory().getId().toString(), "5678")))) {
                sername = servicename + "," + sername;  // for commison
                servicePrice = servicePrice.add(unitPrice);
            }

            // BigDecimal ind = NumberUtils.createBigDecimal(indCount.toString());
            //BigDecimal da = discountAmount.divide(ind, 2, RoundingMode.CEILING);
            if (dpsb.getBillingStatus() == "PAID") {

                BigDecimal oneHundred = new BigDecimal(100);
                BigDecimal le = null;
                System.out.println("*******" + service.getCategory().getId());
                if ((!StringUtils.equalsIgnoreCase(service.getCategory().getId().toString(), "5678"))) {
                    if (!StringUtils.isBlank(discount)) {
                        BigDecimal dis;
                        dis = new BigDecimal(discount);
                        BigDecimal less = (unitPrice.multiply(dis)).divide(oneHundred, 0, RoundingMode.HALF_EVEN);
                        le = less;
                    } else {
                        le = new BigDecimal(0);
                    }
                }

                //if (!StringUtils.equalsIgnoreCase(service.getCommission(), "0")) {
                if ((!StringUtils.equalsIgnoreCase(service.getCategory().getId().toString(), "5678"))) {
                    BigDecimal percentage = NumberUtils.createBigDecimal(service.getCommission());
                    BigDecimal com = (unitPrice.multiply(percentage)).divide(oneHundred);
                    totCom = totCom.add(com);

                    servicePrice = servicePrice.add(unitPrice);
                }
                if ((!StringUtils.equalsIgnoreCase(service.getCategory().getId().toString(), "5678"))) {

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

        }

        /// For diacommissionall
        if (sername != null && dpsb.getBillingStatus() == "PAID") {
            sername = sername.replace(",null", "");

            DiaCommissionCalAll diaAll = new DiaCommissionCalAll();
            diaAll.setDiaPatientServiceBill(dpsb);
            diaAll.setPatient(patient);
            diaAll.setServiceName(sername);
            diaAll.setServicePrice(servicePrice);
            diaAll.setLessAmount(discountAmount);
            diaAll.setComAmount(totCom);
            diaAll.setCreatedDate(new Date());
            diaAll.setCreator(Context.getAuthenticatedUser().getId());
            diaAll.setRefId(refDocId);
            diaAll.setRefRmp(rmpId);
            ms.saveDiaComAll(diaAll);
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
