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

package org.openmrs.module.laboratory.web.controller.queue;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.openmrs.Concept;
import org.openmrs.Encounter;
import org.openmrs.Order;
import org.openmrs.Patient;
import org.openmrs.api.EncounterService;
import org.openmrs.api.PatientService;
import org.openmrs.api.context.Context;
import org.openmrs.module.hospitalcore.HospitalCoreService;
import org.openmrs.module.laboratory.LaboratoryService;
import org.openmrs.module.laboratory.util.LaboratoryConstants;
import org.openmrs.module.laboratory.web.util.PagingUtil;
import org.openmrs.module.laboratory.web.util.LaboratoryUtil;
import org.openmrs.module.laboratory.web.util.TestModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.openmrs.module.hospitalcore.LabService;

@Controller("LaboratorySearchTestController")
@RequestMapping("/module/laboratory/searchTest.form")
public class SearchTestController {

	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.GET)
	public String searchTest(
			@RequestParam(value = "date", required = false) String dateStr,
                       	@RequestParam(value = "phrase", required = false) String phrase,
			@RequestParam(value = "investigation", required = false) Integer investigationId,
                        @RequestParam(value = "patientId", required = false) Integer patientId,
                        
			@RequestParam(value = "currentPage", required = false) Integer currentPage,
			HttpServletRequest request, Model model) {
		LaboratoryService ls = (LaboratoryService) Context
				.getService(LaboratoryService.class);
                
                
                PatientService ps = Context.getPatientService();
               
	//	Patient patient = ps.getPatient(patientId);
       //   Encounter encounter = Context.getEncounterService().getEncounter(encounterId);
                
		Concept investigation = Context.getConceptService().getConcept(investigationId);
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		Date date = null;
		try {
			date = sdf.parse(dateStr);
			Map<Concept, Set<Concept>> testTreeMap = (Map<Concept, Set<Concept>>) request
					.getSession().getAttribute(
							LaboratoryConstants.SESSION_TEST_TREE_MAP);
			Set<Concept> allowableTests = new HashSet<Concept>();
			if (investigation != null) {
				allowableTests = testTreeMap.get(investigation);
			} else {
				for (Concept c : testTreeMap.keySet()) {
					allowableTests.addAll(testTreeMap.get(c));
				}
			}
			if (currentPage == null)
				currentPage = 1;
			List<Order> orders = ls.getOrders(date, phrase, allowableTests,	currentPage);
			List<TestModel> tests = LaboratoryUtil.generateModelsFromOrders(orders, testTreeMap);
                        
			int total = ls.countOrders(date, phrase, allowableTests);
                                              
			PagingUtil pagingUtil = new PagingUtil(LaboratoryConstants.PAGESIZE, currentPage,total);
			model.addAttribute("pagingUtil", pagingUtil);
			model.addAttribute("tests", tests);
			model.addAttribute("testNo", tests.size());
                        model.addAttribute("patientId", patientId);
                        
		} catch (ParseException e) {
			e.printStackTrace();
			System.out.println("Error when parsing order date!");
			return null;
		}
                
 		return "/module/laboratory/queue/search";
	}
}
