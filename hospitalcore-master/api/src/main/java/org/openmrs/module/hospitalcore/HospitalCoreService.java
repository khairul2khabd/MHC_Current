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
package org.openmrs.module.hospitalcore;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigInteger;
import java.util.List;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPathExpressionException;

import org.openmrs.Concept;
import org.openmrs.Encounter;
import org.openmrs.EncounterType;
import org.openmrs.Obs;
import org.openmrs.Patient;
import org.openmrs.PersonAttribute;
import org.openmrs.User;
import org.openmrs.api.APIException;
import org.openmrs.api.ConceptService;
import org.openmrs.api.OpenmrsService;
import org.openmrs.module.hospitalcore.model.CoreForm;
import org.openmrs.module.hospitalcore.model.OpdTestOrder;
import org.openmrs.module.hospitalcore.model.PatientSearch;
import org.springframework.transaction.annotation.Transactional;
import org.xml.sax.SAXException;

@Transactional
public interface HospitalCoreService extends OpenmrsService {

    public List<Obs> listObsGroup(Integer personId, Integer conceptId,
            Integer min, Integer max) throws APIException;

    public EncounterType insertEncounterTypeByKey(String type)
            throws APIException;

    public void creatConceptQuestionAndAnswer(ConceptService conceptService,
            User user, String conceptParent, String... conceptChild)
            throws APIException;

    public Obs createObsGroup(Patient patient, String properyKey);

    public Concept insertConceptUnlessExist(String dataTypeName,
            String conceptClassName, String conceptName) throws APIException;

    public Obs getObsGroup(Patient patient);

    public Obs getObsGroupCurrentDate(Integer personId) throws APIException;

    public void insertSynonym(Concept concept, String name);

    public void insertMapping(Concept concept, String sourceName,
            String sourceCode);

    public Concept insertConcept(String dataTypeName, String conceptClassName,
            String name, String shortname, String description)
            throws APIException;

    public Integer importConcepts(InputStream diagnosisStream,
            InputStream mappingStream, InputStream synonymStream)
            throws XPathExpressionException, ParserConfigurationException,
            SAXException, IOException;

    public List<Patient> searchPatient(String nameOrIdentifier, String gender,
            int age, int rangeAge, String date, int rangeDay,
            String relativeName) throws APIException;

    public List<Patient> searchPatient(String hql);

    public BigInteger getPatientSearchResultCount(String hql);

    public List<PersonAttribute> getPersonAttributes(Integer patientId);

    public Encounter getLastVisitEncounter(Patient patient,
            List<EncounterType> types);

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
    
    //public DiaPatientNew getPatientById(Integer patientId) throws APIException;

}
