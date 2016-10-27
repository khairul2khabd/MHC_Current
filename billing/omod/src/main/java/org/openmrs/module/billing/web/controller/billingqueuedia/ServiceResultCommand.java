/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.openmrs.module.billing.web.controller.billingqueuedia;

import java.math.BigDecimal;
import java.util.Arrays;

/**
 *
 * @author khairul
 */
public class ServiceResultCommand {
    private Integer[] selectedServiceList;
    private Integer[] selectedTestId;
    private Integer[] selectedTestDetails;
    private BigDecimal[] selectedPriceList;
    private Integer refDocId;
    private Integer refMarId;
    private Integer orderId;

    public Integer[] getSelectedTestDetails() {
        return selectedTestDetails;
    }

    public void setSelectedTestDetails(Integer[] selectedTestDetails) {
        this.selectedTestDetails = selectedTestDetails;
    }

    public Integer[] getSelectedTestId() {
        return selectedTestId;
    }

    public void setSelectedTestId(Integer[] selectedTestId) {
        this.selectedTestId = selectedTestId;
    }
    public Integer[] getSelectedServiceList() {
        return selectedServiceList;
    }

    public void setSelectedServiceList(Integer[] selectedServiceList) {
        this.selectedServiceList = selectedServiceList;
    }

    public BigDecimal[] getSelectedPriceList() {
        return selectedPriceList;
    }

    public void setSelectedPriceList(BigDecimal[] selectedPriceList) {
        this.selectedPriceList = selectedPriceList;
    }

    public Integer getRefDocId() {
        return refDocId;
    }

    public void setRefDocId(Integer refDocId) {
        this.refDocId = refDocId;
    }

    public Integer getRefMarId() {
        return refMarId;
    }

    public void setRefMarId(Integer refMarId) {
        this.refMarId = refMarId;
    }
    
     @Override
    public String toString() {
        return "ServiceResultCommand [selectedTestId="
                + Arrays.toString(selectedTestId)
                + ", selectedTestDetails="
                + Arrays.toString(selectedTestDetails)
                + "]";
    }
    
    /* 
    return "OPDEntryCommand [selectedDiagnosisList="
                + Arrays.toString(selectedDiagnosisList)
                + ", selectedProcedureList="
                + Arrays.toString(selectedProcedureList)
                //ghanshyam 1-june-2013 New Requirement #1633 User must be able to send investigation orders from dashboard to billing
                + ", selectedInvestigationList="
                + Arrays.toString(selectedInvestigationList) 
                + ", patientId="
                + patientId + ", internalReferral="
                + Integer.toString(internalReferral)
                + ", externalReferral=" + externalReferral
                + ", note=" + note
                + ", admit=" + admit
                + ", outCome=" + outCome
                + ", dateFollowUp=" 
                + dateFollowUp 
                + ", admitWard=" 
                + admitWard
                + ", radio_f="
                + radio_f 
                + "]";
    */   
    

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }
    
}
