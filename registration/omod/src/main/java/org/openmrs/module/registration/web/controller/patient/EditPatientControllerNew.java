/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.registration.web.controller.patient;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.Patient;
import org.openmrs.api.context.Context;
import org.openmrs.module.hospitalcore.HospitalCoreService;
import org.openmrs.module.hospitalcore.model.PatientSearch;
import org.openmrs.module.hospitalcore.util.PatientUtils;
import org.openmrs.module.registration.RegistrationService;
import org.openmrs.module.registration.model.DiaPatientEdit;
import org.openmrs.module.registration.model.DiaPersonEdit;
import org.openmrs.module.registration.model.DiaPersonNameEdit;
import org.openmrs.module.registration.web.controller.util.PatientModelNew;
import org.openmrs.module.registration.web.controller.util.RegistrationWebUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Khairul
 */
@Controller("RegistrationEditPatientControllerNew")
@RequestMapping("/module/registration/editPatientNew.form")
public class EditPatientControllerNew {

    private static Log logger = LogFactory.getLog(EditPatientController.class);

    @RequestMapping(method = RequestMethod.GET)
    public String showForm(@RequestParam("patientId") Integer patientId, Model model) throws ParseException {
        Patient patient = Context.getPatientService().getPatient(patientId);
        PatientModelNew patientModel = new PatientModelNew(patient);
        model.addAttribute("patient", patientModel);

        return "/module/registration/patient/editPatientNew";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String savePatient(@RequestParam("patientId") Integer patientId,
            @RequestParam(value = "fname", required = false) String fName,
            @RequestParam(value = "mname", required = false) String mName,
            @RequestParam(value = "lname", required = false) String lName,
            @RequestParam(value = "gender", required = false) String gender,
            @RequestParam(value = "age", required = false) Date age,
            @RequestParam(value = "ageOnly", required = false) String ageOnly,
            HttpServletRequest request, Model model)
            throws ParseException {

        Patient patient = Context.getPatientService().getPatient(patientId);
        RegistrationService rs = Context.getService(RegistrationService.class);

        Date birthday = patient.getBirthdate();
        model.addAttribute("age", PatientUtils.estimateAge(birthday));

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:MM:ss");
        String ageFormat = sdf.format(age) + " 00:00:00";
        Date conAge = null;
        try {
            conAge = sdf.parse(ageFormat);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        String genderValue = null;
        if (gender.equals("Male")) {
            genderValue = "M";
        } else if (gender.equals("Female")) {
            genderValue = "F";
        } else {
            genderValue = "O";
        }

        // DmsCommonService ms = Context.getService(DmsCommonService.class); // for diagnosis center
        DiaPatientEdit d = rs.getDiaPaEditByPatientId(patientId);
        d.setChangedBy(Context.getAuthenticatedUser().getId());
        d.setDateChanged(new Date());
        rs.updateDiaPaEdit(d); 
        
        String[] s=ageOnly.split("y");
        String ageYear = s[0];
        Integer estAge = Integer.parseInt(ageYear);

        PatientSearch ps = rs.getPatientSearchByPatId(patientId);
        ps.setGivenName(fName);
        ps.setMiddleName(mName);
        ps.setFamilyName(lName);
        ps.setGender(genderValue);
        ps.setBirthdate(conAge);
        ps.setAge(estAge);
        rs.updatePatSearch(ps);

        DiaPersonEdit dpe = rs.getDiaPerEditByPaId(patientId);
        dpe.setGender(genderValue);
        dpe.setBirthDate(age);
        dpe.setDateChanged(new Date());
        dpe.setChangedBy(Context.getAuthenticatedUser().getId());
        rs.updateDiaPerEdit(dpe);

        DiaPersonNameEdit dpne = rs.getDiaPerNamEditByPaId(patientId);
        dpne.setGivenName(fName);
        dpne.setMiddleName(mName);
        dpne.setFamilyName(lName);
        dpne.setChangedBy(Context.getAuthenticatedUser().getId());
        dpne.setDateChanged(new Date());
        rs.updateDiaPerNameEdit(dpne);

        return "/module/registration/thickbox/success";
    }
}
