/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.openmrs.module.hospitalcore.impl;

import java.util.List;
import org.openmrs.api.APIException;
import org.openmrs.api.impl.BaseOpenmrsService;
import org.openmrs.module.hospitalcore.BloodBankService;
import org.openmrs.module.hospitalcore.db.BloodBankDAO;
import org.openmrs.module.hospitalcore.model.BloodBankDonorInfo;
import org.openmrs.module.hospitalcore.model.BloodBankPatient;
import org.openmrs.module.hospitalcore.model.BloodBankPatientFinal;
import org.openmrs.module.hospitalcore.model.BloodBankPatientLog;

/**
 *
 * @author cTechbd
 */
public class BloodBankServiceImpl extends BaseOpenmrsService implements BloodBankService {

    public BloodBankServiceImpl() {
    }
    protected BloodBankDAO dao;

    public void setDao(BloodBankDAO dao) {
        this.dao = dao;
    }

    public BloodBankPatient saveBloodBankPatient(BloodBankPatient bbpatient) throws APIException {
        return dao.saveBloodBankPatient(bbpatient);
    }

    public BloodBankPatientLog saveBloodBankPatientLog(BloodBankPatientLog bbpatientlog) throws APIException {
        return dao.saveBloodBankPatientLog(bbpatientlog);
    }

    public BloodBankPatientFinal saveBloodBankPatientFinal(BloodBankPatientFinal bbpatientfinal) throws APIException {
        return dao.saveBloodBankPatientFinal(bbpatientfinal);
    }

    public List<BloodBankPatient> getBloodBankPatient() throws APIException {
        return dao.getBloodBankPatient();
    }

    public void removeBloodBankPatientQueue(BloodBankPatient bbPatientQueue)
            throws APIException {
        dao.removeBloodBankPatientQueue(bbPatientQueue);
    }

    public BloodBankPatient getBloodBankPatientQueue(Integer id)
            throws APIException {
        return dao.getBloodBankPatientQueue(id);
    }
    public BloodBankPatient getBloodBankPatient(Integer id)
		throws APIException {
    	return dao.getBloodBankPatient(id);
    }
    
    
    
    
    public BloodBankDonorInfo saveBloodBankDonorInfo(BloodBankDonorInfo donorinfo) throws APIException {
        return dao.saveBloodBankDonorInfo(donorinfo);
    }
    
    
    /*For donor*/
    
    
     public List<BloodBankDonorInfo> getBloodBankDonorInfo() throws APIException {
        return dao.getBloodBankDonorInfo();
    }
}