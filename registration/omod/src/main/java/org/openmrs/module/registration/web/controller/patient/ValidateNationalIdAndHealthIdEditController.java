/**
 *  Copyright 2013 Society for Health Information Systems Programmes, India (HISP India)
 *
 *  This file is part of Registration module.
 *
 *  Registration module is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.

 *  Registration module is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with Registration module.  If not, see <http://www.gnu.org/licenses/>.
 *  author: Ghanshyam
 *  date:   3-june-2013
 *  issue no: #1962
 **/

package org.openmrs.module.registration.web.controller.patient;

import org.openmrs.api.context.Context;
import org.openmrs.module.registration.RegistrationService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("ValidateNationalIdAndHealthIdEditController")
@RequestMapping("/module/registration/validatenationalidandhealthidedit.form")
public class ValidateNationalIdAndHealthIdEditController {
	@RequestMapping(method = RequestMethod.GET)
	public String main(
			Model model,
			@RequestParam(value = "patientId", required = false) Integer patientId, 
			@RequestParam(value = "nationalId", required = false) String patientNationalId, 
			@RequestParam(value = "healthId", required = false) String patientHealthId) {
		RegistrationService registrationService  = Context.getService(RegistrationService.class);
		Integer nid=registrationService .getNationalId(patientId,patientNationalId);
		Integer hid=registrationService .getHealthId(patientId,patientHealthId);
		model.addAttribute("nid", nid);
		model.addAttribute("hid", hid);
		return "/module/registration/validateNationalIdAndHealthIdEdit";
	}
}

