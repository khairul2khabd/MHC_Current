/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.hospitalcore.db;

import java.util.Date;
import java.util.List;
import org.openmrs.Role;
import org.openmrs.User;
import org.openmrs.api.db.DAOException;
import org.openmrs.module.hospitalcore.model.BillableService;
import org.openmrs.module.hospitalcore.model.DiaBarcodeGroup;
import org.openmrs.module.hospitalcore.model.DiaBillingOrder;
import org.openmrs.module.hospitalcore.model.DiaBillingQueue;
import org.openmrs.module.hospitalcore.model.DiaCommissionCal;
import org.openmrs.module.hospitalcore.model.DiaCommissionCalPaid;
import org.openmrs.module.hospitalcore.model.DiaCommissionCalPaidAdj;
import org.openmrs.module.hospitalcore.model.DiaConceptNumeric;
import org.openmrs.module.hospitalcore.model.DiaDocDetails;
import org.openmrs.module.hospitalcore.model.DiaLabSampleid;
import org.openmrs.module.hospitalcore.model.DiaPatientServiceBill;
import org.openmrs.module.hospitalcore.model.DiaPatientServiceBillCollect;
import org.openmrs.module.hospitalcore.model.DiaPatientServiceBillItem;
import org.openmrs.module.hospitalcore.model.DiaReceipt;
import org.openmrs.module.hospitalcore.model.DiaRmpCommCalculationPaid;
import org.openmrs.module.hospitalcore.model.DiaRmpCommCalculationPaidAdj;
import org.openmrs.module.hospitalcore.model.DiaRmpName;
import org.openmrs.module.hospitalcore.model.DocDetail;
import org.openmrs.module.hospitalcore.model.MarDetails;
import org.openmrs.module.hospitalcore.model.PatientSearch;

/**
 *
 * @author khairul
 */
public interface MedisunDAO {

    //public DiaBillingQueue saveDiaBillingQueue(DiaBillingQueue diaBillingQueue) throws DAOException;
    public List<PatientSearch> searchListOfPatient(Date date, String searchKey, int page) throws DAOException;

    public List<DiaBillingQueue> searchListOfPatientDia(Date date, String searchKey, int page) throws DAOException;

    public DocDetail getDocInfoById(int docId) throws DAOException;

    public MarDetails getMarInfoById(int marId) throws DAOException;

    //public DocDetail saveById(DocDetail docDetails) throws DAOException;
    //public List<DocDetail> searchDoctorName(String text) throws DAOException;
    //public List<MarDetails> serchMarName(String text) throws DAOException;
    //public MarDetails saveByIdMar(MarDetails marDetails) throws DAOException;
    public List<BillableService> searchTestNameOrID(String text) throws DAOException;

    public DiaReceipt saveDiaReceipt(DiaReceipt diaReceipt) throws DAOException;

    public DiaPatientServiceBill saveDiaPatientServiceBill(DiaPatientServiceBill diaPatientServiceBill) throws DAOException;

    public BillableService getServiceByName(String name) throws DAOException;

    public List<BillableService> getServiceById(Integer conceptId) throws DAOException;

    public DiaBillingOrder saveDiaBillingOrder(DiaBillingOrder diaBillingOrder) throws DAOException;

    public List<BillableService> listOfServiceOrder(Integer patientId, Integer encounterId) throws DAOException;

    public void removeDiaBillingQueue(DiaBillingQueue diaBillingQueue) throws DAOException;

    public DiaBillingQueue getDiaBillingQueue(Integer id) throws DAOException;

    public DiaPatientServiceBillCollect saveDiaPatientServiceBillCollect(DiaPatientServiceBillCollect diaPatientServiceBillCollect) throws DAOException;

    public List<BillableService> getDiaBillingOrderandPatientId(Integer orderId, Integer patientId) throws DAOException;

    public void removeDiaBillingOrder(DiaBillingOrder diaBillingOrder) throws DAOException;

    public DiaPatientServiceBill getDiaPatientServiceBillId(Integer billId) throws DAOException;

    public DiaPatientServiceBill reSaveDia(DiaPatientServiceBill diaPatientServiceBill) throws DAOException;

    public DiaPatientServiceBillItem saveDiaPatientServiceBillItem(DiaPatientServiceBillItem diaBillItem) throws DAOException;

    public List<DiaPatientServiceBillItem> getDiaBillItemByBillId(Integer billId) throws DAOException;

    public List<DiaPatientServiceBillCollect> getBillCollectListByBillId(Integer billId) throws DAOException;

    public PatientSearch getPatientSerachByID(int patientId) throws DAOException;

    public List<PatientSearch> listPatientSearch(String searchKey, int page) throws DAOException;

    public List<DiaPatientServiceBill> getCommission(int docId, Date sDate, Date eDate, String path, String radio) throws DAOException;

    public List<DiaPatientServiceBill> getCommissionCal(int docId, Date sDate, Date eDate) throws DAOException;

    public List<DiaDocDetails> searchDoctorName(String text) throws DAOException;

    public PatientSearch mergePatientSerach(PatientSearch ps) throws DAOException;

    public DiaCommissionCal saveDiaComCal(DiaCommissionCal diaComCal) throws DAOException;

    public List<DiaCommissionCal> getDiaComCal(int docId, Date sDate, Date eDate) throws DAOException;

    public DiaCommissionCal getDiaComCalById(Integer id) throws DAOException;

    public DiaCommissionCal reSaveDiaComCal(DiaCommissionCal diaComCal) throws DAOException;

    public List<DiaCommissionCal> getDiaComCalByBillId(Integer billId) throws DAOException;

    public DiaCommissionCalPaid saveDiaComCalPaid(DiaCommissionCalPaid diaComCalPaid) throws DAOException;

    public List<DiaCommissionCalPaid> getDiaComCalPaidByIdandDate(int docId, Date sDate, Date eDate) throws DAOException;

    public List<DiaCommissionCalPaid> getDiaComCalPaid(int docId, Date sDate, Date eDate) throws DAOException;

    public List<DiaCommissionCalPaid> getDiaComCalPaidByIdDate(int docId, int docId2, Date sDate, Date eDate) throws DAOException;

    public List<DiaBillingOrder> getDiaBillOrderByPatientIdOrderId(int patientId, int orderId) throws DAOException;

    public void removeDiaBillOrder(DiaBillingOrder diaBillOrder) throws DAOException;

    public DiaBillingOrder getDiaBillOrderById(Integer id) throws DAOException;

    public DiaLabSampleid saveDiaLabSam(DiaLabSampleid diaLabSam) throws DAOException;

    public List<DiaLabSampleid> getDiaLabSam() throws DAOException;

    public List<DiaLabSampleid> getSampleIdByBillId(int billId) throws DAOException;

    public List<DiaCommissionCal> getDiaComCalRmp(int rmpId, Date sDate, Date eDate) throws DAOException;

    public List<DiaRmpName> searchRmpName(String text) throws DAOException;

    public DiaRmpName getDiaRmpById(int rmpId) throws DAOException;

    public DiaRmpCommCalculationPaid saveRmpComPaid(DiaRmpCommCalculationPaid diaRmp) throws DAOException;

    public DiaRmpCommCalculationPaid getDiaRmpCalPaidById(int Id) throws DAOException;

    public DiaCommissionCalPaid getDiaComCalPaidById(int id) throws DAOException;

    public List<User> getAllUser() throws DAOException;

    public DiaCommissionCalPaidAdj saveDiaComPaidAdj(DiaCommissionCalPaidAdj diaAdj) throws DAOException;

    public DiaRmpCommCalculationPaidAdj saveDiaRmpAdj(DiaRmpCommCalculationPaidAdj diaRmpAdj) throws DAOException;

    public List<DiaRmpCommCalculationPaid> getRmpComCalPaidByIdDate(int rmpId, int rmpId2, Date sDate, Date eDate) throws DAOException;

    public List<DiaBarcodeGroup> listDiaBarcodeGroup() throws DAOException;

    public PatientSearch getPatientByPatientIdentifier(String patientId) throws DAOException;
    
    public DiaPatientServiceBill getDiaPatienSerBillByPatientId(int patientId)throws DAOException;
     
}
