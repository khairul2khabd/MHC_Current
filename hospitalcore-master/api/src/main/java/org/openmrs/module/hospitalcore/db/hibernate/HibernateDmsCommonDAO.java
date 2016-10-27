/**
 * Copyright 2013 Society for Health Information Systems Programmes, India (HISP
 * India)
 *
 * This file is part of Hospital-core module.
 *
 * Hospital-core module is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option) any
 * later version.
 *
 * Hospital-core module is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
 * details.
 *
 * You should have received a copy of the GNU General Public License along with
 * Hospital-core module. If not, see <http://www.gnu.org/licenses/>.
 *
 * author: ghanshyam date: 8-01-2013
 *
 */
package org.openmrs.module.hospitalcore.db.hibernate;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.openmrs.Concept;
import org.openmrs.ConceptName;
import org.openmrs.PatientIdentifier;
import org.openmrs.api.ConceptNameType;
import org.openmrs.api.db.DAOException;
import org.openmrs.module.hospitalcore.db.DmsCommonDAO;
import org.openmrs.module.hospitalcore.model.DiaBillingQueue;
 
import org.openmrs.module.hospitalcore.model.DmsOpdUnit;
import org.openmrs.module.hospitalcore.model.PatientSearch;

public class HibernateDmsCommonDAO implements DmsCommonDAO {

    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @SuppressWarnings("unchecked")
    public ConceptName getOpdWardNameByConceptId(Concept con)
            throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
                ConceptName.class);
        criteria.add(Restrictions.eq("concept", con));
        criteria.add(Restrictions.like("conceptNameType",
                ConceptNameType.FULLY_SPECIFIED));
        return (ConceptName) criteria.uniqueResult();
    }

    @SuppressWarnings("unchecked")
    public List<DmsOpdUnit> getOpdActivatedIdList() {
        Date date = new Date();
        int hour = date.getHours();
        int minute = date.getMinutes();
        int second = date.getSeconds();
        String curtime = "";
        if (hour < 10) {
            curtime = "0" + hour + ":" + minute + ":" + second;
        } else {
            curtime = hour + ":" + minute + ":" + second;
        }
        String days[] = {"Sunday", "Monday", "Tuesday", "Wednesday",
            "Thursday", "Friday", "Saturday"};
        GregorianCalendar gcalendar = new GregorianCalendar();
        String dayName = days[gcalendar.get(Calendar.DAY_OF_WEEK) - 1];
        String hql = "from DmsOpdUnit d where d.opdWorkingDay='"
                + dayName
                + "' AND '"
                + curtime
                + "' BETWEEN d.startTime AND d.endTime AND d.unitActiveDate is not null";
        Session session = sessionFactory.getCurrentSession();
        Query q = session.createQuery(hql);
        List<DmsOpdUnit> list = q.list();
        return list;
    }

    public DiaBillingQueue saveDiaBillingQueue(DiaBillingQueue diaBillingQueue) throws DAOException {
        sessionFactory.getCurrentSession().saveOrUpdate(diaBillingQueue);
        return diaBillingQueue;
    }

    public PatientSearch getPatientById(int patientId) throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(PatientSearch.class);
        criteria.add(Restrictions.eq("patientId", patientId));
        return (PatientSearch) criteria.uniqueResult();
    }

    public PatientSearch savePatientSearch(PatientSearch patientSearch) throws DAOException {
         sessionFactory.getCurrentSession().merge(patientSearch);
         return patientSearch;
    }

    public PatientIdentifier getPatIdentByPatientId(int patientId) throws DAOException {
        Criteria criteria=sessionFactory.getCurrentSession().createCriteria(PatientIdentifier.class);
        criteria.add(Restrictions.eq("patient.id", patientId));
        return (PatientIdentifier) criteria.uniqueResult();
    }

    public PatientIdentifier reSavePatientIde(PatientIdentifier patientIdentifier) throws DAOException {
        sessionFactory.getCurrentSession().merge(patientIdentifier);
        return patientIdentifier;
    }

}
