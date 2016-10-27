/**
 * Copyright 2011 Society for Health Information Systems Programmes, India (HISP
 * India)
 *
 * This file is part of Laboratory module.
 *
 * Laboratory module is free software: you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option) any
 * later version.
 *
 * Laboratory module is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
 * details.
 *
 * You should have received a copy of the GNU General Public License along with
 * Laboratory module. If not, see <http://www.gnu.org/licenses/>.
 *
 *
 */
package backup;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang.StringUtils;

import org.openmrs.Concept;
import org.openmrs.ConceptNumeric;
import org.openmrs.Encounter;
import org.openmrs.Obs;
import org.openmrs.Patient;
import org.openmrs.api.context.Context;
import org.openmrs.module.hospitalcore.LabService;
import org.openmrs.module.hospitalcore.model.DiaConceptNumeric;
import org.openmrs.module.hospitalcore.model.LabTest;
import org.openmrs.module.hospitalcore.util.PatientUtils;
import org.openmrs.module.laboratory.LaboratoryService;
import org.openmrs.module.laboratory.util.LaboratoryConstants;
import org.openmrs.module.laboratory.web.util.LaboratoryUtil;
import org.openmrs.module.laboratory.web.util.TestModelNew;
import org.openmrs.module.laboratory.web.util.TestResultModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.openmrs.module.hospitalcore.LabService;
import org.openmrs.module.hospitalcore.MedisunService;
import org.openmrs.module.hospitalcore.model.DiaInvestigationSpecimen;
import org.openmrs.module.hospitalcore.model.DiaPatientServiceBillItem;
import org.openmrs.module.hospitalcore.model.DocDetail;

@Controller("LaboratorySearchPatientReportController")
@RequestMapping("/module/laboratory/searchPatientReport.form")
public class SearchPatientReportCon {

     @SuppressWarnings("unchecked")
    @RequestMapping(method = RequestMethod.GET)
    public String searchTest(
            @RequestParam(value = "date", required = false) String dateStr,
            @RequestParam(value = "patientId") Integer patientId,
            @RequestParam(value = "investigation", required = false) String investigation,
            HttpServletRequest request, Model model) {
        LaboratoryService ls = (LaboratoryService) Context.getService(LaboratoryService.class);
        LabService labSer = Context.getService(LabService.class);
        MedisunService ms = Context.getService(MedisunService.class);
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        Date date = null;
        try {
            date = sdf.parse(dateStr);
            Patient patient = Context.getPatientService().getPatient(patientId);

            List<TestModelNew> tmn = new ArrayList<TestModelNew>();
            //String ob=null;
            List<LabTest> te = Context.getService(LaboratoryService.class).getLaboratoryTestsByDateAndPatient(date, patient);
            // Patient information
            if (patient != null) {
                model.addAttribute("patient_identifier", patient.getPatientIdentifier().getIdentifier());
                model.addAttribute("patient_age", patient.getAge());
                model.addAttribute("patient_gender", patient.getGender());
                model.addAttribute("patient_name", PatientUtils.getFullName(patient));
                model.addAttribute("test_orderDate", date);
                model.addAttribute("dDate", new Date());
                Date birthday = patient.getBirthdate();
                //model.addAttribute("age", PatientUtils.estimateAge(birthday));
                model.addAttribute("age", patient.getAge());
            }
            List<DiaInvestigationSpecimen> diaSpcList = ls.getAllDiaSpecimen();

            //c1.retainAll(c2);             
            // te.retainAll(diaSpcList);
            
            List<Integer> l1 = new ArrayList<Integer>();
            Integer blood;
            for (int i = 0; i < diaSpcList.size(); i++) {//using loop 
//               blood= diaSpcList.get(i).getBlood();
             //  l1.add(blood);
                }
            
            List<Integer> l2 = new ArrayList<Integer>();
            Integer pres;
            for (int i = 0; i < te.size(); i++) {//using loop 
               pres= te.get(i).getConcept().getId();
               l2.add(pres);
                }
          

           List<Integer> l3 = new ArrayList<Integer>(l2);//second obj k temporary akhane rakha hoase
           l1.retainAll(l3);

            model.addAttribute("l1", l1);
            model.addAttribute("l2", l2);
            model.addAttribute("l3", l3);

            /*
             Set<DiaInvestigationSpecimen> set1 = new HashSet<DiaInvestigationSpecimen>();
             set1.addAll(diaSpcList);
             Set<LabTest> set2 = new HashSet<LabTest>();
             set2.addAll(te);
             if(set2.equals(set1)){
             model.addAttribute("abc", "Blood");  
             }
             
             Integer kha;
             int param = 2;
             for (int i = 0; i < te.size(); i++) {
             kha = i;
             if (kha== param) {
                    
             break;
             } */
            for (LabTest test : te) {

                Integer abc = test.getConcept().getId();
                DiaInvestigationSpecimen diaSpe = ls.getDiaSepByConceptId(abc);
                model.addAttribute("a", abc);
                model.addAttribute("b", diaSpe);

                Integer orderId = test.getOrder().getId();
                DiaPatientServiceBillItem dBillItem = labSer.getDiPatientBillItemByOrderId(orderId);
                Integer refBy = dBillItem.getDiaPatientServiceBill().getRefDocId();
                DocDetail docInfo = ms.getDocInfoById(refBy);
                model.addAttribute("refBy", docInfo);

                //  model.addAttribute("refBy",docInfo.getDoctorName() );
                if ((test.getEncounter().getId() != null) && (test.getConcept().getConceptClass().getName().equalsIgnoreCase("LabSet"))) /*   || (test.getConcept().getId() == 2920)
                 && (test.getConcept().getId() == 2577) && (test.getConcept().getId() == 5239)
                 && (test.getConcept().getId() == 5240) && (test.getConcept().getId() == 2404)
                 && (test.getConcept().getId() == 2543) && (test.getConcept().getId() == 2407)
                 ) */ {
                    Encounter encounter = test.getEncounter();
                    for (Obs obs : encounter.getAllObs()) {
                        TestModelNew t = new TestModelNew();
                        Concept concept = Context.getConceptService().getConcept(obs.getConcept().getConceptId());
                        t.setTest(obs.getValueText()); // result
                        t.setGroupName(test.getConcept().getId().toString());
                        t.setInvestigation(obs.getConcept().getId().toString()); // test id
                        t.setTestName(obs.getConcept().getName().getName()); // test name
                        t.setEncounterId(obs.getEncounter().getId());
                        String datatype = concept.getDatatype().getName();
                        if (datatype.equalsIgnoreCase("Text")) {
                            t.setValue(obs.getValueText());
                        } else if (datatype.equalsIgnoreCase("Numeric")) {
                            if (obs.getValueText() != null) {
                                t.setValue(obs.getValueText().toString());
                            } else {
                                t.setValue(obs.getValueNumeric().toString());
                            }
                            DiaConceptNumeric dia = Context.getService(LabService.class).getDiaConNumByConId(concept.getConceptId());
                            if (dia.getConceptId() != null) {
                                String d = dia.getRefRange();
                                String[] dd = d.split("#");
                                String ddd = StringUtils.join(dd, "<br>");
                                // t.setRefRange(dia.getRefRange());
                                t.setRefRange(ddd);
                            }
                            ConceptNumeric cn = Context.getConceptService().getConceptNumeric(concept.getConceptId());
                            t.setUnit(cn.getUnits());

                            if (cn.getLowNormal() != null) {
                                t.setLowNormal(cn.getLowNormal().toString());
                            }
                            if (cn.getHiNormal() != null) {
                                t.setHiNormal(cn.getHiNormal().toString());
                            }
                        } else if (datatype.equalsIgnoreCase("Coded")) {
                            t.setValue(obs.getValueCoded().getName().getName());
                        }
                        //ob+=obs.getConcept().getId();
                        tmn.add(t);
                        model.addAttribute("status", test.getConcept().getId());
                    }
                }
            }
            model.addAttribute("te", te);
            model.addAttribute("tmn", tmn);

            if (patient != null) {
                List<LabTest> tests = ls.getLaboratoryTestsByDateAndPatient(
                        date, patient);
                if ((tests != null) && (!tests.isEmpty())) {
                    Map<Concept, Set<Concept>> testTreeMap = (Map<Concept, Set<Concept>>) request
                            .getSession().getAttribute(
                                    LaboratoryConstants.SESSION_TEST_TREE_MAP);
                    List<TestResultModel> trms = renderTests(tests, testTreeMap);
                    trms = formatTestResult(trms);
                    model.addAttribute("tests", trms);
                    model.addAttribute("investigation", investigation);
                }
            }
        } catch (ParseException e) {
            e.printStackTrace();
            System.out.println("Error when parsing order date!");
            return null;
        }
        return "/module/laboratory/patientreport/search";
    }

    private List<TestResultModel> renderTests(List<LabTest> tests,
            Map<Concept, Set<Concept>> testTreeMap) {
        List<TestResultModel> trms = new ArrayList<TestResultModel>();
        for (LabTest test : tests) {
            if ((test.getEncounter().getId() != null) && (!test.getConcept().getConceptClass().getName().equalsIgnoreCase("LabSet"))) {
                /* if ((test.getEncounter().getId() != null) && (test.getConcept().getId() != 2920)
                 && (test.getConcept().getId() != 2577) && (test.getConcept().getId() != 5239)
                 && (test.getConcept().getId() != 5240) && (test.getConcept().getId() != 2404)
                 && (test.getConcept().getId() != 2543) && (test.getConcept().getId() != 2407) )  { */
                Encounter encounter = test.getEncounter();
                for (Obs obs : encounter.getAllObs()) {
                    TestResultModel trm = new TestResultModel();
                    Concept investigation = getInvestigationByTest(test, testTreeMap);
                    trm.setInvestigation(LaboratoryUtil.getConceptName(investigation));
                    trm.setSet(test.getConcept().getName().getName());
                    Concept concept = Context.getConceptService().getConcept(obs.getConcept().getConceptId());
                    trm.setTest(concept.getName().getName());
                    trm.setConcept(test.getConcept());
                    setTestResultModelValue(obs, trm);
                    trms.add(trm);
                }
            }
        }
        return trms;
    }
  
    private Concept getInvestigationByTest(LabTest test,
            Map<Concept, Set<Concept>> investigationTests) {
        for (Concept investigation : investigationTests.keySet()) {
            if (investigationTests.get(investigation).contains(test.getConcept())) {
                return investigation;
            }
        }
        return null;
    }
//normal format not lab set

    private void setTestResultModelValue(Obs obs, TestResultModel trm) {
        Concept concept = Context.getConceptService().getConcept(
                obs.getConcept().getConceptId());
        trm.setTest(concept.getName().getName());
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

                DiaConceptNumeric dia = Context.getService(LabService.class).getDiaConNumByConId(concept.getConceptId());
                if (dia.getConceptId() != null) {
                    String d = dia.getRefRange();
                    String[] dd = d.split("#");
                    String ddd = StringUtils.join(dd, "<br>");
                    // t.setRefRange(dia.getRefRange());
                    trm.setRefRange(ddd);
                }

                ConceptNumeric cn = Context.getConceptService().getConceptNumeric(concept.getConceptId());
                trm.setUnit(cn.getUnits());

                if (cn.getLowNormal() != null) {
                    trm.setLowNormal(cn.getLowNormal().toString());
                }
                if (cn.getHiNormal() != null) {
                    trm.setHiNormal(cn.getHiNormal().toString());
                }
            } else if (datatype.equalsIgnoreCase("Coded")) {
                trm.setValue(obs.getValueCoded().getName().getName());
            }
        }
    }

    private List<TestResultModel> formatTestResult(
            List<TestResultModel> testResultModels) {
        //  Collections.sort(testResultModels);
        List<TestResultModel> trms = new ArrayList<TestResultModel>();
        String investigation = null;
        String set = null;
        String set1 = null;
        for (TestResultModel trm : testResultModels) {
            if (!trm.getInvestigation().equalsIgnoreCase(investigation)) {
                investigation = trm.getInvestigation();
                TestResultModel t = new TestResultModel();
                t.setInvestigation(investigation);
                t.setLevel(TestResultModel.LEVEL_INVESTIGATION);
                //t.setSet(trm.getSet());
                trms.add(t);
            }

            if (!trm.getSet().equalsIgnoreCase(set)) { //direct test
                set = trm.getSet();
                if (!trm.getConcept().getConceptClass().getName().equalsIgnoreCase("LabSet")) {
                    trm.setSet(set);
                    trm.setLevel(TestResultModel.LEVEL_SET);
                    trms.add(trm);
                }
                /*
                 if (trm.getConcept().getConceptClass().getName().equalsIgnoreCase("LabSet")) {
                 TestResultModel t = new TestResultModel();
                 t.setSet(trm.getSet());
                 t.setLevel(TestResultModel.LEVEL_SET);
                 t.setEncounterId(trm.getEncounterId());
                 t.setTestId(trm.getTestId());
                 trms.add(t);
                 } */

            }

            if (trm.getConcept().getConceptClass().getName().equalsIgnoreCase("LabSet")) {

                trms.add(trm);
            }
        }
        return trms;
    }
}
