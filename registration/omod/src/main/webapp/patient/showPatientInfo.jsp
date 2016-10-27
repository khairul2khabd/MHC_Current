 <%--
 *  Copyright 2009 Society for Health Information Systems Programmes, India (HISP India)
 *
 *  This file is part of Registration module.
 *
 *  Registration module is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.

 *  Registration module is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with Registration module.  If not, see <http://www.gnu.org/licenses/>.
 *
--%> 
<%@ include file="/WEB-INF/template/include.jsp" %>
<%@ include file="/WEB-INF/template/header.jsp" %>
<%@ include file="../includes/js_css.jsp" %>
<openmrs:require privilege="View Patients" otherwise="/login.htm" redirect="/module/registration/showPatientInfo.form" />
<openmrs:globalProperty key="hospitalcore.hospitalName" defaultValue="ddu" var="hospitalName"/>

<script type="text/javascript">
	var _attributes = new Array();
	<c:forEach var="entry" items="${patient.attributes}">
		_attributes[${entry.key}] = "${entry.value}";
	</c:forEach>
	
	var _observations = new Array();
	<c:forEach var="entry" items="${observations}">
		_observations[${entry.key}] = "${entry.value}";
	</c:forEach>
	
	/**
	 ** VALUES FROM MODEL
	 **/
	MODEL = {
		patientId: "${patient.patientId}",
		patientIdentifier: "${patient.identifier}",
		patientName: "${patient.fullname}",
		patientAge: "${patient.age}",
		patientGender: "${patient.gender}",
		patientAddress: "${patient.address}",
		patientAttributes: _attributes,
		observations: _observations,
		currentDateTime: "${currentDateTime}", 
                lastVisit : "${lastVisit}", // This add for SKH--> compare visit date
                currentDateVisit: "${currentDateVisit}", // This add for SKH--> compare visit date
		selectedOPD: "${selectedOPD}",
		selectedReffered:"${selectedReffered}",
		OPDs: "${OPDs}",
		dueDate: "${dueDate}",
		daysLeft: "${daysLeft}",
		reprint: "${param.reprint eq 'true'}",
		tempCategoryId: "${tempCategoryId}",
		opdWardId: "${opdWardId}"
	};
</script>
<jsp:include page="../includes/${hospitalName}/patientInfoForm.jsp"/>

<%@ include file="/WEB-INF/template/footer.jsp" %>  