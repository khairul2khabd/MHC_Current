/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.billing.web.controller.staticreport;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang.math.NumberUtils;
import org.openmrs.User;
import org.openmrs.api.context.Context;
import org.openmrs.module.hospitalcore.MedisunService;
import org.openmrs.module.hospitalcore.model.DiaCommissionCalPaid;
import org.openmrs.module.hospitalcore.model.DiaRmpCommCalculationPaid;
import org.openmrs.module.hospitalcore.model.DiaRmpCommCalculationPaidAdj;
import org.openmrs.module.hospitalcore.model.DiaRmpName;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Khairul
 */
@Controller("RmpCommissionViewUpdate")
public class RmpCommissionViewUpdate {

    @RequestMapping(value = "/module/billing/rmpComPaymentView.htm", method = RequestMethod.GET)
    public String comView(Model model) {

        return "module/billing/reports/rmpPaymentView";
    }

    @RequestMapping(value = "/module/billing/rmpPaymentView.htm", method = RequestMethod.GET)
    public String resultView(HttpServletRequest request,
            @RequestParam(value = "rmpIdName", required = false) Integer rmpId,
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

        if (rmpId != null) {
            List<DiaRmpCommCalculationPaid> diaRmpPaid = ms.getRmpComCalPaidByIdDate(rmpId, rmpId, date, date1);
            model.addAttribute("diaRmpPaid", diaRmpPaid);
            
        } else {
            int rmp1 = 0;
            int rmp2 = 10000;
            List<DiaRmpCommCalculationPaid> diaRmpPaid = ms.getRmpComCalPaidByIdDate(rmp1, rmp2, date, date1);
            model.addAttribute("diaRmpPaid", diaRmpPaid);
        }

        if (rmpId != null) {
            DiaRmpName rmpInfo = ms.getDiaRmpById(rmpId);
            model.addAttribute("rmpInfo", rmpInfo);
        }

        model.addAttribute("startDate", date);
        model.addAttribute("endDate", date1);

        return "module/billing/reports/rmpPaymentView";
    }
    
     @RequestMapping(value = "/module/billing/rmpRepById.htm", method = RequestMethod.GET)
    public String rmpReportsViewById(@RequestParam("id") Integer id,
            Model model) {
        MedisunService ms = Context.getService(MedisunService.class);

        DiaRmpCommCalculationPaid diaRmpPaid = ms.getDiaRmpCalPaidById(id);
        model.addAttribute("comPaid", diaRmpPaid);
        return "module/billing/reports/rmpViewUpdate";
    }
    
     @RequestMapping(value = "/module/billing/rmpPayUpdate.htm", method = RequestMethod.POST)
    public String docReportsViewUpdate(@RequestParam("id") Integer id,
            Model model, HttpServletRequest request) {
        MedisunService ms = Context.getService(MedisunService.class);
        User user = Context.getAuthenticatedUser();

        BigDecimal due = NumberUtils.createBigDecimal(request.getParameter("due"));

        BigDecimal paid = NumberUtils.createBigDecimal(request.getParameter("adj"));
        BigDecimal paidAmnt = NumberUtils.createBigDecimal(request.getParameter("paAmnt"));
        
        BigDecimal test = new BigDecimal(0);
        BigDecimal totalPaid=(test.add(paid.add(paidAmnt)));
        
        DiaRmpCommCalculationPaid dpaid=ms.getDiaRmpCalPaidById(id);
        dpaid.setPaidAmount(totalPaid);
        dpaid.setDueAmount(due);
        ms.saveRmpComPaid(dpaid);
        
        DiaRmpCommCalculationPaidAdj dAdj=new DiaRmpCommCalculationPaidAdj();
        dAdj.setDiaRmpComPaid(dpaid);
        dAdj.setPayableAmount(due);
        dAdj.setPaidAmount(paid);
        dAdj.setDueAmount(due);
        dAdj.setUser(user);
        dAdj.setCreatedDate(new Date());
        ms.saveDiaRmpAdj(dAdj);

        return "module/billing/thickbox/success";
    }

}
