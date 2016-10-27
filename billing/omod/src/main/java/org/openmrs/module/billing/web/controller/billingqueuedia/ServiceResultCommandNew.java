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
public class ServiceResultCommandNew {
    
    private Integer[] selectedTestId;
    private Integer[] selectedTestDetails;
     
    
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
     

    
    
     @Override
    public String toString() {
        return "ServiceResultCommandNew [selectedTestDetails="
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
    

     
    
}
