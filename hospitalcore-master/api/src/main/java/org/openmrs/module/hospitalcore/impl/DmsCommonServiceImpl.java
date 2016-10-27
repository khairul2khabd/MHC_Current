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
package org.openmrs.module.hospitalcore.impl;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.Concept;
import org.openmrs.ConceptName;
import org.openmrs.PatientIdentifier;
import org.openmrs.api.APIException;
import org.openmrs.api.impl.BaseOpenmrsService;
import org.openmrs.module.hospitalcore.DmsCommonService;
import org.openmrs.module.hospitalcore.db.DmsCommonDAO;
import org.openmrs.module.hospitalcore.model.DiaBillingQueue;
import org.openmrs.module.hospitalcore.model.DmsOpdUnit;
import org.openmrs.module.hospitalcore.model.PatientSearch;

public class DmsCommonServiceImpl extends BaseOpenmrsService implements
        DmsCommonService {

    private Log log = LogFactory.getLog(this.getClass());

    public DmsCommonServiceImpl() {
    }

    protected DmsCommonDAO dao;

    public DmsCommonDAO getDao() {
        return dao;
    }

    public void setDao(DmsCommonDAO dao) {
        this.dao = dao;
    }

    public ConceptName getOpdWardNameByConceptId(Concept con)
            throws APIException {
        return dao.getOpdWardNameByConceptId(con);
    }

    public List<DmsOpdUnit> getOpdActivatedIdList() {
        return dao.getOpdActivatedIdList();
    }

    public DiaBillingQueue saveDiaBillingQueue(DiaBillingQueue diaBillingQueue) throws APIException {
        return dao.saveDiaBillingQueue(diaBillingQueue);
    }

    public PatientSearch getPatientById(int patientId) throws APIException {
        return dao.getPatientById(patientId);
    }

    public PatientSearch savePatientSearch(PatientSearch patientSearch) throws APIException {
        return dao.savePatientSearch(patientSearch);
    }

    public PatientIdentifier getPatIdentByPatientId(int patientId) throws APIException {
        return dao.getPatIdentByPatientId(patientId);
    }

    public PatientIdentifier reSavePatientIde(PatientIdentifier patientIdentifier) throws APIException {
        return dao.reSavePatientIde(patientIdentifier);
    }

 
}
