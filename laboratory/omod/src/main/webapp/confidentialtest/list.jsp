 <%--
 *  Copyright 2009 Society for Health Information Systems Programmes, India (HISP India)
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
--%> 
<%@ include file="/WEB-INF/template/include.jsp" %>
<%@ include file="/WEB-INF/template/header.jsp" %>
<%@ include file="../includes/js_css.jsp" %>
<br/>
<openmrs:require privilege="Manage Laboratory Confidential Test" otherwise="/login.htm" redirect="/module/laboratory/confidentialTest.form" />
<%@ include file="../localHeader.jsp" %>



<div class="boxHeader"> 
	<strong>Search patient</strong>
</div>
<div class="box">
	<div id="advSearch"></div>
</div>
<br/>
<div id="patientResult"></div>

<script>
	function showConfidentialTest(patientIdentifier){
		tb_show("confidential test", "addConfidentialTest.form?modal=true&width=600&height=320&patientIdentifier=" + patientIdentifier);
	}
	
	jQuery("#advSearch").toggleSearchBox({
		view:'laboratory_confidentialTest'
	});
</script>

<%@ include file="/WEB-INF/template/footer.jsp" %>  