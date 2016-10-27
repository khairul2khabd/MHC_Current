/**
 *  Copyright 2011 Society for Health Information Systems Programmes, India (HISP India)
 *
 *  This file is part of Laboratory module.
 *
 *  Laboratory module is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.

 *  Laboratory module is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with Laboratory module.  If not, see <http://www.gnu.org/licenses/>.
 *
 **/

package org.openmrs.module.laboratory.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.Concept;
import org.openmrs.Encounter;
import org.openmrs.Order;
import org.openmrs.OrderType;
import org.openmrs.Patient;
import org.openmrs.Role;
import org.openmrs.api.APIException;
import org.openmrs.api.context.Context;
import org.openmrs.api.impl.BaseOpenmrsService;
import org.openmrs.module.hospitalcore.BillingConstants;
import org.openmrs.module.hospitalcore.model.DiaConceptNumeric;
import org.openmrs.module.hospitalcore.model.DiaInvestigationSpecimen;
 
import org.openmrs.module.hospitalcore.model.Lab;
import org.openmrs.module.hospitalcore.model.LabTest;
import org.openmrs.module.hospitalcore.util.GlobalPropertyUtil;
import org.openmrs.module.hospitalcore.util.TestModel;
import org.openmrs.module.laboratory.LaboratoryService;
import org.openmrs.module.laboratory.db.LaboratoryDAO;
import org.openmrs.module.laboratory.model.LabDoctorSeal;
import org.openmrs.module.laboratory.util.LaboratoryConstants;

public class LaboratoryServiceImpl extends BaseOpenmrsService implements
		LaboratoryService {

	private Log logger = LogFactory.getLog(getClass());
	 //ghanshyam 7-august-2013 code review bug
	//private static SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	public LaboratoryServiceImpl() {
	}

	protected LaboratoryDAO dao;

	public void setDao(LaboratoryDAO dao) {
		this.dao = dao;
	}

	//
	// LABORATORY DEPARTMENT
	//
	public Lab saveLaboratoryDepartment(Lab department) {
		return dao.saveLaboratoryDepartment(department);
	}

	public Lab getLaboratoryDepartment(Integer id) {
		return dao.getLaboratoryDepartment(id);
	}

	public void deleteLaboratoryDepartment(Lab department) {
		dao.deleteLabDepartment(department);
	}

	public Lab getCurrentDepartment() {
		Set<Role> roles = Context.getAuthenticatedUser().getAllRoles();
		List<Lab> departments = new ArrayList<Lab>();
		for (Role role : roles) {
			Lab department = dao.getDepartment(role);
			if (department != null) {
				departments.add(department);
			}
		}

		if (!CollectionUtils.isEmpty(departments)) {
			return departments.get(0);
		} else {
			return null;
		}
	}

	//
	// ORDER
	//
	public List<Order> getOrders(Date startDate, String phrase,
			Set<Concept> tests, int page) throws ParseException {

		Integer laboratoryOrderTypeId = GlobalPropertyUtil.getInteger(
				BillingConstants.GLOBAL_PROPRETY_LAB_ORDER_TYPE, 2);
		OrderType orderType = Context.getOrderService().getOrderType(
				laboratoryOrderTypeId);

		List<Patient> patients = Context.getPatientService()
				.getPatients(phrase);
		List<Order> orders = dao.getOrders(startDate, orderType, tests,
				patients, page);
		return orders;
	}

	public Integer countOrders(Date startDate, String phrase, Set<Concept> tests)
			throws ParseException {

		Integer laboratoryOrderTypeId = GlobalPropertyUtil.getInteger(
				BillingConstants.GLOBAL_PROPRETY_LAB_ORDER_TYPE, 2);
		OrderType orderType = Context.getOrderService().getOrderType(
				laboratoryOrderTypeId);

		List<Patient> patients = Context.getPatientService()
				.getPatients(phrase);
		return dao.countOrders(startDate, orderType, tests, patients);
	}

	public List<Order> getOrders(Patient patient, Date date, Concept concept)
			throws ParseException {
		return dao.getOrders(patient, date, concept);
	}

	//
	// LABORATORY TEST
	//
	public LabTest saveLaboratoryTest(LabTest test) {
		return dao.saveLaboratoryTest(test);
	}

	public LabTest getLaboratoryTest(Integer id) {
		return dao.getLaboratoryTest(id);
	}

	public void deleteLaboratoryTest(LabTest test) {
		dao.deleteLaboratoryTest(test);
	}

	/**
	 * ACCEPT A TEST
	 */
	public Integer acceptTest(Order order, String sampleId)
			throws ParseException {
		if (!isTestExisting(sampleId)) {
			LabTest test = dao.getLaboratoryTest(order);
			if (test == null) {
				test = new LabTest();
				test.setOrder(order);
				test.setPatient(order.getPatient());
				test.setConcept(order.getConcept());
				test.setCreator(Context.getAuthenticatedUser());
				test.setAcceptDate(new Date());
				test.setStatus(LaboratoryConstants.TEST_STATUS_ACCEPTED);
				test.setSampleNumber(sampleId);
				LabTest acceptedTest = dao.saveLaboratoryTest(test);
				logger.info(String
						.format("Accepting a test [concept=%s, patient=%s, order=%s, sampleNumber=%s]",
								test.getConcept().getConceptId(), test
										.getPatient().getPatientId(), test
										.getOrder().getOrderId(), test
										.getSampleNumber()));
				return acceptedTest.getLabTestId();
			} else {
				logger.warn(String.format("Existing test for order=%s found.",
						order.getOrderId()));
				return LaboratoryConstants.ACCEPT_TEST_RETURN_ERROR_EXISTING_TEST;
			}
		} else {
			//ghanshyam 7-august-2013 code review bug
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			logger.warn(String.format("SampleId=%s for date=%s is existing",
					sampleId, sdf.format(new Date())));
			return LaboratoryConstants.ACCEPT_TEST_RETURN_ERROR_EXISTING_SAMPLEID;
		}
	}

	/**
	 * Get the default sample id
	 */
	public String getDefaultSampleId(String investigationName)
			throws ParseException {
		//ghanshyam 7-august-2013 code review bug
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		String date = sdf.format(new Date());
		String letter = investigationName.toUpperCase().substring(0, 1);
		String defaultSampleId = "";

		int id = 0;
		do {
			id++;
			defaultSampleId = date + "-" + letter + id;
		} while (isTestExisting(defaultSampleId));
		return defaultSampleId;
	}

	/*
	 * Check exisitng test with a given sample id
	 * 
	 * @param sampleId
	 * 
	 * @return
	 * 
	 * @throws ParseException
	 */
	private boolean isTestExisting(String sampleId) throws ParseException {
		List<LabTest> tests = dao.getLaboratoryTests(new Date(), "%" + sampleId	+ "%");
		return !CollectionUtils.isEmpty(tests);
	}

	public String rescheduleTest(Order order, Date rescheduledDate) {

		if (!order.getDiscontinued()) {
			LabTest test = getLaboratoryTest(order);
			if (test != null) {
				if (test.getStatus().equalsIgnoreCase(
						LaboratoryConstants.TEST_STATUS_ACCEPTED)) {
					order.setStartDate(rescheduledDate);
					order.setChangedBy(Context.getAuthenticatedUser());
					order.setDateChanged(new Date());
					deleteLaboratoryTest(test);
					Context.getOrderService().saveOrder(order);
					return LaboratoryConstants.RESCHEDULE_TEST_RETURN_STATUS_SUCCESS;
				} else {
					// TODO: add more reschedule test return status here
					return test.getStatus();
				}
			} else {
				order.setStartDate(rescheduledDate);
				order.setChangedBy(Context.getAuthenticatedUser());
				order.setDateChanged(new Date());
				Context.getOrderService().saveOrder(order);
				return LaboratoryConstants.RESCHEDULE_TEST_RETURN_STATUS_SUCCESS;
			}
		}

		return LaboratoryConstants.RESCHEDULE_TEST_RETURN_STATUS_ENTERED;
	}

	public LabTest getLaboratoryTest(Order order) {
		return dao.getLaboratoryTest(order);
	}

	public List<LabTest> getAcceptedLaboratoryTests(Date date, String phrase,
			Set<Concept> allowableTests) throws ParseException {
		List<Patient> patients = Context.getPatientService()
				.getPatients(phrase);
		return dao.getLaboratoryTests(date,
				LaboratoryConstants.TEST_STATUS_ACCEPTED, allowableTests,
				patients);
	}

	public List<LabTest> getCompletedLaboratoryTests(Date date, String phrase,
			Set<Concept> allowableTests) throws ParseException {

		List<Patient> patients = null;
		if (!StringUtils.isBlank(phrase)) {
			patients = Context.getPatientService().getPatients(phrase);
		}
		List<LabTest> tests = dao.getLaboratoryTestsByDiscontinuedDate(date,
				allowableTests, patients);

		return tests;
	}

	public List<LabTest> getAllLaboratoryTestsByDate(Date date, String phrase,
			Set<Concept> allowableTests) throws ParseException {
		List<Patient> patients = null;
		if (!StringUtils.isBlank(phrase)) {
			patients = Context.getPatientService().getPatients(phrase);
		}
		List<LabTest> tests = dao.getLaboratoryTestsByDate(date,
				allowableTests, patients);
		return tests;
	}

	public String completeTest(LabTest test) {

		if (test.getStatus() != null) {
			if ((test.getStatus().equalsIgnoreCase(
					LaboratoryConstants.TEST_STATUS_ACCEPTED) || (test
					.getStatus()
					.equalsIgnoreCase(LaboratoryConstants.TEST_STATUS_COMPLETED)))) {
				Order order = test.getOrder();
				order.setDiscontinued(true);
				order.setDiscontinuedDate(new Date());
				order.setDiscontinuedBy(Context.getAuthenticatedUser());
				Context.getOrderService().saveOrder(order);
				test.setStatus(LaboratoryConstants.TEST_STATUS_COMPLETED);
				saveLaboratoryTest(test);
				return LaboratoryConstants.COMPLETE_TEST_RETURN_STATUS_SUCCESS;
			}
		}
		return LaboratoryConstants.COMPLETE_TEST_RETURN_STATUS_NOT_ACCEPTED;
	}

	public List<LabTest> getLaboratoryTests(Date date) throws ParseException {
		return dao.getLaboratoryTests(date, null);
	}

	public List<LabTest> getLaboratoryTestsByDateAndPatient(Date date,
			Patient patient) throws ParseException {
		List<LabTest> tests = dao.getLaboratoryTestsByDateAndPatient(date,
				patient);
		return tests;
	}

	public LabTest getLaboratoryTest(Encounter encounter) {
		return dao.getLaboratoryTest(encounter);
	}
	
	public List<LabTest> getAllTest(){
		return dao.getAllTest();
	}
 
    public DiaInvestigationSpecimen getDiaSepByConceptId(Integer conceptId) throws APIException {
        return dao.getDiaSepByConceptId(conceptId);
    }

    public List<DiaInvestigationSpecimen> getAllDiaSpecimen() throws APIException {
        return dao.getAllDiaSpecimen();
    }

    public List<LabTest> getLaboratoryTestsByDateAndAccepted(Date date) throws ParseException {
        return dao.getLaboratoryTestsByDateAndAccepted(date);
    }

    public LabDoctorSeal saveLabDocSeal(LabDoctorSeal labDocSeal) throws APIException {
        return dao.saveLabDocSeal(labDocSeal);
    }

    public List<LabDoctorSeal> getAllListLabDocSeal() throws APIException {
        return dao.getAllListLabDocSeal();
    }

    public LabDoctorSeal getLabDocSealById(Integer id) throws APIException {
        return dao.getLabDocSealById(id);
    }

    public LabDoctorSeal updateLabDocSeal(LabDoctorSeal labDocSela) throws APIException {
        return dao.updateLabDocSeal(labDocSela);
    }
} 