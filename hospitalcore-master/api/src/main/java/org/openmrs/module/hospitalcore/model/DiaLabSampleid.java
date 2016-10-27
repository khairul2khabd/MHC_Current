/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.openmrs.module.hospitalcore.model;

import org.openmrs.Patient;

/**
 *
 * @author Khairul
 */
public class DiaLabSampleid {
    private int id;
    private Patient patient;
    private String sampleId;
    private DiaPatientServiceBill diaPatientServiceBill;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public String getSampleId() {
        return sampleId;
    }

    public void setSampleId(String sampleId) {
        this.sampleId = sampleId;
    }

    public DiaPatientServiceBill getDiaPatientServiceBill() {
        return diaPatientServiceBill;
    }

    public void setDiaPatientServiceBill(DiaPatientServiceBill diaPatientServiceBill) {
        this.diaPatientServiceBill = diaPatientServiceBill;
    }
 
}
