/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.openmrs.module.hospitalcore.model;

/**
 *
 * @author cTechbd
 */
 
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import org.openmrs.Concept;
import org.openmrs.Encounter;
import org.openmrs.Patient;
import org.openmrs.User;
import org.openmrs.module.hospitalcore.util.PatientUtils;
 
public class IpdPatientAdmittedQueueLog implements Serializable{
	 private static final long serialVersionUID = 1L;
	        
        private Integer id;
        private Date admissionDate;
	private Patient patient; 
	private String patientIdentifier;
	private String patientName;
	private Date birthDate;
	private String patientAddress;
	private String bed;
	private String comments;
	private String fatherName;
	private String relationshipType;	// son/daughter/wife of
	private String gender;
	private Concept admittedWard; //    :  the ipd ward concept name that patient is transferd from
	private User user; 			  // :     1 ) user who transferred  this patient
				 
	private String  status ; //   : discharge, transfer, call (STRING ) 
	private String caste; // : String
	private BigDecimal monthlyIncome ; //:  String
	private String basicPay; // : String
	private User ipdAdmittedUser; // User admitted in patient admission queue
	private IpdPatientAdmissionLog  patientAdmissionLog;
	private IpdPatientAdmittedLog patientAdmittedLogTransferFrom;//transfer_from_id : log   ( N/A )
	private String admissionOutCome;
        private Encounter ipdEncounter;

        
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getAdmissionDate() {
		return admissionDate;
	}
	public void setAdmissionDate(Date admissionDate) {
		this.admissionDate = admissionDate;
	}
	public Patient getPatient() {
		return patient;
	}
	public void setPatient(Patient patient) {
		this.patient = patient;
	}
	public String getPatientCategory()
	{
		return PatientUtils.getPatientCategory(patient);
	}
	public String getPatientName() {
		return patientName;
	}
	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}
	public Date getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}
	public String getAge(){
		return PatientUtils.estimateAge(patient);
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCaste() {
		return caste;
	}
	public void setCaste(String caste) {
		this.caste = caste;
	}
	
	public BigDecimal getMonthlyIncome() {
		return monthlyIncome;
	}
	public void setMonthlyIncome(BigDecimal monthlyIncome) {
		this.monthlyIncome = monthlyIncome;
	}
	public String getBasicPay() {
		return basicPay;
	}
	public void setBasicPay(String basicPay) {
		this.basicPay = basicPay;
	}
	public IpdPatientAdmissionLog getPatientAdmissionLog() {
		return patientAdmissionLog;
	}
	public void setPatientAdmissionLog(IpdPatientAdmissionLog patientAdmissionLog) {
		this.patientAdmissionLog = patientAdmissionLog;
	}
	public String getPatientIdentifier() {
		return patientIdentifier;
	}
	public void setPatientIdentifier(String patientIdentifier) {
		this.patientIdentifier = patientIdentifier;
	}
	public User getIpdAdmittedUser() {
		return ipdAdmittedUser;
	}
	public void setIpdAdmittedUser(User ipdAdmittedUser) {
		this.ipdAdmittedUser = ipdAdmittedUser;
	}
	public Concept getAdmittedWard() {
		return admittedWard;
	}
	public void setAdmittedWard(Concept admittedWard) {
		this.admittedWard = admittedWard;
	}
	public String getPatientAddress() {
		return patientAddress;
	}
	public void setPatientAddress(String patientAddress) {
		this.patientAddress = patientAddress;
	}
	public String getBed() {
		return bed;
	}
	public void setBed(String bed) {
		this.bed = bed;
	}
	//ghanshyam 11-july-2013 feedback # 1724 Introducing bed availability
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getFatherName() {
		return fatherName;
	}
	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}
	// 30-6-2012 Marta - To handle relationship type #290
	public String getRelationshipType() {
			return relationshipType;
	}
	public void setRelationshipType(String relationshipType) {
		this.relationshipType = relationshipType;
	}
	public IpdPatientAdmittedLog getPatientAdmittedLogTransferFrom() {
		return patientAdmittedLogTransferFrom;
	}
	public void setPatientAdmittedLogTransferFrom(
			IpdPatientAdmittedLog patientAdmittedLogTransferFrom) {
		this.patientAdmittedLogTransferFrom = patientAdmittedLogTransferFrom;
	}
	public String getAdmissionOutCome() {
		return admissionOutCome;
	}
	public void setAdmissionOutCome(String admissionOutCome) {
		this.admissionOutCome = admissionOutCome;
	}
        
        
          public Encounter getIpdEncounter() {
        return ipdEncounter;
           }

        public void setIpdEncounter(Encounter ipdEncounter) {
        this.ipdEncounter = ipdEncounter;
            }
	
}

