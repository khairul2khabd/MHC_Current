/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.openmrs.module.hospitalcore.model;

import java.util.Date;

/**
 *
 * @author khairul
 */
public class HisOrder {
    private int id;
    private String accessionNumber;

    
    private String modality;
    private String institutionName;
    private String refPhysicianName;
    private String patientName;
    private String patientId;
    private String birthDate;

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    public String getPatientId() {
        return patientId;
    }

    public void setPatientId(String patientId) {
        this.patientId = patientId;
    }
    private String patientIdentifier;
    private Date patientBirthDate;
    private String patient_sex;
    private String patientWeight;
    private String requestingPhysician;
    private String reqProcDesc;
    private int admissionId;
    private String schStationAeTitle;
    private String schStationName;
    private String schProcStepStartDate;
    private String schProcStepStartTime;
    private String schPrefPhysicianName;
    private String schProcStepDesc;
    private String schProcStepId;
    private String schProcStepLocation;
    private String reqProcId;
    private String reasonForTheReqProc;
    private String reqProcPriority;
    private String orderStatus;
    private String errorDesc;
    private String ipdField1;
    private String ipdField2;
    private String ipdField3;
    private String ipdField4;
    private String ipdField5;
    private String ipdField6;
    private String ipdField7;
    private String ipdField8;
    private Date   createdDate;

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    public String getAccessionNumber() {
        return accessionNumber;
    }

    public void setAccessionNumber(String accessionNumber) {
        this.accessionNumber = accessionNumber;
    }

    public String getModality() {
        return modality;
    }

    public void setModality(String modality) {
        this.modality = modality;
    }

    public String getInstitutionName() {
        return institutionName;
    }

    public void setInstitutionName(String institutionName) {
        this.institutionName = institutionName;
    }

    public String getRefPhysicianName() {
        return refPhysicianName;
    }

    public void setRefPhysicianName(String refPhysicianName) {
        this.refPhysicianName = refPhysicianName;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public String getPatientIdentifier() {
        return patientIdentifier;
    }

    public void setPatientIdentifier(String patientIdentifier) {
        this.patientIdentifier = patientIdentifier;
    }

    public Date getPatientBirthDate() {
        return patientBirthDate;
    }

    public void setPatientBirthDate(Date patientBirthDate) {
        this.patientBirthDate = patientBirthDate;
    }

    public String getPatient_sex() {
        return patient_sex;
    }

    public void setPatient_sex(String patient_sex) {
        this.patient_sex = patient_sex;
    }

    public String getPatientWeight() {
        return patientWeight;
    }

    public void setPatientWeight(String patientWeight) {
        this.patientWeight = patientWeight;
    }

    public String getRequestingPhysician() {
        return requestingPhysician;
    }

    public void setRequestingPhysician(String requestingPhysician) {
        this.requestingPhysician = requestingPhysician;
    }

    public String getReqProcDesc() {
        return reqProcDesc;
    }

    public void setReqProcDesc(String reqProcDesc) {
        this.reqProcDesc = reqProcDesc;
    }

    public int getAdmissionId() {
        return admissionId;
    }

    public void setAdmissionId(int admissionId) {
        this.admissionId = admissionId;
    }

    public String getSchStationAeTitle() {
        return schStationAeTitle;
    }

    public void setSchStationAeTitle(String schStationAeTitle) {
        this.schStationAeTitle = schStationAeTitle;
    }

    public String getSchStationName() {
        return schStationName;
    }

    public void setSchStationName(String schStationName) {
        this.schStationName = schStationName;
    }

    public String getSchProcStepStartDate() {
        return schProcStepStartDate;
    }

    public void setSchProcStepStartDate(String schProcStepStartDate) {
        this.schProcStepStartDate = schProcStepStartDate;
    }

    public String getSchProcStepStartTime() {
        return schProcStepStartTime;
    }

    public void setSchProcStepStartTime(String schProcStepStartTime) {
        this.schProcStepStartTime = schProcStepStartTime;
    }

    public String getSchPrefPhysicianName() {
        return schPrefPhysicianName;
    }

    public void setSchPrefPhysicianName(String schPrefPhysicianName) {
        this.schPrefPhysicianName = schPrefPhysicianName;
    }

    public String getSchProcStepDesc() {
        return schProcStepDesc;
    }

    public void setSchProcStepDesc(String schProcStepDesc) {
        this.schProcStepDesc = schProcStepDesc;
    }

    public String getSchProcStepId() {
        return schProcStepId;
    }

    public void setSchProcStepId(String schProcStepId) {
        this.schProcStepId = schProcStepId;
    }

    public String getSchProcStepLocation() {
        return schProcStepLocation;
    }

    public void setSchProcStepLocation(String schProcStepLocation) {
        this.schProcStepLocation = schProcStepLocation;
    }

    public String getReqProcId() {
        return reqProcId;
    }

    public void setReqProcId(String reqProcId) {
        this.reqProcId = reqProcId;
    }

    public String getReasonForTheReqProc() {
        return reasonForTheReqProc;
    }

    public void setReasonForTheReqProc(String reasonForTheReqProc) {
        this.reasonForTheReqProc = reasonForTheReqProc;
    }

    public String getReqProcPriority() {
        return reqProcPriority;
    }

    public void setReqProcPriority(String reqProcPriority) {
        this.reqProcPriority = reqProcPriority;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getErrorDesc() {
        return errorDesc;
    }

    public void setErrorDesc(String errorDesc) {
        this.errorDesc = errorDesc;
    }

    public String getIpdField1() {
        return ipdField1;
    }

    public void setIpdField1(String ipdField1) {
        this.ipdField1 = ipdField1;
    }

    public String getIpdField2() {
        return ipdField2;
    }

    public void setIpdField2(String ipdField2) {
        this.ipdField2 = ipdField2;
    }

    public String getIpdField3() {
        return ipdField3;
    }

    public void setIpdField3(String ipdField3) {
        this.ipdField3 = ipdField3;
    }

    public String getIpdField4() {
        return ipdField4;
    }

    public void setIpdField4(String ipdField4) {
        this.ipdField4 = ipdField4;
    }

    public String getIpdField5() {
        return ipdField5;
    }

    public void setIpdField5(String ipdField5) {
        this.ipdField5 = ipdField5;
    }

    public String getIpdField6() {
        return ipdField6;
    }

    public void setIpdField6(String ipdField6) {
        this.ipdField6 = ipdField6;
    }

    public String getIpdField7() {
        return ipdField7;
    }

    public void setIpdField7(String ipdField7) {
        this.ipdField7 = ipdField7;
    }

    public String getIpdField8() {
        return ipdField8;
    }

    public void setIpdField8(String ipdField8) {
        this.ipdField8 = ipdField8;
    }
   
}
