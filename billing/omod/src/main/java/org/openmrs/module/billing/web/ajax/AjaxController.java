/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.billing.web.ajax;

import java.util.List;
import org.openmrs.api.context.Context;
import org.openmrs.module.hospitalcore.MedisunService;
import org.openmrs.module.hospitalcore.model.DoctorPerformanceInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Khairul
 */
@Controller("DoctorOrCommissionAjaxController")
public class AjaxController {

    @RequestMapping(value = "/module/billing/getDoctorOrRmpCommission.htm", method = RequestMethod.GET)
    public String getUserWiseBillingReport(
            @RequestParam(value = "autoCompleteValue", required = false) String autoCompleteValue,
            @RequestParam(value = "doctorId", required = false) String doctorId,
            @RequestParam(value = "sDate", required = false) String sDate,
            @RequestParam(value = "eDate", required = false) String eDate, Model model) {

        sDate = sDate + " 00:00:00";
        eDate = eDate + " 23:59:59";

        MedisunService medisunService = Context.getService(MedisunService.class);
        List<DoctorPerformanceInfo> doctorInfoList = medisunService.getDoctorsPerformanceInfo(sDate, eDate, doctorId, autoCompleteValue);

        Integer singlePatient = 0;
        Integer pId = null;

        if (doctorInfoList != null && !doctorInfoList.isEmpty()) {

            pId = doctorInfoList.get(0).getDoctorOrRmpId();

            for (DoctorPerformanceInfo doctorPerformanceInfo : doctorInfoList) {
                int tempId = doctorPerformanceInfo.getDoctorOrRmpId();

                if (pId != null && !pId.equals(tempId)) {
                    singlePatient = 1;
                    break;
                }
            }
        }

        model.addAttribute("singlePatient", singlePatient);
        model.addAttribute("doctorOrRmp", autoCompleteValue);
        model.addAttribute("sDate", sDate);
        model.addAttribute("eDate", eDate);
        model.addAttribute("doctorPerformanceInfoList", doctorInfoList);
        return "module/billing/ajax/doctorOrRmpCommissionTable";
    }
}
