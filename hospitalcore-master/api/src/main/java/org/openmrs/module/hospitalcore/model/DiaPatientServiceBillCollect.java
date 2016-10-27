/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.openmrs.module.hospitalcore.model;

import java.math.BigDecimal;
import java.util.Date;
import org.openmrs.User;

/**
 *
 * @author khairul
 */
public class DiaPatientServiceBillCollect {
    private static final long serialVersionUID = 1L;

    private Integer billCollectId;
    private Integer patientId;
    private DiaPatientServiceBill diaPatientServiceBill;
    private User user;
    private Date createdDate;
    private BigDecimal actualAmount;
    private BigDecimal paidAmount;
    private BigDecimal payableAmount;
    private BigDecimal dueAmount;
    private BigDecimal duePaid;
    private BigDecimal discountAmount;
    private Boolean duePaidStatus = false;

    public Boolean isDuePaidStatus() {
        return duePaidStatus;
    }

    public void setDuePaidStatus(Boolean duePaidStatus) {
        this.duePaidStatus = duePaidStatus;
    }
     

    public Integer getBillCollectId() {
        return billCollectId;
    }

    public void setBillCollectId(Integer billCollectId) {
        this.billCollectId = billCollectId;
    }

    public Integer getPatientId() {
        return patientId;
    }

    public void setPatientId(Integer patientId) {
        this.patientId = patientId;
    }

    public DiaPatientServiceBill getDiaPatientServiceBill() {
        return diaPatientServiceBill;
    }

    public void setDiaPatientServiceBill(DiaPatientServiceBill diaPatientServiceBill) {
        this.diaPatientServiceBill = diaPatientServiceBill;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public BigDecimal getActualAmount() {
        return actualAmount;
    }

    public void setActualAmount(BigDecimal actualAmount) {
        this.actualAmount = actualAmount;
    }

    public BigDecimal getPaidAmount() {
        return paidAmount;
    }

    public void setPaidAmount(BigDecimal paidAmount) {
        this.paidAmount = paidAmount;
    }

    public BigDecimal getPayableAmount() {
        return payableAmount;
    }

    public void setPayableAmount(BigDecimal payableAmount) {
        this.payableAmount = payableAmount;
    }

    public BigDecimal getDueAmount() {
        return dueAmount;
    }

    public void setDueAmount(BigDecimal dueAmount) {
        this.dueAmount = dueAmount;
    }

    public BigDecimal getDuePaid() {
        return duePaid;
    }

    public void setDuePaid(BigDecimal duePaid) {
        this.duePaid = duePaid;
    }

    public BigDecimal getDiscountAmount() {
        return discountAmount;
    }

    public void setDiscountAmount(BigDecimal discountAmount) {
        this.discountAmount = discountAmount;
    }
    
}
