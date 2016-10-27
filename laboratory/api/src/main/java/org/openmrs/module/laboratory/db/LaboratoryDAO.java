/**
 *  Copyright 2011 Society for Health Information Systems Programmes, India (HISP India)
 *
 *  This file is part of Laboratory module.
 *
 *  Laboratory module is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.

 *  Laboratory module is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with Laboratory module.  If not, see <http://www.gnu.org/licenses/>.
 *
 **/

package org.openmrs.module.laboratory.db;

import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.openmrs.Concept;
import org.openmrs.Encounter;
import org.openmrs.Order;
import org.openmrs.OrderType;
import org.openmrs.Patient;
import org.openmrs.Role;
import org.openmrs.api.APIException;
import org.openmrs.api.db.DAOException;
import org.openmrs.module.hospitalcore.model.DiaConceptNumeric;
import org.openmrs.module.hospitalcore.model.DiaInvestigationSpecimen;
 
import org.openmrs.module.hospitalcore.model.Lab;
import org.openmrs.module.hospitalcore.model.LabTest;
import org.openmrs.module.hospitalcore.util.TestModel;
import org.openmrs.module.laboratory.model.LabDoctorSeal;

public interface LaboratoryDAO {

	 
	public Lab saveLaboratoryDepartment(Lab department);

	 
	public Lab getLaboratoryDepartment(Integer id);

	 
	public void deleteLabDepartment(Lab department);

	 
	public Lab getDepartment(Role role);

	 
	public List<Order> getOrders(Date orderStartDate, OrderType orderType,
			Set<Concept> tests, List<Patient> patients, int page)
			throws ParseException;

	 
	public Integer countOrders(Date orderStartDate, OrderType orderType,
			Set<Concept> tests, List<Patient> patients) throws ParseException;

	 
	public LabTest saveLaboratoryTest(LabTest test);
 
	public LabTest getLaboratoryTest(Integer id);

	 
	public void deleteLaboratoryTest(LabTest test);

	 
	public LabTest getLaboratoryTest(Order order);

	 
	public List<LabTest> getLaboratoryTests(Date date, String status,
			Set<Concept> concepts, List<Patient> patients)
			throws ParseException;

	 
	public abstract List<LabTest> getLaboratoryTestsByDate(Date date,
			Set<Concept> tests, List<Patient> patients) throws ParseException;

	 
	public List<LabTest> getLaboratoryTestsByDiscontinuedDate(Date date,
			Set<Concept> tests, List<Patient> patients) throws ParseException;

	 
	public List<LabTest> getLaboratoryTestsByDateAndPatient(Date date,
			Patient patient) throws ParseException;

	 
	public List<LabTest> getLaboratoryTests(Date date, String sampleId)
			throws ParseException;

	 
	public List<Order> getOrders(Patient patient, Date date, Concept concept)
			throws ParseException;

	 
	public LabTest getLaboratoryTest(Encounter encounter);
	
        public List<TestModel> getEncounter(Integer patientId,Date date) throws APIException;
	public List<LabTest> getAllTest();
        
     //   public DiaConceptNumeric saveDiaConNum(DiaConceptNumeric diaConceptNumeric) throws ParseException;
        
     //   public DiaConceptNumericDta saveDiaConNumDta(DiaConceptNumericDta diaConceptNumericDta);
        
        public DiaInvestigationSpecimen getDiaSepByConceptId(Integer conceptId)throws DAOException;
        
        public List<DiaInvestigationSpecimen> getAllDiaSpecimen() throws DAOException;
        
        public List<LabTest> getLaboratoryTestsByDateAndAccepted(Date date) throws DAOException;
        
        public LabDoctorSeal saveLabDocSeal(LabDoctorSeal labDocSeal)throws DAOException;
        
        public List<LabDoctorSeal> getAllListLabDocSeal()throws DAOException; 
        
        public LabDoctorSeal getLabDocSealById(Integer id)throws DAOException;
        
        public LabDoctorSeal updateLabDocSeal(LabDoctorSeal labDocSela)throws DAOException;
        
}
