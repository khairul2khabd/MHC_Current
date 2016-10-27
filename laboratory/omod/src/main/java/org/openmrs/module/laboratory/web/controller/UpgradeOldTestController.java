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

package org.openmrs.module.laboratory.web.controller;

import java.util.List;

import org.openmrs.Order;
import org.openmrs.api.context.Context;
import org.openmrs.module.hospitalcore.model.LabTest;
import org.openmrs.module.laboratory.LaboratoryService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("LaboratoryUpgradeOldTestController")
@RequestMapping("/module/laboratory/upgradeOldTest.form")
public class UpgradeOldTestController {

	@RequestMapping(method = RequestMethod.GET)
	public void enterResult() {
		List<LabTest> tests = Context.getService(LaboratoryService.class).getAllTest();
		for(LabTest test:tests){
			Order order = test.getOrder();
			test.setConcept(order.getConcept());
			test.setPatient(order.getPatient());
			Context.getService(LaboratoryService.class).saveLaboratoryTest(test);
		}
	}
}
