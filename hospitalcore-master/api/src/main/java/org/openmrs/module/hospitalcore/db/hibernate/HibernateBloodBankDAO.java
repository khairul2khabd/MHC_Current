/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.openmrs.module.hospitalcore.db.hibernate;

import java.text.SimpleDateFormat;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.openmrs.api.db.DAOException;
import org.openmrs.module.hospitalcore.db.BloodBankDAO;
import org.openmrs.module.hospitalcore.model.BloodBankDonorInfo;
import org.openmrs.module.hospitalcore.model.BloodBankPatient;
import org.openmrs.module.hospitalcore.model.BloodBankPatientFinal;
import org.openmrs.module.hospitalcore.model.BloodBankPatientLog;

/**
 *
 * @author cTechbd
 */
public class HibernateBloodBankDAO implements BloodBankDAO {

    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    protected final Log log = LogFactory.getLog(getClass());
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @SuppressWarnings("unchecked")
    public List<BloodBankPatient> getAllBloodBankPatient() throws DAOException {
        return sessionFactory.getCurrentSession().createCriteria(BloodBankPatient.class).list();
    }

    public BloodBankPatient saveBloodBankPatient(BloodBankPatient bbpatient) throws DAOException {
        return (BloodBankPatient) sessionFactory.getCurrentSession().merge(bbpatient);
    }

    public BloodBankPatientLog saveBloodBankPatientLog(BloodBankPatientLog bbpatientlog) throws DAOException {
        return (BloodBankPatientLog) sessionFactory.getCurrentSession().merge(bbpatientlog);
    }

    public BloodBankPatientFinal saveBloodBankPatientFinal(BloodBankPatientFinal bbpatientfinal) throws DAOException {
        return (BloodBankPatientFinal) sessionFactory.getCurrentSession().merge(bbpatientfinal);
    }

    @SuppressWarnings("unchecked")
    public List<BloodBankPatient> getBloodBankPatient() throws DAOException {
        return sessionFactory.getCurrentSession().createCriteria(BloodBankPatient.class).list();
    }

    public void removeBloodBankPatientQueue(BloodBankPatient bbPatientQueue) throws DAOException {
        sessionFactory.getCurrentSession().delete(bbPatientQueue);
    }

    public BloodBankPatient getBloodBankPatientQueue(Integer id)
            throws DAOException {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(BloodBankPatient.class);
        criteria.add(Restrictions.eq("id", id));
        return (BloodBankPatient) criteria.uniqueResult();
    }
    
    public BloodBankPatient getBloodBankPatient(Integer id)
		throws DAOException {
	Criteria criteria = sessionFactory.getCurrentSession().createCriteria(BloodBankPatient.class);
	criteria.add(Restrictions.eq("id", id));
        return (BloodBankPatient) criteria.uniqueResult();
    }
    
    
    
    public BloodBankDonorInfo saveBloodBankDonorInfo(BloodBankDonorInfo donorinfo) throws DAOException {
        return (BloodBankDonorInfo) sessionFactory.getCurrentSession().merge(donorinfo);
    }
    
    
    /*For donor*/
    
    @SuppressWarnings("unchecked")
    public List<BloodBankDonorInfo> getBloodBankDonorInfo() throws DAOException {
        return sessionFactory.getCurrentSession().createCriteria(BloodBankDonorInfo.class).list();
    }
}
