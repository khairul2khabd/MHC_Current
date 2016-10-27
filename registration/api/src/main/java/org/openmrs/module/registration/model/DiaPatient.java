/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.openmrs.module.registration.model;

import java.util.Date;

/**
 *
 * @author Khairul
 */
public class DiaPatient {
    public Integer newPatientId;
    public Integer oldPatientId;
    public Integer creator;
    public Date createdDate;

    public Integer getNewPatientId() {
        return newPatientId;
    }

    public void setNewPatientId(Integer newPatientId) {
        this.newPatientId = newPatientId;
    }

    public Integer getOldPatientId() {
        return oldPatientId;
    }

    public void setOldPatientId(Integer oldPatientId) {
        this.oldPatientId = oldPatientId;
    }

    public Integer getCreator() {
        return creator;
    }

    public void setCreator(Integer creator) {
        this.creator = creator;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }
    
}
