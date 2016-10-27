/**
 *  Copyright 2010 Society for Health Information Systems Programmes, India (HISP India)
 *
 *  This file is part of Hospital-core module.
 *
 *  Hospital-core module is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.

 *  Hospital-core module is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with Hospital-core module.  If not, see <http://www.gnu.org/licenses/>.
 *
 **/
package org.openmrs.module.hospitalcore;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.openmrs.Concept;
import org.openmrs.api.APIException;
import org.openmrs.api.OpenmrsService;
import org.openmrs.module.hospitalcore.model.IpdPatientAdmission;
import org.openmrs.module.hospitalcore.model.IpdPatientAdmissionLog;
import org.openmrs.module.hospitalcore.model.IpdPatientAdmitted;
import org.openmrs.module.hospitalcore.model.IpdPatientAdmittedLog;
import org.openmrs.module.hospitalcore.model.IpdPatientIntake;
import org.openmrs.module.hospitalcore.model.WardBedStrength;
import org.openmrs.module.hospitalcore.model.IpdPatientVitalStatistics;
import org.openmrs.module.hospitalcore.model.OpdDrugOrder;
import org.springframework.transaction.annotation.Transactional;
import org.openmrs.module.hospitalcore.model.IpdPatientAdmittedQueueLog;

@Transactional(readOnly=false)
public interface IpdService extends OpenmrsService{
	
	public IpdPatientAdmission saveIpdPatientAdmission(IpdPatientAdmission admission) throws APIException;
	
	public void removeIpdPatientAdmission(IpdPatientAdmission admission) throws APIException;
	
	public IpdPatientAdmissionLog saveIpdPatientAdmissionLog(IpdPatientAdmissionLog admissionLog) throws APIException;
	
	public IpdPatientAdmitted saveIpdPatientAdmitted(IpdPatientAdmitted admitted) throws APIException;
	
	public void removeIpdPatientAdmitted(IpdPatientAdmitted admitted) throws APIException;
	
	public IpdPatientAdmittedLog saveIpdPatientAdmittedLog(IpdPatientAdmittedLog admitted) throws APIException;
	
	@Transactional(readOnly = true)
	public IpdPatientAdmittedLog getIpdPatientAdmittedLog(Integer id) throws APIException;
	
	@Transactional(readOnly = true)
	public IpdPatientAdmitted getIpdPatientAdmitted(Integer id) throws APIException;
	
	@Transactional(readOnly = true)
	public IpdPatientAdmissionLog getIpdPatientAdmissionLog(Integer id) throws APIException;
	
	@Transactional(readOnly = true)
	public IpdPatientAdmission getIpdPatientAdmission(Integer id) throws APIException;
        
       	
	@Transactional(readOnly = true)
	public List<IpdPatientAdmittedLog> getAllIpdPatientAdmittedLog() throws APIException;
	
	@Transactional(readOnly = true)
	public List<IpdPatientAdmitted> getAllIpdPatientAdmitted() throws APIException;
	
	@Transactional(readOnly = true)
	public List<IpdPatientAdmissionLog> listIpdPatientAdmissionLog(Integer patientId, Integer admissionWardId,String status,Integer min, Integer max)
			throws APIException;
	
	@Transactional(readOnly = true)
	public List<IpdPatientAdmission> getAllIpdPatientAdmission() throws APIException;
	
	@Transactional(readOnly = true)
	public List<IpdPatientAdmission> searchIpdPatientAdmission(String patientSearch, ArrayList<Integer> userIds, String fromDate, String toDate, ArrayList<Integer> wardIds, String status) throws APIException;
	
	@Transactional(readOnly = true)
	public List<IpdPatientAdmitted> searchIpdPatientAdmitted(String patientSearch, ArrayList<Integer> userIds, String fromDate, String toDate, ArrayList<Integer> wardIds, String status) throws APIException;
	
	public IpdPatientAdmitted transfer(Integer id, Integer wardId, Integer doctorId, String bed) throws APIException;
	
	//ghanshyam 11-july-2013 feedback # 1724 Introducing bed availability
	public IpdPatientAdmitted transfer(Integer id, Integer wardId, Integer doctorId, String bed,String comments) throws APIException;
	
	public IpdPatientAdmittedLog discharge(Integer id, Integer outComeConceptId) throws APIException;
	
	// Kesavulu loka 24/06/2013 # 1926 One text filed for otherInstructions.
	public IpdPatientAdmittedLog discharge(Integer id, Integer outComeConceptId, String otherInstructions) throws APIException;
	
	@Transactional(readOnly = true)
	public List<IpdPatientAdmittedLog> listAdmittedLogByPatientId(Integer patientId) throws APIException;
	
	@Transactional(readOnly = true)
	public IpdPatientAdmitted getAdmittedByPatientId(Integer patientId) throws APIException;
	public void saveWardBedStrength(WardBedStrength wardBedStrength) throws APIException;
	public WardBedStrength getWardBedStrengthByWardId(Integer wardId) throws APIException;

	//ghanshyam 10-june-2013 New Requirement #1847 Capture Vital statistics for admitted patient in ipd
	public IpdPatientVitalStatistics saveIpdPatientVitalStatistics(IpdPatientVitalStatistics vitalStatistics) throws APIException;
	public List<Concept> getDiet() throws APIException;
	public List<IpdPatientVitalStatistics> getIpdPatientVitalStatistics(Integer patientId,Integer patientAdmissionLogId) throws APIException;
        
        // According to the NIKDU (Specialy for NIKDU) add this Yasmin akter cTechbd
        public IpdPatientIntake saveIpdPatientIntake(IpdPatientIntake ipdPatientIntake) throws APIException; 
        public List<IpdPatientIntake> getIpdPatientIntake(Integer patientId,Integer patientAdmissionLogId) throws APIException;
        
        // for Drug
        public List<OpdDrugOrder> getOpdDrugOrderByPatientEncounterId(Integer pateintId )throws APIException;
        
       //double entry queue avoid
        
        public IpdPatientAdmission getAdmissionByPatientId(Integer patientId) throws APIException;
        
        // Ipd to billing and finaly admitted  index, add thos service
        public IpdPatientAdmittedQueueLog saveIpdPatientAdmittedQueueLog (IpdPatientAdmittedQueueLog admittedqueuelog) throws APIException;
        
        @Transactional(readOnly = true)
        public IpdPatientAdmittedQueueLog  getIpdpatientAdmittedQueueLogNew(Integer enconterId) throws APIException;

        public void removeIpdPatientAdmittedQueueLogNew(IpdPatientAdmittedQueueLog admittedqueuelog)throws APIException;
}
