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
 *  date: 11-01-2013
 *  issue: #556 Bangladesh
 **/

package org.openmrs.module.hospitalcore;

import java.util.Date;
import java.util.List;

import org.openmrs.Concept;
import org.openmrs.Patient;
import org.openmrs.api.APIException;
import org.openmrs.api.OpenmrsService;
import org.openmrs.module.hospitalcore.model.InventoryDrug;
import org.openmrs.module.hospitalcore.model.InventoryDrugFormulation;
import org.openmrs.module.hospitalcore.model.InventoryStoreDrugPatient;
import org.openmrs.module.hospitalcore.model.InventoryStoreDrugPatientDetail;
import org.openmrs.module.hospitalcore.model.OpdDrugOrder;
import org.openmrs.module.hospitalcore.model.PatientSearch;
import org.springframework.transaction.annotation.Transactional;

/**
*
*/
@Transactional
public interface InventoryCommonService extends OpenmrsService{

	public List<InventoryStoreDrugPatient> getAllIssueDateByPatientId(Patient patient) throws APIException;
	
	public List<InventoryStoreDrugPatient> getDeatilOfInventoryStoreDrugPatient(Patient patient,String date) throws APIException;
	
	public List<InventoryStoreDrugPatientDetail> getDrugDetailOfPatient(InventoryStoreDrugPatient isdpd) throws APIException;
	
	//ghanshyam 12-june-2013 New Requirement #1635 User should be able to send pharmacy orders to issue drugs to a patient from dashboard
	public InventoryDrug getDrugByName(String name) throws APIException;
	
	public List<Concept> getDrugFrequency() throws APIException;
	
	public InventoryDrugFormulation getDrugFormulationById(Integer id) throws APIException;
        
        // khairul 09-Mar-15 New Requirements #IPD Treatment page can show this drug when dr prescribe
        
        public List<PatientSearch> searchListOfPatient(Date date, String searchKey,int page) throws APIException;
	
	public List<OpdDrugOrder> listOfOrder(Integer patientId) throws APIException;
	
	public List<OpdDrugOrder> listOfDrugOrder(Integer patientId, Integer encounterId) throws APIException;
	
	public OpdDrugOrder getOpdDrugOrder(Integer patientId,Integer encounterId,Integer inventoryDrugId,Integer formulationId) throws APIException;
	
}
