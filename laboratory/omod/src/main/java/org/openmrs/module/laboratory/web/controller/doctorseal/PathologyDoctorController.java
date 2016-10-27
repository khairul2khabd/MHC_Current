/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.laboratory.web.controller.doctorseal;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.openmrs.User;
import org.openmrs.api.context.Context;
import org.openmrs.module.laboratory.LaboratoryService;
import org.openmrs.module.laboratory.model.LabDoctorSeal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Tanvir
 */
@Controller("PathologyDoctorController")
public class PathologyDoctorController {

    @RequestMapping(value = "/module/laboratory/pathologydoctor.form", method = RequestMethod.GET)
    public String viewForm(Model model) {

        LaboratoryService ls = Context.getService(LaboratoryService.class);
        List<LabDoctorSeal> getAllDoc = ls.getAllListLabDocSeal();
        model.addAttribute("allDoc", getAllDoc);

        return "/module/laboratory/labdoctorseal/pathologyDoctorName";
    }

    @RequestMapping(value = "/module/laboratory/pathologydoctor.form", method = RequestMethod.POST)
    public String submitForm(@RequestParam("doctorName") String doctorName,
            @RequestParam("degree") String degree,
            @RequestParam("designation") String designation,
            @RequestParam("workplace") String workplace,
            HttpServletRequest request, Model model) {

        LaboratoryService ls = Context.getService(LaboratoryService.class);

        LabDoctorSeal lds = new LabDoctorSeal();
        lds.setDocName(doctorName);
        lds.setDegree(degree);
        lds.setDesignation(designation);
        lds.setWorkPlace(workplace);
        lds.setCreator(Context.getAuthenticatedUser().getId());
        lds.setCreatedDate(new Date());

        ls.saveLabDocSeal(lds);

        return "/module/laboratory/labdoctorseal/pathologyDoctorName";
    }

    @RequestMapping(value = "/module/laboratory/editLabDocSeal.htm", method = RequestMethod.GET)
    public String editLabDoctor(@RequestParam("id") int docId, Model model) {

        LaboratoryService ls = Context.getService(LaboratoryService.class);
        LabDoctorSeal ldseal=ls.getLabDocSealById(docId);
        model.addAttribute("docInfo", ldseal);

        return "/module/laboratory/labdoctorseal/editlabdoc";
    }

    @RequestMapping(value = "/module/laboratory/updateLabDoc.htm", method = RequestMethod.POST)
    public String saveEditedLabDoctorDetails(@RequestParam("id") Integer docId,
            @RequestParam("docName") String docName,
            @RequestParam("degree") String degree,
            @RequestParam("designation") String designation,
            @RequestParam("workplace") String workplace,
            HttpServletRequest request, Model model) {
        
        LaboratoryService ls=Context.getService(LaboratoryService.class);
        LabDoctorSeal lds=ls.getLabDocSealById(docId);
        lds.setDocName(docName);
        lds.setDegree(degree);
        lds.setDesignation(designation);
        lds.setWorkPlace(workplace);
        ls.updateLabDocSeal(lds);

        
        return "/module/laboratory/thickbox/success";
        //return "/module/laboratory/labdoctorseal/editlabdoc";
    }

}
