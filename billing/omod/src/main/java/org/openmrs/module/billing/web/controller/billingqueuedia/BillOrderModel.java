/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.openmrs.module.billing.web.controller.billingqueuedia;

/**
 *
 * @author khairul
 */
public class BillOrderModel {
    private Integer[] selectedTestId;
    private Integer conceptId;
    private Integer patientId;
    private Integer encounterId;

    public Integer[] getSelectedTestId() {
        return selectedTestId;
    }

    public void setSelectedTestId(Integer[] selectedTestId) {
        this.selectedTestId = selectedTestId;
    }

    public Integer getConceptId() {
        return conceptId;
    }

    public void setConceptId(Integer conceptId) {
        this.conceptId = conceptId;
    }

    public Integer getPatientId() {
        return patientId;
    }

    public void setPatientId(Integer patientId) {
        this.patientId = patientId;
    }

    public Integer getEncounterId() {
        return encounterId;
    }

    public void setEncounterId(Integer encounterId) {
        this.encounterId = encounterId;
    }
    
}
