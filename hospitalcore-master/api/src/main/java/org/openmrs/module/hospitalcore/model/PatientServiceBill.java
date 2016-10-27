/**
 *  Copyright 2010 Society for Health Information Systems Programmes, India (HISP India)
 *
 *  This file is part of Hospital-core module.
 *
 *  Hospital-core module is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.

 *  Hospital-core module is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with Hospital-core module.  If not, see <http://www.gnu.org/licenses/>.
 *
 **/

package org.openmrs.module.hospitalcore.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.openmrs.Patient;
import org.openmrs.User;

/**
 *
 */
public class PatientServiceBill implements Serializable {
	
	/**
     * 
     */
	private static final long serialVersionUID = 1L;
	
	private Integer patientServiceBillId;
	
	private Patient patient;
	
	private User creator;
	
	private BigDecimal amount;
	
	private BigDecimal actualAmount;
	
	private Boolean printed = false;
	
	private Boolean voided = false;
	
	private Date voidedDate;
	
	private Date createdDate;
	
	private String description;
	
	private Receipt receipt;
	
	//ghanshyam 3-june-2013 New Requirement #1632 Orders from dashboard must be appear in billing queue.User must be able to generate bills from this queue
	private Integer freeBill;//0=paidBill,1=freeBill,2=mixedBill
	
	//ghanshyam 25-feb-2013 New Requirement #966[Billing]Add Paid Bill/Add Free Bill for Bangladesh module(added 'comment' property)
	private String comment;
	
	private Set<PatientServiceBillItem> billItems;
	
	public Integer getPatientServiceBillId() {
		return patientServiceBillId;
	}
	
	public void setPatientServiceBillId(Integer patientServiceBillId) {
		this.patientServiceBillId = patientServiceBillId;
	}
	
	public Patient getPatient() {
		return patient;
	}
	
	public void setPatient(Patient patient) {
		this.patient = patient;
	}
	
	public BigDecimal getAmount() {
		return amount;
	}
	
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	
	public Boolean getPrinted() {
		return printed;
	}
	
	public void setPrinted(Boolean printed) {
		this.printed = printed;
	}
	
	public Boolean getVoided() {
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
	
	public Date getCreatedDate() {
		return createdDate;
	}
	
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public void addBillItem(PatientServiceBillItem item) {
		if (billItems == null)
			billItems = new HashSet<PatientServiceBillItem>();
		billItems.add(item);
	}
	
	public Set<PatientServiceBillItem> getBillItems() {
		return billItems;
	}
	
	public void setBillItems(Set<PatientServiceBillItem> billItems) {
		this.billItems = billItems;
	}
	
	public User getCreator() {
		return creator;
	}
	
	public void setCreator(User creator) {
		this.creator = creator;
	}
	
	public Receipt getReceipt() {
		return receipt;
	}
	
	public void setReceipt(Receipt receipt) {
		this.receipt = receipt;
	}
	
	//ghanshyam 3-june-2013 New Requirement #1632 Orders from dashboard must be appear in billing queue.User must be able to generate bills from this queue
	public Integer getFreeBill() {
		return freeBill;
	}

	public void setFreeBill(Integer freeBill) {
		this.freeBill = freeBill;
	}

	public BigDecimal getActualAmount() {
		return actualAmount;
	}
	
	public void setActualAmount(BigDecimal actualAmount) {
		this.actualAmount = actualAmount;
	}
	
	public String getComment() {
		return comment;
	}
	
	public void setComment(String comment) {
		this.comment = comment;
	}
}
