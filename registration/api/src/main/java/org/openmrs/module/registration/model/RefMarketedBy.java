/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.openmrs.module.registration.model;

import java.util.Date;

/**
 *
 * @author khairul
 */
public class RefMarketedBy {
     public int id;
    public int marId;
    public String marName;
    public int patientId;
    public String patientName;
    public int encounterId;
    public int creator;
    public Date createdDate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMarId() {
        return marId;
    }

    public void setMarId(int marId) {
        this.marId = marId;
    }

    public String getMarName() {
        return marName;
    }

    public void setMarName(String marName) {
        this.marName = marName;
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
