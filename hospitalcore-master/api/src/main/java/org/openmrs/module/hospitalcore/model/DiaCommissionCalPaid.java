/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.hospitalcore.model;

import java.math.BigDecimal;
import java.util.Date;
import org.openmrs.Encounter;
import org.openmrs.User;

/**
 *
 * @author Khairul
 */
public class DiaCommissionCalPaid {

    private Integer id;
    private BigDecimal serviceAmount;
    private BigDecimal netAmount;
    private BigDecimal lessAmount;
    private BigDecimal docCommission;
    private Date createdDate;
    private User creator;
    private Integer docId;
    private String note;
    private BigDecimal paidAmount;
    private BigDecimal dueAmount;

    public BigDecimal getPaidAmount() {
        return paidAmount;
    }

    public void setPaidAmount(BigDecimal paidAmount) {
        this.paidAmount = paidAmount;
    }

    public BigDecimal getDueAmount() {
        return dueAmount;
    }

    public void setDueAmount(BigDecimal dueAmount) {
        this.dueAmount = dueAmount;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public BigDecimal getServiceAmount() {
        return serviceAmount;
    }

    public void setServiceAmount(BigDecimal serviceAmount) {
        this.serviceAmount = serviceAmount;
    }

    public BigDecimal getNetAmount() {
        return netAmount;
    }

    public void setNetAmount(BigDecimal netAmount) {
        this.netAmount = netAmount;
    }

    public BigDecimal getLessAmount() {
        return lessAmount;
    }

    public void setLessAmount(BigDecimal lessAmount) {
        this.lessAmount = lessAmount;
    }

    public BigDecimal getDocCommission() {
        return docCommission;
    }

    public void setDocCommission(BigDecimal docCommission) {
        this.docCommission = docCommission;
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

    public Integer getDocId() {
        return docId;
    }

    public void setDocId(Integer docId) {
        this.docId = docId;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

}
