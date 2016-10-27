/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.openmrs.module.hospitalcore.impl;

import java.util.Date;
import java.util.List;
import org.openmrs.api.APIException;
import org.openmrs.api.impl.BaseOpenmrsService;
import org.openmrs.module.hospitalcore.InventoryService;
import org.openmrs.module.hospitalcore.db.InventoryDAO;
import org.openmrs.module.hospitalcore.model.OpdDrugOrder;
import org.openmrs.module.hospitalcore.model.PatientSearch;

/**
 *
 * @author khairul
 */
public class InventoryServiceImpl extends BaseOpenmrsService implements InventoryService  {

    
    public InventoryServiceImpl() {
	}
	
	protected InventoryDAO dao;
	
	public void setDao(InventoryDAO dao) {
		this.dao = dao;
	}
    
    public List<PatientSearch> searchListOfPatient(Date date, String searchKey, int page) throws APIException {
        return dao.searchListOfPatient(date, searchKey, page);
                }

    public List<OpdDrugOrder> listOfOrder(Integer patientId, Date date) throws APIException {
        return dao.listOfOrder(patientId, date);
    }

    public List<OpdDrugOrder> listOfDrugOrder(Integer patientId, Integer encounterId) throws APIException {
         return dao.listOfDrugOrder(patientId, encounterId);
    }

    public OpdDrugOrder getOpdDrugOrder(Integer patientId, Integer encounterId, Integer inventoryDrugId, Integer formulationId) throws APIException {
        return dao.getOpdDrugOrder(patientId, encounterId, inventoryDrugId, formulationId);
    }
}

