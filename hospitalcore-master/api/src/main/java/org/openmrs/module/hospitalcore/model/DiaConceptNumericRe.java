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
public class DiaConceptNumericRe {
    private int id;
    private Integer conceptId;
    //private Integer numericId;
    private String normalRange;
    private String range;
    private DiaConceptNumeric diaConceptNumeric;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Integer getConceptId() {
        return conceptId;
    }

    public void setConceptId(Integer conceptId) {
        this.conceptId = conceptId;
    }
 
    public String getNormalRange() {
        return normalRange;
    }

    public void setNormalRange(String normalRange) {
        this.normalRange = normalRange;
    }

    public String getRange() {
        return range;
    }

    public void setRange(String range) {
        this.range = range;
    }

    public DiaConceptNumeric getDiaConceptNumeric() {
        return diaConceptNumeric;
    }

    public void setDiaConceptNumeric(DiaConceptNumeric diaConceptNumeric) {
        this.diaConceptNumeric = diaConceptNumeric;
    }
 
 
    
}
