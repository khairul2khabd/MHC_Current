/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.openmrs.module.hospitalcore.model;

/**
 *
 * @author Dell
 */
public class BloodBankPatientLog {
    private Integer id;
    private String patientId;
    private Integer encounterId;
    //private Integer userId;
    private String patientName;
    private String patientIdentifier;
    private String age;
    private String gender;
    private String blood;
    private String aboCell;
    private String bloodGroup;
    private String result;
    private Integer bbPatientInfoId;
    

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

    public Integer getEncounterId() {
        return encounterId;
    }

    public void setEncounterId(Integer encounterId) {
        this.encounterId = encounterId;
    }

    /*public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
*/
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

    public String getBlood() {
        return blood;
    }

    public void setBlood(String blood) {
        this.blood = blood;
    }
    
    ////Blood related information

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
}
