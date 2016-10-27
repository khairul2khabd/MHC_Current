
package org.openmrs.module.hospitalcore;

import java.util.Date;
import java.util.List;

import org.openmrs.api.APIException;
import org.openmrs.api.OpenmrsService;
import org.openmrs.module.hospitalcore.model.OpdDrugOrder;
import org.openmrs.module.hospitalcore.model.PatientSearch;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 */
@Transactional
public interface InventoryService extends OpenmrsService {
	
	
	//ghanshyam 15-june-2013 New Requirement #1636 User is able to see and dispense drugs in patient queue for issuing drugs, as ordered from dashboard
	public List<PatientSearch> searchListOfPatient(Date date, String searchKey,int page) throws APIException;
	
	public List<OpdDrugOrder> listOfOrder(Integer patientId,Date date) throws APIException;
	
	public List<OpdDrugOrder> listOfDrugOrder(Integer patientId, Integer encounterId) throws APIException;
	
	public OpdDrugOrder getOpdDrugOrder(Integer patientId,Integer encounterId,Integer inventoryDrugId,Integer formulationId) throws APIException;
	
}
