/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.openmrs.module.hospitalcore.db;

import java.util.List;
import org.openmrs.api.db.DAOException;
import org.openmrs.module.hospitalcore.model.BloodBankDonorInfo;
import org.openmrs.module.hospitalcore.model.BloodBankPatient;
import org.openmrs.module.hospitalcore.model.BloodBankPatientFinal;
import org.openmrs.module.hospitalcore.model.BloodBankPatientLog;

/**
 *
 * @author cTechbd
 */
public interface BloodBankDAO {

    public BloodBankPatient saveBloodBankPatient(BloodBankPatient bbpatient) throws DAOException;

    public BloodBankPatientLog saveBloodBankPatientLog(BloodBankPatientLog bbpatientlog) throws DAOException;

    public BloodBankPatientFinal saveBloodBankPatientFinal(BloodBankPatientFinal bbpatientfinal) throws DAOException;

    public List<BloodBankPatient> getBloodBankPatient() throws DAOException;

    public void removeBloodBankPatientQueue(BloodBankPatient bbPatientQueue) throws DAOException;

    public BloodBankPatient getBloodBankPatientQueue(Integer id) throws DAOException;
    
    public BloodBankPatient getBloodBankPatient(Integer id) throws DAOException;
    
    
    /*For donor*/
    
    public BloodBankDonorInfo saveBloodBankDonorInfo(BloodBankDonorInfo donorinfo) throws DAOException;
    public List<BloodBankDonorInfo> getBloodBankDonorInfo() throws DAOException;
    
}

