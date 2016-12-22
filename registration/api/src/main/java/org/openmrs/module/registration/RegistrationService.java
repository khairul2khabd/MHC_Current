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
package org.openmrs.module.registration;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import org.openmrs.Encounter;
import org.openmrs.Patient;
import org.openmrs.PatientIdentifier;
import org.openmrs.PersonAttribute;
import org.openmrs.PersonAttributeType;
import org.openmrs.User;
import org.openmrs.api.APIException;
import org.openmrs.api.OpenmrsService;
import org.openmrs.module.hospitalcore.model.MarDetails;
import org.openmrs.module.registration.model.DiaPatient;
import org.openmrs.module.registration.model.RegistrationFee;
import org.springframework.transaction.annotation.Transactional;
import org.openmrs.module.registration.model.DocDetails;
import org.openmrs.module.registration.model.MarketedBy;
import org.openmrs.module.registration.model.RefDoctor;
import org.openmrs.module.registration.model.MarketedBy;
import org.openmrs.module.registration.model.RefMarketedBy;
import org.openmrs.PersonName;
import org.openmrs.module.hospitalcore.model.DiaRmpName;
import org.openmrs.module.registration.model.DiaPatientEdit;
import org.openmrs.module.hospitalcore.model.PatientSearch;
import org.openmrs.module.registration.model.DiaPersonEdit;
import org.openmrs.module.registration.model.DiaPersonNameEdit;


@Transactional
public interface RegistrationService extends OpenmrsService {

    public RegistrationFee saveRegistrationFee(RegistrationFee fee);

    public RegistrationFee getRegistrationFee(Integer id);

    public List<RegistrationFee> getRegistrationFees(Patient patient,
            Integer numberOfLastDate) throws ParseException;

    public void deleteRegistrationFee(RegistrationFee fee);

    public List<PersonAttribute> getPersonAttribute(PersonAttributeType type,
            String value);

    public Encounter getLastEncounter(Patient patient);

    //ghanshya,3-july-2013 #1962 Create validation for length of Health ID and National ID
    public int getNationalId(String nationalId);

    public int getNationalId(Integer patientId, String nationalId);

    public int getHealthId(String healthId);

    public int getHealthId(Integer patientId, String healthId);

    public List<Encounter> getCountPatient(Integer creatro) throws APIException;

    public List<Encounter> countPatientByUser(Integer creator, Date date) throws APIException;

    public List<Encounter> countRegPatient(Integer creator, String date) throws APIException;

    public DocDetails saveDocDetails(DocDetails docDetails) throws APIException;

    public List<DocDetails> getdocName() throws APIException;

    public RefDoctor saveRefDoc(RefDoctor refDoc) throws APIException;

    public MarketedBy saveMarketedBy(MarketedBy marketedBy) throws APIException;

    public List<MarketedBy> getMarketedBy() throws APIException;

    //public void deleteOpdPatientQueue(OpdPatientQueue opdPatientQueue) throws APIException;
    public void deleteDocDetails(DocDetails docDetails) throws APIException;

    public RefMarketedBy saveRefMarketedBy(RefMarketedBy refMarketedBy) throws APIException;

    public List<MarDetails> serchMarName(String text) throws APIException;

    public List<DocDetails> searchDoctorName(String text) throws APIException;

    public DocDetails getDocInById(int docId) throws APIException;

    public DocDetails saveById(DocDetails docDetails) throws APIException;

    public MarDetails getMarInById(int marId) throws APIException;

    public MarDetails saveByIdMar(MarDetails marDetails) throws APIException;
    
    public DiaPatient saveDiaPatient(DiaPatient diaPatient)throws APIException;
    
    public DiaPatient getDiaPatientById(int patientId) throws APIException;
    
    public DiaRmpName saveRmp(DiaRmpName rmp)throws APIException;
    
    public List <DiaRmpName> getRmpNameAll() throws APIException;
    
    public List<DiaRmpName> searchRmpName(String text)throws APIException;
    
    public DiaRmpName getRmpById(int rmpId)throws APIException;
    
    public DiaRmpName saveRmpByIdForEdit(DiaRmpName rmp)throws APIException;
   
    // For Patient Edit
    
    public DiaPatientEdit getDiaPaEditByPatientId(Integer patientId)throws APIException;
    public DiaPatientEdit updateDiaPaEdit(DiaPatientEdit diPaEdit) throws APIException;
    
    public PatientSearch getPatientSearchByPatId(Integer patientId)throws APIException;
    public PatientSearch updatePatSearch(PatientSearch ps)throws APIException;
    
    public DiaPersonEdit getDiaPerEditByPaId(Integer patientId)throws APIException;
    public DiaPersonEdit updateDiaPerEdit(DiaPersonEdit diaPerEdit)throws APIException;
    
    public DiaPersonNameEdit getDiaPerNamEditByPaId(Integer patientId)throws APIException;
    public DiaPersonNameEdit updateDiaPerNameEdit(DiaPersonNameEdit diaPerNameEdit)throws APIException;
    
}
