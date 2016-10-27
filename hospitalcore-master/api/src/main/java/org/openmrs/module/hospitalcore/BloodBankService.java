/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.openmrs.module.hospitalcore;

/**
 *
 * @author cTechbd
 */
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.openmrs.Concept;

import org.openmrs.api.APIException;
import org.openmrs.api.OpenmrsService;

import org.openmrs.module.hospitalcore.model.BloodBankDonorInfo;
import org.openmrs.module.hospitalcore.model.BloodBankPatient;
import org.openmrs.module.hospitalcore.model.BloodBankPatientFinal;
import org.openmrs.module.hospitalcore.model.BloodBankPatientLog;
import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly = false)
public interface BloodBankService extends OpenmrsService {

    public BloodBankPatient saveBloodBankPatient(BloodBankPatient bbpatient) throws APIException;

    public BloodBankPatientLog saveBloodBankPatientLog(BloodBankPatientLog bbpatientlog) throws APIException;

    public BloodBankPatientFinal saveBloodBankPatientFinal(BloodBankPatientFinal bbpatientfinal) throws APIException;

    public List<BloodBankPatient> getBloodBankPatient() throws APIException;

    public void removeBloodBankPatientQueue(BloodBankPatient bbPatientQueue) throws APIException;

    @Transactional(readOnly = true)
	public BloodBankPatient getBloodBankPatient(Integer id) throws APIException;
    
    
    @Transactional(readOnly = true)
    public BloodBankPatient getBloodBankPatientQueue(Integer id) throws APIException;
    
    
    /*For donor*/
    
    public BloodBankDonorInfo saveBloodBankDonorInfo(BloodBankDonorInfo donorinfo) throws APIException;
    public List<BloodBankDonorInfo> getBloodBankDonorInfo() throws APIException;
}
