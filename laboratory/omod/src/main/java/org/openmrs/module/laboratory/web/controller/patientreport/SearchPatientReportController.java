package org.openmrs.module.laboratory.web.controller.patientreport;

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
import org.openmrs.module.laboratory.model.LabDoctorSeal;

@Controller("LaboratorySearchPatientReportController")
@RequestMapping("/module/laboratory/searchPatientReport.form")
public class SearchPatientReportController {

    @SuppressWarnings("unchecked")
    @RequestMapping(method = RequestMethod.GET)
    public String searchTest(
            @RequestParam(value = "date", required = false) String dateStr,
            @RequestParam(value = "patientId") Integer patientId,
            @RequestParam(value = "investigation", required = false) String investigation,
            @RequestParam(value = "doc", required = false) Integer doc,
            HttpServletRequest request, Model model) {
        LaboratoryService ls = (LaboratoryService) Context.getService(LaboratoryService.class);
        LabService labSer = Context.getService(LabService.class);
        MedisunService ms = Context.getService(MedisunService.class);
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        Date date = null;
//Property 'dergee' not found on type org.openmrs.module.hospitalcore.model.DocDetail
        if (doc != 0) {
            LabDoctorSeal ldseal = ls.getLabDocSealById(doc);
            model.addAttribute("docInfo", ldseal);
        }

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
                model.addAttribute("ageD", PatientUtils.estimateAge(birthday));
                model.addAttribute("age", patient.getAge());
            }
            List<DiaInvestigationSpecimen> diaSpcList = ls.getAllDiaSpecimen();

            List<Integer> bioBlood = new ArrayList<Integer>(); // For Blood Bio
            List<Integer> bioUrine = new ArrayList<Integer>(); // For Urine Bio

            List<Integer> urine24 = new ArrayList<Integer>(); // 24 Hours Urine
            urine24.add(4252);

            List<Integer> immBlood = new ArrayList<Integer>(); // Immunology Blood
            List<Integer> immUrine = new ArrayList<Integer>(); // Immunology Urine

            List<Integer> haeBlood = new ArrayList<Integer>(); // Haematology Blood

            List<Integer> pathStool = new ArrayList<Integer>(); // Path stool
            pathStool.add(3117);
            pathStool.add(5230);
            pathStool.add(5231);
            pathStool.add(5232);
            List<Integer> pathSoptUrine = new ArrayList<Integer>(); // path sopt urine
            pathSoptUrine.add(5143);
            pathSoptUrine.add(5144);
            pathSoptUrine.add(5145);
            List<Integer> pathUrine = new ArrayList<Integer>(); // Haematology Blood

            List<Integer> seroBlood = new ArrayList<Integer>(); // For Blood Serology
            // List<Integer> seroUrine = new ArrayList<Integer>(); // For Urine Serology

            for (int i = 0; i < diaSpcList.size(); i++) {//For blood 
                Integer bloodbio = diaSpcList.get(i).getBioBlood(); // bio blood
                Integer urinebio = diaSpcList.get(i).getBioUrine(); // bio urine
                Integer bloodimmu = diaSpcList.get(i).getImmuBlood(); // Immunology blood
                Integer urineimmu = diaSpcList.get(i).getImmuUrine(); // Immunology urine
                Integer bloodhae = diaSpcList.get(i).getHaeBlood(); // Haematology blood
                Integer urinePath = diaSpcList.get(i).getHaeUrine(); // Clinical Pathology urine
                Integer bloodSero = diaSpcList.get(i).getOne(); // Serology Blood  Database Store as One Column

                bioBlood.add(bloodbio);
                bioUrine.add(urinebio);
                immBlood.add(bloodimmu);
                immUrine.add(urineimmu);
                haeBlood.add(bloodhae);
                pathUrine.add(urinePath);
                seroBlood.add(bloodSero);
            }

            List<Integer> cs = new ArrayList<Integer>();  // Cervical Smear
            cs.add(5472);
            cs.add(5392);
            cs.add(5421);
            cs.add(5450);

            List<Integer> conId = new ArrayList<Integer>();
            for (int i = 0; i < te.size(); i++) { //using loop 
                Integer pres = te.get(i).getConcept().getId();
                conId.add(pres);
            }

            List<Integer> compare = new ArrayList<Integer>(conId);// conceptId temporary store in compare list
            immBlood.retainAll(compare); // Immunology Blood
            immUrine.retainAll(compare); // Immunology Urine

            haeBlood.retainAll(compare); //Hae Blood

            pathStool.retainAll(compare); // Pathology Stool
            pathSoptUrine.retainAll(compare); // Pathology spot urine
            pathUrine.retainAll(compare);
            urine24.retainAll(compare);

            cs.retainAll(compare);   //  

            bioBlood.retainAll(compare); // Bio Blood
            bioUrine.retainAll(compare); // Bio Urine

            seroBlood.retainAll(compare); // Ser Blood

            model.addAttribute("immBlood", immBlood); // For blood Clinical Immunology
            model.addAttribute("immUrine", immUrine); // For Urine Clinical Immunology

            model.addAttribute("haeBlood", haeBlood); // For Blood Haematology

            model.addAttribute("bioBlood", bioBlood); // For Urine Biochemistry
            model.addAttribute("bioUrine", bioUrine); // For Urine Biochemistry

            model.addAttribute("pathStool", pathStool); // For Stool Path
            model.addAttribute("pathSoptUrine", pathSoptUrine); // For spot urine Path
            model.addAttribute("pathUrine", pathUrine); //For urine Path
            model.addAttribute("seroBlood", seroBlood);
            model.addAttribute("urine24", urine24); // 24 Hours Urine

            model.addAttribute("cs", cs);  // Clinical Pathology cervical smear
            model.addAttribute("compare", compare);

            model.addAttribute("dList", diaSpcList);

            for (LabTest test : te) {

                Integer orderId = test.getOrder().getId();
                DiaPatientServiceBillItem dBillItem = labSer.getDiPatientBillItemByOrderId(orderId);
                Integer refBy = dBillItem.getDiaPatientServiceBill().getRefDocId();
                DocDetail docInfo = ms.getDocInfoById(refBy);
                model.addAttribute("refBy", docInfo);

                //  model.addAttribute("refBy",docInfo.getDoctorName() );
                if ((test.getEncounter().getId() != null) && (test.getConcept().getConceptClass().getName().equalsIgnoreCase("LabSet"))
                        //&& (test.getConcept().getId() != 2577) && (test.getConcept().getId() != 5158)
                        || (test.getConcept().getId() == 5148)  
                        || (test.getConcept().getId() == 3092) || (test.getConcept().getId() == 5158)
                        || (test.getConcept().getId() == 5225) || (test.getConcept().getId() == 5226)
                        || (test.getConcept().getId() == 5186) || (test.getConcept().getId() == 5185)
                        || (test.getConcept().getId() == 2215) || (test.getConcept().getId() == 2294)
                        || (test.getConcept().getId() == 2739) || (test.getConcept().getId() == 2232)
                        || (test.getConcept().getId() == 2738) || (test.getConcept().getId() == 2209)
                        || (test.getConcept().getId() == 2208) || (test.getConcept().getId() == 2214)
                        || (test.getConcept().getId() == 5687) || (test.getConcept().getId() == 2500)
                        || (test.getConcept().getId() == 2230) || (test.getConcept().getId() == 2234)
                        || (test.getConcept().getId() == 5198) || (test.getConcept().getId() == 2228)
                        || (test.getConcept().getId() == 2461) || (test.getConcept().getId() == 5199)
                        || (test.getConcept().getId() == 3993) || (test.getConcept().getId() == 2559)
                        || (test.getConcept().getId() == 3002) || (test.getConcept().getId() == 5291)
                        || (test.getConcept().getId() == 5301) || (test.getConcept().getId() == 5163)
                        || (test.getConcept().getId() == 2229) || (test.getConcept().getId() == 2554)
                        || (test.getConcept().getId() == 2502) || (test.getConcept().getId() == 5271)
                        || (test.getConcept().getId() == 3074) || (test.getConcept().getId() == 5266)
                        || (test.getConcept().getId() == 4248) || (test.getConcept().getId() == 4249)
                        || (test.getConcept().getId() == 4250) || (test.getConcept().getId() == 2227)
                        || (test.getConcept().getId() == 5860) || (test.getConcept().getId() == 5861)
                        || (test.getConcept().getId() == 5206) || (test.getConcept().getId() == 5213)
                        //Microbiology filter here 
                        || (test.getConcept().getId() == 5889)
                        //immu filter here 
                        || (test.getConcept().getId() == 5245) || (test.getConcept().getId() == 5246)
                        || (test.getConcept().getId() == 2509) || (test.getConcept().getId() == 2510)
                        || (test.getConcept().getId() == 4278) || (test.getConcept().getId() == 2568)
                        || (test.getConcept().getId() == 2569) || (test.getConcept().getId() == 5151)
                        || (test.getConcept().getId() == 2571) || (test.getConcept().getId() == 5257)
                        || (test.getConcept().getId() == 2938) || (test.getConcept().getId() == 3135)
                        || (test.getConcept().getId() == 2939) || (test.getConcept().getId() == 2944)
                        || (test.getConcept().getId() == 764) || (test.getConcept().getId() == 5157)
                        || (test.getConcept().getId() == 2617) || (test.getConcept().getId() == 5254)
                        //Serelogy filter here 
                        || (test.getConcept().getId() == 3967) || (test.getConcept().getId() == 4256)
                        || (test.getConcept().getId() == 5688) || (test.getConcept().getId() == 5218)
                        || (test.getConcept().getId() == 5267) || (test.getConcept().getId() == 5308)
                        || (test.getConcept().getId() == 5814) || (test.getConcept().getId() == 5366)
                        || (test.getConcept().getId() == 5221) || (test.getConcept().getId() == 2561)
                        || (test.getConcept().getId() == 2261) || (test.getConcept().getId() == 2262)
                        || (test.getConcept().getId() == 6043) || (test.getConcept().getId() == 6044)) {

                    Encounter encounter = test.getEncounter();
                    for (Obs obs : encounter.getAllObs()) {
                        TestModelNew t = new TestModelNew();
                        Concept concept = Context.getConceptService().getConcept(obs.getConcept().getConceptId());
                        t.setTest(obs.getValueText()); // result
                        t.setGroupName(test.getConcept().getId().toString());
                        t.setInvestigation(obs.getConcept().getId().toString()); // test id
                        t.setTestName(obs.getConcept().getName().getName()); // test name
                        t.setEncounterId(obs.getEncounter().getId());
                        t.setConcept(test.getConcept());

                        Integer con = test.getConcept().getId();
                        model.addAttribute("con", con);

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
                            t.setCodedId(obs.getValueCoded().getConceptId());
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
                    model.addAttribute("doc", doc);
                }
            }
        } catch (ParseException e) {
            e.printStackTrace();
            System.out.println("Error when parsing order date!");
            return null;
        }
        //  return "/module/laboratory/patientreport/search";
        if ((investigation.equals("2415")) || (investigation.equals("3117"))) {
            return "/module/laboratory/patientreport/search_us"; // Biochemistry
        } 
        else if (investigation.equals("5709")) {
            System.out.println("*************false **" + investigation);
            return "/module/laboratory/patientreport/search_single"; // Ascitic Fluid for Biochemical test and single
        } 
        else {
            return "/module/laboratory/patientreport/search";
        }
    }

    private List<TestResultModel> renderTests(List<LabTest> tests,
            Map<Concept, Set<Concept>> testTreeMap) {
        List<TestResultModel> trms = new ArrayList<TestResultModel>();
        for (LabTest test : tests) {
            if ((test.getEncounter().getId() != null)
                    && (!test.getConcept().getConceptClass().getName().equalsIgnoreCase("LabSet"))
                    && (test.getConcept().getId() != 5148)  
                    && (test.getConcept().getId() != 3092) && (test.getConcept().getId() != 5158)
                    && (test.getConcept().getId() != 5225) && (test.getConcept().getId() != 5226)
                    && (test.getConcept().getId() != 5186) && (test.getConcept().getId() != 5185)
                    && (test.getConcept().getId() != 2215) && (test.getConcept().getId() != 2294)
                    && (test.getConcept().getId() != 2739) && (test.getConcept().getId() != 2232)
                    && (test.getConcept().getId() != 2738) && (test.getConcept().getId() != 2232)
                    && (test.getConcept().getId() != 2738) && (test.getConcept().getId() != 2209)
                    && (test.getConcept().getId() != 2208) && (test.getConcept().getId() != 2214)
                    && (test.getConcept().getId() != 5687) && (test.getConcept().getId() != 2500)
                    && (test.getConcept().getId() != 2230) && (test.getConcept().getId() != 2234)
                    && (test.getConcept().getId() != 5198) && (test.getConcept().getId() != 2228)
                    && (test.getConcept().getId() != 2461) && (test.getConcept().getId() != 5199)
                    && (test.getConcept().getId() != 3993) && (test.getConcept().getId() != 2559)
                    && (test.getConcept().getId() != 3002) && (test.getConcept().getId() != 5291)
                    && (test.getConcept().getId() != 5301) && (test.getConcept().getId() != 5163)
                    && (test.getConcept().getId() != 2229) && (test.getConcept().getId() != 2554)
                    && (test.getConcept().getId() != 2502) && (test.getConcept().getId() != 5271)
                    && (test.getConcept().getId() != 3074) && (test.getConcept().getId() != 5266)
                    && (test.getConcept().getId() != 4248) && (test.getConcept().getId() != 4249)
                    && (test.getConcept().getId() != 4250) && (test.getConcept().getId() != 2227)
                    && (test.getConcept().getId() != 5860) && (test.getConcept().getId() != 5861)
                    && (test.getConcept().getId() != 5206) && (test.getConcept().getId() != 5213)
                    //Microbiology filter here 
                    && (test.getConcept().getId() != 5889)
                    ///immu concept start here 
                    && (test.getConcept().getId() != 5245) && (test.getConcept().getId() != 5246)
                    && (test.getConcept().getId() != 2509) && (test.getConcept().getId() != 2510)
                    && (test.getConcept().getId() != 4278) && (test.getConcept().getId() != 2568)
                    && (test.getConcept().getId() != 2569) && (test.getConcept().getId() != 5151)
                    && (test.getConcept().getId() != 2571) && (test.getConcept().getId() != 5257)
                    && (test.getConcept().getId() != 2938) && (test.getConcept().getId() != 3135)
                    && (test.getConcept().getId() != 2939) && (test.getConcept().getId() != 2944)
                    && (test.getConcept().getId() != 764) && (test.getConcept().getId() != 5157)
                    && (test.getConcept().getId() != 2617) && (test.getConcept().getId() != 5254)
                    //SERELOGY FILTER here
                    && (test.getConcept().getId() != 3967) && (test.getConcept().getId() != 4256)
                    && (test.getConcept().getId() != 5688) && (test.getConcept().getId() != 5218)
                    && (test.getConcept().getId() != 5267) && (test.getConcept().getId() != 5308)
                    && (test.getConcept().getId() != 5814) && (test.getConcept().getId() != 5366)
                    && (test.getConcept().getId() != 5221) && (test.getConcept().getId() != 2561)
                    && (test.getConcept().getId() != 2261) && (test.getConcept().getId() != 2262)
                    && (test.getConcept().getId() != 6043) && (test.getConcept().getId() != 6044)) {

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
        //  trm.setSet1(concept.getName().getShortName());
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
        Collections.sort(testResultModels);
        TestResultModel tr = new TestResultModel();
        List<String> tt = new ArrayList<String>();

        List<TestResultModel> trms = new ArrayList<TestResultModel>();
        String investigation = null;
        String set = null;

        for (TestResultModel trm : testResultModels) {
            if (!trm.getInvestigation().equalsIgnoreCase(investigation)) {
                investigation = trm.getInvestigation();
                TestResultModel t = new TestResultModel();
                trms.add(t);
            }

            if (!trm.getSet().equalsIgnoreCase(set)) { //direct test
                set = trm.getSet();
                if (!trm.getConcept().getConceptClass().getName().equalsIgnoreCase("LabSet")) {
                    trm.setSet(set);
                    trm.setLevel(TestResultModel.LEVEL_SET);
                    trms.add(trm);
                }
            }
            if (trm.getConcept().getConceptClass().getName().equalsIgnoreCase("LabSet")) {
                trms.add(trm);
            }
        }
        return trms;
    }
}
