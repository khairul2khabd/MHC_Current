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

package org.openmrs.module.laboratory.web.controller.main;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.Concept;
import org.openmrs.api.context.Context;
import org.openmrs.module.hospitalcore.concept.TestTree;
import org.openmrs.module.hospitalcore.model.Lab;
import org.openmrs.module.laboratory.LaboratoryService;
import org.openmrs.module.laboratory.util.LaboratoryConstants;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("LaboratoryMainController")
@RequestMapping("/module/laboratory/main.form")
public class MainController {
	
	private Log logger = LogFactory.getLog(getClass());

	@RequestMapping(method = RequestMethod.GET)
	public String firstView(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		Map<Concept, Set<Concept>> testTreeMap = generateTestTreeMap();
		logger.info("Test tree: " + testTreeMap);
		session.setAttribute(LaboratoryConstants.SESSION_TEST_TREE_MAP, testTreeMap);		
		return "/module/laboratory/main/main";
	}

	/*
	 * Generate test tree map. This map will be stored in session, so other features can reuse it and don't need to generate it again.
	 */	
	private Map<Concept, Set<Concept>> generateTestTreeMap() {
		LaboratoryService ls = (LaboratoryService) Context
				.getService(LaboratoryService.class);
		Lab department = ls.getCurrentDepartment();
		Map<Concept, Set<Concept>> investigationTests = new HashMap<Concept, Set<Concept>>();
		if (department != null) {
			Set<Concept> investigations = department.getInvestigationsToDisplay();
			for (Concept investigation : investigations) {
				TestTree tree = new TestTree(investigation);
				if (tree.getRootNode() != null) {
					investigationTests.put(tree.getRootNode().getConcept(),
							tree.getConceptSet());
				}
			}			
		}
		return investigationTests;
	}
}
