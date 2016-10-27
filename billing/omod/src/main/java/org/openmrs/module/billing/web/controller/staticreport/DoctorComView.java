/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.billing.web.controller.staticreport;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang.math.NumberUtils;
import org.openmrs.User;
import org.openmrs.api.context.Context;
import org.openmrs.module.hospitalcore.MedisunService;
import org.openmrs.module.hospitalcore.model.DiaCommissionCalPaid;
import org.openmrs.module.hospitalcore.model.DiaCommissionCalPaidAdj;
import org.openmrs.module.hospitalcore.model.DocDetail;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Khairul
 */
@Controller("DoctorCommissionReportsView")
public class DoctorComView {

    @RequestMapping(value = "/module/billing/docCom.form", method = RequestMethod.GET)
    public String docView(Model model) {
        //   Patient patient = Context.getPatientService().getPatient(patientId);
        //model.addAttribute("patientId", patientId);
        MedisunService ms = Context.getService(MedisunService.class);

        List<User> ulist = ms.getAllUser();

        model.addAttribute("u", ulist);

        return "module/billing/reports/docReports";
    }

    @RequestMapping(value = "/module/billing/docComResult.htm", method = RequestMethod.GET)
    public String resultView(HttpServletRequest request,
            @RequestParam(value = "docIdName", required = false) Integer docId,
            @RequestParam(value = "sDate", required = false) String startDate,
            @RequestParam(value = "eDate", required = false) String endDate,
            Model model) {

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

        if (docId != null) {
            List<DiaCommissionCalPaid> diaPaid = ms.getDiaComCalPaidByIdDate(docId, docId, date, date1);
            model.addAttribute("diaPaid", diaPaid);
        } else {
            int doc1 = 0;
            int doc2 = 10000;
            List<DiaCommissionCalPaid> diaPaid = ms.getDiaComCalPaidByIdDate(doc1, doc2, date, date1);
            model.addAttribute("diaPaid", diaPaid);
        }

        if (docId != null) {
            DocDetail docInfo = ms.getDocInfoById(docId);
            model.addAttribute("docInfo", docInfo);
        }

        model.addAttribute("startDate", date);
        model.addAttribute("endDate", date1);

        return "module/billing/reports/docReports";
    }

    @RequestMapping(value = "/module/billing/docComResult.htm", method = RequestMethod.POST)
    public String resultSave(HttpServletRequest request,
            @RequestParam(value = "docIdName", required = false) Integer docId,
            @RequestParam(value = "sDate", required = false) String startDate,
            @RequestParam(value = "eDate", required = false) String endDate,
            Model model) {

        MedisunService ms = Context.getService(MedisunService.class);

        return "module/billing/reports/docReports";
    }

    @RequestMapping(value = "/module/billing/docRepById.htm", method = RequestMethod.GET)
    public String docReportsViewById(@RequestParam("id") Integer id,
            Model model) {
        MedisunService ms = Context.getService(MedisunService.class);

        DiaCommissionCalPaid diaComCalPaid = ms.getDiaComCalPaidById(id);
        model.addAttribute("comPaid", diaComCalPaid);
        return "module/billing/reports/docReportsUpdate";
    }

    @RequestMapping(value = "/module/billing/docRepUpdate.htm", method = RequestMethod.POST)
    public String docReportsViewUpdate(@RequestParam("id") Integer id,
            Model model, HttpServletRequest request) {
        MedisunService ms = Context.getService(MedisunService.class);
        User user = Context.getAuthenticatedUser();

        BigDecimal due = NumberUtils.createBigDecimal(request.getParameter("due"));

        BigDecimal paid = NumberUtils.createBigDecimal(request.getParameter("adj"));
        BigDecimal paidAmnt = NumberUtils.createBigDecimal(request.getParameter("paAmnt"));
        
        BigDecimal test = new BigDecimal(0);
        BigDecimal totalPaid=(test.add(paid.add(paidAmnt)));
        
        DiaCommissionCalPaid d = ms.getDiaComCalPaidById(id);
        d.setPaidAmount(totalPaid);
        d.setDueAmount(due);
        ms.saveDiaComCalPaid(d);

        DiaCommissionCalPaidAdj diaAdj = new DiaCommissionCalPaidAdj();
        diaAdj.setDiaComPaid(d);
        diaAdj.setPayableAmount(due);
        diaAdj.setPaidAmount(paid);
        diaAdj.setDueAmount(due);
        diaAdj.setUser(user);
        diaAdj.setCreatedDate(new Date());
        ms.saveDiaComPaidAdj(diaAdj);

        return "module/billing/thickbox/success";
    }

}
