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
 * @author Khairul
 */
public class DiaRmpCommCalculationPaidAdj {

    private int id;
    private DiaRmpCommCalculationPaid diaRmpComPaid;
    private BigDecimal payableAmount;
    private BigDecimal paidAmount;
    private BigDecimal dueAmount;
    private User user;
    private Date createdDate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public DiaRmpCommCalculationPaid getDiaRmpComPaid() {
        return diaRmpComPaid;
    }

    public void setDiaRmpComPaid(DiaRmpCommCalculationPaid diaRmpComPaid) {
        this.diaRmpComPaid = diaRmpComPaid;
    }

    public BigDecimal getPayableAmount() {
        return payableAmount;
    }

    public void setPayableAmount(BigDecimal payableAmount) {
        this.payableAmount = payableAmount;
    }

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
 
}
