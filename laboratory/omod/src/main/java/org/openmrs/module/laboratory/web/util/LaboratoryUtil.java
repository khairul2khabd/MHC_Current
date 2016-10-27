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

package org.openmrs.module.laboratory.web.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import org.openmrs.Concept;
import org.openmrs.ConceptAnswer;
import org.openmrs.ConceptNumeric;
import org.openmrs.ConceptSet;
import org.openmrs.ConceptWord;
import org.openmrs.Encounter;
import org.openmrs.Obs;
import org.openmrs.Order;
import org.openmrs.api.context.Context;
import org.openmrs.module.hospitalcore.concept.TestTree;
import org.openmrs.module.hospitalcore.model.Lab;
import org.openmrs.module.hospitalcore.model.LabTest;
import org.openmrs.module.hospitalcore.util.PatientUtils;
import org.openmrs.module.laboratory.LaboratoryService;
import org.springframework.ui.Model;

public class LaboratoryUtil {

	 //ghanshyam 7-august-2013 code review bug
	//private static SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	private static Map<Concept, String> conceptNames = new HashMap<Concept, String>();

	/**
	 * Generate list of test model using orders
	 * 
	 * @param orders
         * @param testTreeMap
	 * @return
	 */
	public static List<TestModel> generateModelsFromOrders(List<Order> orders,
			Map<Concept, Set<Concept>> testTreeMap) {

		List<TestModel> models = new ArrayList<TestModel>();
		for (Order order : orders) {
			TestModel tm = generateModel(order, testTreeMap);
			models.add(tm);
		}
		return models;
	}

	/**
	 * Generate list of test models using tests
	 * 
	 * @param tests
	 * @return
	 */
	public static List<TestModel> generateModelsFromTests(List<LabTest> tests,
			Map<Concept, Set<Concept>> testTreeMap) {

		List<TestModel> models = new ArrayList<TestModel>();
		for (LabTest test : tests) {
			TestModel tm = generateModel(test, testTreeMap);
			models.add(tm);
		}
		return models;
	}

	// ghanshyam 19/07/2012 New Requirement #309: [LABORATORY] Show Results in
	// Print WorkList.introduced the column 'Lab' 'Test' 'Test name' 'Result'
	// ghanshyam 20/07/2012 New Requirement #320 [LABORATORY] Show Results as an
	// Option.added one more parameter in method
	// generateModelsForPrintWorkListFromTests showResults
	/**
	 * Generate list of test models for Print WorkList using tests
	 * 
	 * @param tests
	 * @return
	 */

	public static List<TestModel> generateModelsForPrintWorkListFromTests(
			List<LabTest> tests, Map<Concept, Set<Concept>> testTreeMap,
			String showResults) {

		List<TestModel> models = new ArrayList<TestModel>();
		for (LabTest test : tests) {
			List<TestModel> tm = generateModelForAllTestField(test,
					testTreeMap, showResults);
			models.addAll(tm);
		}
		return models;
	}

	// ghanshyam 19/07/2012 New Requirement #309: [LABORATORY] Show Results in
	// Print WorkList.introduced the column 'Lab' 'Test' 'Test name' 'Result'
	// ghanshyam 20/07/2012 New Requirement #320 [LABORATORY] Show Results as an
	// Option.added one more parameter in method
	// generateModelsForPrintWorkListFromTests showResults
	private static List<TestModel> generateModelForAllTestField(LabTest test,
			Map<Concept, Set<Concept>> testTreeMap, String showResults) {
		//ghanshyam 7-august-2013 code review bug
		List<TestModel> listTm = new ArrayList<TestModel>();
		if(test!=null){
		Order order = test.getOrder();
		boolean flag = false;
		Encounter encounter = test.getEncounter();
		// ghanshyam 1-oct-2012 Support #392 [Laboratory]Print Work
		// List(note:added the condition encounter.getAllObs().size()!=0)
		if (encounter != null && encounter.getAllObs().size() != 0) {

			for (Obs obs : encounter.getAllObs()) {

				//ghanshyam 7-august-2013 code review bug
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
				TestModel tm = new TestModel();
				tm.setStartDate(sdf.format(order.getStartDate()));
				tm.setPatientIdentifier(order.getPatient()
						.getPatientIdentifier().getIdentifier());
				tm.setPatientName(PatientUtils.getFullName(order.getPatient()));
				tm.setGender(order.getPatient().getGender());
				tm.setAge(order.getPatient().getAge());
				tm.setTest(order.getConcept());
				setTestResultModelValue(obs, tm);
				tm.setTestName(obs.getConcept());
				tm.setOrderId(order.getOrderId());

				if (test != null) {
					tm.setStatus(test.getStatus());
					tm.setTestId(test.getLabTestId());
					tm.setAcceptedDate(sdf.format(test.getAcceptDate()));
					tm.setConceptId(test.getConcept().getConceptId());
					tm.setSampleId(test.getSampleNumber());
					if (test.getEncounter() != null)
						tm.setEncounterId(test.getEncounter().getEncounterId());
				} else {
					tm.setStatus(null);
				}

				// get investigation from test tree map
				if (testTreeMap != null) {
					tm.setInvestigation(getInvestigationName(
							order.getConcept(), testTreeMap));
				}

				// ghanshyam 20/07/2012 New Requirement #320 [LABORATORY] Show
				// Results as an Option
				if (showResults.equals("true")) {
					if (test.getEncounter() != null) {
						TestModel trm = new TestModel();
						setTestResultModelValue(obs, trm);
						tm.setValue(trm.getValue());
					}
				} else {
					if (test.getEncounter() != null) {

						TestModel trm = new TestModel();
						setTestResultModelValue(obs, trm);
						tm.setValue("");

					}
				}

				listTm.add(tm);

			}

		}
		// ghanshyam 1-oct-2012 Support #392 [Laboratory]Print Work
		// List(note:added the else condition)
		else {
			Concept con1 = order.getConcept();
			if (con1.getSetMembers().size() != 0) {
				for (Concept con2 : con1.getSetMembers()) {
					TestModel tm1 = new TestModel();
					TestModel tm2 = new TestModel();
					tm2 = generateModel(test.getOrder(), test, testTreeMap);
					tm1.setPatientIdentifier(tm2.getPatientIdentifier());
					tm1.setPatientName(tm2.getPatientName());
					tm1.setGender(tm2.getGender());
					tm1.setAge(tm2.getAge());
					tm1.setTest(tm2.getTest());
					tm1.setTestName(con2);
					tm1.setAcceptedDate(tm2.getAcceptedDate());
					tm1.setSampleId(tm2.getSampleId());
					tm1.setInvestigation(tm2.getInvestigation());
					listTm.add(tm1);
				}
			} else {
				TestModel tm1 = new TestModel();
				TestModel tm2 = new TestModel();
				tm2 = generateModel(test.getOrder(), test, testTreeMap);
				tm1.setPatientIdentifier(tm2.getPatientIdentifier());
				tm1.setPatientName(tm2.getPatientName());
				tm1.setGender(tm2.getGender());
				tm1.setAge(tm2.getAge());
				tm1.setTest(tm2.getTest());
				tm1.setTestName(tm2.getTest());
				tm1.setAcceptedDate(tm2.getAcceptedDate());
				tm1.setSampleId(tm2.getSampleId());
				tm1.setInvestigation(tm2.getInvestigation());
				listTm.add(tm1);
			}
		}
	  }
		return listTm;
	}

	/**
	 * Generate a single test model
	 * 
	 * @param order
         * @param testTreeMap
	 * @return
	 */
	public static TestModel generateModel(Order order,
			Map<Concept, Set<Concept>> testTreeMap) {
		LaboratoryService ls = (LaboratoryService) Context
				.getService(LaboratoryService.class);
		LabTest test = ls.getLaboratoryTest(order);
		return generateModel(order, test, testTreeMap);
	}

	/**
	 * Generate a single test model
	 * 
	 * @param test
         * @param testTreeMap
	 * @return
	 */
	public static TestModel generateModel(LabTest test,
			Map<Concept, Set<Concept>> testTreeMap) {
		return generateModel(test.getOrder(), test, testTreeMap);
	}

	/**
	 * Format a date
	 * 
	 * @param date
	 * @return
	 */
	public static String formatDate(Date date) {
		//ghanshyam 7-august-2013 code review bug
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		return sdf.format(date);
	}

	/**
	 * Parse a string into a date
	 * 
	 * @param dateStr
	 * @return
	 * @throws ParseException
	 */
	public static Date parseDate(String dateStr) throws ParseException {
		//ghanshyam 7-august-2013 code review bug
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		return sdf.parse(dateStr);
	}

	private static Set<Concept> getAllInvestigations() {
		LaboratoryService ls = (LaboratoryService) Context
				.getService(LaboratoryService.class);
		Lab department = ls.getCurrentDepartment();
		if (department != null) {
			Set<Concept> investigations = department
					.getInvestigationsToDisplay();
			return investigations;
		}
		return null;
	}

	/**
	 * Get all test trees for all investigation belongs to a department
	 * 
	 * @return
	 */
	public static List<TestTree> getAllTestTrees() {
		List<TestTree> trees = new ArrayList<TestTree>();
		Set<Concept> concepts = getAllInvestigations();
		for (Concept concept : concepts) {
			TestTree tree = new TestTree(concept);
			trees.add(tree);
		}
		return trees;
	}

	/*
	 * REFACTORING
	 */
	private static TestModel generateModel(Order order, LabTest test,
			Map<Concept, Set<Concept>> testTreeMap1) {

		//ghanshyam 7-august-2013 code review bug
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		TestModel tm = new TestModel();
		tm.setStartDate(sdf.format(order.getStartDate()));
		tm.setPatientIdentifier(order.getPatient().getPatientIdentifier()
				.getIdentifier());
		tm.setPatientName(PatientUtils.getFullName(order.getPatient()));
		tm.setGender(order.getPatient().getGender());
		tm.setAge(order.getPatient().getAge());
		tm.setTest(order.getConcept());
		tm.setOrderId(order.getOrderId());

		if (test != null) {
			tm.setStatus(test.getStatus());
			tm.setTestId(test.getLabTestId());
			tm.setAcceptedDate(sdf.format(test.getAcceptDate()));
			tm.setConceptId(test.getConcept().getConceptId());
			tm.setSampleId(test.getSampleNumber());
			if (test.getEncounter() != null)
				tm.setEncounterId(test.getEncounter().getEncounterId());
		} else {
			tm.setStatus(null);
		}

		// get investigation from test tree map
		if (testTreeMap1 != null) {
			tm.setInvestigation(getInvestigationName(order.getConcept(),
					testTreeMap1));
		}

		return tm;
	}

	// ghanshyam 19/07/2012 New Requirement #309: [LABORATORY] Show Results in
	// Print WorkList.introduced the column 'Lab' 'Test' 'Test name' 'Result'
	private static void setTestResultModelValue(Obs obs, TestModel trm) {
		if (obs != null) {
			Concept concept = Context.getConceptService().getConcept(
					obs.getConcept().getConceptId());
			// trm.setTestName(concept.getName().getName());
			if (concept != null) {
				String datatype = concept.getDatatype().getName();
				if (datatype.equalsIgnoreCase("Text")) {
					trm.setValue(obs.getValueText());
				} else if (datatype.equalsIgnoreCase("Numeric")) {
					if (obs.getValueText() != null) {
						trm.setValue(obs.getValueText().toString());
					} else {
						trm.setValue(obs.getValueNumeric().toString());
					}
				} else if (datatype.equalsIgnoreCase("Coded")) {
					trm.setValue(obs.getValueCoded().getName().getName());
				}
			}
		}
	}

	public static String getInvestigationName(Concept concept,
			Map<Concept, Set<Concept>> testTreeMap) {
		for (Concept investigationConcept : testTreeMap.keySet()) {
			Set<Concept> set = testTreeMap.get(investigationConcept);
			if (set.contains(concept)) {
				if (conceptNames.containsKey(investigationConcept)) {
					return conceptNames.get(investigationConcept);
				} else {
					Concept newInvestigationConcept = Context
							.getConceptService().getConcept(
									investigationConcept.getConceptId());
					conceptNames.put(newInvestigationConcept,
							newInvestigationConcept.getName().getName());
					return conceptNames.get(newInvestigationConcept);
				}
			}
		}
		return null;
	}

	/**
	 * Search for concept using name
	 * 
	 * @param name
	 * @return
	 */
	@SuppressWarnings("deprecation")
	public static Concept searchConcept(String name) {
		Concept concept = Context.getConceptService().getConcept(name);
		if (concept != null) {
			return concept;
		} else {
			List<ConceptWord> cws = Context.getConceptService().findConcepts(
					name, new Locale("en"), false);
			if (!cws.isEmpty())
				return cws.get(0).getConcept();
		}
		return null;
	}

	/**
	 * generate data for form from an existing encounter
	 * 
	 * @param model
	 * @param encounter
	 */
	public static void generateDataFromEncounter(Model model,
			Encounter encounter) {
		if (encounter != null) {
			List<String> inputNames = new ArrayList<String>();
			List<String> inputValues = new ArrayList<String>();
			for (Obs obs : getOrderedObs(encounter)) {
				inputNames.add(obs.getConcept().getName().getName());
				inputValues.add(getObsValue(obs));
			}
			model.addAttribute("inputNames", inputNames);
			model.addAttribute("inputValues", inputValues);
			model.addAttribute("inputLength", inputValues.size());
		}
	}

	private static List<Obs> getOrderedObs(Encounter encounter) {
		List<Obs> obs = new ArrayList<Obs>();
		obs.addAll(encounter.getAllObs());
		Collections.sort(obs, new Comparator<Obs>() {

			public int compare(Obs o1, Obs o2) {
				String o1n = o1.getConcept().getName().getName();
				String o2n = o2.getConcept().getName().getName();
				return o1n.compareToIgnoreCase(o2n);
			}
		});
		return obs;
	}

	private static String getObsValue(Obs obs) {
		Concept concept = obs.getConcept();
		if (concept.getDatatype().getName().equalsIgnoreCase("Text")
				|| concept.getDatatype().getName().equalsIgnoreCase("Numeric")) {
			return obs.getValueText();
		} else if (concept.getDatatype().getName().equalsIgnoreCase("Coded")) {
			return obs.getValueCoded().getName().getName();
		}
		return null;
	}

	/**
	 * Get name of a detached by hibernate session concept
	 * 
	 * @param searchConcept
	 * @return
	 */
	public static String getConceptName(Concept searchConcept) {
		if (conceptNames.containsKey(searchConcept)) {
			return conceptNames.get(searchConcept);
		} else {
			Concept concept = Context.getConceptService().getConcept(
					searchConcept.getConceptId());
			conceptNames.put(searchConcept, concept.getName().getName());
			return conceptNames.get(searchConcept);
		}
	}

	/**
	 * Generate parameter models
	 * 
	 * @param parameters
	 * @param concept
	 */
	public static void generateParameterModels(List<ParameterModel> parameters,
			Concept concept) {
		if (concept.getConceptClass().getName().equalsIgnoreCase("LabSet")) {
			List<Concept> concepts = getParameterConcepts(concept);
			for (Concept c : concepts) {
				generateParameterModels(parameters, c);
			}
		} else {
			ParameterModel parameter = generateParameterModel(concept);
			parameters.add(parameter);
		}
	}

	private static List<Concept> getParameterConcepts(Concept concept) {

		List<Concept> concepts = new ArrayList<Concept>();
		for (ConceptSet cs : concept.getConceptSets()) {
			Concept c = cs.getConcept();
			concepts.add(c);
		}
		return concepts;
	}

	private static ParameterModel generateParameterModel(Concept concept) {
		ParameterModel parameter = new ParameterModel();
		if (concept.getDatatype().getName().equalsIgnoreCase("Text")) {
			parameter.setId(concept.getName().getName().trim());
			parameter.setType("text");
		} else if (concept.getDatatype().getName().equalsIgnoreCase("Numeric")) {
			parameter.setId(concept.getName().getName().trim());
			parameter.setType("text");
			parameter.setUnit(getUnit(concept));
		} else if (concept.getDatatype().getName().equalsIgnoreCase("Coded")) {
			parameter.setId(concept.getName().getName().trim());
			parameter.setType("select");
			parameter.getOptionValues().add("");
			parameter.getOptionLabels().add("");
			Set<Concept> options = new HashSet<Concept>();

			for (ConceptAnswer ca : concept.getAnswers()) {
				Concept c = ca.getAnswerConcept();
				options.add(c);
			}

			for (Concept option : options) {
				parameter.getOptionValues().add(option.getName().getName());
				parameter.getOptionLabels().add(option.getName().getName());
			}
		}
		//parameter.setValidator(parameter.getValidator() + " required");
                parameter.setValidator(parameter.getValidator());
		parameter.setTitle(concept.getDatatype().getName());
		return parameter;
	}

	private static String getUnit(Concept concept) {
		ConceptNumeric cn = Context.getConceptService().getConceptNumeric(
				concept.getConceptId());
		return cn.getUnits();
	}
}
