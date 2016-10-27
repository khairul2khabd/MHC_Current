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

    @RequestMapping(value = "/module/billing/orderStore.form", method = RequestMethod.GET)
    public String billSave(@RequestParam("patientId") Integer patientId,
            @RequestParam(value = "refDocId", required = false) Integer refDocId,
            @RequestParam(value = "refMarId", required = false) Integer refMarId,
            @RequestParam(value = "orderId", required = false) Integer orderId,
            @RequestParam(value = "refRmpId", required = false) Integer refRmpId,
            @RequestParam(value = "encounterId", required = false) String encounterId,
            Model model) {

        Patient patient = Context.getPatientService().getPatient(patientId);
        model.addAttribute("patient", patient);

        MedisunService ms = Context.getService(MedisunService.class);

        PatientSearch patientSearch = ms.getPatientSerachByID(patientId);
        model.addAttribute("patientSearch", patientSearch);

        Date birthday = patient.getBirthdate();
        model.addAttribute("age", PatientUtils.estimateAge(birthday));

        DocDetail docInfo = ms.getDocInfoById(refDocId);
        model.addAttribute("docInfo", docInfo);

        MarDetails marInfo = ms.getMarInfoById(refMarId);
        model.addAttribute("marInfo", marInfo);
        model.addAttribute("orderId", orderId);

        PersonAttribute phone = patient.getAttribute("Phone Number");
        if (phone != null) {
            model.addAttribute("phone", phone.getValue());
        }

        List<BillableService> serviceOrderList = ms.listOfServiceOrder(patientId, (NumberUtils.createInteger(encounterId)));
        model.addAttribute("serviceOrderList", serviceOrderList);
        model.addAttribute("serviceOrderSize", serviceOrderList.size());
        model.addAttribute("encounterId", encounterId);

        //return "redirect:/module/billing/patientServiceBillForBD.list?patientId=" + patientId;
        return "module/billing/private/serviceBill";
    }

    @RequestMapping(value = "/module/billing/orderStoreSave.form", method = RequestMethod.POST)
    public String billSaveOrder(@RequestParam("patientId") Integer patientId,
            @RequestParam(value = "refDocId", required = false) Integer refDocId,
            @RequestParam(value = "refMarId", required = false) Integer refMarId,
            @RequestParam(value = "orderId", required = false) Integer orderId,
            @RequestParam(value = "refRmpId", required = false) Integer refRmpId,
            @RequestParam(value = "dDate", required = false) String dDate,
            @RequestParam(value = "dTime", required = false) String dTime,
            //  @RequestParam(value = "discount", required = false) BigDecimal discount,
            @RequestParam(value = "discount", required = false) String discount,
            @RequestParam("indCount") Integer indCount,
            @RequestParam(value = "encounterId", required = false) String encounterId,
            HttpServletRequest request, Model model) throws ParseException, Exception {

        Patient patient = Context.getPatientService().getPatient(patientId);

        MedisunService ms = Context.getService(MedisunService.class);
        BillingService billingService = Context.getService(BillingService.class);

        //Date birthday = patient.getBirthdate();
        // model.addAttribute("age", PatientUtils.estimateAge(birthday));
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        Date deDate = null;

        if (StringUtils.isNotBlank(dDate)) {
            deDate = sdf.parse(dDate);
        }

        DiaBillingQueue dbq = ms.getDiaBillingQueue(orderId);

        DiaReceipt dr = new DiaReceipt();
        dr.setPaidDate(new Date());
        dr.setDeliveryDate(deDate);
        dr.setDeliveryTime(dTime);
        dr.setServiceId(orderId);
        ms.saveDiaReceipt(dr);

        User user = Context.getAuthenticatedUser();

        BillableService service;

        BigDecimal totalBill = NumberUtils.createBigDecimal(request.getParameter("totalBill"));
        BigDecimal netAmount = NumberUtils.createBigDecimal(request.getParameter("netamount"));

        BigDecimal paidAmount = NumberUtils.createBigDecimal(request.getParameter("paidamount"));
        BigDecimal payableAmount = NumberUtils.createBigDecimal(request.getParameter("payableamount"));
        BigDecimal dueAmount = NumberUtils.createBigDecimal(request.getParameter("dueamount"));
        BigDecimal discountAmount = NumberUtils.createBigDecimal(request.getParameter("discountamount"));
        BigDecimal unitPrice = NumberUtils.createBigDecimal(request.getParameter("unitprice"));
        // BigDecimal discount = NumberUtils.createBigDecimal(request.getParameter("discount"));

        String due = null;
        if (dueAmount.signum() < 1) {
            due = "PAID";
        } else {
            due = "DUE";
        }

        DiaPatientServiceBill dpsb = new DiaPatientServiceBill();
        dpsb.setPatient(patient);
        dpsb.setCreatedDate(new Date());
        dpsb.setCreator(user);
        dpsb.setAmount(netAmount);
        dpsb.setPrinted(Boolean.FALSE);
        dpsb.setReceipt(dr);
        dpsb.setVoided(Boolean.FALSE);
        dpsb.setActualAmount(totalBill);
        dpsb.setDueAmount(dueAmount);
        dpsb.setBillingStatus(due);
        dpsb.setRefDocId(refDocId);
        dpsb.setRefMarId(refMarId);
        dpsb.setRefRmpId(refRmpId);
        dpsb.setDiscountAmount(discountAmount);
        if (paidAmount.signum() > 0) {
            dpsb = ms.saveDiaPatientServiceBill(dpsb);
        }

        // if (dpsb != null && dpsb.getBillId() != null ) {
        if (dpsb != null && dpsb.getBillId() != null && orderId != 0) {
            ms.removeDiaBillingQueue(dbq);
        }
        model.addAttribute("billId", dpsb.getBillId());
        model.addAttribute("orderId", orderId);
        model.addAttribute("refDocId", refDocId);
        model.addAttribute("paid", paidAmount);
        model.addAttribute("dDate", dDate);
        model.addAttribute("dTime", dTime);

        DiaPatientServiceBillCollect dBillColl = new DiaPatientServiceBillCollect();
        dBillColl.setPatientId(patientId);
        dBillColl.setDiaPatientServiceBill(dpsb);
        dBillColl.setUser(user);
        dBillColl.setCreatedDate(new Date());
        dBillColl.setActualAmount(totalBill);
        dBillColl.setPaidAmount(paidAmount);
        dBillColl.setPayableAmount(netAmount);
        dBillColl.setDueAmount(dueAmount);
        dBillColl.setDiscountAmount(discountAmount);

        if (paidAmount.signum() > 0) {
            ms.saveDiaPatientServiceBillCollect(dBillColl);
        }

        for (Integer i = 1; i <= indCount; i++) {

            String servicename = request.getParameter("service");
            unitPrice = NumberUtils.createBigDecimal(request.getParameter(i.toString() + "unitprice")); // Quantity * unitPrice
            BigDecimal serviceprice = NumberUtils.createBigDecimal(request.getParameter(i.toString() + "serviceprice")); // Unit Price

            Integer qty = NumberUtils.createInteger(request.getParameter(i.toString() + "servicequantity")); // Quantity
            servicename = request.getParameter(i.toString() + "service");
            service = billingService.getServiceByConceptName(servicename);

            DiaPatientServiceBillItem dBillItem = new DiaPatientServiceBillItem();
            dBillItem.setService(service);
            dBillItem.setDiaPatientServiceBill(dpsb);
            dBillItem.setUnitPrice(serviceprice);
            dBillItem.setAmount(unitPrice);
            dBillItem.setQuantity(qty);
            dBillItem.setName(servicename);
            dBillItem.setCreatedDate(new Date());
            dBillItem.setCreator(user.getId());
            dBillItem.setVoided(Boolean.FALSE);
            dBillItem.setActualAmount(unitPrice);
            if (paidAmount.signum() > 0) {
                ms.saveDiaPatientServiceBillItem(dBillItem);
            }

            BigDecimal ind = NumberUtils.createBigDecimal(indCount.toString());
            BigDecimal da = discountAmount.divide(ind, 2, RoundingMode.CEILING);

            BigDecimal oneHundred = new BigDecimal(100);

            BigDecimal le = null;
            if (!StringUtils.isBlank(discount)) {
                BigDecimal dis;
                dis = new BigDecimal(discount);
                BigDecimal less = (unitPrice.multiply(dis)).divide(oneHundred, 0, RoundingMode.HALF_EVEN);
                le = less;
            } else {
                le = new BigDecimal(0);
            }

            //BigDecimal less = (unitPrice.multiply(discount)).divide(oneHundred, 0, RoundingMode.HALF_EVEN);
            if (dpsb.getBillingStatus() == "PAID") {
                DiaCommissionCal diaComCal = new DiaCommissionCal();
                diaComCal.setDiaPatientServiceBill(dpsb);
                diaComCal.setPatient(patient);
                diaComCal.setServiceName(service.getName());
                diaComCal.setServiceId(service.getServiceId());
                diaComCal.setServicePrice(serviceprice);
                //diaComCal.setLessAmount(discountAmount);
                diaComCal.setLessAmount(le);
                diaComCal.setCommission(service.getCommission());
                diaComCal.setCreatedDate(new Date());
                diaComCal.setCreator(user.getId());
                diaComCal.setRefId(dpsb.getRefDocId());
                diaComCal.setRefRmpId(dpsb.getRefRmpId());
                ms.saveDiaComCal(diaComCal);
            }

            DiaLabSampleid dls = new DiaLabSampleid();
            dls.setPatient(patient);
            dls.setDiaPatientServiceBill(dpsb);
            dls.setSampleId(generateBarcode());
            ms.saveDiaLabSam(dls);

            //// Generate Patient Id Barcode4j
            Code128Bean cod = new Code128Bean();
            final int reso = 128;
            cod.setModuleWidth(UnitConv.in2mm(1.0f / reso)); //makes the narrow bar 
            //width exactly one pixel
            cod.setHeight(10);
            cod.setFontSize(3);
            cod.setFontName("Times New Roman");
            // cod.doQuietZone(true);
            cod.getBarWidth(2);
            // bean.setVerticalQuietZone(1);
            cod.setMsgPosition(HumanReadablePlacement.HRP_BOTTOM);

            File outputFilePatId = new File(request.getSession().getServletContext().getRealPath("/barcode/" + patient.getId() + ".png"));
           // File outputFilePatId = new File("C:\\tomcat6\\webapps\\MEDISUN_HEALTH_CARE_V2_Final\\barcode/" + patient.getId() + ".png"); //Mostofa bhi
            
            OutputStream out1 = new FileOutputStream(outputFilePatId);
            try {
                BitmapCanvasProvider canvas = new BitmapCanvasProvider(out1, "image/x-png", reso, BufferedImage.TYPE_BYTE_BINARY, false, 0);

                cod.generateBarcode(canvas, patient.getPatientIdentifier().getIdentifier());

                canvas.finish();
            } finally {
                out1.close();
            }

            //// Generate Bill Id Barcode4j
            Code128Bean codBil = new Code128Bean();
            final int resou = 128;
            codBil.setModuleWidth(UnitConv.in2mm(1.0f / resou)); //makes the narrow bar 
            //width exactly one pixel
            codBil.setHeight(10);
            codBil.setFontSize(2);
            codBil.setFontName("Helvetica");
            // cod.doQuietZone(true);
            codBil.getBarWidth(2);
            // bean.setVerticalQuietZone(1);
            codBil.setMsgPosition(HumanReadablePlacement.HRP_BOTTOM);

            //  File outputFileBillId = new File("C:\\tomcat6\\webapps\\MEDISUN_HEALTH_CARE_V2_Final\\barcode/" + dpsb.getBillId() + ".png"); // Mostofa bhi
            File outputFileBillId = new File(request.getSession().getServletContext().getRealPath("/barcode/" + dpsb.getBillId() + ".png"));
      
            OutputStream outB = new FileOutputStream(outputFileBillId);
            try {
                BitmapCanvasProvider canvas = new BitmapCanvasProvider(outB, "image/x-png", reso, BufferedImage.TYPE_BYTE_BINARY, false, 0);

                codBil.generateBarcode(canvas, dpsb.getBillId().toString());

                canvas.finish();
            } finally {
                outB.close();
            }

            ///// End 
        }

        model.addAttribute("discountAount", dBillColl.getDiscountAmount());

        return "redirect:/module/billing/billprint.htm?patientId=" + patientId;
        //module/billing/directbillingqueue.form

    }

    public static String generateBarcode() {
        int incrementedValue = 1;
        int barCodeInt = 0;
        MedisunService ms = Context.getService(MedisunService.class);
        if (ms.getDiaLabSam().isEmpty()) {
            incrementedValue = barCodeInt;
        } else {
            List<DiaLabSampleid> diaLab = ms.getDiaLabSam();
            int sampleidLast = Integer.parseInt(diaLab.get(0).getSampleId().toString().substring(7));
            incrementedValue = ++sampleidLast;
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
        String date = sdf.format(new Date());
        String bar = date + "-" + incrementedValue;
        //date + "-" + letter + id;
        return bar;
    }

}
