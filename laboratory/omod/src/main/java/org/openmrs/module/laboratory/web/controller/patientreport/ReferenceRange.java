/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.laboratory.web.controller.patientreport;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.openmrs.Concept;
import org.openmrs.api.context.Context;
import org.openmrs.module.hospitalcore.model.DiaConceptNumeric;
import org.openmrs.module.hospitalcore.model.OpddrugorderNew;
import org.openmrs.User;
import org.openmrs.module.hospitalcore.LabService;
import org.openmrs.module.hospitalcore.model.DiaConceptNumericRe;

/**
 *
 * @author Khairul
 */
@Controller("ReferenceRangeController")
public class ReferenceRange {

    @RequestMapping(value = "/module/laboratory/referenceRange.form", method = RequestMethod.GET)
    public String referenceRange(@RequestParam("id") Integer conceptId,
            @RequestParam(value = "msg", required = false) String msg,
            Model model) {
        LabService lab = Context.getService(LabService.class);
        Concept concept = Context.getConceptService().getConcept(conceptId);
        model.addAttribute("concept", concept.getName().getName());
        model.addAttribute("conceptId", conceptId);
        model.addAttribute("msg", msg);

        List<DiaConceptNumericRe> diaReList = lab.getDiRefarenceListByConId(conceptId);
        model.addAttribute("diaRefList", diaReList);

        DiaConceptNumeric diaConNumeric = lab.getDiaConNumByConId(conceptId);
        model.addAttribute("diaNum", diaConNumeric);
        if (diaConNumeric != null) {
            String d = diaConNumeric.getRefRange();
            String[] dd = d.split("#");
            String ddd = StringUtils.join(dd, "<br>");
            // t.setRefRange(dia.getRefRange());
            model.addAttribute("dd", dd);
            model.addAttribute("ddd", ddd);
        }

        return "/module/laboratory/patientreport/refRange";
    }

    @RequestMapping(value = "/module/laboratory/referenceRangeSave.form", method = RequestMethod.POST)
    public String refRangeSave(//@RequestParam(value="rr",required = false) String rr,
            @RequestParam(value = "conceptId", required = false) Integer conceptId,
            HttpServletRequest request, Model model) {
        //  Concept concept = Context.getConceptService().getConcept(conceptId);
        // model.addAttribute("concept",concept.getName().getName());
        User creator = Context.getAuthenticatedUser();

        String[] refRan = request.getParameterValues("rr");
        LabService lab = Context.getService(LabService.class);
        
        DiaConceptNumeric diaConNumeric = lab.getDiaConNumByConId(conceptId);

        String rRan = StringUtils.join(refRan, '#');
        // if (StringUtils.isNotBlank(command.getNote())) {
        if ((refRan != null) && (diaConNumeric == null)) {
            DiaConceptNumeric diaCon = new DiaConceptNumeric();
            diaCon.setConceptId(conceptId);
            diaCon.setCreator(creator.getId());
            diaCon.setCreatedDate(new Date());
            diaCon.setRefRange(rRan);

            lab.saveDiaConNum(diaCon);

            //d.setNormalRange(refRan);
            for (String ref : refRan) {

                DiaConceptNumericRe d = new DiaConceptNumericRe();
                d.setConceptId(conceptId);
                d.setDiaConceptNumeric(diaCon);
                d.setNormalRange(ref);
                lab.saveConNumRe(d);
            }
        }
        
        if(diaConNumeric!=null && refRan!=null){
            diaConNumeric.setRefRange(rRan);
            lab.margeDiaConNum(diaConNumeric);
        }
        
        
        
        model.addAttribute("msg", "Success fully Added Refarnage Range");

        //return "/module/laboratory/patientreport/blank";
        //return "redirect:/module/inventory/drugCategoryList.form";
        // return "redirect:/module/patientqueue/main.htm?opdId=" + opdPatientLog.getOpdConcept().getId();
        return "redirect:/module/laboratory/referenceRange.form?id=" + conceptId;

    }

}
