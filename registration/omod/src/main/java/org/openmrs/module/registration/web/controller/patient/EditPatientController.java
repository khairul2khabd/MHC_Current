/**
 * Copyright 2008 Society for Health Information Systems Programmes, India (HISP
 * India)
 *
 * This file is part of Registration module.
 *
 * Registration module is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option) any
 * later version.
 *
 * Registration module is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
 * details.
 *
 * You should have received a copy of the GNU General Public License along with
 * Registration module. If not, see <http://www.gnu.org/licenses/>.
 *
 *
 */
package org.openmrs.module.registration.web.controller.patient;

import java.io.IOException;
import java.text.ParseException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.dom4j.DocumentException;
import org.jaxen.JaxenException;
import org.openmrs.Patient;
import org.openmrs.PersonAttribute;
import org.openmrs.PersonName;
import org.openmrs.api.context.Context;
import org.openmrs.module.hospitalcore.DmsCommonService;
import org.openmrs.module.hospitalcore.HospitalCoreService;
import org.openmrs.module.hospitalcore.model.PatientSearch;
import org.openmrs.module.hospitalcore.util.GlobalPropertyUtil;
import org.openmrs.module.hospitalcore.util.HospitalCoreUtils;
import org.openmrs.module.hospitalcore.util.PatientUtils;
import org.openmrs.module.registration.includable.validator.attribute.PatientAttributeValidatorService;
import org.openmrs.module.registration.model.DiaPatient;
import org.openmrs.module.registration.util.RegistrationConstants;
import org.openmrs.module.registration.util.RegistrationUtils;
import org.openmrs.module.registration.web.controller.util.PatientModel;
import org.openmrs.module.registration.web.controller.util.RegistrationWebUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.openmrs.module.registration.RegistrationService;

@Controller("RegistrationEditPatientController")
@RequestMapping("/module/registration/editPatient.form")
public class EditPatientController {

    private static Log logger = LogFactory.getLog(EditPatientController.class);

    @RequestMapping(method = RequestMethod.GET)
    public String showForm(@RequestParam("patientId") Integer patientId, Model model) throws JaxenException,
            DocumentException, IOException,
            ParseException {
        Patient patient = Context.getPatientService().getPatient(patientId);
        PatientModel patientModel = new PatientModel(patient);
        model.addAttribute("patient", patientModel);
        RegistrationWebUtils.getAddressData(model);

        DmsCommonService ms = Context.getService(DmsCommonService.class);
        String shortName = GlobalPropertyUtil.getString(RegistrationConstants.PROPERTY_IDENTIFIER_PREFIX, "");

        DiaPatient dp = Context.getService(RegistrationService.class).getDiaPatientById(patientId);
               // model.addAttribute("identifier", shortName+"-"+dp.getNewPatientId());         

        return "/module/registration/patient/editPatient";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String savePatient(@RequestParam("patientId") Integer patientId, HttpServletRequest request, Model model)
            throws ParseException {

        Patient patient = Context.getPatientService().getPatient(patientId);

        DmsCommonService ms = Context.getService(DmsCommonService.class); // for diagnosis center
        
        Map<String, String> parameters = RegistrationWebUtils.optimizeParameters(request);
        logger.info("Submited parameters: " + parameters);
        
        PatientSearch ps = new PatientSearch();
            String fullname = PatientUtils.getFullName(patient).replace(" ", "");
            ps.setFullname(fullname);
            ps.setPatientId(patient.getPatientId());
            ps.setAge(patient.getAge());
            ps.setBirthdate(patient.getBirthdate());
            ps.setFamilyName(patient.getFamilyName());
            ps.setGender(patient.getGender());
            ps.setGivenName(patient.getGivenName());
            ps.setMiddleName(patient.getMiddleName());
            ps.setIdentifier(patient.getPatientIdentifier().getIdentifier());
            ps.setPersonNameId(patient.getPersonName().getId());

            Context.getService(HospitalCoreService.class).savePatientSearch(ps);

         
        return "/module/registration/patient/savePatient";
    }
   
}
