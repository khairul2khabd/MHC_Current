/**
 * Copyright 2008 Society for Health Information Systems Programmes, India (HISP
 * India)
 *
 * This file is part of Registration module.
 *
 * Registration module is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option) any
 * later version.
 *
 * Registration module is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
 * details.
 *
 * You should have received a copy of the GNU General Public License along with
 * Registration module. If not, see <http://www.gnu.org/licenses/>.
 *
 *
 */
package org.openmrs.module.registration.db.hibernate;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.apache.commons.lang.StringUtils;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.openmrs.Encounter;
import org.openmrs.EncounterType;
import org.openmrs.Patient;
import org.openmrs.PatientIdentifier;
import org.openmrs.PersonAttribute;
import org.openmrs.PersonAttributeType;
import org.openmrs.User;
import org.openmrs.api.context.Context;
import org.openmrs.api.db.DAOException;
import org.openmrs.module.hospitalcore.model.DiaRmpName;
import org.openmrs.module.hospitalcore.model.MarDetails;
import org.openmrs.module.hospitalcore.model.PatientSearch;
import org.openmrs.module.hospitalcore.util.DateUtils;
import org.openmrs.module.hospitalcore.util.GlobalPropertyUtil;
import org.openmrs.module.registration.db.RegistrationDAO;
import org.openmrs.module.registration.model.DiaPatient;
import org.openmrs.module.registration.model.DiaPatientEdit;
import org.openmrs.module.registration.model.DiaPersonEdit;
import org.openmrs.module.registration.model.DiaPersonNameEdit;
import org.openmrs.module.registration.model.DocDetails;
import org.openmrs.module.registration.model.MarketedBy;
import org.openmrs.module.registration.model.RefDoctor;
import org.openmrs.module.registration.model.RefMarketedBy;
import org.openmrs.module.registration.model.RegistrationFee;
import org.openmrs.module.registration.util.RegistrationConstants;

public class HibernateRegistrationDAO implements RegistrationDAO {

    private SessionFactory sessionFactory;

    private SimpleDateFormat mysqlDateTimeFormatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

    private SimpleDateFormat mysqlDateFormatter = new SimpleDateFormat("yyyy-MM-dd");

    private static Log logger = LogFactory.getLog(HibernateRegistrationDAO.class);

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    /*
     * REGISTRATION FEE
     */
    public RegistrationFee saveRegistrationFee(RegistrationFee fee) {
        return (RegistrationFee) sessionFactory.getCurrentSession().merge(fee);
    }

    public RegistrationFee getRegistrationFee(Integer id) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(RegistrationFee.class);
        criteria.add(Restrictions.eq("id", id));
        return (RegistrationFee) criteria.uniqueResult();
    }

    @SuppressWarnings("unchecked")
    public List<RegistrationFee> getRegistrationFees(Patient patient, Integer numberOfLastDate) throws ParseException {

        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(RegistrationFee.class);
        criteria.add(Restrictions.eq("patient", patient));
        Calendar afterDate = Calendar.getInstance();
        afterDate.add(Calendar.DATE, -numberOfLastDate);
        String afterDateFormat = mysqlDateFormatter.format(afterDate.getTime()) + " 00:00:00";
        logger.info(String.format("getRegistrationFees(patientId=%s, afterDate=%s)", patient.getId(), afterDateFormat));
        criteria.add(Expression.ge("createdOn", mysqlDateTimeFormatter.parse(afterDateFormat)));
        criteria.addOrder(Order.desc("createdOn"));

        return criteria.list();
    }

    public void deleteRegistrationFee(RegistrationFee fee) {
        sessionFactory.getCurrentSession().delete(fee);
    }

    /*
     * PERSON ATTRIBUTE
     */
    @SuppressWarnings("unchecked")
    public List<PersonAttribute> getPersonAttribute(PersonAttributeType type, String value) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(PersonAttribute.class);
        criteria.add(Restrictions.eq("attributeType", type));
        criteria.add(Restrictions.eq("value", value));
        criteria.add(Restrictions.eq("voided", false));
        Criteria personCriteria = criteria.createCriteria("person");
        personCriteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
        return criteria.list();
    }

    /*
     * ENCOUNTER
     */
    public Encounter getLastEncounter(Patient patient) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Encounter.class);
        criteria.add(Restrictions.eq("patient", patient));

        // Get encountertypes
        Set<EncounterType> encounterTypes = new HashSet<EncounterType>();
        encounterTypes.add(Context.getEncounterService().getEncounterType(
                GlobalPropertyUtil.getString(RegistrationConstants.PROPERTY_ENCOUNTER_TYPE_REGINIT, "REGINITIAL")));
        encounterTypes.add(Context.getEncounterService().getEncounterType(
                GlobalPropertyUtil.getString(RegistrationConstants.PROPERTY_ENCOUNTER_TYPE_REVISIT, "REGREVISIT")));
        criteria.add(Restrictions.in("encounterType", encounterTypes));
        criteria.addOrder(Order.desc("dateCreated"));
        criteria.setMaxResults(1);
        return (Encounter) criteria.uniqueResult();
    }

    //ghanshya,3-july-2013 #1962 Create validation for length of Health ID and National ID
	/*
     * Validate NationalId
     */
    public int getNationalId(String nationalId) {
        String hql = "from PersonAttribute pa where pa.attributeType=20 AND pa.value like '" + nationalId + "' ";
        Session session = sessionFactory.getCurrentSession();
        Query q = session.createQuery(hql);
        List<PersonAttribute> list = q.list();
        if (list.size() > 0) {
            return 1;
        } else {
            return 0;
        }
    }

    public int getNationalId(Integer patientId, String nationalId) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(PersonAttribute.class);
        criteria.add(Restrictions.eq("attributeType.id", 20));
        criteria.add(Restrictions.eq("value", nationalId));
        criteria.add(Restrictions.eq("voided", false));
        criteria.add(Restrictions.not(Restrictions.eq("person.id", patientId)));
        List<PersonAttribute> list = criteria.list();
        if (list.size() > 0) {
            return 1;
        } else {
            return 0;
        }

    }

    /*
     * Validate HealthId
     */
    public int getHealthId(String healthId) {
        String hql = "from PersonAttribute pa where pa.attributeType=24 AND pa.value like '" + healthId + "' ";
        Session session = sessionFactory.getCurrentSession();
        Query q = session.createQuery(hql);
        List<PersonAttribute> list = q.list();
        if (list.size() > 0) {
            return 1;
        } else {
            return 0;
        }
    }

    public int getHealthId(Integer patientId, String healthId) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(PersonAttribute.class);
        criteria.add(Restrictions.eq("attributeType.id", 24));
        criteria.add(Restrictions.eq("value", healthId));
        criteria.add(Restrictions.eq("voided", false));
        criteria.add(Restrictions.not(Restrictions.eq("person.id", patientId)));
        List<PersonAttribute> list = criteria.list();
        if (list.size() > 0) {
            return 1;
        } else {
            return 0;
        }

    }

    public List<Encounter> getCountPatient(Integer creatro) throws DAOException {
        String hql = "from Encounter e where e.creator='" + creatro
                + "' AND e.encounterType<=6";
        Session session = sessionFactory.getCurrentSession();
        Query q = session.createQuery(hql);
        List<Encounter> list = q.list();

        return list;
    }

    public List<Encounter> countPatientByUser(Integer creator, Date date) throws DAOException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String startDate = sdf.format(date) + " 00:00:00";
        String endDate = sdf.format(date) + " 23:59:59";
        String hql = "from Encounter e where e.creator='" + creator
                + "'AND e.encounterDatetime BETWEEN'"
                + startDate
                + "' AND '"
                + endDate
                + "' AND e.encounterType<=6";
        Session session = sessionFactory.getCurrentSession();
        Query q = session.createQuery(hql);
        List<Encounter> list = q.list();

        return list;

    }

    public List<Encounter> countRegPatient(Integer creator, String date) throws DAOException {

        Date d = new Date();
        String date1 = mysqlDateFormatter.format(d);
        String hql = "from Encounter e where e.creator='" + creator
                + "'AND e.encounterDatetime='"
                + date1
                + "' AND e.encounterType<=6";
        Session session = sessionFactory.getCurrentSession();
        Query q = session.createQuery(hql);
        List<Encounter> list = q.list();

        return list;
    }

    public DocDetails saveDocDetails(DocDetails docDetails) throws DAOException {
        sessionFactory.getCurrentSession().saveOrUpdate(docDetails);
        return docDetails;
    }

    public List<DocDetails> getdocName() throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(DocDetails.class);
        List<DocDetails> list = criteria.list();
        return list;

    }

    public RefDoctor saveRefDoc(RefDoctor refDoc) throws DAOException {
        sessionFactory.getCurrentSession().saveOrUpdate(refDoc);
        return refDoc;
    }

    public MarketedBy saveMarketedBy(MarketedBy marketedBy) throws DAOException {
        sessionFactory.getCurrentSession().saveOrUpdate(marketedBy);
        return marketedBy;
    }

    public List<MarketedBy> getMarketedBy() throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(MarketedBy.class);
        List<MarketedBy> list = criteria.list();
        return list;
    }

    public void deleteDocDetails(DocDetails docDetails) throws DAOException {
        sessionFactory.getCurrentSession().delete(docDetails);
    }

    public RefMarketedBy saveRefMarketedBy(RefMarketedBy refMarketedBy) throws DAOException {
        sessionFactory.getCurrentSession().saveOrUpdate(refMarketedBy);
        return refMarketedBy;
    }

    public List<MarDetails> serchMarName(String text) throws DAOException {
        String hql = null;
        hql = "from  MarDetails o where o.name LIKE '%" + text + "%' OR o.id LIKE '" + text + "%')";
        org.hibernate.classic.Session session = sessionFactory.getCurrentSession();
        Query q = session.createQuery(hql);
        List<MarDetails> list = q.list();
        return list;
    }

    public List<DocDetails> searchDoctorName(String text) throws DAOException {
        String hql = null;
        hql = "from  DocDetail o where o.doctorName LIKE '%" + text + "%' OR o.id LIKE '" + text + "%')";
        Session session = sessionFactory.getCurrentSession();
        Query q = session.createQuery(hql);
        List<DocDetails> list = q.list();
        return list;
    }

    public DocDetails getDocInById(int docId) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(DocDetails.class);
        criteria.add(Restrictions.eq("id", docId));
        return (DocDetails) criteria.uniqueResult();
    }

    public DocDetails saveById(DocDetails docDetails) throws DAOException {
        return (DocDetails) sessionFactory.getCurrentSession().merge(docDetails);
    }

    public MarDetails getMarInById(int marId) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(MarDetails.class);
        criteria.add(Restrictions.eq("id", marId));
        return (MarDetails) criteria.uniqueResult();
    }

    public MarDetails saveByIdMar(MarDetails marDetails) throws DAOException {
        return (MarDetails) sessionFactory.getCurrentSession().merge(marDetails);
    }

    public DiaPatient saveDiaPatient(DiaPatient diaPatient) throws DAOException {
        sessionFactory.getCurrentSession().saveOrUpdate(diaPatient);
        return diaPatient;
    }

    public DiaPatient getDiaPatientById(int patientId) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(DiaPatient.class);
        criteria.add(Restrictions.eq("oldPatientId", patientId));
        return (DiaPatient) criteria.uniqueResult();
    }

    public DiaRmpName saveRmp(DiaRmpName rmp) throws DAOException {
        sessionFactory.getCurrentSession().saveOrUpdate(rmp);
        return rmp;
    }

    public List<DiaRmpName> getRmpNameAll() throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(DiaRmpName.class);
        List<DiaRmpName> list = criteria.list();
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

    public DiaRmpName getRmpById(int rmpId) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(DiaRmpName.class);
        criteria.add(Restrictions.eq("id", rmpId));
        return (DiaRmpName) criteria.uniqueResult();
    }

    public DiaRmpName saveRmpByIdForEdit(DiaRmpName rmp) throws DAOException {
        return (DiaRmpName) sessionFactory.getCurrentSession().merge(rmp);
    }

    public DiaPatientEdit getDiaPaEditByPatientId(Integer patientId) throws DAOException {
        Criteria criteria=sessionFactory.getCurrentSession().createCriteria(DiaPatientEdit.class);
        criteria.add(Restrictions.eq("patientId", patientId));
        return (DiaPatientEdit) criteria.uniqueResult();
    }

    public DiaPatientEdit updateDiaPaEdit(DiaPatientEdit diPaEdit) throws DAOException {
      return (DiaPatientEdit) sessionFactory.getCurrentSession().merge(diPaEdit);
    }

    public PatientSearch getPatientSearchByPatId(Integer patientId) throws DAOException {
        Criteria criteria=sessionFactory.getCurrentSession().createCriteria(PatientSearch.class);
        criteria.add(Restrictions.eq("patientId", patientId));
        return (PatientSearch) criteria.uniqueResult();
    }

    public PatientSearch updatePatSearch(PatientSearch ps) throws DAOException {
        return (PatientSearch) sessionFactory.getCurrentSession().merge(ps);
    }

    public DiaPersonEdit getDiaPerEditByPaId(Integer patientId) throws DAOException {
        Criteria criteria=sessionFactory.getCurrentSession().createCriteria(DiaPersonEdit.class);
        criteria.add(Restrictions.eq("patientId", patientId));
        return (DiaPersonEdit) criteria.uniqueResult();
    }

    public DiaPersonEdit updateDiaPerEdit(DiaPersonEdit diaPerEdit) throws DAOException {
        return (DiaPersonEdit) sessionFactory.getCurrentSession().merge(diaPerEdit);
    }

    public DiaPersonNameEdit getDiaPerNamEditByPaId(Integer patientId) throws DAOException {
        Criteria criteria=sessionFactory.getCurrentSession().createCriteria(DiaPersonNameEdit.class);
        criteria.add(Restrictions.eq("personId", patientId));
        return (DiaPersonNameEdit) criteria.uniqueResult();
    }

    public DiaPersonNameEdit updateDiaPerNameEdit(DiaPersonNameEdit diaPerNameEdit) throws DAOException {
        return (DiaPersonNameEdit) sessionFactory.getCurrentSession().merge(diaPerNameEdit);
    }

}

/*
return (DiaCommissionCal) sessionFactory.getCurrentSession().merge(diaComCal);
*/