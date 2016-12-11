/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.hospitalcore.model;

/**
 *
 * @author Khairul
 */
public class DoctorPerformanceInfo {

    Integer doctorOrRmpId;
    String patientIdentifier;
    Integer billId;
    String doctorOrRmpName;
    String patientName;
    Double actualAmount;
    Double discount;
    Double netAmount;
    Double cashPaidAmount;
    Double careOfPaidAmount;
    Double cashAmount;
    Double dueAmount;
    String createdDate;

    public Integer getDoctorOrRmpId() {
        return doctorOrRmpId;
    }

    public void setDoctorOrRmpId(Integer doctorOrRmpId) {
        this.doctorOrRmpId = doctorOrRmpId;
    }

    public String getPatientIdentifier() {
        return patientIdentifier;
    }

    public void setPatientIdentifier(String patientIdentifier) {
        this.patientIdentifier = patientIdentifier;
    }

    public String getCreatedDate() {

        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public Integer getBillId() {
        return billId;
    }

    public void setBillId(Integer billId) {
        this.billId = billId;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public Double getActualAmount() {
        return actualAmount;
    }

    public void setActualAmount(Double actualAmount) {
        this.actualAmount = actualAmount;
    }

    public Double getDiscount() {
        return discount;
    }

    public void setDiscount(Double discount) {
        this.discount = discount;
    }

    public Double getNetAmount() {
        return netAmount;
    }

    public void setNetAmount(Double netAmount) {
        this.netAmount = netAmount;
    }

    public Double getCashPaidAmount() {
        return cashPaidAmount;
    }

    public void setCashPaidAmount(Double cashPaidAmount) {
        this.cashPaidAmount = cashPaidAmount;
    }

    public Double getCashAmount() {
        return cashAmount;
    }

    public void setCashAmount(Double cashAmount) {
        this.cashAmount = cashAmount;
    }

    public Double getDueAmount() {
        return dueAmount;
    }

    public void setDueAmount(Double dueAmount) {
        this.dueAmount = dueAmount;
    }

    public String getDoctorOrRmpName() {
        return doctorOrRmpName;
    }

    public void setDoctorOrRmpName(String doctorOrRmpName) {
        this.doctorOrRmpName = doctorOrRmpName;
    }

    public Double getCareOfPaidAmount() {
        return careOfPaidAmount;
    }

    public void setCareOfPaidAmount(Double careOfPaidAmount) {
        this.careOfPaidAmount = careOfPaidAmount;
    }
}
