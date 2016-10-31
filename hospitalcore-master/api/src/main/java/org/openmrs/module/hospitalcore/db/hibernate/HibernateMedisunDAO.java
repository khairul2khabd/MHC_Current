/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.hospitalcore.db.hibernate;

/**
 *
 * @author khairul
 */
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.hibernate.criterion.Restrictions;
import org.openmrs.Patient;
import org.openmrs.Role;
import org.openmrs.User;
import org.openmrs.api.context.Context;
import org.openmrs.api.db.DAOException;
import org.openmrs.module.hospitalcore.BillingConstants;
import org.openmrs.module.hospitalcore.db.MedisunDAO;
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

public class HibernateMedisunDAO implements MedisunDAO {

    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    protected final Log log = LogFactory.getLog(getClass());

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    //  public DiaBillingQueue saveDiaBillingQueue(DiaBillingQueue diaBillingQueue) throws DAOException {
    //     sessionFactory.getCurrentSession().saveOrUpdate(diaBillingQueue);
    //     return diaBillingQueue;
    //  }
    public List<PatientSearch> searchListOfPatient(Date date, String searchKey, int page) throws DAOException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String startDate = sdf.format(date) + " 00:00:00";
        String endDate = sdf.format(date) + " 23:59:59";
        String hql = null;

        hql = "from PatientSearch ps where ps.patientId IN (SELECT o.patientId FROM DiaBillingQueue o where o.createdDate BETWEEN '"
                + startDate
                + "' AND '"
                + endDate
                + "' AND o.status is NOT NULL) AND (ps.identifier LIKE '%"
                + searchKey + "%' OR ps.fullname LIKE '" + searchKey + "%')";

        int firstResult = (page - 1) * BillingConstants.PAGESIZE;
        Session session = sessionFactory.getCurrentSession();

        Query q = session.createQuery(hql);
        List<PatientSearch> list = q.list();

        return list;
    }

    public List<DiaBillingQueue> searchListOfPatientDia(Date date, String searchKey, int page) throws DAOException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String startDate = sdf.format(date) + " 00:00:00";
        String endDate = sdf.format(date) + " 23:59:59";
        String hql = null;

        hql = "from  DiaBillingQueue o where o.createdDate BETWEEN '"
                + startDate
                + "' AND '"
                + endDate
                + "' AND o.status is NOT NULL  AND (o.identifier LIKE '%"
                + searchKey + "%' OR o.fullName LIKE '" + searchKey + "%')";

        int firstResult = (page - 1) * BillingConstants.PAGESIZE;
        Session session = sessionFactory.getCurrentSession();

        Query q = session.createQuery(hql);
        List<DiaBillingQueue> list = q.list();

        return list;
    }

    public DocDetail getDocInfoById(int docId) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(DocDetail.class);
        criteria.add(Restrictions.eq("id", docId));
        return (DocDetail) criteria.uniqueResult();
    }

    public MarDetails getMarInfoById(int marId) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(MarDetails.class);
        criteria.add(Restrictions.eq("id", marId));
        return (MarDetails) criteria.uniqueResult();
    }

    public List<BillableService> searchTestNameOrID(String text) throws DAOException {
        String hql = null;

        hql = "from  BillableService bs where bs.price IS NOT NULL AND bs.disable=false"
                + "  AND bs.name LIKE '%"
                + text
                + "%' "
                + "OR bs.shortName LIKE '"
                //+ text + "%')";
                + text + "%')";

        Session session = sessionFactory.getCurrentSession();
        Query q = session.createQuery(hql);
        List<BillableService> list = q.list();
        return list;
    }

    public DiaReceipt saveDiaReceipt(DiaReceipt diaReceipt) throws DAOException {
        sessionFactory.getCurrentSession().saveOrUpdate(diaReceipt);
        return diaReceipt;
    }

    public DiaPatientServiceBill saveDiaPatientServiceBill(DiaPatientServiceBill diaPatientServiceBill) throws DAOException {
        sessionFactory.getCurrentSession().saveOrUpdate(diaPatientServiceBill);
        return diaPatientServiceBill;
    }

    public BillableService getServiceByName(String name) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(BillableService.class, "bill")
                .add(Restrictions.eq("bill.name", name));
        return (BillableService) criteria.uniqueResult();

    }

    public List<BillableService> getServiceById(Integer conceptId) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(BillableService.class);
        criteria.add(Restrictions.eq("conceptId", conceptId));
        return criteria.list();

    }

    public DiaBillingOrder saveDiaBillingOrder(DiaBillingOrder diaBillingOrder) throws DAOException {
        sessionFactory.getCurrentSession().saveOrUpdate(diaBillingOrder);
        return diaBillingOrder;
    }

    public List<BillableService> listOfServiceOrder(Integer patientId, Integer encounterId) throws DAOException {
        String hql = "from BillableService b where b.conceptId IN (SELECT o.conceptId FROM DiaBillingOrder o where o.patientId='"
                + patientId
                + "' AND o.encounterId='"
                + encounterId
                + "' AND o.billingStatus=0 AND o.cancelStatus=0 )";
        Session session = sessionFactory.getCurrentSession();
        Query q = session.createQuery(hql);
        List<BillableService> list = q.list();
        return list;
    }

    public void removeDiaBillingQueue(DiaBillingQueue diaBillingQueue) throws DAOException {
        sessionFactory.getCurrentSession().delete(diaBillingQueue);
    }

    public DiaBillingQueue getDiaBillingQueue(Integer id) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(DiaBillingQueue.class);
        criteria.add(Restrictions.eq("id", id));
        return (DiaBillingQueue) criteria.uniqueResult();
    }

    public DiaPatientServiceBillCollect saveDiaPatientServiceBillCollect(DiaPatientServiceBillCollect diaPatientServiceBillCollect) throws DAOException {
        sessionFactory.getCurrentSession().saveOrUpdate(diaPatientServiceBillCollect);
        return diaPatientServiceBillCollect;
    }

    public List<BillableService> getDiaBillingOrderandPatientId(Integer orderId, Integer patientId) throws DAOException {
        /* Criteria criteria=sessionFactory.getCurrentSession().createCriteria(DiaBillingOrder.class);
         criteria.add(Restrictions.eq("orderId", orderId));
         criteria.add(Restrictions.eq("patientId", patientId));
         return criteria.list(); */
        String hql = "from BillableService b where b.conceptId IN (SELECT o.conceptId FROM DiaBillingOrder o where o.patientId='"
                + patientId
                + "' AND o.orderId='"
                + orderId
                + "' AND o.billingStatus=0 AND o.cancelStatus=0 )";
        Session session = sessionFactory.getCurrentSession();
        Query q = session.createQuery(hql);
        List<BillableService> list = q.list();
        return list;

    }

    public void removeDiaBillingOrder(DiaBillingOrder diaBillingOrder) throws DAOException {
        sessionFactory.getCurrentSession().delete(diaBillingOrder);
    }

    public DiaPatientServiceBill getDiaPatientServiceBillId(Integer billId) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(DiaPatientServiceBill.class);
        criteria.add(Restrictions.eq("billId", billId));
        return (DiaPatientServiceBill) criteria.uniqueResult();
    }

    public DiaPatientServiceBill reSaveDia(DiaPatientServiceBill diaPatientServiceBill) throws DAOException {
        return (DiaPatientServiceBill) sessionFactory.getCurrentSession().merge(diaPatientServiceBill);
    }

    public DiaPatientServiceBillItem saveDiaPatientServiceBillItem(DiaPatientServiceBillItem diaBillItem) throws DAOException {
        sessionFactory.getCurrentSession().saveOrUpdate(diaBillItem);
        return diaBillItem;
    }

    public List<DiaPatientServiceBillItem> getDiaBillItemByBillId(Integer billId) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(DiaPatientServiceBillItem.class);
        criteria.add(Restrictions.eq("diaPatientServiceBill.billId", billId));
        return criteria.list();
    }

    public List<DiaPatientServiceBillCollect> getBillCollectListByBillId(Integer billId) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(DiaPatientServiceBillCollect.class);
        criteria.add(Restrictions.eq("diaPatientServiceBill.billId", billId));
        return criteria.list();
    }

    public PatientSearch getPatientSerachByID(int patientId) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(PatientSearch.class);
        criteria.add(Restrictions.eq("patientId", patientId));
        return (PatientSearch) criteria.uniqueResult();
    }

    public List<PatientSearch> listPatientSearch(String searchKey, int page) throws DAOException {
        String hql = null;
        hql = "from PatientSearch ps where ps.identifier LIKE '%"
                + searchKey
                + "%' "
                + "OR ps.fullname LIKE '"
                + searchKey + "%')";
        int firstResult = (page - 1) * BillingConstants.PAGESIZE;
        Session session = sessionFactory.getCurrentSession();
        Query q = session.createQuery(hql);
        q.setFirstResult(0);
        q.setMaxResults(50);

        List<PatientSearch> list = q.list();
        return list;
    }

    public List<DiaPatientServiceBill> getCommission(int docId, Date sDate, Date eDate, String path, String radio) throws DAOException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String startDate = sdf.format(sDate) + " 00:00:00";
        String endDate = sdf.format(eDate) + " 23:59:59";
        String hql = null;
        String bs = "PAID";
        // hql = "SELECT d.billId, d.patientID  from  DiaPatientServiceBill d "
        hql = "from  DiaPatientServiceBill d "
                //  + "INNER JOIN DiaPatientServiceBillItem di ON d.billId = di.diaPatientServiceBill.billId "
                + " where d.refDocId='"
                + docId
                + "' AND d.createdDate BETWEEN '"
                + startDate
                + "' AND '"
                + endDate
                + "' AND d.printed=1 AND d.billingStatus = '" + bs + "'";

        //String hql = "from Stock s where s.stockCode = '" + stockCode + "'";
        Session session = sessionFactory.getCurrentSession();
        Query q = session.createQuery(hql);
        List<DiaPatientServiceBill> list = q.list();
        return list;

    }

    public List<DiaPatientServiceBill> getCommissionCal(int docId, Date sDate, Date eDate) throws DAOException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String startDate = sdf.format(sDate) + " 00:00:00";
        String endDate = sdf.format(eDate) + " 23:59:59";
        String hql = null;
        // hql = "SELECT d.billId, d.patientID  from  DiaPatientServiceBill d "
        hql = "from  DiaPatientServiceBill d "
                //  + "INNER JOIN DiaPatientServiceBillItem di ON d.billId = di.diaPatientServiceBill.billId "
                + " where d.refDocId='"
                + docId
                + "' AND d.createdDate BETWEEN '"
                + startDate
                + "' AND '"
                + endDate
                + "' AND d.printed=1";

        Session session = sessionFactory.getCurrentSession();
        Query q = session.createQuery(hql);
        List<DiaPatientServiceBill> list = q.list();
        return list;
    }

    public List<DiaDocDetails> searchDoctorName(String text) throws DAOException {
        String hql = null;
        hql = "from  DiaDocDetails o where o.doctorName LIKE '%" + text + "%' OR o.id LIKE '" + text + "%')";
        Session session = sessionFactory.getCurrentSession();
        Query q = session.createQuery(hql);
        List<DiaDocDetails> list = q.list();
        return list;
    }

    public PatientSearch mergePatientSerach(PatientSearch ps) throws DAOException {
        return (PatientSearch) sessionFactory.getCurrentSession().merge(ps);
    }

    public DiaCommissionCal saveDiaComCal(DiaCommissionCal diaComCal) throws DAOException {
        sessionFactory.getCurrentSession().saveOrUpdate(diaComCal);
        return diaComCal;
    }

    public List<DiaCommissionCal> getDiaComCal(int docId, Date sDate, Date eDate) throws DAOException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String startDate = sdf.format(sDate) + " 00:00:00";
        String endDate = sdf.format(eDate) + " 23:59:59";
        String hql = null;
        // hql = "SELECT d.billId, d.patientID  from  DiaPatientServiceBill d "
        hql = "from  DiaCommissionCal d "
                //  + "INNER JOIN DiaPatientServiceBillItem di ON d.billId = di.diaPatientServiceBill.billId "
                + " where d.refId='"
                + docId
                + "' AND d.createdDate BETWEEN '"
                + startDate
                + "' AND '"
                + endDate
                + "' AND d.status=false AND d.refRmpId<1";

        Session session = sessionFactory.getCurrentSession();
        Query q = session.createQuery(hql);
        List<DiaCommissionCal> list = q.list();
        return list;
    }

    public DiaCommissionCal getDiaComCalById(Integer id) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(DiaCommissionCal.class);
        criteria.add(Restrictions.eq("id", id));
        return (DiaCommissionCal) criteria.uniqueResult();
    }

    public DiaCommissionCal reSaveDiaComCal(DiaCommissionCal diaComCal) throws DAOException {
        return (DiaCommissionCal) sessionFactory.getCurrentSession().merge(diaComCal);

    }

    public List<DiaCommissionCal> getDiaComCalByBillId(Integer billId) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(DiaCommissionCal.class);
        criteria.add(Restrictions.eq("refId", billId));
        return criteria.list();
    }

    public DiaCommissionCalPaid saveDiaComCalPaid(DiaCommissionCalPaid diaComCalPaid) throws DAOException {
        sessionFactory.getCurrentSession().saveOrUpdate(diaComCalPaid);
        return diaComCalPaid;
    }

    public List<DiaCommissionCalPaid> getDiaComCalPaidByIdandDate(int docId, Date sDate, Date eDate) throws DAOException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String startDate = sdf.format(sDate) + "00:00:00";
        String endDate = sdf.format(eDate) + "23:59:59";
        String hql = "from DiaCommissionCalPaid d where d.docId='"
                //+ docId
                //+ "' AND '"
                + docId
                + "' AND d.createdDate BETWEEN '"
                + startDate
                + "' AND '"
                + endDate + "'";
        Session ses = sessionFactory.getCurrentSession();
        Query q = ses.createQuery(hql);
        List<DiaCommissionCalPaid> list = q.list();
        return list;

    }

    public List<DiaCommissionCalPaid> getDiaComCalPaid(int docId, Date sDate, Date eDate) throws DAOException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String startDate = sdf.format(sDate) + " 00:00:00";
        String endDate = sdf.format(eDate) + " 23:59:59";
        String hql = null;
        // hql = "SELECT d.billId, d.patientID  from  DiaPatientServiceBill d "
        hql = "from  DiaCommissionCalPaid d "
                //  + "INNER JOIN DiaPatientServiceBillItem di ON d.billId = di.diaPatientServiceBill.billId "
                + " where d.docId BETWEEN'"
                + docId
                + "' AND '"
                + docId
                + "' AND d.createdDate BETWEEN '"
                + startDate
                + "' AND '"
                + endDate
                + "'";

        Session session = sessionFactory.getCurrentSession();
        Query q = session.createQuery(hql);
        List<DiaCommissionCalPaid> list = q.list();
        return list;
    }

    public List<DiaCommissionCalPaid> getDiaComCalPaidByIdDate(int docId, int docId2, Date sDate, Date eDate) throws DAOException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String startDate = sdf.format(sDate) + " 00:00:00";
        String endDate = sdf.format(eDate) + " 23:59:59";
        String hql = null;
        // hql = "SELECT d.billId, d.patientID  from  DiaPatientServiceBill d "
        hql = "from  DiaCommissionCalPaid d "
                //  + "INNER JOIN DiaPatientServiceBillItem di ON d.billId = di.diaPatientServiceBill.billId "
                + " where d.docId BETWEEN'"
                + docId
                + "' AND '"
                + docId2
                + "' AND d.createdDate BETWEEN '"
                + startDate
                + "' AND '"
                + endDate
                + "'";

        // + "' AND d.status=false AND d.refRmpId>0";
        Session session = sessionFactory.getCurrentSession();
        Query q = session.createQuery(hql);
        List<DiaCommissionCalPaid> list = q.list();
        return list;
    }

    public List<DiaBillingOrder> getDiaBillOrderByPatientIdOrderId(int patientId, int orderId) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(DiaBillingOrder.class);
        criteria.add(Restrictions.eq("patientId", patientId));
        criteria.add(Restrictions.eq("orderId", orderId));
        return criteria.list();
    }

    public void removeDiaBillOrder(DiaBillingOrder diaBillOrder) throws DAOException {
        sessionFactory.getCurrentSession().delete(diaBillOrder);
    }

    public DiaBillingOrder getDiaBillOrderById(Integer id) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(DiaBillingOrder.class);
        criteria.add(Restrictions.eq("id", id));
        return (DiaBillingOrder) criteria.uniqueResult();
    }

    public DiaLabSampleid saveDiaLabSam(DiaLabSampleid diaLabSam) throws DAOException {
        sessionFactory.getCurrentSession().saveOrUpdate(diaLabSam);
        return diaLabSam;
    }

    public List<DiaLabSampleid> getDiaLabSam() throws DAOException {
        Session ses = sessionFactory.getCurrentSession();
        String hql = "from DiaLabSampleid AS d ORDER BY d.id DESC LIMIT 1;";
        Query q = ses.createQuery(hql).setMaxResults(1);
        List<DiaLabSampleid> list = q.list();
        return list;
    }

    public List<DiaLabSampleid> getSampleIdByBillId(int billId) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(DiaLabSampleid.class);
        criteria.add(Restrictions.eq("diaPatientServiceBill.billId", billId));
        return criteria.list();
    }

    public List<DiaCommissionCal> getDiaComCalRmp(int rmpId, Date sDate, Date eDate) throws DAOException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String startDate = sdf.format(sDate) + " 00:00:00";
        String endDate = sdf.format(eDate) + " 23:59:59";
        String hql = null;
        // hql = "SELECT d.billId, d.patientID  from  DiaPatientServiceBill d "
        hql = "from  DiaCommissionCal d "
                //  + "INNER JOIN DiaPatientServiceBillItem di ON d.billId = di.diaPatientServiceBill.billId "
                + " where d.refRmpId='"
                + rmpId
                + "' AND d.createdDate BETWEEN '"
                + startDate
                + "' AND '"
                + endDate
                + "' AND d.status=false AND d.refRmpId>0";

        Session session = sessionFactory.getCurrentSession();
        Query q = session.createQuery(hql);
        List<DiaCommissionCal> list = q.list();
        return list;
    }

    public List<DiaRmpName> searchRmpName(String text) throws DAOException {
        String hql = null;
        hql = "from  DiaRmpName o where o.name LIKE '%" + text + "%' OR o.id LIKE '" + text + "%')";
        Session session = sessionFactory.getCurrentSession();
        Query q = session.createQuery(hql);
        List<DiaRmpName> list = q.list();
        return list;
    }

    public DiaRmpName getDiaRmpById(int rmpId) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(DiaRmpName.class);
        criteria.add(Restrictions.eq("id", rmpId));
        return (DiaRmpName) criteria.uniqueResult();
    }

    public DiaRmpCommCalculationPaid saveRmpComPaid(DiaRmpCommCalculationPaid diaRmp) throws DAOException {
        sessionFactory.getCurrentSession().saveOrUpdate(diaRmp);
        return diaRmp;
    }

    public DiaRmpCommCalculationPaid getDiaRmpCalPaidById(int Id) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(DiaRmpCommCalculationPaid.class);
        criteria.add(Restrictions.eq("id", Id));
        return (DiaRmpCommCalculationPaid) criteria.uniqueResult();
    }

    public DiaCommissionCalPaid getDiaComCalPaidById(int id) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(DiaCommissionCalPaid.class);
        criteria.add(Restrictions.eq("id", id));
        return (DiaCommissionCalPaid) criteria.uniqueResult();
    }

    public List<User> getAllUser() throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(User.class);

        // criteria.add(Restrictions.eq("roles.role", "DOCTOR"));
        return criteria.list();
    }

    public DiaCommissionCalPaidAdj saveDiaComPaidAdj(DiaCommissionCalPaidAdj diaAdj) throws DAOException {
        sessionFactory.getCurrentSession().saveOrUpdate(diaAdj);
        return diaAdj;
    }

    public DiaRmpCommCalculationPaidAdj saveDiaRmpAdj(DiaRmpCommCalculationPaidAdj diaRmpAdj) throws DAOException {
        sessionFactory.getCurrentSession().saveOrUpdate(diaRmpAdj);
        return diaRmpAdj;
    }

    public List<DiaRmpCommCalculationPaid> getRmpComCalPaidByIdDate(int rmpId, int rmpId2, Date sDate, Date eDate) throws DAOException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String startDate = sdf.format(sDate) + " 00:00:00";
        String endDate = sdf.format(eDate) + " 23:59:59";
        String hql = null;
        // hql = "SELECT d.billId, d.patientID  from  DiaPatientServiceBill d "
        hql = "from  DiaRmpCommCalculationPaid d "
                //  + "INNER JOIN DiaPatientServiceBillItem di ON d.billId = di.diaPatientServiceBill.billId "
                + " where d.rmpId BETWEEN'"
                + rmpId
                + "' AND '"
                + rmpId2
                + "' AND d.createdDate BETWEEN '"
                + startDate
                + "' AND '"
                + endDate
                + "'";

        Session session = sessionFactory.getCurrentSession();
        Query q = session.createQuery(hql);
        List<DiaRmpCommCalculationPaid> list = q.list();
        return list;
    }

    public List<DiaBarcodeGroup> listDiaBarcodeGroup() throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(DiaBarcodeGroup.class);
        return criteria.list();
    }

    public PatientSearch getPatientByPatientIdentifier(String patientId) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(PatientSearch.class);
        criteria.add(Restrictions.eq("identifier", patientId));
        return (PatientSearch) criteria.uniqueResult();
    }

    public DiaPatientServiceBill getDiaPatienSerBillByPatientId(int patientId) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(DiaPatientServiceBill.class);
        criteria.add(Restrictions.eq("patient.id", patientId));
        return (DiaPatientServiceBill) criteria.uniqueResult();
    }

    public List<DiaCommissionCal> listDiaComCalByBillId(Integer billId) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(DiaCommissionCal.class);
        criteria.add(Restrictions.eq("diaPatientServiceBill.billId", billId));
        List<DiaCommissionCal> list = criteria.list();
        return list;
    }

}
