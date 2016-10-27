/**
 *  Copyright 2008 Society for Health Information Systems Programmes, India (HISP India)
 *
 *  This file is part of Registration module.
 *
 *  Registration module is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.

 *  Registration module is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with Registration module.  If not, see <http://www.gnu.org/licenses/>.
 *
 **/

package org.openmrs.module.registration.impl;

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
import org.openmrs.api.impl.BaseOpenmrsService;
import org.openmrs.module.hospitalcore.model.MarDetails;
import org.openmrs.module.hospitalcore.model.PatientSearch;
import org.openmrs.module.registration.RegistrationService;
import org.openmrs.module.registration.db.RegistrationDAO;
import org.openmrs.module.registration.model.DiaPatient;
import org.openmrs.module.registration.model.DiaPatientEdit;
import org.openmrs.module.registration.model.DiaPersonEdit;
import org.openmrs.module.registration.model.DiaPersonNameEdit;
import org.openmrs.module.registration.model.DocDetails;
import org.openmrs.module.registration.model.MarketedBy;
import org.openmrs.module.registration.model.RefDoctor;
import org.openmrs.module.registration.model.RefMarketedBy;
import org.openmrs.module.registration.model.RegistrationFee;
import org.openmrs.module.registration.model.RmpName;

public class RegistrationServiceImpl extends BaseOpenmrsService implements
		RegistrationService {

	public RegistrationServiceImpl() {
	}

	protected RegistrationDAO dao;

	public void setDao(RegistrationDAO dao) {
		this.dao = dao;
	}

	/*
	 * REGISTRATION FEE
	 */
	public RegistrationFee saveRegistrationFee(RegistrationFee fee) {
		return dao.saveRegistrationFee(fee);
	}

	public RegistrationFee getRegistrationFee(Integer id) {
		return dao.getRegistrationFee(id);
	}

	public List<RegistrationFee> getRegistrationFees(Patient patient,
			Integer numberOfLastDate) throws ParseException {
		return dao.getRegistrationFees(patient, numberOfLastDate);
	}

	public void deleteRegistrationFee(RegistrationFee fee) {
		dao.deleteRegistrationFee(fee);
	}

	/*
	 * PERSON ATTRIBUTE
	 */
	public List<PersonAttribute> getPersonAttribute(PersonAttributeType type,
			String value) {
		return dao.getPersonAttribute(type, value);
	}

	public Encounter getLastEncounter(Patient patient) {
		return dao.getLastEncounter(patient);
	}
	
	//ghanshya,3-july-2013 #1962 Create validation for length of Health ID and National ID
	public int getNationalId(String nationalId){
		return dao.getNationalId(nationalId);
	}
	
	public int getNationalId(Integer patientId,String nationalId){
		return dao.getNationalId(patientId,nationalId);
	}
	
	public int getHealthId(String healthId){
		return dao.getHealthId(healthId);
	}
	
	public int getHealthId(Integer patientId,String healthId){
		return dao.getHealthId(patientId,healthId);
	}
    public List<Encounter> getCountPatient(Integer creatro) throws APIException {
        return dao.getCountPatient(creatro);
    }

    public List<Encounter> countPatientByUser(Integer creator, Date date) throws APIException {
        return dao.countPatientByUser(creator, date);
    }

    public List<Encounter> countRegPatient(Integer creator, String date) throws APIException {
        return dao.countRegPatient(creator, date);
    }

    public DocDetails saveDocDetails(DocDetails docDetails) throws APIException {
        return dao.saveDocDetails(docDetails);
    }

    public List<DocDetails> getdocName() throws APIException {
        return dao.getdocName();
    }

    public RefDoctor saveRefDoc(RefDoctor refDoc) throws APIException {
        return dao.saveRefDoc(refDoc);
    }

    public MarketedBy saveMarketedBy(MarketedBy marketedBy) throws APIException {
        return dao.saveMarketedBy(marketedBy);
    }

    public List<MarketedBy> getMarketedBy() throws APIException {
        return dao.getMarketedBy();
    }

    public void deleteDocDetails(DocDetails docDetails) throws APIException {
         dao.deleteDocDetails(docDetails);
    }

    public RefMarketedBy saveRefMarketedBy(RefMarketedBy refMarketedBy) throws APIException {
       return dao.saveRefMarketedBy(refMarketedBy);
    }

    public List<MarDetails> serchMarName(String text) throws APIException {
        return dao.serchMarName(text);
    }

    public List<DocDetails> searchDoctorName(String text) throws APIException {
        return dao.searchDoctorName(text);
    }

    public DocDetails getDocInById(int docId) throws APIException {
        return dao.getDocInById(docId);
    }

    public DocDetails saveById(DocDetails docDetails) throws APIException {
        return dao.saveById(docDetails);
    }

    public MarDetails getMarInById(int marId) throws APIException {
        return dao.getMarInById(marId);
    }

    public MarDetails saveByIdMar(MarDetails marDetails) throws APIException {
        return dao.saveByIdMar(marDetails);
    }

    public DiaPatient saveDiaPatient(DiaPatient diaPatient) throws APIException {
        return dao.saveDiaPatient(diaPatient);
    }

    public DiaPatient getDiaPatientById(int patientId) throws APIException {
        return dao.getDiaPatientById(patientId);
    }

    public RmpName saveRmp(RmpName rmp) throws APIException {
        return dao.saveRmp(rmp);
    }

    public List<RmpName> getRmpNameAll() throws APIException {
        return dao.getRmpNameAll();
    }

    public List<RmpName> searchRmpName(String text) throws APIException {
        return dao.searchRmpName(text);
    }

    public RmpName getRmpById(int rmpId) throws APIException {
        return dao.getRmpById(rmpId);
    }

    public RmpName reSaveRmpById(RmpName rmp) throws APIException {
        return dao.reSaveRmpById(rmp);
    }

    public DiaPatientEdit getDiaPaEditByPatientId(Integer patientId) throws APIException {
        return dao.getDiaPaEditByPatientId(patientId);
    }

    public DiaPatientEdit updateDiaPaEdit(DiaPatientEdit diPaEdit) throws APIException {
        return dao.updateDiaPaEdit(diPaEdit);
    }

    public PatientSearch getPatientSearchByPatId(Integer patientId) throws APIException {
        return dao.getPatientSearchByPatId(patientId);
    }

    public PatientSearch updatePatSearch(PatientSearch ps) throws APIException {
        return dao.updatePatSearch(ps);
    }

    public DiaPersonEdit getDiaPerEditByPaId(Integer patientId) throws APIException {
        return dao.getDiaPerEditByPaId(patientId);
    }

    public DiaPersonEdit updateDiaPerEdit(DiaPersonEdit diaPerEdit) throws APIException {
        return dao.updateDiaPerEdit(diaPerEdit);
    }

    public DiaPersonNameEdit getDiaPerNamEditByPaId(Integer patientId) throws APIException {
        return dao.getDiaPerNamEditByPaId(patientId);
    }

    public DiaPersonNameEdit updateDiaPerNameEdit(DiaPersonNameEdit diaPerNameEdit) throws APIException {
        return dao.updateDiaPerNameEdit(diaPerNameEdit);
    }

    
  
}
