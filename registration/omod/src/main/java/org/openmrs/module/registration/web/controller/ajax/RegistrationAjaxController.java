/**
 *  Copyright 2008 Society for Health Information Systems Programmes, India (HISP India)
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
 *
 **/

package org.openmrs.module.registration.web.controller.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.Patient;
import org.openmrs.api.context.Context;
import org.openmrs.module.hospitalcore.util.GlobalPropertyUtil;
import org.openmrs.module.registration.RegistrationService;
import org.openmrs.module.registration.model.RegistrationFee;
import org.openmrs.module.registration.util.RegistrationConstants;
import org.openmrs.module.registration.util.RegistrationUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("RegistrationAjaxController")
public class RegistrationAjaxController {
	
	private static Log logger = LogFactory.getLog(RegistrationAjaxController.class);
	
	/**
	 * process patient birth date
	 * 
	 * @param birthdate
	 * @param model
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value = "/module/registration/ajax/processPatientBirthDate.htm", method = RequestMethod.GET)
	public String processPatientBirthDate(@RequestParam("birthdate") String birthdate, Model model) throws ParseException {
		
		Map<String, Object> json = new HashMap<String, Object>();
		
		// try to parse date
		// if success -> it's a birthdate
		// otherwise -> it's an age
		Date date = null;
		try {
			date = RegistrationUtils.parseDate(birthdate);
		}
		catch (ParseException e) {
			
		}
		
		if (date != null) {
			
			if (isLaterToday(date)) {
				json.put("error", "Birthdate must be before the current date.");
			} else {
				// the user entered the correct birthdate
				json.put("estimated", false);
				json.put("birthdate", birthdate);
				json.put("age", RegistrationUtils.estimateAge(birthdate));
				logger.info("User entered the correct birthdate.");
			}
			
		} else {
			
			String lastLetter = birthdate.substring(birthdate.length() - 1).toLowerCase();
			if ("ymwd".indexOf(lastLetter) < 0) {
				json.put("error", "Age in wrong format");
			} else {
				try {
					json.put("estimated", true);
					String estimatedBirthdate = getEstimatedBirthdate(birthdate);
					json.put("birthdate", estimatedBirthdate);
					json.put("age", RegistrationUtils.estimateAge(estimatedBirthdate));
				}
				catch (Exception e) {
					json.put("error", e.getMessage());
				}
			}
		}
		model.addAttribute("json", json);
		return "/module/registration/ajax/processPatientBirthDate";
	}
	
	/**
	 * Check whether a day is later than today
	 * 
	 * @param date
	 * @return
	 */
	private boolean isLaterToday(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(new Date());
		c.set(Calendar.HOUR, 0);
		c.set(Calendar.MINUTE, 0);
		c.set(Calendar.SECOND, 0);
		return date.after(c.getTime());
	}
	
	/*
	 * Estimate the birthdate by age
	 * 
	 * @param age
	 * 
	 * @return
	 */
	private String getEstimatedBirthdate(String text) throws Exception {
		text = text.toLowerCase();
		String ageStr = text.substring(0, text.length() - 1);
		String type = text.substring(text.length() - 1);
		int age = Integer.parseInt(ageStr);
		if (age < 0) {
			throw new Exception("Age must not be negative number!");
		}
		Calendar date = Calendar.getInstance();
		if (type.equalsIgnoreCase("y")) {
			date.add(Calendar.YEAR, -age);
		} else if (type.equalsIgnoreCase("m")) {
			date.add(Calendar.MONTH, -age);
		} else if (type.equalsIgnoreCase("w")) {
			date.add(Calendar.WEEK_OF_YEAR, -age);
		} else if (type.equalsIgnoreCase("d")) {
			date.add(Calendar.DATE, -age);
		}
		return RegistrationUtils.formatDate(date.getTime());
	}
	
	@RequestMapping(value = "/module/registration/ajax/buySlip.htm", method = RequestMethod.GET)
	public void buySlip(@RequestParam("patientId") Integer patientId, Model model, HttpServletResponse response)
	                                                                                                            throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		RegistrationFee fee = new RegistrationFee();
		Patient patient = Context.getPatientService().getPatient(patientId);
		fee.setPatient(patient);
		fee.setCreatedOn(new Date());
		fee.setCreatedBy(Context.getAuthenticatedUser());
		fee.setFee(new BigDecimal(GlobalPropertyUtil.getInteger(RegistrationConstants.PROPERTY_REGISTRATION_FEE, 0)));
		Context.getService(RegistrationService.class).saveRegistrationFee(fee);
		out.print("success");
	}
}
