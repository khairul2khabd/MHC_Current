/**
 *  Copyright 2011 Society for Health Information Systems Programmes, India (HISP India)
 *
 *  This file is part of Laboratory module.
 *
 *  Laboratory module is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.

 *  Laboratory module is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with Laboratory module.  If not, see <http://www.gnu.org/licenses/>.
 *
 **/

package org.openmrs.module.laboratory.web.controller.worklist;

import java.util.Date;
import java.util.UUID;

import org.openmrs.Encounter;
import org.openmrs.EncounterType;
import org.openmrs.Location;
import org.openmrs.api.context.Context;
import org.openmrs.module.hospitalcore.BillingConstants;
import org.openmrs.module.hospitalcore.model.LabTest;
import org.openmrs.module.hospitalcore.util.GlobalPropertyUtil;
import org.openmrs.module.laboratory.LaboratoryService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("LaboratoryEnterResultController")
@RequestMapping("/module/laboratory/enterResult.form")
public class EnterResultController {

	@RequestMapping(method = RequestMethod.GET)
	public String enterResult(
			@RequestParam(value = "testId") Integer testId,
			Model model) {
		LaboratoryService ls = (LaboratoryService) Context.getService(LaboratoryService.class);
		LabTest test = ls.getLaboratoryTest(testId);
		String encounterTypeStr = GlobalPropertyUtil.getString(BillingConstants.GLOBAL_PROPRETY_LAB_ENCOUNTER_TYPE, "LABENCOUNTER");
		EncounterType encounterType = Context.getEncounterService().getEncounterType(encounterTypeStr);
		Encounter enc = new Encounter();
		enc.setCreator(Context.getAuthenticatedUser());
		enc.setDateCreated(new Date());
		Location loc = Context.getLocationService().getLocation(1);		
		enc.setLocation(loc);
		enc.setPatient(test.getPatient());
		enc.setPatientId(test.getPatient().getId());		
		enc.setEncounterType(encounterType);
		enc.setVoided(false);
		enc.setProvider(Context.getAuthenticatedUser().getPerson());
		enc.setUuid(UUID.randomUUID().toString());		
		enc.setEncounterDatetime(new Date());		
		enc = Context.getEncounterService().saveEncounter(enc);		
		test.setEncounter(enc);
		ls.saveLaboratoryTest(test);
		return "redirect:/module/laboratory/showForm.form?encounterId=" + enc.getEncounterId() + "&conceptId=" + test.getConcept().getConceptId();
	}
}
