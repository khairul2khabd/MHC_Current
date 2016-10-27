/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.openmrs.module.billing.web.controller.billingqueuedia;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Khairul
 */
@Controller("BillSerchController")
public class BillSearch {
    @RequestMapping(value = "/module/billing/billSearch.form", method = RequestMethod.GET)
    public String billSearch( @RequestParam(value = "refDocId", required = false) Integer refDocId,
           // @RequestParam(value = "refMarId", required = false) Integer refMarId,
           // @RequestParam(value = "orderId", required = false) Integer orderId,
            @RequestParam(value = "date", required = false) String dStr, Model model) {
       
        return "module/billing/private/billSearch";
        
    }
    
    @RequestMapping(value = "/module/billing/tb.form", method = RequestMethod.GET)
    public String tbShow(  
             Model model) {
       
        return "module/billing/thickbox/success_1";
        
    }
    
}
