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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.openmrs.Role;
import org.openmrs.api.db.DAOException;
import org.openmrs.module.hospitalcore.db.InventoryDAO;
import org.openmrs.module.hospitalcore.model.InventoryDrug;
import org.openmrs.module.hospitalcore.model.InventoryDrugCategory;
import org.openmrs.module.hospitalcore.model.InventoryDrugFormulation;
import org.openmrs.module.hospitalcore.model.InventoryDrugUnit;
import org.openmrs.module.hospitalcore.model.InventoryStore;
import org.openmrs.module.hospitalcore.model.InventoryStoreDrugIndent;
import org.openmrs.module.hospitalcore.model.InventoryStoreDrugPatient;
import org.openmrs.module.hospitalcore.model.InventoryStoreDrugPatientDetail;
import org.openmrs.module.hospitalcore.model.InventoryStoreDrugTransaction;
import org.openmrs.module.hospitalcore.model.InventoryStoreDrugTransactionDetail;
import org.openmrs.module.hospitalcore.model.OpdDrugOrder;
import org.openmrs.module.hospitalcore.model.PatientSearch;
import org.openmrs.module.hospitalcore.util.ActionValue;

/**
 * Hibernate specific Idcards database methods
 */
public class HibernateInventoryDAO implements InventoryDAO {

	SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");

	SimpleDateFormat formatterExt = new SimpleDateFormat("dd/MM/yyyy");

	protected final Log log = LogFactory.getLog(getClass());

	/**
	 * Hibernate session factory
	 */
	private SessionFactory sessionFactory;

	/**
	 * Set session factory
	 * 
	 * @param sessionFactory
	 */
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@SuppressWarnings("unchecked")
	public List<InventoryStore> listInventoryStore(int min, int max)
			throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				InventoryStore.class);
		criteria.setFirstResult(min).setMaxResults(max);
		List<InventoryStore> l = criteria.list();

		return l;
	}

	@SuppressWarnings("unchecked")
	public List<InventoryStore> listMainStore() throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				InventoryStore.class);
		criteria.add(Restrictions.isNull("parent"));
		List<InventoryStore> l = criteria.list();
		// System.out.println("listMainStore>>l: "+l);
		return l;
	}

	public InventoryStore saveStore(InventoryStore store) throws DAOException {
		return (InventoryStore) sessionFactory.getCurrentSession().merge(store);
	}

	public int countListStore() throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				InventoryStore.class);
		Number rs = (Number) criteria.setProjection(Projections.rowCount())
				.uniqueResult();
		return rs != null ? rs.intValue() : 0;
	}

	public InventoryStore getStoreById(Integer id) throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				InventoryStore.class);
		criteria.add(Restrictions.eq("id", id));
		InventoryStore store = (InventoryStore) criteria.uniqueResult();
		return store;
	}

	public InventoryStore getStoreByName(String name) throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				InventoryStore.class);
		criteria.add(Restrictions.eq("name", name));
		InventoryStore store = (InventoryStore) criteria.uniqueResult();
		return store;
	}

	public InventoryStore getStoreByRole(String role) throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				InventoryStore.class);
		criteria.add(Restrictions.eq("role", role));
		criteria.setMaxResults(1);
		List<InventoryStore> list = criteria.list();
		return CollectionUtils.isEmpty(list) ? null : list.get(0);
	}

	public InventoryStore getStoreByCollectionRole(List<Role> roles)
			throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				InventoryStore.class);
		criteria.add(Restrictions.in("role", roles));
		criteria.setMaxResults(1);
		List<InventoryStore> list = criteria.list();
		return CollectionUtils.isEmpty(list) ? null : list.get(0);

	}

	public void deleteStore(InventoryStore store) throws DAOException {
		sessionFactory.getCurrentSession().delete(store);
	}

	@SuppressWarnings("unchecked")
	public List<InventoryStore> listAllInventoryStore() throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				InventoryStore.class);
		List<InventoryStore> list = criteria.list();
		return list;
	}

	public List<InventoryStore> listStoreByMainStore(Integer mainStoreid,
			boolean bothMainStore) throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				InventoryStore.class, "store");
		if (bothMainStore) {
			criteria.add(Restrictions.or(
					Restrictions.eq("store.parent.id", mainStoreid),
					Restrictions.eq("store.id", mainStoreid)));
		} else {
			criteria.add(Restrictions.eq("store.parent.id", mainStoreid));
		}
		List<InventoryStore> l = criteria.list();
		return l;
	}

	/**
	 * ItemCategory
	 */



	/**
	 * ItemSubCategory
	 */

	

	/**
	 * ItemSpecification
	 */

  

	public List<InventoryDrug> listDrug(Integer categoryId, String name,
			int min, int max) throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				InventoryDrug.class, "drug");
		if (StringUtils.isNotBlank(name)) {
			criteria.add(Restrictions.like("drug.name", "%" + name + "%"));
		}
		if (categoryId != null) {
			criteria.add(Restrictions.eq("drug.category.id", categoryId));
		}
		if (max > 0) {
			criteria.setFirstResult(min).setMaxResults(max);
		}
		List<InventoryDrug> l = criteria.list();

		return l;
	}

	public List<InventoryDrug> findDrug(Integer categoryId, String name)
			throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				InventoryDrug.class, "drug");
		if (categoryId != null) {
			criteria.add(Restrictions.eq("drug.category.id", categoryId));
		}
		if (!StringUtils.isBlank(name)) {
			criteria.add(Restrictions.like("drug.name", "%" + name + "%"));
		}
		List<InventoryDrug> l = criteria.list();

		return l;
	}

	public InventoryDrug saveDrug(InventoryDrug drug) throws DAOException {
		return (InventoryDrug) sessionFactory.getCurrentSession().merge(drug);
	}

	public int countListDrug(Integer categoryId, String name)
			throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				InventoryDrug.class, "drug");
		if (!StringUtils.isBlank(name)) {
			criteria.add(Restrictions.like("drug.name", "%" + name + "%"));
		}
		if (categoryId != null) {
			criteria.add(Restrictions.eq("drug.category.id", categoryId));
		}
		Number rs = (Number) criteria.setProjection(Projections.rowCount())
				.uniqueResult();
		return rs != null ? rs.intValue() : 0;
	}

	public int countListDrug(Integer categoryId, Integer unitId,
			Integer formulationId) throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				InventoryDrug.class, "drug");
		if (categoryId != null && categoryId > 0) {
			criteria.add(Restrictions.eq("drug.category.id", categoryId));
		}
		if (unitId != null && unitId > 0) {
			criteria.add(Restrictions.eq("drug.unit.id", unitId));
		}

		if (formulationId != null && formulationId > 0) {
			criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
					.createCriteria("drug.formulations", Criteria.LEFT_JOIN)
					.add(Restrictions.eq("id", formulationId));
		}

		// .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
		Number rs = (Number) criteria.setProjection(Projections.rowCount())
				.uniqueResult();
		return rs != null ? rs.intValue() : 0;
	}

	public InventoryDrug getDrugById(Integer id) throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession()
				.createCriteria(InventoryDrug.class, "drug")
				.add(Restrictions.eq("drug.id", id));
		return (InventoryDrug) criteria.uniqueResult();
	}

	public InventoryDrug getDrugByName(String name) throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession()
				.createCriteria(InventoryDrug.class, "drug")
				.add(Restrictions.eq("drug.name", name));
		return (InventoryDrug) criteria.uniqueResult();
	}

	public void deleteDrug(InventoryDrug drug) throws DAOException {
		sessionFactory.getCurrentSession().delete(drug);
	}

	/**
	 * Implement for InventoryDAO interface - Get All Drugs (Order with
	 * drug.name)
	 * 
	 * @support feature#174
	 * @author Thai Chuong
	 * @date <dd/mm/yyyy>08/05/2012
	 * @return List <InventoryDrug>
	 * @throws DAOException
	 */
	public List<InventoryDrug> getAllDrug() throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession()
				.createCriteria(InventoryDrug.class, "drug")
				.addOrder(Order.asc("drug.name"));

		List<InventoryDrug> l = criteria.list();

		return l;
	}

	/**
	 * DrugCategory
	 */

	public List<InventoryDrugCategory> listDrugCategory(String name, int min,
			int max) throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				InventoryDrugCategory.class, "drugCategory");
		if (!StringUtils.isBlank(name)) {
			criteria.add(Restrictions.like("drugCategory.name", "%" + name
					+ "%"));
		}
		if (max > 0) {
			criteria.setFirstResult(min).setMaxResults(max);
		}
		List<InventoryDrugCategory> l = criteria.list();

		return l;
	}

	public List<InventoryDrugCategory> findDrugCategory(String name)
			throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				InventoryDrugCategory.class, "drugCategory");
		if (!StringUtils.isBlank(name)) {
			criteria.add(Restrictions.like("drugCategory.name", "%" + name
					+ "%"));
		}
		List<InventoryDrugCategory> l = criteria.list();

		return l;
	}

	public InventoryDrugCategory saveDrugCategory(
			InventoryDrugCategory drugCategory) throws DAOException {
		return (InventoryDrugCategory) sessionFactory.getCurrentSession()
				.merge(drugCategory);
	}

	public int countListDrugCategory(String name) throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				InventoryDrugCategory.class, "drugCategory");
		if (!StringUtils.isBlank(name)) {
			criteria.add(Restrictions.like("drugCategory.name", "%" + name
					+ "%"));
		}
		Number rs = (Number) criteria.setProjection(Projections.rowCount())
				.uniqueResult();
		return rs != null ? rs.intValue() : 0;
	}

	public InventoryDrugCategory getDrugCategoryById(Integer id)
			throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession()
				.createCriteria(InventoryDrugCategory.class, "drugCategory")
				.add(Restrictions.eq("drugCategory.id", id));
		return (InventoryDrugCategory) criteria.uniqueResult();
	}

	public InventoryDrugCategory getDrugCategoryByName(String name)
			throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession()
				.createCriteria(InventoryDrugCategory.class, "drugCategory")
				.add(Restrictions.eq("drugCategory.name", name));
		return (InventoryDrugCategory) criteria.uniqueResult();
	}

	public void deleteDrugCategory(InventoryDrugCategory drugCategory)
			throws DAOException {
		sessionFactory.getCurrentSession().delete(drugCategory);
	}

	/**
	 * DrugFormulation
	 */

	public List<InventoryDrugFormulation> listDrugFormulation(String name,
			int min, int max) throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				InventoryDrugFormulation.class, "drugFormulation");
		if (!StringUtils.isBlank(name)) {
			criteria.add(Restrictions.like("drugFormulation.name", "%" + name
					+ "%"));
		}
		criteria.setFirstResult(min).setMaxResults(max);
		List<InventoryDrugFormulation> l = criteria.list();

		return l;
	}

	public List<InventoryDrugFormulation> findDrugFormulation(String name)
			throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				InventoryDrugFormulation.class, "drugFormulation");
		if (!StringUtils.isBlank(name)) {
			criteria.add(Restrictions.eq("drugFormulation.name", "%" + name
					+ "%"));
		}
		List<InventoryDrugFormulation> l = criteria.list();

		return l;
	}

	public InventoryDrugFormulation saveDrugFormulation(
			InventoryDrugFormulation drugFormulation) throws DAOException {
		return (InventoryDrugFormulation) sessionFactory.getCurrentSession()
				.merge(drugFormulation);
	}

	public int countListDrugFormulation(String name) throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				InventoryDrugFormulation.class, "drugFormulation");
		if (!StringUtils.isBlank(name)) {
			criteria.add(Restrictions.like("drugFormulation.name", "%" + name
					+ "%"));
		}
		Number rs = (Number) criteria.setProjection(Projections.rowCount())
				.uniqueResult();
		return rs != null ? rs.intValue() : 0;
	}

	public InventoryDrugFormulation getDrugFormulationById(Integer id)
			throws DAOException {
		Criteria criteria = sessionFactory
				.getCurrentSession()
				.createCriteria(InventoryDrugFormulation.class,
						"drugFormulation")
				.add(Restrictions.eq("drugFormulation.id", id));
		return (InventoryDrugFormulation) criteria.uniqueResult();
	}

	public InventoryDrugFormulation getDrugFormulationByName(String name)
			throws DAOException {
		Criteria criteria = sessionFactory
				.getCurrentSession()
				.createCriteria(InventoryDrugFormulation.class,
						"drugFormulation")
				.add(Restrictions.eq("drugFormulation.name", name));
		return (InventoryDrugFormulation) criteria.uniqueResult();
	}

	public InventoryDrugFormulation getDrugFormulation(String name,
			String dozage) throws DAOException {
		Criteria criteria = sessionFactory
				.getCurrentSession()
				.createCriteria(InventoryDrugFormulation.class,
						"drugFormulation")
				.add(Restrictions.eq("drugFormulation.dozage", dozage))
				.add(Restrictions.eq("drugFormulation.name", name));
		return (InventoryDrugFormulation) criteria.uniqueResult();
	}

	public void deleteDrugFormulation(InventoryDrugFormulation drugFormulation)
			throws DAOException {
		sessionFactory.getCurrentSession().delete(drugFormulation);
	}

	/**
	 * DrugUnit
	 */

	public List<InventoryDrugUnit> listDrugUnit(String name, int min, int max)
			throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				InventoryDrugUnit.class, "drugUnit");
		if (StringUtils.isNotBlank(name)) {
			criteria.add(Restrictions.like("drugUnit.name", "%" + name + "%"));
		}
		if (max > 0) {
			criteria.setFirstResult(min).setMaxResults(max);
		}
		List<InventoryDrugUnit> l = criteria.list();
		return l;
	}

	public List<InventoryDrugUnit> findDrugUnit(String name)
			throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				InventoryDrugUnit.class, "drugUnit");
		if (StringUtils.isNotBlank(name)) {
			criteria.add(Restrictions.like("drugUnit.name", "%" + name + "%"));
		}
		List<InventoryDrugUnit> l = criteria.list();

		return l;
	}

	public InventoryDrugUnit saveDrugUnit(InventoryDrugUnit drugUnit)
			throws DAOException {
		return (InventoryDrugUnit) sessionFactory.getCurrentSession().merge(
				drugUnit);
	}

	public int countListDrugUnit(String name) throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				InventoryDrugUnit.class, "drugUnit");
		if (StringUtils.isNotBlank(name)) {
			criteria.add(Restrictions.like("drugUnit.name", "%" + name + "%"));
		}
		Number rs = (Number) criteria.setProjection(Projections.rowCount())
				.uniqueResult();
		return rs != null ? rs.intValue() : 0;
	}

	public InventoryDrugUnit getDrugUnitById(Integer id) throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				InventoryDrugUnit.class, "drugUnit");
		criteria.add(Restrictions.eq("drugUnit.id", id));
		return (InventoryDrugUnit) criteria.uniqueResult();
	}

	public InventoryDrugUnit getDrugUnitByName(String name) throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				InventoryDrugUnit.class, "drugUnit");
		criteria.add(Restrictions.eq("drugUnit.name", name));
		return (InventoryDrugUnit) criteria.uniqueResult();
	}

	/**
	 * StoreDrug
	 */

	  
	public List<InventoryStoreDrugTransaction> listStoreDrugTransaction(
			Integer transactionType, Integer storeId, String description,
			String fromDate, String toDate, int min, int max)
			throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				InventoryStoreDrugTransaction.class);
		if (storeId != null) {
			criteria.add(Restrictions.eq("store.id", storeId));
		}
		if (!StringUtils.isBlank(description)) {
			criteria.add(Restrictions.like("description", "%" + description
					+ "%"));
		}
		if (transactionType != null) {
			criteria.add(Restrictions.eq("typeTransaction", transactionType));
		}
		if (!StringUtils.isBlank(fromDate) && StringUtils.isBlank(toDate)) {
			String startFromDate = fromDate + " 00:00:00";
			String endFromDate = fromDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(
						Restrictions.ge("createdOn",
								formatter.parse(startFromDate)),
						Restrictions.le("createdOn",
								formatter.parse(endFromDate))));
			} catch (Exception e) {
				// TODO: handle exception
				// System.out.println("Error convert date: "+ e.toString());
				e.printStackTrace();
			}
		} else if (StringUtils.isBlank(fromDate)
				&& !StringUtils.isBlank(toDate)) {
			String startToDate = toDate + " 00:00:00";
			String endToDate = toDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(Restrictions.ge("createdOn",
						formatter.parse(startToDate)), Restrictions.le(
						"createdOn", formatter.parse(endToDate))));
			} catch (Exception e) {
				// TODO: handle exception
				// System.out.println("Error convert date: "+ e.toString());
				e.printStackTrace();
			}
		} else if (!StringUtils.isBlank(fromDate)
				&& !StringUtils.isBlank(toDate)) {
			String startToDate = fromDate + " 00:00:00";
			String endToDate = toDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(Restrictions.ge("createdOn",
						formatter.parse(startToDate)), Restrictions.le(
						"createdOn", formatter.parse(endToDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("Error convert date: " + e.toString());
				e.printStackTrace();
			}
		}
		if (max > 0) {
			criteria.setFirstResult(min).setMaxResults(max);
		}
		criteria.addOrder(Order.desc("createdOn"));
		List<InventoryStoreDrugTransaction> l = criteria.list();

		return l;
	}

	public List<InventoryStoreDrugTransaction> listStoreDrugTransaction(
			Integer transactionType, Integer storeId, String description,
			String fromDate, String toDate) throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				InventoryStoreDrugTransaction.class);
		if (storeId != null) {
			criteria.add(Restrictions.eq("store.id", storeId));
		}
		if (!StringUtils.isBlank(description)) {
			criteria.add(Restrictions.like("description", "%" + description
					+ "%"));
		}
		if (transactionType != null) {
			criteria.add(Restrictions.eq("typeTransaction", transactionType));
		}
		if (!StringUtils.isBlank(fromDate) && StringUtils.isBlank(toDate)) {
			String startFromDate = fromDate + " 00:00:00";
			String endFromDate = fromDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(
						Restrictions.ge("createdOn",
								formatter.parse(startFromDate)),
						Restrictions.le("createdOn",
								formatter.parse(endFromDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("Error convert date: " + e.toString());
				e.printStackTrace();
			}
		} else if (StringUtils.isBlank(fromDate)
				&& !StringUtils.isBlank(toDate)) {
			String startToDate = toDate + " 00:00:00";
			String endToDate = toDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(Restrictions.ge("createdOn",
						formatter.parse(startToDate)), Restrictions.le(
						"createdOn", formatter.parse(endToDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("Error convert date: " + e.toString());
				e.printStackTrace();
			}
		} else if (!StringUtils.isBlank(fromDate)
				&& !StringUtils.isBlank(toDate)) {
			String startToDate = fromDate + " 00:00:00";
			String endToDate = toDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(Restrictions.ge("createdOn",
						formatter.parse(startToDate)), Restrictions.le(
						"createdOn", formatter.parse(endToDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("Error convert date: " + e.toString());
				e.printStackTrace();
			}
		}
		List<InventoryStoreDrugTransaction> l = criteria.list();

		return l;
	}

	public InventoryStoreDrugTransaction saveStoreDrugTransaction(
			InventoryStoreDrugTransaction storeTransaction) throws DAOException {
		return (InventoryStoreDrugTransaction) sessionFactory
				.getCurrentSession().merge(storeTransaction);
	}

	public int countStoreDrugTransaction(Integer transactionType,
			Integer storeId, String description, String fromDate, String toDate)
			throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				InventoryStoreDrugTransaction.class);
		if (storeId != null) {
			criteria.add(Restrictions.eq("store.id", storeId));
		}
		if (!StringUtils.isBlank(description)) {
			criteria.add(Restrictions.like("description", "%" + description
					+ "%"));
		}
		if (transactionType != null) {
			criteria.add(Restrictions.eq("typeTransaction", transactionType));
		}
		if (!StringUtils.isBlank(fromDate) && StringUtils.isBlank(toDate)) {
			String startFromDate = fromDate + " 00:00:00";
			String endFromDate = fromDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(
						Restrictions.ge("createdOn",
								formatter.parse(startFromDate)),
						Restrictions.le("createdOn",
								formatter.parse(endFromDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("Error convert date: " + e.toString());
				e.printStackTrace();
			}
		} else if (StringUtils.isBlank(fromDate)
				&& !StringUtils.isBlank(toDate)) {
			String startToDate = toDate + " 00:00:00";
			String endToDate = toDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(Restrictions.ge("createdOn",
						formatter.parse(startToDate)), Restrictions.le(
						"createdOn", formatter.parse(endToDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("Error convert date: " + e.toString());
				e.printStackTrace();
			}
		} else if (!StringUtils.isBlank(fromDate)
				&& !StringUtils.isBlank(toDate)) {
			String startToDate = fromDate + " 00:00:00";
			String endToDate = toDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(Restrictions.ge("createdOn",
						formatter.parse(startToDate)), Restrictions.le(
						"createdOn", formatter.parse(endToDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("Error convert date: " + e.toString());
				e.printStackTrace();
			}
		}
		Number rs = (Number) criteria.setProjection(Projections.rowCount())
				.uniqueResult();
		return rs != null ? rs.intValue() : 0;
	}

	public InventoryStoreDrugTransaction getStoreDrugTransactionById(Integer id)
			throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				InventoryStoreDrugTransaction.class, "storeDrugTransaction");
		criteria.add(Restrictions.eq("storeDrugTransaction.id", id));
		return (InventoryStoreDrugTransaction) criteria.uniqueResult();
	}

	public InventoryStoreDrugTransaction getStoreDrugTransactionByParentId(
			Integer parentId) throws DAOException {
		Criteria criteria = sessionFactory
				.getCurrentSession()
				.createCriteria(InventoryStoreDrugTransaction.class,
						"storeDrugTransaction")
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
				.createAlias("storeDrugTransaction.parent", "parent");
		criteria.add(Restrictions.eq("parent.id", parentId));
		return (InventoryStoreDrugTransaction) criteria.uniqueResult();
	}

	/**
	 * StoreDrugTransactionDetail
	 */

	public List<InventoryStoreDrugTransactionDetail> listStoreDrugTransactionDetail(
			Integer storeId, Integer categoryId, String drugName,
			String formulationName, String fromDate, String toDate, int min,
			int max) throws DAOException {
		Criteria criteria = sessionFactory
				.getCurrentSession()
				.createCriteria(InventoryStoreDrugTransactionDetail.class,
						"transactionDetail")
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
				.createAlias("transactionDetail.transaction", "transaction")
				.createAlias("transactionDetail.drug", "drug")
				.createAlias("transactionDetail.formulation", "formulation");
		criteria.add(Restrictions.eq("transaction.typeTransaction",
				ActionValue.TRANSACTION[0]));
		if (storeId != null) {
			criteria.add(Restrictions.eq("transaction.store.id", storeId));
		}
		if (categoryId != null) {
			criteria.add(Restrictions.eq("drug.category.id", categoryId));
		}
		if (!StringUtils.isBlank(drugName)) {
			criteria.add(Restrictions.like("drug.name", "%" + drugName + "%"));
		}
		if (!StringUtils.isBlank(formulationName)) {
			criteria.add(Restrictions.like("formulation.name", "%"
					+ formulationName + "%"));
		}
		if (!StringUtils.isBlank(fromDate) && StringUtils.isBlank(toDate)) {
			String startFromDate = fromDate + " 00:00:00";
			String endFromDate = fromDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(
						Restrictions.ge("transaction.createdOn",
								formatter.parse(startFromDate)),
						Restrictions.le("transaction.createdOn",
								formatter.parse(endFromDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out
						.println("listInventoryStoreTransactionItemType1>>Error convert date: "
								+ e.toString());
				e.printStackTrace();
			}
		} else if (StringUtils.isBlank(fromDate)
				&& !StringUtils.isBlank(toDate)) {
			String startToDate = toDate + " 00:00:00";
			String endToDate = toDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(
						Restrictions.ge("transaction.createdOn",
								formatter.parse(startToDate)),
						Restrictions.le("transaction.createdOn",
								formatter.parse(endToDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out
						.println("listInventoryStoreTransactionItemType2>>Error convert date: "
								+ e.toString());
				e.printStackTrace();
			}
		} else if (!StringUtils.isBlank(fromDate)
				&& !StringUtils.isBlank(toDate)) {
			String startToDate = fromDate + " 00:00:00";
			String endToDate = toDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(
						Restrictions.ge("transaction.createdOn",
								formatter.parse(startToDate)),
						Restrictions.le("transaction.createdOn",
								formatter.parse(endToDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out
						.println("listInventoryStoreTransactionItemType3>>Error convert date: "
								+ e.toString());
				e.printStackTrace();
			}
		}
		if (max > 0) {
			criteria.setFirstResult(min).setMaxResults(max);
		}
		List<InventoryStoreDrugTransactionDetail> l = criteria.list();

		return l;
	}

 

	public InventoryStoreDrugTransactionDetail saveStoreDrugTransactionDetail(
			InventoryStoreDrugTransactionDetail storeTransactionDetail)
			throws DAOException {
		return (InventoryStoreDrugTransactionDetail) sessionFactory
				.getCurrentSession().merge(storeTransactionDetail);
	}

	public int countStoreDrugTransactionDetail(Integer storeId,
			Integer categoryId, String drugName, String formulationName,
			String fromDate, String toDate) throws DAOException {
		Criteria criteria = sessionFactory
				.getCurrentSession()
				.createCriteria(InventoryStoreDrugTransactionDetail.class,
						"transactionDetail")
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
				.createAlias("transactionDetail.transaction", "transaction")
				.createAlias("transactionDetail.drug", "drug")
				.createAlias("transactionDetail.formulation", "formulation");
		criteria.add(Restrictions.eq("transaction.typeTransaction",
				ActionValue.TRANSACTION[0]));
		if (storeId != null) {
			criteria.add(Restrictions.eq("transaction.store.id", storeId));
		}
		if (categoryId != null) {
			criteria.add(Restrictions.eq("drug.category.id", categoryId));
		}
		if (!StringUtils.isBlank(drugName)) {
			criteria.add(Restrictions.like("drug.name", "%" + drugName + "%"));
		}
		if (!StringUtils.isBlank(formulationName)) {
			criteria.add(Restrictions.like("formulation.name", "%"
					+ formulationName + "%"));
		}
		if (!StringUtils.isBlank(fromDate) && StringUtils.isBlank(toDate)) {
			String startFromDate = fromDate + " 00:00:00";
			String endFromDate = fromDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(
						Restrictions.ge("transaction.createdOn",
								formatter.parse(startFromDate)),
						Restrictions.le("transaction.createdOn",
								formatter.parse(endFromDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out
						.println("listInventoryStoreTransactionItemType1>>Error convert date: "
								+ e.toString());
				e.printStackTrace();
			}
		} else if (StringUtils.isBlank(fromDate)
				&& !StringUtils.isBlank(toDate)) {
			String startToDate = toDate + " 00:00:00";
			String endToDate = toDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(
						Restrictions.ge("transaction.createdOn",
								formatter.parse(startToDate)),
						Restrictions.le("transaction.createdOn",
								formatter.parse(endToDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out
						.println("listInventoryStoreTransactionItemType2>>Error convert date: "
								+ e.toString());
				e.printStackTrace();
			}
		} else if (!StringUtils.isBlank(fromDate)
				&& !StringUtils.isBlank(toDate)) {
			String startToDate = fromDate + " 00:00:00";
			String endToDate = toDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(
						Restrictions.ge("transaction.createdOn",
								formatter.parse(startToDate)),
						Restrictions.le("transaction.createdOn",
								formatter.parse(endToDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out
						.println("listInventoryStoreTransactionItemType3>>Error convert date: "
								+ e.toString());
				e.printStackTrace();
			}
		}
		Number rs = (Number) criteria.setProjection(Projections.rowCount())
				.uniqueResult();
		return rs != null ? rs.intValue() : 0;
	}

	public InventoryStoreDrugTransactionDetail getStoreDrugTransactionDetailById(
			Integer id) throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				InventoryStoreDrugTransactionDetail.class, "transactionDetail");
		criteria.add(Restrictions.eq("transactionDetail.id", id));
		return (InventoryStoreDrugTransactionDetail) criteria.uniqueResult();
	}

	public List<InventoryStoreDrugTransactionDetail> listStoreDrugTransactionDetail(
			Integer storeId, Integer drugId, Integer formulationId,
			boolean haveQuantity) throws DAOException {
		Criteria criteria = sessionFactory
				.getCurrentSession()
				.createCriteria(InventoryStoreDrugTransactionDetail.class,
						"transactionDetail")
				.createAlias("transactionDetail.transaction", "transaction")
				.add(Restrictions.eq("transaction.store.id", storeId))
				.add(Restrictions.eq("transactionDetail.drug.id", drugId))
				.add(Restrictions.eq("transactionDetail.formulation.id",
						formulationId))
				.add(Restrictions.eq("transaction.typeTransaction",
						ActionValue.TRANSACTION[0]));

		String date = formatterExt.format(new Date());
		String startFromDate = date + " 00:00:00";

		if (haveQuantity) {
			criteria.add(Restrictions
					.gt("transactionDetail.currentQuantity", 0));
			try {
				criteria.add(Restrictions.ge("transactionDetail.dateExpiry",
						formatter.parse(startFromDate)));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		criteria.addOrder(Order.asc("transactionDetail.dateExpiry"));
		List<InventoryStoreDrugTransactionDetail> l = criteria.list();
		return l;
	}

	public List<InventoryStoreDrugTransactionDetail> listStoreDrugTransactionDetail(
			Integer storeId, Integer drugId, Integer formulationId,
			Integer isExpiry) throws DAOException {
		Criteria criteria = sessionFactory
				.getCurrentSession()
				.createCriteria(InventoryStoreDrugTransactionDetail.class,
						"transactionDetail")
				.createAlias("transactionDetail.transaction", "transaction")
				.add(Restrictions.eq("transaction.store.id", storeId))
				.add(Restrictions.eq("transactionDetail.drug.id", drugId))
				.add(Restrictions.eq("transactionDetail.formulation.id",
						formulationId));
		criteria.addOrder(Order.desc("transactionDetail.createdOn"));
		if (isExpiry != null && isExpiry == 1) {
			criteria.add(Restrictions.lt("transactionDetail.dateExpiry",
					new Date()));
		} else {
			criteria.add(Restrictions.ge("transactionDetail.dateExpiry",
					new Date()));
		}
		List<InventoryStoreDrugTransactionDetail> l = criteria.list();
		return l;
	}

	public Integer sumCurrentQuantityDrugOfStore(Integer storeId,
			Integer drugId, Integer formulationId) throws DAOException {
		Criteria criteria = sessionFactory
				.getCurrentSession()
				.createCriteria(InventoryStoreDrugTransactionDetail.class,
						"transactionDetail")
				.createAlias("transactionDetail.transaction", "transaction")
				.add(Restrictions.eq("transaction.store.id", storeId))
				.add(Restrictions.eq("transaction.typeTransaction",
						ActionValue.TRANSACTION[0]))
				.add(Restrictions.eq("transactionDetail.drug.id", drugId))
				.add(Restrictions.eq("transactionDetail.formulation.id",
						formulationId));

		criteria.add(Restrictions.gt("transactionDetail.currentQuantity", 0));
		criteria.add(Restrictions
				.gt("transactionDetail.dateExpiry", new Date()));
		ProjectionList proList = Projections.projectionList();
		proList.add(Projections.sum("currentQuantity"));
		criteria.setProjection(proList);
		Object l = criteria.uniqueResult();
		return l != null ? (Integer) l : 0;
	}

	public List<InventoryStoreDrugTransactionDetail> listStoreDrugAvaiable(
			Integer storeId, Collection<Integer> drugs,
			Collection<Integer> formulations) throws DAOException {
		Criteria criteria = sessionFactory
				.getCurrentSession()
				.createCriteria(InventoryStoreDrugTransactionDetail.class,
						"transactionDetail")
				.createAlias("transactionDetail.transaction", "transaction")
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);

		ProjectionList proList = Projections.projectionList();
		proList.add(Projections.groupProperty("drug"))
				.add(Projections.groupProperty("formulation"))
				.add(Projections.sum("currentQuantity"));
		criteria.add(Restrictions.eq("transaction.store.id", storeId));
		if (drugs != null) {
			criteria.createCriteria("transactionDetail.drug",
					Criteria.INNER_JOIN).add(Restrictions.in("id", drugs));
		}
		criteria.add(Restrictions.eq("transaction.typeTransaction",
				ActionValue.TRANSACTION[0]));
		if (formulations != null) {
			criteria.createCriteria("transactionDetail.formulation",
					Criteria.INNER_JOIN).add(
					Restrictions.in("id", formulations));
		}
		criteria.setProjection(proList);
		criteria.add(Restrictions
				.ge("transactionDetail.dateExpiry", new Date()));
		List<Object> lst = criteria.list();
		if (lst == null || lst.size() == 0)
			return null;
		List<InventoryStoreDrugTransactionDetail> list = new ArrayList<InventoryStoreDrugTransactionDetail>();
		// System.out.println("lst size: "+lst.size());
		for (int i = 0; i < lst.size(); i++) {
			Object[] row = (Object[]) lst.get(i);
			InventoryStoreDrugTransactionDetail tDetail = new InventoryStoreDrugTransactionDetail();
			tDetail.setDrug((InventoryDrug) row[0]);
			tDetail.setFormulation((InventoryDrugFormulation) row[1]);
			tDetail.setCurrentQuantity((Integer) row[2]);
			list.add(tDetail);
			// System.out.println("I: "+i+" drug: "+tDetail.getDrug().getName()+" formulation: "+tDetail.getFormulation().getName()+" quantity: "+tDetail.getCurrentQuantity());
		}
		return list;
	}

	public List<InventoryStoreDrugTransactionDetail> listViewStockBalance(
			Integer storeId, Integer categoryId, String drugName,
			String fromDate, String toDate, boolean isExpiry, int min, int max)
			throws DAOException {
		Criteria criteria = sessionFactory
				.getCurrentSession()
				.createCriteria(InventoryStoreDrugTransactionDetail.class,
						"transactionDetail")
				.createAlias("transactionDetail.transaction", "transaction")
				.createAlias("transactionDetail.drug", "drugAlias")
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);

		ProjectionList proList = Projections.projectionList();
		proList.add(Projections.groupProperty("drug"))
				.add(Projections.groupProperty("formulation"))
				.add(Projections.sum("currentQuantity"))
				.add(Projections.sum("quantity"))
				.add(Projections.sum("issueQuantity"));
		criteria.add(Restrictions.eq("transaction.store.id", storeId));
		if (categoryId != null) {
			criteria.add(Restrictions.eq("drugAlias.category.id", categoryId));
		}
		if (!StringUtils.isBlank(drugName)) {
			criteria.add(Restrictions.like("drugAlias.name", "%" + drugName
					+ "%"));
		}
		if (!StringUtils.isBlank(fromDate) && StringUtils.isBlank(toDate)) {
			String startFromDate = fromDate + " 00:00:00";
			String endFromDate = fromDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(Restrictions.ge(
						"transactionDetail.createdOn",
						formatter.parse(startFromDate)), Restrictions.le(
						"transactionDetail.createdOn",
						formatter.parse(endFromDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("listSubStoreIndent>>Error convert date: "
						+ e.toString());
				e.printStackTrace();
			}
		} else if (StringUtils.isBlank(fromDate)
				&& !StringUtils.isBlank(toDate)) {
			String startToDate = toDate + " 00:00:00";
			String endToDate = toDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(Restrictions.ge(
						"transactionDetail.createdOn",
						formatter.parse(startToDate)), Restrictions.le(
						"transactionDetail.createdOn",
						formatter.parse(endToDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("listSubStoreIndent>>Error convert date: "
						+ e.toString());
				e.printStackTrace();
			}
		} else if (!StringUtils.isBlank(fromDate)
				&& !StringUtils.isBlank(toDate)) {
			String startToDate = fromDate + " 00:00:00";
			String endToDate = toDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(Restrictions.ge(
						"transactionDetail.createdOn",
						formatter.parse(startToDate)), Restrictions.le(
						"transactionDetail.createdOn",
						formatter.parse(endToDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out
						.println("listInventorySubStoreIndent>>Error convert date: "
								+ e.toString());
				e.printStackTrace();
			}
		}
		if (isExpiry) {
			criteria.add(Restrictions.lt("transactionDetail.dateExpiry",
					new Date()));
		} else {
			criteria.add(Restrictions.ge("transactionDetail.dateExpiry",
					new Date()));
		}

		/*
		 * Sagar Bele : 13-08-2012 Bug #330 ( [INVENTORY]-error in Current
		 * quantity of pharmacy )
		 */
		criteria.add(Restrictions.ge("transactionDetail.currentQuantity", 0));

		criteria.setProjection(proList);
		if (max > 0) {
			criteria.setFirstResult(min).setMaxResults(max);
		}
		List<Object> lst = criteria.list();
		if (lst == null || lst.size() == 0)
			return null;
		List<InventoryStoreDrugTransactionDetail> list = new ArrayList<InventoryStoreDrugTransactionDetail>();
		for (int i = 0; i < lst.size(); i++) {
			Object[] row = (Object[]) lst.get(i);
			InventoryStoreDrugTransactionDetail tDetail = new InventoryStoreDrugTransactionDetail();
			tDetail.setDrug((InventoryDrug) row[0]);
			tDetail.setFormulation((InventoryDrugFormulation) row[1]);
			tDetail.setCurrentQuantity((Integer) row[2]);
			tDetail.setQuantity((Integer) row[3]);
			tDetail.setIssueQuantity((Integer) row[4]);
			list.add(tDetail);
		}

		return list;
	}

	public Integer countViewStockBalance(Integer storeId, Integer categoryId,
			String drugName, String fromDate, String toDate, boolean isExpiry)
			throws DAOException {
		Criteria criteria = sessionFactory
				.getCurrentSession()
				.createCriteria(InventoryStoreDrugTransactionDetail.class,
						"transactionDetail")
				.createAlias("transactionDetail.transaction", "transaction")
				.createAlias("transactionDetail.drug", "drugAlias");

		ProjectionList proList = Projections.projectionList();
		proList.add(Projections.groupProperty("drug"))
				.add(Projections.groupProperty("formulation"))
				.add(Projections.sum("currentQuantity"))
				.add(Projections.sum("quantity"))
				.add(Projections.sum("issueQuantity"));
		criteria.add(Restrictions.eq("transaction.store.id", storeId));
		if (categoryId != null) {
			criteria.add(Restrictions.eq("drugAlias.category.id", categoryId));
		}
		if (!StringUtils.isBlank(drugName)) {
			criteria.add(Restrictions.like("drugAlias.name", "%" + drugName
					+ "%"));
		}
		if (!StringUtils.isBlank(fromDate) && StringUtils.isBlank(toDate)) {
			String startFromDate = fromDate + " 00:00:00";
			String endFromDate = fromDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(Restrictions.ge(
						"transactionDetail.createdOn",
						formatter.parse(startFromDate)), Restrictions.le(
						"transactionDetail.createdOn",
						formatter.parse(endFromDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("listSubStoreIndent>>Error convert date: "
						+ e.toString());
				e.printStackTrace();
			}
		} else if (StringUtils.isBlank(fromDate)
				&& !StringUtils.isBlank(toDate)) {
			String startToDate = toDate + " 00:00:00";
			String endToDate = toDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(Restrictions.ge(
						"transactionDetail.createdOn",
						formatter.parse(startToDate)), Restrictions.le(
						"transactionDetail.createdOn",
						formatter.parse(endToDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("listSubStoreIndent>>Error convert date: "
						+ e.toString());
				e.printStackTrace();
			}
		} else if (!StringUtils.isBlank(fromDate)
				&& !StringUtils.isBlank(toDate)) {
			String startToDate = fromDate + " 00:00:00";
			String endToDate = toDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(Restrictions.ge(
						"transactionDetail.createdOn",
						formatter.parse(startToDate)), Restrictions.le(
						"transactionDetail.createdOn",
						formatter.parse(endToDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out
						.println("listInventorySubStoreIndent>>Error convert date: "
								+ e.toString());
				e.printStackTrace();
			}
		}
		if (isExpiry) {
			criteria.add(Restrictions.lt("transactionDetail.dateExpiry",
					new Date()));
		} else {
			criteria.add(Restrictions.ge("transactionDetail.dateExpiry",
					new Date()));
		}
		criteria.setProjection(proList);
		List<Object> list = criteria.list();
		Number total = 0;
		if (!CollectionUtils.isEmpty(list)) {
			total = (Number) list.size();
		}
		return total.intValue();
	}

	public int checkExistDrugTransactionDetail(Integer drugId)
			throws DAOException {
		Criteria criteria = sessionFactory
				.getCurrentSession()
				.createCriteria(InventoryStoreDrugTransactionDetail.class,
						"transactionDetail")
				.add(Restrictions.eq("transactionDetail.drug.id", drugId));
		Number rs = (Number) criteria.setProjection(Projections.rowCount())
				.uniqueResult();
		return rs != null ? rs.intValue() : 0;
	}

	/**
	 * InventoryStoreDrugIndent
	 */

	public List<InventoryStoreDrugIndent> listSubStoreIndent(Integer storeId,
			String name, Integer status, String fromDate, String toDate,
			int min, int max) throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession()
				.createCriteria(InventoryStoreDrugIndent.class, "indent")
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
				.createAlias("indent.store", "store");
		criteria.add(Restrictions.eq("store.id", storeId));

		if (status != null) {
			criteria.add(Restrictions.eq("indent.subStoreStatus", status));
		}
		if (!StringUtils.isBlank(name)) {
			criteria.add(Restrictions.like("indent.name", "%" + name + "%"));
		}

		if (!StringUtils.isBlank(fromDate) && StringUtils.isBlank(toDate)) {
			String startFromDate = fromDate + " 00:00:00";
			String endFromDate = fromDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(
						Restrictions.ge("indent.createdOn",
								formatter.parse(startFromDate)),
						Restrictions.le("indent.createdOn",
								formatter.parse(endFromDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("listSubStoreIndent>>Error convert date: "
						+ e.toString());
				e.printStackTrace();
			}
		} else if (StringUtils.isBlank(fromDate)
				&& !StringUtils.isBlank(toDate)) {
			String startToDate = toDate + " 00:00:00";
			String endToDate = toDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(
						Restrictions.ge("indent.createdOn",
								formatter.parse(startToDate)),
						Restrictions.le("indent.createdOn",
								formatter.parse(endToDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("listSubStoreIndent>>Error convert date: "
						+ e.toString());
				e.printStackTrace();
			}
		} else if (!StringUtils.isBlank(fromDate)
				&& !StringUtils.isBlank(toDate)) {
			String startToDate = fromDate + " 00:00:00";
			String endToDate = toDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(
						Restrictions.ge("indent.createdOn",
								formatter.parse(startToDate)),
						Restrictions.le("indent.createdOn",
								formatter.parse(endToDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out
						.println("listInventorySubStoreIndent>>Error convert date: "
								+ e.toString());
				e.printStackTrace();
			}
		}
		criteria.addOrder(Order.desc("indent.createdOn"));
		criteria.setFirstResult(min).setMaxResults(max);
		List<InventoryStoreDrugIndent> l = criteria.list();
		return l;
	}

	public int countSubStoreIndent(Integer storeId, String name,
			Integer status, String fromDate, String toDate) throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession()
				.createCriteria(InventoryStoreDrugIndent.class, "indent")
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
				.setProjection(Projections.rowCount())
				.createAlias("indent.store", "store");
		criteria.add(Restrictions.eq("store.id", storeId));

		if (status != null) {
			criteria.add(Restrictions.eq("indent.subStoreStatus", status));
		}
		if (!StringUtils.isBlank(name)) {
			criteria.add(Restrictions.like("indent.name", "%" + name + "%"));
		}

		if (!StringUtils.isBlank(fromDate) && StringUtils.isBlank(toDate)) {
			String startFromDate = fromDate + " 00:00:00";
			String endFromDate = fromDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(
						Restrictions.ge("indent.createdOn",
								formatter.parse(startFromDate)),
						Restrictions.le("indent.createdOn",
								formatter.parse(endFromDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("listSubStoreIndent>>Error convert date: "
						+ e.toString());
				e.printStackTrace();
			}
		} else if (StringUtils.isBlank(fromDate)
				&& !StringUtils.isBlank(toDate)) {
			String startToDate = toDate + " 00:00:00";
			String endToDate = toDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(
						Restrictions.ge("indent.createdOn",
								formatter.parse(startToDate)),
						Restrictions.le("indent.createdOn",
								formatter.parse(endToDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("listSubStoreIndent>>Error convert date: "
						+ e.toString());
				e.printStackTrace();
			}
		} else if (!StringUtils.isBlank(fromDate)
				&& !StringUtils.isBlank(toDate)) {
			String startToDate = fromDate + " 00:00:00";
			String endToDate = toDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(
						Restrictions.ge("indent.createdOn",
								formatter.parse(startToDate)),
						Restrictions.le("indent.createdOn",
								formatter.parse(endToDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out
						.println("listInventorySubStoreIndent>>Error convert date: "
								+ e.toString());
				e.printStackTrace();
			}
		}
		Number rs = (Number) criteria.uniqueResult();
		return rs != null ? rs.intValue() : 0;
	}

	public List<InventoryStoreDrugIndent> listMainStoreIndent(Integer id,
			Integer mainStoreId, Integer subStoreId, String name,
			Integer status, String fromDate, String toDate, int min, int max)
			throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession()
				.createCriteria(InventoryStoreDrugIndent.class, "indent")
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
				.createAlias("indent.store", "store");

		criteria.add(Restrictions.eq("store.parent.id", mainStoreId));

		if (subStoreId != null) {

			criteria.add(Restrictions.eq("store.id", subStoreId));
		}

		if (id != null && id > 0) {

			criteria.add(Restrictions.eq("indent.id", id));
		}

		criteria.add(Restrictions.ge("indent.subStoreStatus",
				ActionValue.INDENT_SUBSTORE[1]));
		if (status != null) {
			criteria.add(Restrictions.eq("indent.mainStoreStatus", status));
		}
		if (!StringUtils.isBlank(name)) {
			criteria.add(Restrictions.like("indent.name", "%" + name + "%"));
		}

		if (!StringUtils.isBlank(fromDate) && StringUtils.isBlank(toDate)) {
			String startFromDate = fromDate + " 00:00:00";
			String endFromDate = fromDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(
						Restrictions.ge("indent.createdOn",
								formatter.parse(startFromDate)),
						Restrictions.le("indent.createdOn",
								formatter.parse(endFromDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("listMainStoreIndent>>Error convert date: "
						+ e.toString());
				e.printStackTrace();
			}
		} else if (StringUtils.isBlank(fromDate)
				&& !StringUtils.isBlank(toDate)) {
			String startToDate = toDate + " 00:00:00";
			String endToDate = toDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(
						Restrictions.ge("indent.createdOn",
								formatter.parse(startToDate)),
						Restrictions.le("indent.createdOn",
								formatter.parse(endToDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("listMainStoreIndent>>Error convert date: "
						+ e.toString());
				e.printStackTrace();
			}
		} else if (!StringUtils.isBlank(fromDate)
				&& !StringUtils.isBlank(toDate)) {
			String startToDate = fromDate + " 00:00:00";
			String endToDate = toDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(
						Restrictions.ge("indent.createdOn",
								formatter.parse(startToDate)),
						Restrictions.le("indent.createdOn",
								formatter.parse(endToDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("listMainStoreIndent>>Error convert date: "
						+ e.toString());
				e.printStackTrace();
			}
		}
		criteria.addOrder(Order.desc("indent.createdOn"));
		criteria.setFirstResult(min).setMaxResults(max);
		List<InventoryStoreDrugIndent> l = criteria.list();
		return l;
	}

	public List<InventoryStoreDrugIndent> listStoreDrugIndent(Integer StoreId,
			String name, String fromDate, String toDate, int min, int max)
			throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession()
				.createCriteria(InventoryStoreDrugIndent.class, "indent")
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
				.createAlias("indent.store", "store");

		criteria.add(Restrictions.eq("store.id", StoreId));

		if (!StringUtils.isBlank(name)) {
			criteria.add(Restrictions.like("indent.name", "%" + name + "%"));
		}

		if (!StringUtils.isBlank(fromDate) && StringUtils.isBlank(toDate)) {
			String startFromDate = fromDate + " 00:00:00";
			String endFromDate = fromDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(
						Restrictions.ge("indent.createdOn",
								formatter.parse(startFromDate)),
						Restrictions.le("indent.createdOn",
								formatter.parse(endFromDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("listMainStoreIndent>>Error convert date: "
						+ e.toString());
				e.printStackTrace();
			}
		} else if (StringUtils.isBlank(fromDate)
				&& !StringUtils.isBlank(toDate)) {
			String startToDate = toDate + " 00:00:00";
			String endToDate = toDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(
						Restrictions.ge("indent.createdOn",
								formatter.parse(startToDate)),
						Restrictions.le("indent.createdOn",
								formatter.parse(endToDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("listMainStoreIndent>>Error convert date: "
						+ e.toString());
				e.printStackTrace();
			}
		} else if (!StringUtils.isBlank(fromDate)
				&& !StringUtils.isBlank(toDate)) {
			String startToDate = fromDate + " 00:00:00";
			String endToDate = toDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(
						Restrictions.ge("indent.createdOn",
								formatter.parse(startToDate)),
						Restrictions.le("indent.createdOn",
								formatter.parse(endToDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("listMainStoreIndent>>Error convert date: "
						+ e.toString());
				e.printStackTrace();
			}
		}
		criteria.addOrder(Order.desc("indent.createdOn"));
		criteria.setFirstResult(min).setMaxResults(max);
		List<InventoryStoreDrugIndent> l = criteria.list();
		return l;
	}

	public int countStoreDrugIndent(Integer StoreId, String name,
			String fromDate, String toDate) throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession()
				.createCriteria(InventoryStoreDrugIndent.class, "indent")
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
				.createAlias("indent.store", "store");

		criteria.add(Restrictions.eq("store.id", StoreId));

		if (!StringUtils.isBlank(name)) {
			criteria.add(Restrictions.like("indent.name", "%" + name + "%"));
		}

		if (!StringUtils.isBlank(fromDate) && StringUtils.isBlank(toDate)) {
			String startFromDate = fromDate + " 00:00:00";
			String endFromDate = fromDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(
						Restrictions.ge("indent.createdOn",
								formatter.parse(startFromDate)),
						Restrictions.le("indent.createdOn",
								formatter.parse(endFromDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("listMainStoreIndent>>Error convert date: "
						+ e.toString());
				e.printStackTrace();
			}
		} else if (StringUtils.isBlank(fromDate)
				&& !StringUtils.isBlank(toDate)) {
			String startToDate = toDate + " 00:00:00";
			String endToDate = toDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(
						Restrictions.ge("indent.createdOn",
								formatter.parse(startToDate)),
						Restrictions.le("indent.createdOn",
								formatter.parse(endToDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("listMainStoreIndent>>Error convert date: "
						+ e.toString());
				e.printStackTrace();
			}
		} else if (!StringUtils.isBlank(fromDate)
				&& !StringUtils.isBlank(toDate)) {
			String startToDate = fromDate + " 00:00:00";
			String endToDate = toDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(
						Restrictions.ge("indent.createdOn",
								formatter.parse(startToDate)),
						Restrictions.le("indent.createdOn",
								formatter.parse(endToDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("listMainStoreIndent>>Error convert date: "
						+ e.toString());
				e.printStackTrace();
			}
		}
		Number rs = (Number) criteria.setProjection(Projections.rowCount())
				.uniqueResult();
		return rs != null ? rs.intValue() : 0;
	}

	public int countMainStoreIndent(Integer id, Integer mainStoreId,
			Integer subStoreId, String name, Integer status, String fromDate,
			String toDate) throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession()
				.createCriteria(InventoryStoreDrugIndent.class, "indent")
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
				.createAlias("indent.store", "store");

		criteria.add(Restrictions.eq("store.parent.id", mainStoreId));
		if (id != null && id > 0) {
			criteria.add(Restrictions.eq("indent.id", id));
		}
		if (subStoreId != null) {

			criteria.add(Restrictions.eq("store.id", subStoreId));
		}
		criteria.add(Restrictions.ge("indent.subStoreStatus",
				ActionValue.INDENT_SUBSTORE[1]));
		if (status != null) {
			criteria.add(Restrictions.eq("indent.mainStoreStatus", status));
		}
		if (!StringUtils.isBlank(name)) {
			criteria.add(Restrictions.like("indent.name", "%" + name + "%"));
		}

		if (!StringUtils.isBlank(fromDate) && StringUtils.isBlank(toDate)) {
			String startFromDate = fromDate + " 00:00:00";
			String endFromDate = fromDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(
						Restrictions.ge("indent.createdOn",
								formatter.parse(startFromDate)),
						Restrictions.le("indent.createdOn",
								formatter.parse(endFromDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("listMainStoreIndent>>Error convert date: "
						+ e.toString());
				e.printStackTrace();
			}
		} else if (StringUtils.isBlank(fromDate)
				&& !StringUtils.isBlank(toDate)) {
			String startToDate = toDate + " 00:00:00";
			String endToDate = toDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(
						Restrictions.ge("indent.createdOn",
								formatter.parse(startToDate)),
						Restrictions.le("indent.createdOn",
								formatter.parse(endToDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("listMainStoreIndent>>Error convert date: "
						+ e.toString());
				e.printStackTrace();
			}
		} else if (!StringUtils.isBlank(fromDate)
				&& !StringUtils.isBlank(toDate)) {
			String startToDate = fromDate + " 00:00:00";
			String endToDate = toDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(
						Restrictions.ge("indent.createdOn",
								formatter.parse(startToDate)),
						Restrictions.le("indent.createdOn",
								formatter.parse(endToDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("listMainStoreIndent>>Error convert date: "
						+ e.toString());
				e.printStackTrace();
			}
		}
		Number rs = (Number) criteria.setProjection(Projections.rowCount())
				.uniqueResult();
		// System.out.println("count total transfer: "+rs);
		return rs != null ? rs.intValue() : 0;
	}

	public InventoryStoreDrugIndent saveStoreDrugIndent(
			InventoryStoreDrugIndent storeDrugIndent) throws DAOException {
		return (InventoryStoreDrugIndent) sessionFactory.getCurrentSession()
				.merge(storeDrugIndent);
	}

	public void deleteStoreDrugIndent(InventoryStoreDrugIndent storeDrugIndent)
			throws DAOException {
		sessionFactory.getCurrentSession().delete(storeDrugIndent);
	}

	public InventoryStoreDrugIndent getStoreDrugIndentById(Integer id)
			throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession()
				.createCriteria(InventoryStoreDrugIndent.class, "indent")
				.add(Restrictions.eq("indent.id", id));
		return (InventoryStoreDrugIndent) criteria.uniqueResult();
	}

	 
	public List<InventoryStoreDrugPatient> listStoreDrugPatient(
			Integer storeId, String name, String fromDate, String toDate,
			int min, int max) throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession()
				.createCriteria(InventoryStoreDrugPatient.class, "bill")
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
				.createAlias("bill.store", "store");

		if (storeId != null) {

			criteria.add(Restrictions.eq("store.id", storeId));
		}
		if (!StringUtils.isBlank(name)) {
			criteria.add(Restrictions.or(
					Restrictions.like("bill.identifier", "%" + name + "%"),
					Restrictions.like("bill.name", "%" + name + "%")));
		}

		if (!StringUtils.isBlank(fromDate) && StringUtils.isBlank(toDate)) {
			String startFromDate = fromDate + " 00:00:00";
			String endFromDate = fromDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(
						Restrictions.ge("bill.createdOn",
								formatter.parse(startFromDate)),
						Restrictions.le("bill.createdOn",
								formatter.parse(endFromDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("listBill>>Error convert date: "
						+ e.toString());
				e.printStackTrace();
			}
		} else if (StringUtils.isBlank(fromDate)
				&& !StringUtils.isBlank(toDate)) {
			String startToDate = toDate + " 00:00:00";
			String endToDate = toDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(
						Restrictions.ge("bill.createdOn",
								formatter.parse(startToDate)),
						Restrictions.le("bill.createdOn",
								formatter.parse(endToDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("listBill>>Error convert date: "
						+ e.toString());
				e.printStackTrace();
			}
		} else if (!StringUtils.isBlank(fromDate)
				&& !StringUtils.isBlank(toDate)) {
			String startToDate = fromDate + " 00:00:00";
			String endToDate = toDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(
						Restrictions.ge("bill.createdOn",
								formatter.parse(startToDate)),
						Restrictions.le("bill.createdOn",
								formatter.parse(endToDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("listBill>>Error convert date: "
						+ e.toString());
				e.printStackTrace();
			}
		}
		criteria.addOrder(Order.desc("bill.createdOn"));
		criteria.setFirstResult(min).setMaxResults(max);
		List<InventoryStoreDrugPatient> l = criteria.list();
		return l;
	}

	public int countStoreDrugPatient(Integer storeId, String name,
			String fromDate, String toDate) throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession()
				.createCriteria(InventoryStoreDrugPatient.class, "bill")
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
				.createAlias("bill.store", "store")
				.setProjection(Projections.rowCount());

		if (storeId != null) {
			criteria.add(Restrictions.eq("store.id", storeId));
		}
		if (!StringUtils.isBlank(name)) {
			criteria.add(Restrictions.or(
					Restrictions.like("bill.identifier", "%" + name + "%"),
					Restrictions.like("bill.name", "%" + name + "%")));
		}
		if (!StringUtils.isBlank(fromDate) && StringUtils.isBlank(toDate)) {
			String startFromDate = fromDate + " 00:00:00";
			String endFromDate = fromDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(
						Restrictions.ge("bill.createdOn",
								formatter.parse(startFromDate)),
						Restrictions.le("bill.createdOn",
								formatter.parse(endFromDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("countBill>>Error convert date: "
						+ e.toString());
				e.printStackTrace();
			}
		} else if (StringUtils.isBlank(fromDate)
				&& !StringUtils.isBlank(toDate)) {
			String startToDate = toDate + " 00:00:00";
			String endToDate = toDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(
						Restrictions.ge("bill.createdOn",
								formatter.parse(startToDate)),
						Restrictions.le("bill.createdOn",
								formatter.parse(endToDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("countBill>>Error convert date: "
						+ e.toString());
				e.printStackTrace();
			}
		} else if (!StringUtils.isBlank(fromDate)
				&& !StringUtils.isBlank(toDate)) {
			String startToDate = fromDate + " 00:00:00";
			String endToDate = toDate + " 23:59:59";
			try {
				criteria.add(Restrictions.and(
						Restrictions.ge("bill.createdOn",
								formatter.parse(startToDate)),
						Restrictions.le("bill.createdOn",
								formatter.parse(endToDate))));
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("countBill>>Error convert date: "
						+ e.toString());
				e.printStackTrace();
			}
		}
		Number rs = (Number) criteria.uniqueResult();
		return rs != null ? rs.intValue() : 0;
	}

	public InventoryStoreDrugPatient saveStoreDrugPatient(
			InventoryStoreDrugPatient bill) throws DAOException {
		return (InventoryStoreDrugPatient) sessionFactory.getCurrentSession()
				.merge(bill);
	}

	public InventoryStoreDrugPatient getStoreDrugPatientById(Integer id)
			throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				InventoryStoreDrugPatient.class, "drugPatient");
		criteria.add(Restrictions.eq("patientBill.id", id));
		return (InventoryStoreDrugPatient) criteria.uniqueResult();
	}

	/**
	 * InventoryStoreDrugPatientDetail
	 */
	public List<InventoryStoreDrugPatientDetail> listStoreDrugPatientDetail(
			Integer storeDrugPatientId) throws DAOException {
		Criteria criteria = sessionFactory
				.getCurrentSession()
				.createCriteria(InventoryStoreDrugPatientDetail.class,
						"billDetail")
				.add(Restrictions.eq("billDetail.storeDrugPatient.id",
						storeDrugPatientId));
		List<InventoryStoreDrugPatientDetail> l = criteria.list();
		return l;
	}

	public InventoryStoreDrugPatientDetail saveStoreDrugPatientDetail(
			InventoryStoreDrugPatientDetail storeDrugPatientDetail)
			throws DAOException {
		return (InventoryStoreDrugPatientDetail) sessionFactory
				.getCurrentSession().merge(storeDrugPatientDetail);
	}

	public InventoryStoreDrugPatientDetail getStoreDrugPatientDetailById(
			Integer id) throws DAOException {
		Criteria criteria = sessionFactory
				.getCurrentSession()
				.createCriteria(InventoryStoreDrugPatientDetail.class,
						"billDetail").add(Restrictions.eq("billDetail.id", id));

		return (InventoryStoreDrugPatientDetail) criteria.uniqueResult();
	}

	  
	 
	       
	public List<OpdDrugOrder> listOfOrder(Integer patientId, Date date)
			throws DAOException {
		/*
		 * Criteria criteria =
		 * sessionFactory.getCurrentSession().createCriteria(
		 * OpdDrugOrder.class); criteria.add(Restrictions.eq("patient",
		 * patient)); criteria.add(Restrictions.eq("orderStatus", 0));
		 * criteria.add(Restrictions.eq("cancelStatus", 0)); return
		 * criteria.list();
		 */
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String startDate = sdf.format(date) + " 00:00:00";
		String endDate = sdf.format(date) + " 23:59:59";
		String hql = "from OpdDrugOrder o where o.patient='"
				+ patientId
				+ "' AND o.createdOn BETWEEN '"
				+ startDate
				+ "' AND '"
				+ endDate
				+ "' AND o.orderStatus=0 AND o.cancelStatus=0 GROUP BY encounter";
		Session session = sessionFactory.getCurrentSession();
		Query q = session.createQuery(hql);
		List<OpdDrugOrder> list = q.list();
		return list;
	}
	
	public List<OpdDrugOrder> listOfDrugOrder(Integer patientId,
			Integer encounterId) throws DAOException {
		String hql = "from OpdDrugOrder o where o.patient='" + patientId
				+ "' AND o.encounter='" + encounterId
				+ "' AND o.orderStatus=0 AND o.cancelStatus=0";
		Session session = sessionFactory.getCurrentSession();
		Query q = session.createQuery(hql);
		List<OpdDrugOrder> list = q.list();
		return list;
	}
	
	public OpdDrugOrder getOpdDrugOrder(Integer patientId,Integer encounterId,Integer inventoryDrugId,Integer formulationId) throws DAOException {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				OpdDrugOrder.class);
		criteria.add(Restrictions.eq("patient.id", patientId));
		criteria.add(Restrictions.eq("encounter.encounterId", encounterId));
		criteria.add(Restrictions.eq("inventoryDrug.id", inventoryDrugId));
		criteria.add(Restrictions.eq("inventoryDrugFormulation.id", formulationId));

		return (OpdDrugOrder) criteria.uniqueResult();
	}

    public void deleteDrugUnit(InventoryDrugUnit drugUnit) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public List<InventoryStoreDrugTransactionDetail> listTransactionDetail(Integer transactionId) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public List<PatientSearch> searchListOfPatient(Date date, String searchKey, int page) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}

