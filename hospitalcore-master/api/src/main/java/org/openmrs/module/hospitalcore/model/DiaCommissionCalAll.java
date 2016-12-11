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
public class DiaCommissionCalAll {

    private Integer id;
    private DiaPatientServiceBill diaPatientServiceBill;
    private Patient patient;
    private String serviceName;
    private BigDecimal servicePrice;
    private BigDecimal lessAmount;
    private BigDecimal comAmount;
    private Date createdDate;
    private Integer creator;
    private Integer refId;
    private Boolean status = false;
    private Integer refRmp;
    private Integer refMar;

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

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
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

    public BigDecimal getComAmount() {
        return comAmount;
    }

    public void setComAmount(BigDecimal comAmount) {
        this.comAmount = comAmount;
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

    public Integer getRefId() {
        return refId;
    }

    public void setRefId(Integer refId) {
        this.refId = refId;
    }

    public Boolean isStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Integer getRefRmp() {
        return refRmp;
    }

    public void setRefRmp(Integer refRmp) {
        this.refRmp = refRmp;
    }

    public Integer getRefMar() {
        return refMar;
    }

    public void setRefMar(Integer refMar) {
        this.refMar = refMar;
    }
}
