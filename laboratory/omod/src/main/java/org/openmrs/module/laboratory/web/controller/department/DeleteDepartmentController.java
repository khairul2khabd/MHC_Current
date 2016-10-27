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

package org.openmrs.module.laboratory.web.controller.department;

import org.openmrs.api.context.Context;
import org.openmrs.module.hospitalcore.model.Lab;
import org.openmrs.module.laboratory.LaboratoryService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("LaboratoryDeleteDepartmentController")
@RequestMapping("/module/laboratory/deleteDepartment.form")
public class DeleteDepartmentController {

	@RequestMapping(method = RequestMethod.GET)
	public String deleteForm(@RequestParam("id") Integer id,
			Model model) {
		LaboratoryService ls = (LaboratoryService) Context.getService(LaboratoryService.class);
		Lab department = ls.getLaboratoryDepartment(id);
		if(department!=null){
			ls.deleteLaboratoryDepartment(department);
		}
		return "redirect:/module/laboratory/listDepartment.form";
	}

}
