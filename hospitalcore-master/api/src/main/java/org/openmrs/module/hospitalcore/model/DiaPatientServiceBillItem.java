/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.hospitalcore.model;

import java.math.BigDecimal;
import java.util.Date;
import org.openmrs.Order;

/**
 *
 * @author khairul
 */
public class DiaPatientServiceBillItem {

    private static final long serialVersionUID = 1L;

    private Integer billItemId;

    private BillableService service;

    private DiaPatientServiceBill diaPatientServiceBill;

    private BigDecimal unitPrice;

    private BigDecimal amount;

    private BigDecimal actualAmount;

    private Integer quantity;

    private String name;

    private Date createdDate;

    private Integer creator;

    private Boolean voided = false;

    private Date voidedDate;

    private Integer voidedBy;

    private Order order;

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Integer getBillItemId() {
        return billItemId;
    }

    public void setBillItemId(Integer billItemId) {
        this.billItemId = billItemId;
    }

    public BillableService getService() {
        return service;
    }

    public void setService(BillableService service) {
        this.service = service;
    }

    public DiaPatientServiceBill getDiaPatientServiceBill() {
        return diaPatientServiceBill;
    }

    public void setDiaPatientServiceBill(DiaPatientServiceBill diaPatientServiceBill) {
        this.diaPatientServiceBill = diaPatientServiceBill;
    }

    public BigDecimal getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(BigDecimal unitPrice) {
        this.unitPrice = unitPrice;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public BigDecimal getActualAmount() {
        return actualAmount;
    }

    public void setActualAmount(BigDecimal actualAmount) {
        this.actualAmount = actualAmount;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public Boolean isVoided() {
        return voided;
    }

    public void setVoided(Boolean voided) {
        this.voided = voided;
    }

    public Date getVoidedDate() {
        return voidedDate;
    }

    public void setVoidedDate(Date voidedDate) {
        this.voidedDate = voidedDate;
    }

    public Integer getVoidedBy() {
        return voidedBy;
    }

    public void setVoidedBy(Integer voidedBy) {
        this.voidedBy = voidedBy;
    }
}
