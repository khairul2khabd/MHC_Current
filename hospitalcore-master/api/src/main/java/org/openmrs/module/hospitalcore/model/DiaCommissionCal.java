/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.openmrs.module.hospitalcore.model;

import java.math.BigDecimal;
import java.util.Date;
import org.openmrs.Patient;

/**
 *
 * @author Khairul
 */
public class DiaCommissionCal {
    private Integer id;
    private DiaPatientServiceBill diaPatientServiceBill;
    //private Integer patientId;
    private Patient patient;

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }
    private BigDecimal servicePrice;
    private BigDecimal lessAmount;
    private String commission;
    private Date createdDate;
    private Integer creator;
    private Integer serviceId;
    private String serviceName;
    private Integer refId;
    private Boolean status = false;
    private DiaCommissionCalPaid diaComPaid;
    private Integer refRmpId;
    private DiaRmpCommCalculationPaid diaRmpComPaid;
    private Boolean hsStatus=false;

    public Boolean getHsStatus() {
        return hsStatus;
    }

    public void setHsStatus(Boolean hsStatus) {
        this.hsStatus = hsStatus;
    }

    public DiaRmpCommCalculationPaid getDiaRmpComPaid() {
        return diaRmpComPaid;
    }

    public void setDiaRmpComPaid(DiaRmpCommCalculationPaid diaRmpComPaid) {
        this.diaRmpComPaid = diaRmpComPaid;
    }

    public Integer getRefRmpId() {
        return refRmpId;
    }

    public void setRefRmpId(Integer refRmpId) {
        this.refRmpId = refRmpId;
    }

    public DiaCommissionCalPaid getDiaComPaid() {
        return diaComPaid;
    }

    public void setDiaComPaid(DiaCommissionCalPaid diaComPaid) {
        this.diaComPaid = diaComPaid;
    }

    public Boolean isStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public DiaPatientServiceBill getDiaPatientServiceBill() {
        return diaPatientServiceBill;
    }

    public void setDiaPatientServiceBill(DiaPatientServiceBill diaPatientServiceBill) {
        this.diaPatientServiceBill = diaPatientServiceBill;
    }

    public BigDecimal getServicePrice() {
        return servicePrice;
    }

    public void setServicePrice(BigDecimal servicePrice) {
        this.servicePrice = servicePrice;
    }

    public BigDecimal getLessAmount() {
        return lessAmount;
    }

    public void setLessAmount(BigDecimal lessAmount) {
        this.lessAmount = lessAmount;
    }

    public String getCommission() {
        return commission;
    }

    public void setCommission(String commission) {
        this.commission = commission;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Integer getCreator() {
        return creator;
    }

    public void setCreator(Integer creator) {
        this.creator = creator;
    }

    public Integer getServiceId() {
        return serviceId;
    }

    public void setServiceId(Integer serviceId) {
        this.serviceId = serviceId;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public Integer getRefId() {
        return refId;
    }

    public void setRefId(Integer refId) {
        this.refId = refId;
    }
 
}
