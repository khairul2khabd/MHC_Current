 <%--
 *  Copyright 2013 Society for Health Information Systems Programmes, India (HISP India)
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
 *  author: Ghanshyam
 *  date:   20-02-2013
--%> 

<%@ include file="/WEB-INF/template/include.jsp" %>
<%@ include file="/WEB-INF/template/header.jsp" %>
<%@ include file="../includes/js_css.jsp" %>
<openmrs:require privilege="Add Patients" otherwise="/login.htm" redirect="/findPatient.htm" />
<openmrs:globalProperty key="hospitalcore.hospitalName" defaultValue="ddu" var="hospitalName"/>
<br/>

<script type="text/javascript">

	// Hospital name
	hospitalName = "${hospitalName}";

	// Districts
	var _districts = new Array();
	<c:forEach var="district" items="${districts}" varStatus="status">
		_districts[${status.index}] = "${district}";
	</c:forEach>
	
	// Upazilas
	//Ghanshyam - Sagar :  date- 15 Dec, 2012. Redmine issue's for Bangladesh : #510 and #511 and #512
	var _upazilas = new Array();
	<c:forEach var="upazila" items="${upazilas}" varStatus="status">
		_upazilas[${status.index}] = "${upazila}";
	</c:forEach>
	
	//Opds
	var _OPDs = "";
	<c:forEach var="OPD" items="${OPDs}" varStatus="status">
		_OPDs = _OPDs + "${OPD} |";
	</c:forEach>				
	
	/**
	 ** MODEL FROM CONTROLLER
	 **/
	MODEL = {
		patientIdentifier: "${patientIdentifier}",
		districts: _districts,
		upazilas: _upazilas,
		OPDs: _OPDs,
		referralHospitals: "${referralHospitals}",
		referralReasons: "${referralReasons}",
                countPatient:"${countPatient}"
	}
</script>
<jsp:include page="../includes/${hospitalName}/patientRegisterForm.jsp"/>

<%@ include file="/WEB-INF/template/footer.jsp" %>  