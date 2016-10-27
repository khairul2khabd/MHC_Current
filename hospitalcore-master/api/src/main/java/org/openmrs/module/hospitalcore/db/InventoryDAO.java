/**
 *
 * @author khairul
 */

package org.openmrs.module.hospitalcore.db;



import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.hibernate.SessionFactory;
import org.openmrs.Role;
import org.openmrs.api.db.DAOException;
import org.openmrs.module.hospitalcore.model.InventoryDrug;
import org.openmrs.module.hospitalcore.model.InventoryDrugCategory;
import org.openmrs.module.hospitalcore.model.InventoryDrugFormulation;
import org.openmrs.module.hospitalcore.model.InventoryDrugUnit;
import org.openmrs.module.hospitalcore.model.InventoryStore;
import org.openmrs.module.hospitalcore.model.InventoryStoreDrugIndent;
import org.openmrs.module.hospitalcore.model.InventoryStoreDrugPatient;
import org.openmrs.module.hospitalcore.model.InventoryStoreDrugPatientDetail;
import org.openmrs.module.hospitalcore.model.InventoryStoreDrugTransaction;
import org.openmrs.module.hospitalcore.model.InventoryStoreDrugTransactionDetail;
import org.openmrs.module.hospitalcore.model.OpdDrugOrder;
import org.openmrs.module.hospitalcore.model.PatientSearch;


/**
 *
 */
public interface InventoryDAO {
	
	
	
	//ghanshyam 15-june-2013 New Requirement #1636 User is able to see and dispense drugs in patient queue for issuing drugs, as ordered from dashboard
	public List<PatientSearch> searchListOfPatient(Date date, String searchKey,int page) throws DAOException;
	
	public List<OpdDrugOrder> listOfOrder(Integer patientId,Date date) throws DAOException;
	
	public List<OpdDrugOrder> listOfDrugOrder(Integer patientId, Integer encounterId) throws DAOException;
	
	public OpdDrugOrder getOpdDrugOrder(Integer patientId,Integer encounterId,Integer inventoryDrugId,Integer formulationId) throws DAOException;
	
}
