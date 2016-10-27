/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.openmrs.module.hospitalcore.model;

import java.util.Date;

/**
 *
 * @author Khairul
 */
public class DiaConceptNumeric {
    private int numericId;
    private Integer conceptId;
    private Integer creator;
    private Date createdDate;
    private Integer editedBy;
    private Date editedDate;
    private String refRange;

    public String getRefRange() {
        return refRange;
    }

    public void setRefRange(String refRange) {
        this.refRange = refRange;
    }

    public int getNumericId() {
        return numericId;
    }

    public void setNumericId(int numericId) {
        this.numericId = numericId;
    }

    public Integer getConceptId() {
        return conceptId;
    }

    public void setConceptId(Integer conceptId) {
        this.conceptId = conceptId;
    }

    public Integer getCreator() {
        return creator;
    }

    public void setCreator(Integer creator) {
        this.creator = creator;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Integer getEditedBy() {
        return editedBy;
    }

    public void setEditedBy(Integer editedBy) {
        this.editedBy = editedBy;
    }

    public Date getEditedDate() {
        return editedDate;
    }

    public void setEditedDate(Date editedDate) {
        this.editedDate = editedDate;
    }

     
}
