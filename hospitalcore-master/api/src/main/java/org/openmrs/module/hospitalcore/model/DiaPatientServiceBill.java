/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.hospitalcore.model;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import org.openmrs.Patient;
import org.openmrs.User;

/**
 *
 * @author khairul
 */
public class DiaPatientServiceBill {

    private static final long serialVersionUID = 1L;

    private Integer billId;
    private Patient patient;
    private Date createdDate;
    private User creator;
    private BigDecimal amount;
    private Boolean printed = false;
    //private Receipt receipt;
    private DiaReceipt receipt;
    private Boolean voided = false;
    private String voidedDesc;
    private Date voidedDate;
    private BigDecimal actualAmount;
    private String comment;
    private BigDecimal dueAmount;
    private String billingStatus;
    private Integer voidedCreator;
    private Integer refDocId;
    private Integer refMarId;
    private BigDecimal discountAmount;
    private Integer refRmpId;
    private String freeReason;

    public String getFreeReason() {
        return freeReason;
    }

    public void setFreeReason(String freeReason) {
        this.freeReason = freeReason;
    }
     

    public Integer getRefRmpId() {
        return refRmpId;
    }

    public void setRefRmpId(Integer refRmpId) {
        this.refRmpId = refRmpId;
    }

    private Set<DiaPatientServiceBillItem> billItems;

    public BigDecimal getDiscountAmount() {
        return discountAmount;
    }

    public void setDiscountAmount(BigDecimal discountAmount) {
        this.discountAmount = discountAmount;
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

    public void addBillItem(DiaPatientServiceBillItem item) {
        if (billItems == null) {
            billItems = new HashSet<DiaPatientServiceBillItem>();
        }
        billItems.add(item);
    }

    public Set<DiaPatientServiceBillItem> getBillItems() {
        return billItems;
    }

    public void setBillItems(Set<DiaPatientServiceBillItem> billItems) {
        this.billItems = billItems;
    }

    public Boolean getPrinted() {
        return printed;
    }

    public Integer getVoidedCreator() {
        return voidedCreator;
    }

    public void setVoidedCreator(Integer voidedCreator) {
        this.voidedCreator = voidedCreator;
    }

    public BigDecimal getDueAmount() {
        return dueAmount;
    }

    public void setDueAmount(BigDecimal dueAmount) {
        this.dueAmount = dueAmount;
    }

    public String getBillingStatus() {
        return billingStatus;
    }

    public void setBillingStatus(String billingStatus) {
        this.billingStatus = billingStatus;
    }

    public Integer getBillId() {
        return billId;
    }

    public void setBillId(Integer billId) {
        this.billId = billId;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public User getCreator() {
        return creator;
    }

    public void setCreator(User creator) {
        this.creator = creator;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public Boolean isPrinted() {
        return printed;
    }

    public void setPrinted(Boolean printed) {
        this.printed = printed;
    }

    public DiaReceipt getReceipt() {
        return receipt;
    }

    public void setReceipt(DiaReceipt receipt) {
        this.receipt = receipt;
    }

    public Boolean getVoided() {
        return voided;
    }

    public void setVoided(Boolean voided) {
        this.voided = voided;
    }

    public String getVoidedDesc() {
        return voidedDesc;
    }

    public void setVoidedDesc(String voidedDesc) {
        this.voidedDesc = voidedDesc;
    }

    public Date getVoidedDate() {
        return voidedDate;
    }

    public void setVoidedDate(Date voidedDate) {
        this.voidedDate = voidedDate;
    }

    public BigDecimal getActualAmount() {
        return actualAmount;
    }

    public void setActualAmount(BigDecimal actualAmount) {
        this.actualAmount = actualAmount;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

}
