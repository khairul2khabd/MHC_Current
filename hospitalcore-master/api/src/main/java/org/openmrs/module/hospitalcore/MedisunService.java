/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.hospitalcore;

import java.util.Date;
import java.util.List;
import org.openmrs.Role;
import org.openmrs.User;
import org.openmrs.api.APIException;
import org.openmrs.api.OpenmrsService;
import org.openmrs.module.hospitalcore.model.DiaBillingQueue;
import org.openmrs.module.hospitalcore.model.DocDetail;
import org.openmrs.module.hospitalcore.model.MarDetails;
import org.openmrs.module.hospitalcore.model.PatientSearch;
import org.springframework.transaction.annotation.Transactional;
import org.openmrs.module.hospitalcore.model.BillableService;
import org.openmrs.module.hospitalcore.model.DiaBarcodeGroup;
import org.openmrs.module.hospitalcore.model.DiaReceipt;
import org.openmrs.module.hospitalcore.model.DiaPatientServiceBill;
import org.openmrs.module.hospitalcore.model.DiaBillingOrder;
import org.openmrs.module.hospitalcore.model.DiaCommissionCal;
import org.openmrs.module.hospitalcore.model.DiaCommissionCalPaid;
import org.openmrs.module.hospitalcore.model.DiaCommissionCalPaidAdj;
import org.openmrs.module.hospitalcore.model.DiaConceptNumeric;
import org.openmrs.module.hospitalcore.model.DiaDocDetails;
import org.openmrs.module.hospitalcore.model.DiaLabSampleid;
import org.openmrs.module.hospitalcore.model.DiaPatientServiceBillCollect;
import org.openmrs.module.hospitalcore.model.DiaPatientServiceBillItem;
import org.openmrs.module.hospitalcore.model.DiaRmpCommCalculationPaid;
import org.openmrs.module.hospitalcore.model.DiaRmpCommCalculationPaidAdj;
import org.openmrs.module.hospitalcore.model.DiaRmpName;
import org.openmrs.module.hospitalcore.model.PatientServiceBill;

/**
 *
 * @author khairul
 */
@Transactional(readOnly = false)
public interface MedisunService extends OpenmrsService {

   // public DiaBillingQueue saveDiaBillingQueue(DiaBillingQueue diaBillingQueue)throws APIException;
    public List<PatientSearch> searchListOfPatient(Date date, String searchKey, int page) throws APIException;

    public List<DiaBillingQueue> searchListOfPatientDia(Date date, String searchKey, int page) throws APIException;

    public DocDetail getDocInfoById(int docId) throws APIException;

    public MarDetails getMarInfoById(int marId) throws APIException;

    //public DocDetail saveById(DocDetail docDetails) throws APIException;
    //public List<DocDetail> searchDoctorName(String text) throws APIException; // This is final for Search text or id
   // public List<MarDetails> serchMarName(String text)throws APIException;
   // public MarDetails saveByIdMar(MarDetails marDetails)throws APIException;
    public List<BillableService> searchTestNameOrID(String text) throws APIException;

    public DiaReceipt saveDiaReceipt(DiaReceipt diaReceipt) throws APIException;

    public DiaPatientServiceBill saveDiaPatientServiceBill(DiaPatientServiceBill diaPatientServiceBill) throws APIException;

    public BillableService getServiceByName(String name) throws APIException;

    public List<BillableService> getServiceById(Integer conceptId) throws APIException;

    public DiaBillingOrder saveDiaBillingOrder(DiaBillingOrder diaBillingOrder) throws APIException;

    public List<BillableService> listOfServiceOrder(Integer patientId, Integer encounterId) throws APIException;

    public void removeDiaBillingQueue(DiaBillingQueue diaBillingQueue) throws APIException;

    public DiaBillingQueue getDiaBillingQueue(Integer id) throws APIException;

    public DiaPatientServiceBillCollect saveDiaPatientServiceBillCollect(DiaPatientServiceBillCollect diaPatientServiceBillCollect) throws APIException;

    public List<BillableService> getDiaBillingOrderandPatientId(Integer orderId, Integer patientId) throws APIException;

    public void removeDiaBillingOrder(DiaBillingOrder diaBillingOrder) throws APIException;

    public DiaPatientServiceBill getDiaPatientServiceBillId(Integer billId) throws APIException;

    public DiaPatientServiceBill reSaveDia(DiaPatientServiceBill diaPatientServiceBill) throws APIException;

    public DiaPatientServiceBillItem saveDiaPatientServiceBillItem(DiaPatientServiceBillItem diaBillItem) throws APIException;

    public List<DiaPatientServiceBillItem> getDiaBillItemByBillId(Integer billId) throws APIException;

    public List<DiaPatientServiceBillCollect> getBillCollectListByBillId(Integer billId) throws APIException;

    public PatientSearch getPatientSerachByID(int patientId) throws APIException;

    public List<PatientSearch> listPatientSearch(String searchKey, int page) throws APIException;

    //  public void saveBillEncounterAndOrder(PatientServiceBill bill) throws APIException;
    public void saveBillEncounterAndOrder(DiaPatientServiceBill bill) throws APIException;
    
    public List<DiaPatientServiceBill> getCommission(int docId, Date sDate, Date eDate, String path, String radio)throws APIException;
    
    public List<DiaPatientServiceBill> getCommissionCal(int docId, Date sDate, Date eDate)throws APIException;
    
    public List<DiaDocDetails> searchDoctorName(String text) throws APIException;
    
    public PatientSearch mergePatientSerach(PatientSearch ps)throws APIException;
    
    public DiaCommissionCal saveDiaComCal(DiaCommissionCal diaComCal)throws APIException;
    
    public List<DiaCommissionCal> getDiaComCal(int docId,Date sDate,Date eDate)throws APIException;
    
    public DiaCommissionCal getDiaComCalById(Integer id)throws APIException;
    
    public DiaCommissionCal reSaveDiaComCal(DiaCommissionCal diaComCal) throws APIException;
    
    public List<DiaCommissionCal> getDiaComCalByBillId(Integer billId)throws APIException;
    
    public DiaCommissionCalPaid saveDiaComCalPaid(DiaCommissionCalPaid diaComCalPaid)throws APIException;
    
    public List<DiaCommissionCalPaid> getDiaComCalPaidByIdandDate(int docId, Date sDate, Date eDate)throws APIException;
    
    public List<DiaCommissionCalPaid> getDiaComCalPaid(int docId,Date sDate,Date eDate)throws APIException;
    
    public List<DiaCommissionCalPaid> getDiaComCalPaidByIdDate(int docId, int docId2,Date sDate,Date eDate)throws APIException;
    
    public List<DiaBillingOrder> getDiaBillOrderByPatientIdOrderId(int patientId, int orderId)throws APIException;
    
    public void removeDiaBillOrder(DiaBillingOrder diaBillOrder) throws APIException;
    
    public DiaBillingOrder getDiaBillOrderById(Integer id)throws APIException;
    
    public DiaLabSampleid saveDiaLabSam(DiaLabSampleid diaLabSam)throws APIException;
    
    public List<DiaLabSampleid> getDiaLabSam() throws APIException;
    
    public List<DiaLabSampleid> getSampleIdByBillId(int billId)throws APIException;
    
    public List<DiaCommissionCal> getDiaComCalRmp(int rmpId,Date sDate,Date eDate)throws APIException;
    
    public List<DiaRmpName> searchRmpName(String text) throws APIException;
    
    public DiaRmpName getDiaRmpById(int rmpId) throws APIException;
    
    public DiaRmpCommCalculationPaid saveRmpComPaid(DiaRmpCommCalculationPaid diaRmp)throws APIException;
    
    public DiaRmpCommCalculationPaid getDiaRmpCalPaidById(int Id)throws APIException;
    
    public DiaCommissionCalPaid getDiaComCalPaidById(int id)throws APIException;
 
    public List<User> getAllUser() throws APIException;
    
    public DiaCommissionCalPaidAdj saveDiaComPaidAdj(DiaCommissionCalPaidAdj diaAdj)throws APIException;
    
    public DiaRmpCommCalculationPaidAdj saveDiaRmpAdj(DiaRmpCommCalculationPaidAdj diaRmpAdj)throws APIException;
    
    public List<DiaRmpCommCalculationPaid> getRmpComCalPaidByIdDate(int rmpId, int rmpId2,Date sDate,Date eDate)throws APIException;
    
    public List<DiaBarcodeGroup> listDiaBarcodeGroup()throws APIException;
    
    public PatientSearch getPatientByPatientIdentifier(String patientId)throws APIException;
    
    public DiaPatientServiceBill getDiaPatienSerBillByPatientId(int patientId)throws APIException;
    
    
}

