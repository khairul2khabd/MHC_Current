/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.billing.web.controller.billingqueuedia;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import static net.sf.saxon.exslt.Date.date;
import org.openmrs.Patient;
import org.openmrs.api.context.Context;
import org.openmrs.module.hospitalcore.BillingConstants;
import org.openmrs.module.hospitalcore.util.PagingUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.openmrs.module.hospitalcore.MedisunService;
import org.openmrs.module.hospitalcore.model.DiaBillingQueue;
import org.openmrs.module.hospitalcore.model.PatientSearch;

/**
 * @author khairul
 */
@Controller("BillingQueueControllerDia")
public class BillingQueueControllerDia {

    @RequestMapping(value = "/module/billing/directbillingqueue.form", method = RequestMethod.GET)
    public String viewQueue(Model model) {
        //   Patient patient = Context.getPatientService().getPatient(patientId);
        //model.addAttribute("patientId", patientId);
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        String dateStr = sdf.format(new Date());
        model.addAttribute("currentDate", dateStr);
        return "module/billing/private/billingqueue";
    }

    @RequestMapping(value = "/module/billing/getbillqueue.form", method = RequestMethod.GET)
    public String serarchQueue(@RequestParam(value = "date", required = false) String dateStr,
            @RequestParam(value = "searchKey", required = false) String searchKey,
            @RequestParam(value = "currentPage", required = false) Integer currentPage,
            //  @RequestParam(value = "patientId", required = false) Integer patientId,
            Model model) {
        // Patient patient = Context.getPatientService().getPatient(patientId);
        MedisunService ms = Context.getService(MedisunService.class);
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        Date date = null;
        try {
            date = sdf.parse(dateStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        List<PatientSearch> patientSearchResult = ms.listPatientSearch(searchKey, currentPage);
        currentPage = 1;
        int total = patientSearchResult.size();
        PagingUtil pagingUtil = new PagingUtil(BillingConstants.PAGESIZE, currentPage, total);
        model.addAttribute("pagingUtil", pagingUtil);
        // model.addAttribute("patientList", patientSearchResult);
        model.addAttribute("date", dateStr);
        // model.addAttribute("patientInfo", patient);
        List<DiaBillingQueue> diaBillList = ms.searchListOfPatientDia(date, searchKey, currentPage);
        model.addAttribute("diaBillList", diaBillList);
        return "/module/billing/private/getResult";
    }

    @RequestMapping(value = "/module/billing/getPatientInSystem.form", method = RequestMethod.GET)
    public String serarchPatient(@RequestParam(value = "searchKey", required = false) String searchKey,
            @RequestParam(value = "currentPage", required = false) Integer currentPage,
            //  @RequestParam(value = "patientId", required = false) Integer patientId,
            Model model) {
        // Patient patient = Context.getPatientService().getPatient(patientId);
        MedisunService ms = Context.getService(MedisunService.class);
        List<PatientSearch> patientSearchResult = ms.listPatientSearch(searchKey, currentPage);

        Date dNow = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        model.addAttribute("currentDate", sdf.format(dNow));

        currentPage = 1;
        int total = patientSearchResult.size();
        PagingUtil pagingUtil = new PagingUtil(BillingConstants.PAGESIZE, currentPage, total);
        model.addAttribute("pagingUtil", pagingUtil);
        model.addAttribute("patientList", patientSearchResult);
        // model.addAttribute("patientInfo", patient);
        return "/module/billing/private/searchInSystem";
    }
}
