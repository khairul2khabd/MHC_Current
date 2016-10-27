/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.openmrs.module.hospitalcore.model;

import java.util.Date;

/**
 *
 * @author Dell
 */
public class BloodBankPatientFinal {

    private Integer id;
    private String patientId;
    private String patientName;
    private String age;
    private String gender;
    private String aboCell;
    private String bloodGroup;
    private String result;
    private Integer bbPatientInfoId;
    private String identifier;
    private Date dateAccepted;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPatientId() {
        return patientId;
    }

    public void setPatientId(String patientId) {
        this.patientId = patientId;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAboCell() {
        return aboCell;
    }

    public void setAboCell(String aboCell) {
        this.aboCell = aboCell;
    }

    public String getBloodGroup() {
        return bloodGroup;
    }

    public void setBloodGroup(String bloodGroup) {
        this.bloodGroup = bloodGroup;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public Integer getBbPatientInfoId() {
        return bbPatientInfoId;
    }

    public void setBbPatientInfoId(Integer bbPatientInfoId) {
        this.bbPatientInfoId = bbPatientInfoId;
    }

    public String getIdentifier() {
        return identifier;
    }

    public void setIdentifier(String identifier) {
        this.identifier = identifier;
    }

    public Date getDateAccepted() {
        return dateAccepted;
    }

    public void setDateAccepted(Date dateAccepted) {
        this.dateAccepted = dateAccepted;
    }

}
