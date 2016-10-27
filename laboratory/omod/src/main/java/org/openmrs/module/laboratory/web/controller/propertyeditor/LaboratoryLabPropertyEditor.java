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

package org.openmrs.module.laboratory.web.controller.propertyeditor;

import java.beans.PropertyEditorSupport;

import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.api.context.Context;
import org.openmrs.module.hospitalcore.model.RadiologyDepartment;
import org.openmrs.module.laboratory.LaboratoryService;

public class LaboratoryLabPropertyEditor extends PropertyEditorSupport {
	private Log log = LogFactory.getLog(this.getClass());

	public LaboratoryLabPropertyEditor() {
	}

	public void setAsText(String text) throws IllegalArgumentException {
		LaboratoryService ls = (LaboratoryService) Context.getService(LaboratoryService.class);
		if (text != null && text.trim().length() > 0) {
			try {
				setValue(ls.getLaboratoryDepartment(NumberUtils.toInt(text)));
			} catch (Exception ex) {
				log.error("Error setting text: " + text, ex);
				throw new IllegalArgumentException("Radiology department not found: "
						+ ex.getMessage());
			}
		} else {
			setValue(null);
		}
	}

	public String getAsText() {
		RadiologyDepartment department = (RadiologyDepartment) getValue();
		if (department == null) {
			return null;
		} else {
			return department.getId() + "";
		}
	}
}
