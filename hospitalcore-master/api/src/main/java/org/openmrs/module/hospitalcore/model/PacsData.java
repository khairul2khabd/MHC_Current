/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.openmrs.module.hospitalcore.model;

import java.util.Date;

/**
 *
 * @author khairul
 */
public class PacsData {
    private int id;
    private String accessionNumber;
    private String study;
    private Date studyDate;
    private Date studyTime;
    private Date recevingDate;
    private Date reportDate;
    private String readingPhysician;
    private int readingPhysicianId;
    private String reportData;
    private String studyStatus;
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    public String getAccessionNumber() {
        return accessionNumber;
    }

    public void setAccessionNumber(String accessionNumber) {
        this.accessionNumber = accessionNumber;
    } 
    public String getStudy() {
        return study;
    }

    public void setStudy(String study) {
        this.study = study;
    }

    public Date getStudyDate() {
        return studyDate;
    }

    public void setStudyDate(Date studyDate) {
        this.studyDate = studyDate;
    }

    public Date getStudyTime() {
        return studyTime;
    }

    public void setStudyTime(Date studyTime) {
        this.studyTime = studyTime;
    }

    public Date getRecevingDate() {
        return recevingDate;
    }

    public void setRecevingDate(Date recevingDate) {
        this.recevingDate = recevingDate;
    }

    public Date getReportDate() {
        return reportDate;
    }

    public void setReportDate(Date reportDate) {
        this.reportDate = reportDate;
    }

    public String getReadingPhysician() {
        return readingPhysician;
    }

    public void setReadingPhysician(String readingPhysician) {
        this.readingPhysician = readingPhysician;
    }

    public int getReadingPhysicianId() {
        return readingPhysicianId;
    }

    public void setReadingPhysicianId(int readingPhysicianId) {
        this.readingPhysicianId = readingPhysicianId;
    }

    public String getReportData() {
        return reportData;
    }

    public void setReportData(String reportData) {
        this.reportData = reportData;
    }

    public String getStudyStatus() {
        return studyStatus;
    }

    public void setStudyStatus(String studyStatus) {
        this.studyStatus = studyStatus;
    }
    
            
    
}
