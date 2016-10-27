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

package org.openmrs.module.laboratory;

import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Set;
import org.apache.log4j.DailyRollingFileAppender;

import org.openmrs.Concept;
import org.openmrs.Encounter;
import org.openmrs.Order;
import org.openmrs.Patient;
import org.openmrs.api.APIException;
import org.openmrs.api.OpenmrsService;
import org.openmrs.module.hospitalcore.model.Lab;
import org.openmrs.module.hospitalcore.model.LabTest;
import org.openmrs.module.hospitalcore.util.TestModel;
import org.springframework.transaction.annotation.Transactional;
import org.openmrs.module.hospitalcore.model.DiaConceptNumeric;
import org.openmrs.module.hospitalcore.model.DiaInvestigationSpecimen;
import org.openmrs.module.laboratory.model.LabDoctorSeal;


@Transactional
public interface LaboratoryService extends OpenmrsService {


	public Lab saveLaboratoryDepartment(Lab department);
	
	public Lab getLaboratoryDepartment(Integer id);

	public void deleteLaboratoryDepartment(Lab department);
	
	public Lab getCurrentDepartment();
	
	public List<Order> getOrders(Date startDate, String phrase,
			Set<Concept> tests, int page) throws ParseException;

	public Integer countOrders(Date startDate, String phrase, Set<Concept> tests)
			throws ParseException;

	public Integer acceptTest(Order order, String sampleId) throws ParseException;

	public LabTest saveLaboratoryTest(LabTest test);
	
	public LabTest getLaboratoryTest(Integer id);
	
	public void deleteLaboratoryTest(LabTest test);
	
	public LabTest getLaboratoryTest(Order order);
	
	public String rescheduleTest(Order order, Date rescheduledDate);
	
	public List<LabTest> getAcceptedLaboratoryTests(Date date, String phrase,
			Set<Concept> allowableTests) throws ParseException;

	public String completeTest(LabTest test);
	
	public List<LabTest> getAllLaboratoryTestsByDate(Date date, String phrase,
			Set<Concept> allowableTests) throws ParseException;

	public List<LabTest> getCompletedLaboratoryTests(Date date, String phrase,
			Set<Concept> allowableTests) throws ParseException;

	public List<LabTest> getLaboratoryTestsByDateAndPatient(Date date,
			Patient patient) throws ParseException;

	public List<LabTest> getLaboratoryTests(Date date) throws ParseException;
	
	public String getDefaultSampleId(String investigationName) throws ParseException;

	public List<Order> getOrders(Patient patient, Date date, Concept concept) throws ParseException;
	
	public LabTest getLaboratoryTest(Encounter encounter);
        
	public List<LabTest> getAllTest();
        
       // public DiaConceptNumeric saveDiaConNum(DiaConceptNumeric diaConceptNumeric)throws ParseException;
        
      //  public DiaConceptNumericDta saveDiaConNumDta(DiaConceptNumericDta diaConceptNumericDta);
        public DiaInvestigationSpecimen getDiaSepByConceptId(Integer conceptId)throws APIException;
        
        public List<DiaInvestigationSpecimen> getAllDiaSpecimen() throws APIException;
        
        public List<LabTest> getLaboratoryTestsByDateAndAccepted(Date date) throws ParseException;
        
        public LabDoctorSeal saveLabDocSeal(LabDoctorSeal labDocSeal)throws APIException;
        
        public List<LabDoctorSeal> getAllListLabDocSeal()throws APIException;
        
        public LabDoctorSeal getLabDocSealById(Integer id)throws APIException;
        
        public LabDoctorSeal updateLabDocSeal(LabDoctorSeal labDocSela)throws APIException;
}
