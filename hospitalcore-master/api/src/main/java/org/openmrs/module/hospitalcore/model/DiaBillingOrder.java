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
public class DiaBillingOrder {
    private Integer id;
    private Integer patientId;
    private Integer encounterId;
    private Integer orderId;
    private Integer conceptId;
    private Integer creator;
    private Date createdDate;
    private int billingStatus; //0=not yet billed,1=billed
    private int cancelStatus; //0=not yet canceled,1=canceled
    private String serviceName;

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getConceptId() {
        return conceptId;
    }

    public void setConceptId(Integer conceptId) {
        this.conceptId = conceptId;
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

    public int getBillingStatus() {
        return billingStatus;
    }

    public void setBillingStatus(int billingStatus) {
        this.billingStatus = billingStatus;
    }

    public int getCancelStatus() {
        return cancelStatus;
    }

    public void setCancelStatus(int cancelStatus) {
        this.cancelStatus = cancelStatus;
    }
    
 
    
    
}
