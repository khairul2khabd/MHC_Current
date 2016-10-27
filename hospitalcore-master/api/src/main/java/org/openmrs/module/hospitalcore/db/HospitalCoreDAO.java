/**
 * Copyright 2010 Society for Health Information Systems Programmes, India (HISP
 * India)
 *
 * This file is part of Hospital-core module.
 *
 * Hospital-core module is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option) any
 * later version.
 *
 * Hospital-core module is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
 * details.
 *
 * You should have received a copy of the GNU General Public License along with
 * Hospital-core module. If not, see <http://www.gnu.org/licenses/>.
 *
 *
 */
package org.openmrs.module.hospitalcore.db;

import java.math.BigInteger;
import java.util.List;

import org.openmrs.Encounter;
import org.openmrs.EncounterType;
import org.openmrs.Obs;
import org.openmrs.Patient;
import org.openmrs.PersonAttribute;
import org.openmrs.api.db.DAOException;
import org.openmrs.module.hospitalcore.concept.ConceptModel;
import org.openmrs.module.hospitalcore.model.CoreForm;
 
import org.openmrs.module.hospitalcore.model.OpdTestOrder;
import org.openmrs.module.hospitalcore.model.PatientSearch;

public interface HospitalCoreDAO {

    public List<Obs> listObsGroup(Integer personId, Integer conceptId, Integer min, Integer max) throws DAOException;

    public Obs getObsGroupCurrentDate(Integer personId, Integer conceptId) throws DAOException;

    public Integer buildConcepts(List<ConceptModel> conceptModels);

    public List<Patient> searchPatient(String nameOrIdentifier, String gender, int age, int rangeAge, String date, int rangeDay, String relativeName) throws DAOException;

    public List<Patient> searchPatient(String hql);

    public BigInteger getPatientSearchResultCount(String hql);

    public List<PersonAttribute> getPersonAttributes(Integer patientId);

    public Encounter getLastVisitEncounter(Patient patient, List<EncounterType> types);

    public CoreForm saveCoreForm(CoreForm form);

    public CoreForm getCoreForm(Integer id);

    public List<CoreForm> getCoreForms(String conceptName);

    public List<CoreForm> getCoreForms();

    public void deleteCoreForm(CoreForm form);

    public PatientSearch savePatientSearch(PatientSearch patientSearch);

    public java.util.Date getLastVisitTime(int patientID);

    //ghanshyam 3-june-2013 New Requirement #1632 Orders from dashboard must be appear in billing queue.User must be able to generate bills from this queue
    public PatientSearch getPatientByPatientId(int patientId);

    public OpdTestOrder getOpdTestOrder(Integer orderId);
    
   // public DiaPatientNew getPatientById(Integer patientId) throws DAOException;
}
