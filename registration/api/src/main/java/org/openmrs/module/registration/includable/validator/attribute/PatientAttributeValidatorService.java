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

package org.openmrs.module.registration.includable.validator.attribute;

import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.module.hospitalcore.util.GlobalPropertyUtil;
import org.openmrs.module.hospitalcore.util.HospitalCoreConstants;

public class PatientAttributeValidatorService implements PatientAttributeValidator {
	
	private Log logger = LogFactory.getLog(getClass());
	
	private PatientAttributeValidator validator = null;
	
	/**
	 * Get the validator relying on the hospital name. If can't find one, a warning will be thrown
	 * and the default validator will be used.
	 */
	public PatientAttributeValidatorService() {
		String hospitalName = GlobalPropertyUtil.getString(HospitalCoreConstants.PROPERTY_HOSPITAL_NAME, "");
		
		if (StringUtils.isBlank(hospitalName)) {
			hospitalName = "common";
			logger.warn("CAN'T FIND THE HOSPITAL NAME. USE THE DEFAULT VALIDATOR.");
		}
		
		hospitalName = hospitalName.toLowerCase();
		String qualifiedName = "org.openmrs.module.registration.includable.validator.attribute." + hospitalName
		        + ".PatientAttributeValidatorImpl";
		try {
			validator = (PatientAttributeValidator) Class.forName(qualifiedName).newInstance();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String validate(Map<String, Object> parameters) {
		if (validator != null) {
			return validator.validate(parameters);
		} else {
			logger.warn("NO VALIDATOR FOUND!");
		}
		return null;
	}
}
