/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.hospitalcore.impl;

import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.openmrs.Concept;
import org.openmrs.ConceptClass;
import org.openmrs.ConceptSet;
import org.openmrs.Encounter;
import org.openmrs.EncounterType;
import org.openmrs.Location;
import org.openmrs.Order;
import org.openmrs.OrderType;
import org.openmrs.Role;
import org.openmrs.User;
import org.openmrs.api.APIException;
import org.openmrs.api.context.Context;
import org.openmrs.api.impl.BaseOpenmrsService;
import org.openmrs.module.hospitalcore.BillingConstants;
import org.openmrs.module.hospitalcore.LabService;
import org.openmrs.module.hospitalcore.MedisunService;
import org.openmrs.module.hospitalcore.RadiologyCoreService;
import org.openmrs.module.hospitalcore.concept.TestTree;
import org.openmrs.module.hospitalcore.db.MedisunDAO;
import org.openmrs.module.hospitalcore.model.BillableService;
import org.openmrs.module.hospitalcore.model.DiaBarcodeGroup;
import org.openmrs.module.hospitalcore.model.DiaBillingOrder;
import org.openmrs.module.hospitalcore.model.DiaBillingQueue;
import org.openmrs.module.hospitalcore.model.DiaCommissionCal;
import org.openmrs.module.hospitalcore.model.DiaCommissionCalAll;
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
import org.openmrs.module.hospitalcore.model.DoctorPerformanceInfo;
import org.openmrs.module.hospitalcore.model.Lab;
import org.openmrs.module.hospitalcore.model.MarDetails;
import org.openmrs.module.hospitalcore.model.PatientSearch;
import org.openmrs.module.hospitalcore.model.RadiologyDepartment;
import org.openmrs.module.hospitalcore.util.GlobalPropertyUtil;
import org.openmrs.module.hospitalcore.util.HospitalCoreConstants;

/**
 *
 * @author khairul
 */
public class MedisunServiceImpl extends BaseOpenmrsService implements MedisunService {

    public MedisunServiceImpl() {
    }

    protected MedisunDAO dao;

    public void setDao(MedisunDAO dao) {
        this.dao = dao;
    }

  //  public DiaBillingQueue saveDiaBillingQueue(DiaBillingQueue diaBillingQueue) throws APIException {
  //      return dao.saveDiaBillingQueue(diaBillingQueue);
   // }

    public List<PatientSearch> searchListOfPatient(Date date, String searchKey, int page) throws APIException {
        return dao.searchListOfPatient(date, searchKey, page);
    }

    public List<DiaBillingQueue> searchListOfPatientDia(Date date, String searchKey, int page) throws APIException {
        return dao.searchListOfPatientDia(date, searchKey, page);
    }

     public DocDetail getDocInfoById(int docId) throws APIException {
        return dao.getDocInfoById(docId);
    }  

    public MarDetails getMarInfoById(int marId) throws APIException {
        return dao.getMarInfoById(marId);
    }
 
    public List<BillableService> searchTestNameOrID(String text) throws APIException {
        return dao.searchTestNameOrID(text);
    }

    public DiaReceipt saveDiaReceipt(DiaReceipt diaReceipt) throws APIException {
        return dao.saveDiaReceipt(diaReceipt);
    }

    public DiaPatientServiceBill saveDiaPatientServiceBill(DiaPatientServiceBill diaPatientServiceBill) throws APIException {
        return dao.saveDiaPatientServiceBill(diaPatientServiceBill);
    }

    public BillableService getServiceByName(String name) throws APIException {
        return dao.getServiceByName(name);
    }

    public List<BillableService> getServiceById(Integer conceptId) throws APIException {
        return dao.getServiceById(conceptId);
    }

    public DiaBillingOrder saveDiaBillingOrder(DiaBillingOrder diaBillingOrder) throws APIException {
        return dao.saveDiaBillingOrder(diaBillingOrder);
    }

    public List<BillableService> listOfServiceOrder(Integer patientId, Integer encounterId) throws APIException {
        return dao.listOfServiceOrder(patientId, encounterId);
    }

    public void removeDiaBillingQueue(DiaBillingQueue diaBillingQueue) throws APIException {
        dao.removeDiaBillingQueue(diaBillingQueue);
    }

    public DiaBillingQueue getDiaBillingQueue(Integer id) throws APIException {
        return dao.getDiaBillingQueue(id);
    }

    public DiaPatientServiceBillCollect saveDiaPatientServiceBillCollect(DiaPatientServiceBillCollect diaPatientServiceBillCollect) throws APIException {
        return dao.saveDiaPatientServiceBillCollect(diaPatientServiceBillCollect);
    }

    public List<BillableService> getDiaBillingOrderandPatientId(Integer orderId, Integer patientId) throws APIException {
        return dao.getDiaBillingOrderandPatientId(orderId, patientId);
    }

    public void removeDiaBillingOrder(DiaBillingOrder diaBillingOrder) throws APIException {
        dao.removeDiaBillingOrder(diaBillingOrder);
    }

    public DiaPatientServiceBill getDiaPatientServiceBillId(Integer billId) throws APIException {
        return dao.getDiaPatientServiceBillId(billId);
    }

    public DiaPatientServiceBill reSaveDia(DiaPatientServiceBill diaPatientServiceBill) throws APIException {
        return dao.reSaveDia(diaPatientServiceBill);
    }

    public void saveBillEncounterAndOrder(DiaPatientServiceBill bill) throws APIException {
        Set<Integer> labConceptIds = getLabConceptIds();
        Set<Integer> radiologyConceptIds = getRadiologyConceptIds();

        String labEncounterTypeText = GlobalPropertyUtil.getString(BillingConstants.GLOBAL_PROPRETY_LAB_ENCOUNTER_TYPE,
                "LABENCOUNTER");
        EncounterType labEncounterType = Context.getEncounterService().getEncounterType(labEncounterTypeText);

        String radiologyEncounterTypeText = GlobalPropertyUtil.getString(
                BillingConstants.GLOBAL_PROPRETY_RADIOLOGY_ENCOUNTER_TYPE, "RADIOLOGYENCOUNTER");
        EncounterType radiologyEncounterType = Context.getEncounterService().getEncounterType(radiologyEncounterTypeText);

        Integer labOrderTypeId = GlobalPropertyUtil.getInteger(BillingConstants.GLOBAL_PROPRETY_LAB_ORDER_TYPE, 2);
        OrderType labOrderType = Context.getOrderService().getOrderType(labOrderTypeId);

        Integer radiologyOrderTypeId = GlobalPropertyUtil.getInteger(BillingConstants.GLOBAL_PROPRETY_RADIOLOGY_ORDER_TYPE,
                8);
        OrderType radiologyOrderType = Context.getOrderService().getOrderType(radiologyOrderTypeId);

        Encounter labEncounter = null;
        Encounter radiologyEncounter = null;

        // Get medical examination class
        Integer medicalExaminationClassId = GlobalPropertyUtil.getInteger(HospitalCoreConstants.PROPERTY_MEDICAL_EXAMINATION, 9);
        ConceptClass medicalExaminationClass = Context.getConceptService().getConceptClass(medicalExaminationClassId);

        for (DiaPatientServiceBillItem item : bill.getBillItems()) {
            Concept concept = Context.getConceptService().getConcept(item.getService().getConceptId());

            // If item is a medical examination set
            if (concept.getConceptClass().equals(medicalExaminationClass)) {
                Collection<ConceptSet> conceptSets = concept.getConceptSets();
                if (conceptSets != null && conceptSets.size() > 0) {
                    for (ConceptSet con : conceptSets) {
                        if (labConceptIds.contains(con.getConcept().getConceptId())) {
                            labEncounter = getEncounter(bill, labEncounter, labEncounterType);
                            Order order = addOrder(labEncounter, con.getConcept(), bill, labOrderType);
                            item.setOrder(order);

                        } else if (radiologyConceptIds.contains(con.getConcept().getConceptId())) {
                            radiologyEncounter = getEncounter(bill, radiologyEncounter, radiologyEncounterType);
                            Order order = addOrder(radiologyEncounter, con.getConcept(), bill, radiologyOrderType);
                           item.setOrder(order);
                        }
                    }
                }
            } else {
                if (labConceptIds.contains(concept.getConceptId())) {
                    labEncounter = getEncounter(bill, labEncounter, labEncounterType);
                    Order order = addOrder(labEncounter, concept, bill, labOrderType);
                    item.setOrder(order);

                } else if (radiologyConceptIds.contains(concept.getConceptId())) {
                    radiologyEncounter = getEncounter(bill, radiologyEncounter, radiologyEncounterType);
                    Order order = addOrder(radiologyEncounter, concept, bill, radiologyOrderType);
                    item.setOrder(order);
                }
            }
        }

        if (labEncounter != null) {
            Context.getEncounterService().saveEncounter(labEncounter);
        }
        if (radiologyEncounter != null) {
            Context.getEncounterService().saveEncounter(radiologyEncounter);
        }
        saveDiaPatientServiceBill(bill);
    }
    
    private Encounter getEncounter(DiaPatientServiceBill bill, Encounter encounter, EncounterType encounterType) {
		if (encounter == null) {
			Encounter enc = new Encounter();
			enc.setCreator(bill.getCreator());
			Location location = Context.getLocationService().getLocation(1);
			enc.setLocation(location);
			enc.setDateCreated(new Date());
			enc.setEncounterDatetime(new Date());
			enc.setProvider(bill.getCreator());
			enc.setEncounterType(encounterType);
			enc.setPatient(bill.getPatient());
			return enc;
		} else {
			return encounter;
		}
	}
    
    private Order addOrder(Encounter encounter, Concept concept, DiaPatientServiceBill bill, OrderType orderType) {
		Order order = new Order();
		order.setConcept(concept);
		order.setCreator(bill.getCreator());
		order.setDateCreated(new Date());
		order.setOrderer(Context.getAuthenticatedUser());
		order.setPatient(bill.getPatient());
		order.setStartDate(new Date());
		order.setAccessionNumber("0");
		order.setOrderType(orderType);
		order.setEncounter(encounter);
		encounter.addOrder(order);
		return order;
	}

    private Set<Integer> getConceptIdSet(Set<Concept> concepts) {
        Set<Integer> conceptIdSet = new HashSet<Integer>();
        for (Concept concept : concepts) {
            TestTree tree = new TestTree(concept);
            conceptIdSet.addAll(tree.getConceptIDSet());
        }
        return conceptIdSet;
    }

    private Set<Integer> getRadiologyConceptIds() {
        Set<Integer> conceptIdSet = new HashSet<Integer>();
        RadiologyCoreService rcs = (RadiologyCoreService) Context.getService(RadiologyCoreService.class);
        List<RadiologyDepartment> departments = rcs.getAllRadiologyDepartments();
        for (RadiologyDepartment department : departments) {
            conceptIdSet.addAll(getConceptIdSet(department.getInvestigations()));
        }
        return conceptIdSet;
    }

    private Set<Integer> getLabConceptIds() {
        Set<Integer> conceptIdSet = new HashSet<Integer>();
        LabService ls = (LabService) Context.getService(LabService.class);
        List<Lab> labs = ls.getAllLab();
        for (Lab lab : labs) {
            conceptIdSet.addAll(getConceptIdSet(lab.getInvestigationsToDisplay()));
        }
        return conceptIdSet;
    }

    public DiaPatientServiceBillItem saveDiaPatientServiceBillItem(DiaPatientServiceBillItem diaBillItem) throws APIException {
        return dao.saveDiaPatientServiceBillItem(diaBillItem);
    }

    public List<DiaPatientServiceBillItem> getDiaBillItemByBillId(Integer billId) throws APIException {
        return dao.getDiaBillItemByBillId(billId);
    }

    public List<DiaPatientServiceBillCollect> getBillCollectListByBillId(Integer billId) throws APIException {
        return dao.getBillCollectListByBillId(billId);
    }

    public PatientSearch getPatientSerachByID(int patientId) throws APIException {
        return dao.getPatientSerachByID(patientId);
    }

    public List<PatientSearch> listPatientSearch(String searchKey, int page) throws APIException {
       return dao.listPatientSearch(searchKey, page);
    }

    public List<DiaPatientServiceBill> getCommission(int docId, Date sDate, Date eDate, String path, String radio) throws APIException {
        return dao.getCommission(docId, sDate, eDate, path, radio);
    }

    public List<DiaPatientServiceBill> getCommissionCal(int docId, Date sDate, Date eDate) throws APIException {
        return dao.getCommissionCal(docId, sDate, eDate);
    }

    public List<DiaDocDetails> searchDoctorName(String text) throws APIException {
        return dao.searchDoctorName(text);
    }

    public PatientSearch mergePatientSerach(PatientSearch ps) throws APIException {
        return dao.mergePatientSerach(ps);
    }

    public DiaCommissionCal saveDiaComCal(DiaCommissionCal diaComCal) throws APIException {
        return dao.saveDiaComCal(diaComCal);
    }

    public List<DiaCommissionCal> getDiaComCal(int docId, Date sDate, Date eDate) throws APIException {
        return dao.getDiaComCal(docId, sDate, eDate);
    }

    public DiaCommissionCal getDiaComCalById(Integer id) throws APIException {
        return dao.getDiaComCalById(id);
    }

    public DiaCommissionCal reSaveDiaComCal(DiaCommissionCal diaComCal) throws APIException {
        return dao.reSaveDiaComCal(diaComCal);
    }

    public List<DiaCommissionCal> getDiaComCalByBillId(Integer billId) throws APIException {
        return dao.getDiaComCalByBillId(billId);
    }

    public DiaCommissionCalPaid saveDiaComCalPaid(DiaCommissionCalPaid diaComCalPaid) throws APIException {
        return dao.saveDiaComCalPaid(diaComCalPaid);
    }

    public List<DiaCommissionCalPaid> getDiaComCalPaidByIdandDate(int docId, Date sDate, Date eDate) throws APIException {
        return dao.getDiaComCalPaidByIdandDate(docId, sDate, eDate);
    }

    public List<DiaCommissionCalPaid> getDiaComCalPaid(int docId, Date sDate, Date eDate) throws APIException {
        return dao.getDiaComCalPaid(docId, sDate, eDate);
    }

    public List<DiaCommissionCalPaid> getDiaComCalPaidByIdDate(int docId, int docId2, Date sDate, Date eDate) throws APIException {
        return dao.getDiaComCalPaidByIdDate(docId, docId2, sDate, eDate);
    }

    public List<DiaBillingOrder> getDiaBillOrderByPatientIdOrderId(int patientId, int orderId) throws APIException {
        return dao.getDiaBillOrderByPatientIdOrderId(patientId, orderId);
    }

    public void removeDiaBillOrder(DiaBillingOrder diaBillOrder) throws APIException {
         dao.removeDiaBillOrder(diaBillOrder);
    }

    public DiaBillingOrder getDiaBillOrderById(Integer id) throws APIException {
        return dao.getDiaBillOrderById(id);
    }

    public DiaLabSampleid saveDiaLabSam(DiaLabSampleid diaLabSam) throws APIException {
        return dao.saveDiaLabSam(diaLabSam);
    }

    public List<DiaLabSampleid> getDiaLabSam() throws APIException {
        return dao.getDiaLabSam();
    }

    public List<DiaLabSampleid> getSampleIdByBillId(int billId) throws APIException {
        return dao.getSampleIdByBillId(billId);
    }

    public List<DiaCommissionCal> getDiaComCalRmp(int rmpId, Date sDate, Date eDate) throws APIException {
        return dao.getDiaComCalRmp(rmpId, sDate, eDate);
    }

    public List<DiaRmpName> searchRmpName(String text) throws APIException {
        return dao.searchRmpName(text);
    }

    public DiaRmpName getDiaRmpById(int rmpId) throws APIException {
        return dao.getDiaRmpById(rmpId);
    }

    public DiaRmpCommCalculationPaid saveRmpComPaid(DiaRmpCommCalculationPaid diaRmp) throws APIException {
        return dao.saveRmpComPaid(diaRmp);
    }

    public DiaRmpCommCalculationPaid getDiaRmpCalPaidById(int Id) throws APIException {
        return dao.getDiaRmpCalPaidById(Id);
    }

    public DiaCommissionCalPaid getDiaComCalPaidById(int id) throws APIException {
        return dao.getDiaComCalPaidById(id);
    }

    public List<User> getAllUser() throws APIException {
        return dao.getAllUser();
    }

    public DiaCommissionCalPaidAdj saveDiaComPaidAdj(DiaCommissionCalPaidAdj diaAdj) throws APIException {
        return dao.saveDiaComPaidAdj(diaAdj);
    }

    public DiaRmpCommCalculationPaidAdj saveDiaRmpAdj(DiaRmpCommCalculationPaidAdj diaRmpAdj) throws APIException {
        return dao.saveDiaRmpAdj(diaRmpAdj);
    }

    public List<DiaRmpCommCalculationPaid> getRmpComCalPaidByIdDate(int rmpId, int rmpId2, Date sDate, Date eDate) throws APIException {
        return dao.getRmpComCalPaidByIdDate(rmpId, rmpId2, sDate, eDate);
    }

    public List<DiaBarcodeGroup> listDiaBarcodeGroup() throws APIException {
        return dao.listDiaBarcodeGroup();
    }

    public PatientSearch getPatientByPatientIdentifier(String patientId) throws APIException {
        return dao.getPatientByPatientIdentifier(patientId);
    }

    public DiaPatientServiceBill getDiaPatienSerBillByPatientId(int patientId) throws APIException {
        return dao.getDiaPatienSerBillByPatientId(patientId);
    }

    public List<DiaCommissionCal> listDiaComCalByBillId(Integer billId) throws APIException {
        return dao.listDiaComCalByBillId(billId);
    }

    public List<DiaDocDetails> getAllDoctors() throws APIException {
        return dao.getAllDoctors();
    }

    public List<DoctorPerformanceInfo> getDoctorsPerformanceInfo(String sDate, String eDate, String doctorId, String autoCompleteValue) throws APIException {
        return dao.getDoctorsPerformanceInfo(sDate, eDate, doctorId, autoCompleteValue);
    }

    public List<DiaRmpName> getAllRmp() throws APIException {
        return dao.getAllRmp();
    }

    public DiaCommissionCalAll saveDiaComAll(DiaCommissionCalAll diaAll) throws APIException {
        return dao.saveDiaComAll(diaAll);
    }

    public List<DiaCommissionCalAll> listDiaComCalAll(int docch, Date sDate, Date eDate) throws APIException {
        return dao.listDiaComCalAll(docch, sDate, eDate);
    }

    public DiaCommissionCalAll getDiaAllByBillId(int billId) throws APIException {
        return dao.getDiaAllByBillId(billId);
    }
    
}
