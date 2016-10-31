/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.billing.web.controller.billingqueuedia;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.openmrs.api.context.Context;
import org.openmrs.module.hospitalcore.MedisunService;
import org.openmrs.module.hospitalcore.model.DiaCommissionCal;
//import org.openmrs.module.hospitalcore.model.DiaCommissionCalAll;
import org.openmrs.module.hospitalcore.model.DiaPatientServiceBill;
import org.openmrs.module.hospitalcore.model.DiaPatientServiceBillCollect;
import org.openmrs.module.hospitalcore.model.DiaPatientServiceBillItem;
import org.openmrs.module.hospitalcore.model.DiaRmpName;
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
@Controller("BillVoidRefferrealChangeController")
public class RefferrelChange {

    @RequestMapping(value = "/module/billing/voidrefchange.htm", method = RequestMethod.GET)
    public String refGet(@RequestParam(value = "voidbill", required = false) String voidbill, Model model) {

        MedisunService ms = Context.getService(MedisunService.class);
        int bId = 0;
        try {
            bId = Integer.parseInt(voidbill);
        } catch (NumberFormatException e) {
            model.addAttribute("msg", "Cannot find bill!!");
            return "redirect:/module/billing/directbillingqueue.form";
        }

        DiaPatientServiceBill dpsb = ms.getDiaPatientServiceBillId(bId);

        if (null != dpsb) {
            model.addAttribute("dpsb", dpsb);
            model.addAttribute("identifier", dpsb.getPatient().getIdentifiers().toString());
            System.out.println("*****" + voidbill);
            System.out.println("***dpsb ***" + dpsb);

            List<DiaPatientServiceBillItem> diaBillItemList = ms.getDiaBillItemByBillId(bId);
            model.addAttribute("diaBillItemList", diaBillItemList);
            model.addAttribute("diaBillItemListSize", diaBillItemList.size());

            List<DiaPatientServiceBillCollect> diaBillICollectList = ms.getBillCollectListByBillId(bId);
            model.addAttribute("diaBillICollectList", diaBillICollectList);

            Integer refDocId = dpsb.getRefDocId();
            Integer refRmpId = dpsb.getRefRmpId();

            if (refDocId != null) {
                DocDetail docInfo = ms.getDocInfoById(refDocId);
                model.addAttribute("docInfo", docInfo);
            }

            if (refRmpId != null) {
                DiaRmpName rmpInfo = ms.getDiaRmpById(refRmpId);
                model.addAttribute("rmpInfo", rmpInfo);
            }

            return "module/billing/due/voidrefchange";
        } else {
            model.addAttribute("msg", "Cannot find bill");
            return "redirect:/module/billing/directbillingqueue.form";
        }

        // System.out.println("*****"+voidbill);
        //return "module/billing/due/voidrefchange";
    }

    @RequestMapping(value = "/module/billing/voidrefchange.htm", method = RequestMethod.POST)
    public String updateVoid(HttpServletRequest request,
            @RequestParam(value = "docIdName", required = false) Integer docIdName,
            @RequestParam(value = "rmpIdName", required = false) Integer rmpIdName,
            @RequestParam(value = "billId", required = false) Integer billId,
            @RequestParam(value = "billVoid", required = false) Integer billVoid,
            @RequestParam(value = "voidReason", required = false) String voidReason,
            Model model) {

        MedisunService ms = Context.getService(MedisunService.class);
        if (billVoid == null) {

            DiaPatientServiceBill d = ms.getDiaPatientServiceBillId(billId);
            d.setRefDocId(docIdName);
            d.setRefRmpId(rmpIdName);
            ms.saveDiaPatientServiceBill(d);

//            DiaCommissionCalAll dca = ms.getDiaAllByBillId(billId);
//            dca.setRefId(docIdName);
//            dca.setRefRmp(rmpIdName);
//            ms.saveDiaComAll(dca);
//
//            List<DiaCommissionCal> dc = ms.listDiaComCalByBillId(billId);
//            for (int i = 0; i < dc.size(); i++) {
//                DiaCommissionCal dd = (DiaCommissionCal) dc.get(i);
//                dd.setRefId(docIdName);
//                dd.setRefRmpId(rmpIdName);
//                ms.saveDiaComCal(dd);
//            }
            model.addAttribute("msg", "Successfully Update !!!!");
        } else {
            DiaPatientServiceBill d = ms.getDiaPatientServiceBillId(billId);
            d.setVoided(Boolean.TRUE);
            d.setVoidedDesc(voidReason);
            d.setVoidedCreator(Context.getAuthenticatedUser().getId());
            d.setVoidedDate(new Date());
            d.setBillingStatus("VOID");
            ms.saveDiaPatientServiceBill(d);
            model.addAttribute("msg", "This Bill Voided !!!!");
        }

        //System.out.println("****status :"+dc);
        //return "module/billing/private/billingqueue";
        return "redirect:/module/billing/directbillingqueue.form";

    }

}
