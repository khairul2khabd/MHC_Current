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
import javax.servlet.http.HttpServletRequest;
import org.openmrs.api.context.Context;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.openmrs.module.hospitalcore.MedisunService;
import org.openmrs.module.hospitalcore.model.DiaPatientServiceBill;
import org.openmrs.module.hospitalcore.model.DocDetail;

/**
 *
 * @author Khairul
 */
@Controller("BillingReportsView")
public class BillingReports {

    @RequestMapping(value = "/module/billing/reportsView.form", method = RequestMethod.GET)
    public String mainView(Model model) {
        //   Patient patient = Context.getPatientService().getPatient(patientId);
        //model.addAttribute("patientId", patientId);
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        String dateStr = sdf.format(new Date());
        model.addAttribute("currentDate", dateStr);
        return "module/billing/reports/main";
    }

    @RequestMapping(value = "/module/billing/comCal.htm", method = RequestMethod.GET)
    public String comissionCal(Model model) {
     //   Patient patient = Context.getPatientService().getPatient(patientId);
        //model.addAttribute("patientId", patientId);

        return "module/billing/reports/comissionCal";
    }

    @RequestMapping(value = "/module/billing/comCalGet.htm", method = RequestMethod.GET)
    public String getCommision(HttpServletRequest request,
            @RequestParam("docIdName") Integer docId,
            @RequestParam(value = "sDate", required = false) String startDate,
            @RequestParam(value = "eDate", required = false) String endDate,
            @RequestParam(value = "pathology", required = false) String pathology,
            @RequestParam(value = "radiology", required = false) String radiology,
            Model model) {
        //   Patient patient = Context.getPatientService().getPatient(patientId);
        //model.addAttribute("patientId", patientId);
        //Integer doctorId = Integer.valueOf(Integer.parseInt(request.getParameter("selectedDocId")));
        MedisunService ms = Context.getService(MedisunService.class);

        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        Date date = null;
        Date date1 = null;
        try {
            date = sdf.parse(startDate);
            date1 = sdf.parse(endDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        List<DiaPatientServiceBill> diaList = ms.getCommissionCal(docId, date, date1);
        model.addAttribute("diaList", diaList);
        

        model.addAttribute("startDate", date);
        model.addAttribute("endDate", date1);

        DocDetail docInfo = ms.getDocInfoById(docId);
        model.addAttribute("docInfo", docInfo);

        if (Context.getAuthenticatedUser() != null && Context.getAuthenticatedUser().getId() != null) {
            return "module/billing/reports/comissionCal";
        } else {
            return "redirect:/login.htm";
        }

        //  return "module/studentmanagement/session/checkSession";   
    }
}
