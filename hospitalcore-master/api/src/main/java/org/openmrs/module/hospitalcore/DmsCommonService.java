/**
 *  Copyright 2013 Society for Health Information Systems Programmes, India (HISP India)
 *
 *  This file is part of Hospital-core module.
 *
 *  Hospital-core module is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.

 *  Hospital-core module is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with Hospital-core module.  If not, see <http://www.gnu.org/licenses/>.
 *  
 *  author: ghanshyam
 *  date: 8-01-2013
 **/

package org.openmrs.module.hospitalcore;

import java.util.List;

import org.openmrs.Concept;
import org.openmrs.ConceptName;
import org.openmrs.PatientIdentifier;
import org.openmrs.api.APIException;
import org.openmrs.api.OpenmrsService;
import org.openmrs.module.hospitalcore.model.DiaBillingQueue;
 
import org.openmrs.module.hospitalcore.model.DmsOpdUnit;
import org.openmrs.module.hospitalcore.model.PatientSearch;
import org.springframework.transaction.annotation.Transactional;

/**
*
*/
@Transactional
public interface DmsCommonService extends OpenmrsService {

	public ConceptName getOpdWardNameByConceptId(Concept con)
			throws APIException;

	public List<DmsOpdUnit> getOpdActivatedIdList();
        
        public DiaBillingQueue saveDiaBillingQueue(DiaBillingQueue diaBillingQueue)throws APIException;
        
        public PatientSearch getPatientById(int patientId) throws APIException;
        
        public PatientSearch savePatientSearch(PatientSearch patientSearch) throws APIException;
        
        public PatientIdentifier getPatIdentByPatientId(int patientId) throws APIException;
        
        public PatientIdentifier reSavePatientIde(PatientIdentifier patientIdentifier) throws APIException;
        
 
        
        
}
