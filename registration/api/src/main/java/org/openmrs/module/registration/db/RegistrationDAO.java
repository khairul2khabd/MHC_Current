/**
 * Copyright 2008 Society for Health Information Systems Programmes, India (HISP
 * India)
 *
 * This file is part of Registration module.
 *
 * Registration module is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option) any
 * later version.
 *
 * Registration module is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
 * details.
 *
 * You should have received a copy of the GNU General Public License along with
 * Registration module. If not, see <http://www.gnu.org/licenses/>.
 *
 *
 */
package org.openmrs.module.registration.db;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import org.openmrs.Encounter;
import org.openmrs.Patient;
import org.openmrs.PatientIdentifier;
import org.openmrs.PersonAttribute;
import org.openmrs.PersonAttributeType;
import org.openmrs.User;
import org.openmrs.api.db.DAOException;
import org.openmrs.module.hospitalcore.model.DiaRmpName;
import org.openmrs.module.hospitalcore.model.MarDetails;
import org.openmrs.module.hospitalcore.model.PatientSearch;
import org.openmrs.module.registration.model.DiaPatient;
import org.openmrs.module.registration.model.DiaPatientEdit;
import org.openmrs.module.registration.model.DiaPersonEdit;
import org.openmrs.module.registration.model.DiaPersonNameEdit;
import org.openmrs.module.registration.model.DocDetails;
import org.openmrs.module.registration.model.MarketedBy;
import org.openmrs.module.registration.model.RegistrationFee;
import org.openmrs.module.registration.model.RefDoctor;
import org.openmrs.module.registration.model.RefMarketedBy;

public interface RegistrationDAO {

    public RegistrationFee saveRegistrationFee(RegistrationFee fee);

    public RegistrationFee getRegistrationFee(Integer id);

    public List<RegistrationFee> getRegistrationFees(Patient patient,
            Integer numberOfLastDate) throws ParseException;

    public void deleteRegistrationFee(RegistrationFee fee);

    public List<PersonAttribute> getPersonAttribute(PersonAttributeType type,
            String value);

    public Encounter getLastEncounter(Patient patient);

    public int getNationalId(String nationalId);

    public int getNationalId(Integer patientId, String nationalId);

    public int getHealthId(String healthId);

    public int getHealthId(Integer patientId, String healthId);

    public List<Encounter> getCountPatient(Integer creatro) throws DAOException;

    public List<Encounter> countPatientByUser(Integer creator, Date date) throws DAOException;

    public List<Encounter> countRegPatient(Integer creator, String date) throws DAOException;

    public DocDetails saveDocDetails(DocDetails docDetails) throws DAOException;

    public List<DocDetails> getdocName() throws DAOException;

    public RefDoctor saveRefDoc(RefDoctor refDoc) throws DAOException;

    public MarketedBy saveMarketedBy(MarketedBy marketedBy) throws DAOException;

    public List<MarketedBy> getMarketedBy() throws DAOException;

    public void deleteDocDetails(DocDetails docDetails) throws DAOException;

    public RefMarketedBy saveRefMarketedBy(RefMarketedBy refMarketedBy) throws DAOException;

    public List<MarDetails> serchMarName(String text) throws DAOException;

    public List<DocDetails> searchDoctorName(String text) throws DAOException;

    public DocDetails getDocInById(int docId) throws DAOException;

    public DocDetails saveById(DocDetails docDetails) throws DAOException;

    public MarDetails getMarInById(int marId) throws DAOException;

    public MarDetails saveByIdMar(MarDetails marDetails) throws DAOException;

    public DiaPatient saveDiaPatient(DiaPatient diaPatient) throws DAOException;

    public DiaPatient getDiaPatientById(int patientId) throws DAOException;

    public DiaRmpName saveRmp(DiaRmpName rmp) throws DAOException;

    public List<DiaRmpName> getRmpNameAll() throws DAOException;
    
    public List<DiaRmpName> searchRmpName(String text)throws DAOException;
    
    public DiaRmpName getRmpById(int rmpId)throws DAOException;
    
    public DiaRmpName saveRmpByIdForEdit(DiaRmpName rmp)throws DAOException;
    ////
    public DiaPatientEdit getDiaPaEditByPatientId(Integer patientId)throws DAOException;
    
    public DiaPatientEdit updateDiaPaEdit(DiaPatientEdit diPaEdit) throws DAOException;
    
    public PatientSearch getPatientSearchByPatId(Integer patientId)throws DAOException;
    public PatientSearch updatePatSearch(PatientSearch ps)throws DAOException;
    
    public DiaPersonEdit getDiaPerEditByPaId(Integer patientId)throws DAOException;
    public DiaPersonEdit updateDiaPerEdit(DiaPersonEdit diaPerEdit)throws DAOException;
    
    public DiaPersonNameEdit getDiaPerNamEditByPaId(Integer patientId)throws DAOException;
    public DiaPersonNameEdit updateDiaPerNameEdit(DiaPersonNameEdit diaPerNameEdit)throws DAOException;

}
