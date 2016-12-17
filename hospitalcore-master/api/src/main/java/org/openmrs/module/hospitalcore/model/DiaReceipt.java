/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.hospitalcore.model;

import java.math.BigDecimal;
import java.sql.Time;
import java.util.Date;

/**
 *
 * @author khairul
 */
public class DiaReceipt {

    private static final long serialVersionUID = -4573526140331707301L;

    private Integer id;

    private Date paidDate;

    private Integer serviceId;

    private Date deliveryDate;

    private String deliveryTime;
    private BigDecimal doctorGiven;

    public BigDecimal getDoctorGiven() {
        return doctorGiven;
    }

    public void setDoctorGiven(BigDecimal doctorGiven) {
        this.doctorGiven = doctorGiven;
    }

    public String getDeliveryTime() {
        return deliveryTime;
    }

    public void setDeliveryTime(String deliveryTime) {
        this.deliveryTime = deliveryTime;
    }

    public Date getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(Date deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    public Integer getServiceId() {
        return serviceId;
    }

    public void setServiceId(Integer serviceId) {
        this.serviceId = serviceId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getPaidDate() {
        return paidDate;
    }

    public void setPaidDate(Date paidDate) {
        this.paidDate = paidDate;
    }

}
