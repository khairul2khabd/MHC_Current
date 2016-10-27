/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.openmrs.module.billing.web.controller.billingqueuedia;

import java.util.Date;

/**
 *
 * @author khairul
 */
    public class Service {
    private Integer id;
    private Integer[] selectedServiceList;

    public Integer[] getSelectedServiceList() {
        return selectedServiceList;
    }

    public void setSelectedServiceList(Integer[] selectedServiceList) {
        this.selectedServiceList = selectedServiceList;
    }
    private Date dateOfOrder;
    private String typeOfOrder;
    private String treatingDoctor;
    private String serviceName;
    private Integer conceptId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getDateOfOrder() {
        return dateOfOrder;
    }

    public void setDateOfOrder(Date dateOfOrder) {
        this.dateOfOrder = dateOfOrder;
    }

    public String getTypeOfOrder() {
        return typeOfOrder;
    }

    public void setTypeOfOrder(String typeOfOrder) {
        this.typeOfOrder = typeOfOrder;
    }

    public String getTreatingDoctor() {
        return treatingDoctor;
    }

    public void setTreatingDoctor(String treatingDoctor) {
        this.treatingDoctor = treatingDoctor;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public Integer getConceptId() {
        return conceptId;
    }

    public void setConceptId(Integer conceptId) {
        this.conceptId = conceptId;
    }
    
}
