/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.openmrs.module.hospitalcore.model;

import java.util.Date;
import org.openmrs.Patient;

/**
 *
 * @author khairul
 */
public class IpdPatientIntake {
 
     private Integer id;
   private String oral;
   private String iv;
   private String ngTube;
   private String spc;
   private String catheter;
   private String stool;
   private String vomiting;
   private String drain1;
   private String drain2;
   private String drain3;
   private String drain4;
   private String drain5;
   private String drain6;
   private Patient patient;
   private Date createdOn;
   private IpdPatientAdmissionLog ipdPatientAdmissionLog;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOral() {
        return oral;
    }

    public void setOral(String oral) {
        this.oral = oral;
    }

    public String getIv() {
        return iv;
    }

    public void setIv(String iv) {
        this.iv = iv;
    }

    public String getNgTube() {
        return ngTube;
    }

    public void setNgTube(String ngTube) {
        this.ngTube = ngTube;
    }

    public String getSpc() {
        return spc;
    }

    public void setSpc(String spc) {
        this.spc = spc;
    }

    public String getCatheter() {
        return catheter;
    }

    public void setCatheter(String catheter) {
        this.catheter = catheter;
    }

    public String getStool() {
        return stool;
    }

    public void setStool(String stool) {
        this.stool = stool;
    }

    public String getVomiting() {
        return vomiting;
    }

    public void setVomiting(String vomiting) {
        this.vomiting = vomiting;
    }

    public String getDrain1() {
        return drain1;
    }

    public void setDrain1(String drain1) {
        this.drain1 = drain1;
    }

    public String getDrain2() {
        return drain2;
    }

    public void setDrain2(String drain2) {
        this.drain2 = drain2;
    }

    public String getDrain3() {
        return drain3;
    }

    public void setDrain3(String drain3) {
        this.drain3 = drain3;
    }

    public String getDrain4() {
        return drain4;
    }

    public void setDrain4(String drain4) {
        this.drain4 = drain4;
    }

    public String getDrain5() {
        return drain5;
    }

    public void setDrain5(String drain5) {
        this.drain5 = drain5;
    }

    public String getDrain6() {
        return drain6;
    }

    public void setDrain6(String drain6) {
        this.drain6 = drain6;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public Date getCreatedOn() {
        return createdOn;
    }

    public void setCreatedOn(Date createdOn) {
        this.createdOn = createdOn;
    }

    public IpdPatientAdmissionLog getIpdPatientAdmissionLog() {
        return ipdPatientAdmissionLog;
    }

    public void setIpdPatientAdmissionLog(IpdPatientAdmissionLog ipdPatientAdmissionLog) {
        this.ipdPatientAdmissionLog = ipdPatientAdmissionLog;
    }
}
