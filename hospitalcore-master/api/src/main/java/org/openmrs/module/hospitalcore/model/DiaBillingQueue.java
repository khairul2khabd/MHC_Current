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
public class DiaBillingQueue {
    public int id;
    public int refDocId;
    public int refMarId;
    public int patientId;
    public String patientName;
    public int encounterId;
    public String status;
    public int creator;
    public Date createdDate;
    //new
    public String identifier;
    public int age;
    public String gender;
    public String fullName;
    public int refRmpId;

    public int getRefRmpId() {
        return refRmpId;
    }

    public void setRefRmpId(int refRmpId) {
        this.refRmpId = refRmpId;
    }

    public String getIdentifier() {
        return identifier;
    }

    public void setIdentifier(String identifier) {
        this.identifier = identifier;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRefDocId() {
        return refDocId;
    }

    public void setRefDocId(int refDocId) {
        this.refDocId = refDocId;
    }

    public int getRefMarId() {
        return refMarId;
    }

    public void setRefMarId(int refMarId) {
        this.refMarId = refMarId;
    }

    public int getPatientId() {
        return patientId;
    }

    public void setPatientId(int patientId) {
        this.patientId = patientId;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public int getEncounterId() {
        return encounterId;
    }

    public void setEncounterId(int encounterId) {
        this.encounterId = encounterId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getCreator() {
        return creator;
    }

    public void setCreator(int creator) {
        this.creator = creator;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }
    
}
