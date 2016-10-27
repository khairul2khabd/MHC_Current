/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.billing.web.controller.autocomplete;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.lang.NumberUtils;
import org.openmrs.api.context.Context;
import org.openmrs.module.hospitalcore.MedisunService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.openmrs.module.hospitalcore.model.BillableService;
import org.openmrs.module.hospitalcore.model.DiaDocDetails;
import org.openmrs.module.hospitalcore.model.DiaRmpName;
import org.openmrs.module.hospitalcore.model.DocDetail;

/**
 *
 * @author khairul
 */
@Controller("BillingAutoCompleteController")
public class AutoCompleteController {

    @RequestMapping(value = "/module/billing/autoCompleteTest.htm", method = RequestMethod.GET)
    public String autoCompleteTestName(@RequestParam(value = "q", required = false) String text, Model model) {

        MedisunService ms = Context.getService(MedisunService.class);
        List<BillableService> billableServiceList = ms.searchTestNameOrID(text);
        model.addAttribute("billableServiceList", billableServiceList);

        return "module/billing/autocomplete/autoCompleteTestName";
    }

    @RequestMapping(value = "/module/billing/autoCompleteTestEdit.htm", method = RequestMethod.GET)
    public String autoCompleteEditTestName(@RequestParam(value = "q", required = false) String text, Model model) {

        MedisunService ms = Context.getService(MedisunService.class);
        List<BillableService> billableServiceListEdit = ms.searchTestNameOrID(text);
        model.addAttribute("billableServiceListEdit", billableServiceListEdit);

        return "module/billing/autocomplete/autoCompleteTestNameEdit";
    }

    @RequestMapping(value = "/module/billing/autoCompletePrice.htm", method = RequestMethod.GET)
    public String autoCompletePriceList(@RequestParam(value = "q", required = false) String text, Model model) {

        MedisunService ms = Context.getService(MedisunService.class);
        List<BillableService> billableServiceList = ms.searchTestNameOrID(text);
        model.addAttribute("billableServicePrice", billableServiceList);

        return "module/billing/autocomplete/autoCompletePrice";
    }

    @RequestMapping(value = "/module/billing/autoCompleteTime.htm", method = RequestMethod.GET)
    public String autoCompleteTime(@RequestParam(value = "q", required = false) String text, Model model) {

        return "module/billing/autocomplete/autoCompleteTime";
    }

    @RequestMapping(value = "/module/billing/autoCompleteDoc.htm", method = RequestMethod.GET)
    public String autoCompleteDocList(@RequestParam(value = "q", required = false) String text, Model model) {

        MedisunService ms = Context.getService(MedisunService.class);
        List<DiaDocDetails> docById = ms.searchDoctorName(text);
        model.addAttribute("docById", docById);
        return "module/billing/autocomplete/autoCompleteDocInfo";
    }

    @RequestMapping(value = "/module/billing/autoCompleteRmp.htm", method = RequestMethod.GET)
    public String autoCompleteRmpList(@RequestParam(value = "q", required = false) String text, Model model) {

        MedisunService ms = Context.getService(MedisunService.class);
        List<DiaRmpName> rmpById = ms.searchRmpName(text);
        model.addAttribute("rmpById", rmpById);
        return "module/billing/autocomplete/autoCompleteRmp";
    }

}
