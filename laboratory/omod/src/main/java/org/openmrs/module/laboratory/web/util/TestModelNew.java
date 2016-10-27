/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.laboratory.web.util;

import org.openmrs.Concept;

/**
 *
 * @author khairul
 */
public class TestModelNew {

    public String investigation;
    public String set;
    public String test;
    public String value;
    public String hiNormal;
    public String lowNormal;
    public String unit;
    public String testName;
    public int encounterId;
    public String groupName;
    public String maleHigh;
    public String maleLow;
    public String childHigh;
    public String childLow;
    public String refRange;
    public Concept concept;
    public int codedId;

    public int getCodedId() {
        return codedId;
    }

    public void setCodedId(int codedId) {
        this.codedId = codedId;
    }

    public Concept getConcept() {
        return concept;
    }

    public void setConcept(Concept concept) {
        this.concept = concept;
    }

    public String getRefRange() {
        return refRange;
    }

    public void setRefRange(String refRange) {
        this.refRange = refRange;
    }

    public String getMaleHigh() {
        return maleHigh;
    }

    public void setMaleHigh(String maleHigh) {
        this.maleHigh = maleHigh;
    }

    public String getMaleLow() {
        return maleLow;
    }

    public void setMaleLow(String maleLow) {
        this.maleLow = maleLow;
    }

    public String getChildHigh() {
        return childHigh;
    }

    public void setChildHigh(String childHigh) {
        this.childHigh = childHigh;
    }

    public String getChildLow() {
        return childLow;
    }

    public void setChildLow(String childLow) {
        this.childLow = childLow;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public int getEncounterId() {
        return encounterId;
    }

    public void setEncounterId(int encounterId) {
        this.encounterId = encounterId;
    }

    public String getTestName() {
        return testName;
    }

    public void setTestName(String testName) {
        this.testName = testName;
    }

    public String getInvestigation() {
        return investigation;
    }

    public void setInvestigation(String investigation) {
        this.investigation = investigation;
    }

    public String getSet() {
        return set;
    }

    public void setSet(String set) {
        this.set = set;
    }

    public String getTest() {
        return test;
    }

    public void setTest(String test) {
        this.test = test;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getHiNormal() {
        return hiNormal;
    }

    public void setHiNormal(String hiNormal) {
        this.hiNormal = hiNormal;
    }

    public String getLowNormal() {
        return lowNormal;
    }

    public void setLowNormal(String lowNormal) {
        this.lowNormal = lowNormal;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

}
