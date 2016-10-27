/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.registration.web.controller.autocomplete;

import java.util.ArrayList;
import java.util.List;
import org.openmrs.api.context.Context; 
//import org.openmrs.module.hospitalcore.MedisunService;
import org.openmrs.module.hospitalcore.model.MarDetails;
import org.openmrs.module.registration.RegistrationService;
import org.openmrs.module.registration.model.DocDetails;
import org.openmrs.module.registration.model.RmpName;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author khairul
 */
@Controller("RegistrationAutoCompleteController")
public class AutoCompleteController {

    @RequestMapping(value = "/autoCompleteMarName.htm", method = RequestMethod.GET)
    public String autoCompleteDoctorName(@RequestParam(value = "kha", required = false) String text, Model model) {

     //   MedisunService ms = Context.getService(MedisunService.class);
      //  List<MarDetails> marByIdName = ms.serchMarName(text);
      //  model.addAttribute("marByIdName", marByIdName);
        
        RegistrationService rs=Context.getService(RegistrationService.class);
        List<MarDetails> marByIdName = rs.serchMarName(text);
        model.addAttribute("marByIdName", marByIdName);

        return "/module/registration/autocomplete/autoCompleteMarName";
    }

    @RequestMapping(value = "/autoCompleteDoctorNameById.htm", method = RequestMethod.GET)
    public String autoCompleteDoctorNameById( //@RequestParam(value = "q", required = false) Integer id,
            @RequestParam(value = "kha", required = false) String text, Model model) {

      //  MedisunService ms = Context.getService(MedisunService.class);
      //  List<DocDetail> docById = ms.searchDoctorName(text);
      //  model.addAttribute("docById", docById);
        
        RegistrationService rs=Context.getService(RegistrationService.class);
        List<DocDetails> docById = rs.searchDoctorName(text);
        model.addAttribute("docById", docById);
        return "/module/registration/autocomplete/autoCompleteDoctorNameById";
    }
    
    @RequestMapping(value = "/autoCompleteRmpName.htm", method = RequestMethod.GET)
    public String autoCompleteRmpName( //@RequestParam(value = "q", required = false) Integer id,
            @RequestParam(value = "kha", required = false) String text, Model model) {

      //  MedisunService ms = Context.getService(MedisunService.class);
      //  List<DocDetail> docById = ms.searchDoctorName(text);
      //  model.addAttribute("docById", docById);
        
        RegistrationService rs=Context.getService(RegistrationService.class);
        List<RmpName> rmp = rs.searchRmpName(text);
        model.addAttribute("rmpId", rmp);
        return "/module/registration/autocomplete/autoCompleteRmpName";
    }

}
 