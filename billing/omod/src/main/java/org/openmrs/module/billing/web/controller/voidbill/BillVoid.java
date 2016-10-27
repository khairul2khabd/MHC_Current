/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.openmrs.module.billing.web.controller.voidbill;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Khairul
 */
@Controller("BillinVoidController")
public class BillVoid {
    
    @RequestMapping(value = "/module/billing/vodiBill.htm", method = RequestMethod.GET)
    public String billList(@RequestParam("patientId") Integer patientId,
             Model model) {
        
         
        return "module/billing/void/billvoid";
    }
}
