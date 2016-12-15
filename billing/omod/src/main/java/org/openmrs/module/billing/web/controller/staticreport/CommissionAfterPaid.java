/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.openmrs.module.billing.web.controller.staticreport;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.openmrs.api.context.Context;
import org.openmrs.module.hospitalcore.MedisunService;
import org.openmrs.module.hospitalcore.model.DiaCommissionCal;
import org.openmrs.module.hospitalcore.model.DiaCommissionCalAll;
import org.openmrs.module.hospitalcore.model.DiaCommissionCalPaid;
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
@Controller("CommissionAfterPaidController")
public class CommissionAfterPaid {
    
//    @RequestMapping(value = "/module/billing/comPaidView.htm", method = RequestMethod.GET)
//    public String comPaidView(
//            @RequestParam("docIdName") Integer docId,
//            @RequestParam(value = "sDate", required = false) String startDate,
//            @RequestParam(value = "eDate", required = false) String endDate,
//            @RequestParam(value = "status", required = false) int status,
//            Model model) {
//        MedisunService ms = Context.getService(MedisunService.class);
//
//        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
//        Date date = null;
//        Date date1 = null;
//        try {
//            date = sdf.parse(startDate);
//            date1 = sdf.parse(endDate);
//        } catch (ParseException e) {
//            e.printStackTrace();
//        }
//        
//        List<DiaCommissionCal> diaComCal = ms.getDiaComCal(docId, status, date, date1);
//        model.addAttribute("diaComCal", diaComCal);
//        model.addAttribute("diaComCalSize", diaComCal.size());
//
//        List<DiaCommissionCalPaid> diaComPaid = ms.getDiaComCalPaidByIdandDate(docId, date, date1);
//        model.addAttribute("diaComPaid", diaComPaid);
//
//        List<DiaCommissionCalAll> listDiaComAll = ms.listDiaComCalAll(docId, date, date1);
//        model.addAttribute("listDiaComAll", listDiaComAll);
//
//        model.addAttribute("startDate", date);
//        model.addAttribute("endDate", date1);
//
//        DocDetail docInfo = ms.getDocInfoById(docId);
//        model.addAttribute("docInfo", docInfo);
//         
//        
//        
//        
//        return "module/billing/reports/comPaidView";
//      }
    } 
    
    

