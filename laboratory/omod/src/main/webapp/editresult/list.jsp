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
<openmrs:require privilege="Edit Laboratory Result" otherwise="/login.htm" redirect="/module/laboratory/editResult.form" />
<openmrs:globalProperty key="hospitalcore.hospitalName" defaultValue="ddu" var="hospitalName"/>
<%@ include file="../localHeader.jsp" %>

<style>
	.parameter {
		width: 280px;
		padding: 5px;
		margin: 5px;
		float: left;
		text-align: center;
		border: 1px solid black;
	}
</style>

<script type="text/javascript">

	jQuery(document).ready(function() {
		jQuery('#date').datepicker({yearRange:'c-30:c+30', dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true});
		jQuery("#searchbox").showPatientSearchBox({				
			searchBoxView: "${hospitalName}/default",			
			resultView: "/module/laboratory/patientsearch/${hospitalName}/editresult",		
			target: "#patientResult",
			beforeNewSearch: function(){
				jQuery("#patientSearchResultSection").hide();
			},
			success: function(data){
				jQuery("#patientSearchResultSection").show();
			}
		});	
    });
	
	/**
	 * GET ALL TESTS
	 * @patientIdentifier patient identifier
	 */	
	function getTests(patientIdentifier){
		var date = jQuery("#date").val();
		var phrase = patientIdentifier;
		var investigation = jQuery("#investigation").val();
		jQuery.ajax({
			type : "GET",
			url : getContextPath() + "/module/laboratory/searchCompletedTests.form",
			data : ({
				date			: date,
				phrase			: phrase,
				investigation	: investigation
			}),
			success : function(data) {				
				jQuery("#completedTests").html(data);
				jQuery("#patientSearchResultSection").hide();
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert(thrownError);
			}
		});
	}
	
	//  enter result for a test
	function enterResult(testId, conceptId, encounterId){
	
		jQuery(".resultParameter").hide();
		
		jQuery.ajax({
			type : "GET",
			url : getContextPath() + "/module/laboratory/showForm.form",
			data : ({
				encounterId : encounterId,
				conceptId	: conceptId
			}),
			success : function(data) {
				jQuery("#contentForm" + testId).html(data);				
				jQuery("#row" + testId).show();
				formatParameters();
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert(thrownError);
			}
		});
	}
	
	// format parameters for entering results
	function formatParameters(){
		jQuery(".parameter").hover(
			function(){
				jQuery(this).css("background-color", "#3399FF");
			}, 
			function(){
				jQuery(this).css("background-color", "#FFFFFF");
			}
		);
	}
	
	// submit form
	function submit(testId){
		validationResult = jQuery("#contentForm" + testId).valid();
		if(validationResult){
			jQuery("#contentForm" + testId).ajaxSubmit({
				success: function (responseText, statusText, xhr){					
					if(responseText.indexOf('success')>=0){						
						getTests();
						completeTest(testId);						
					}
				}
			});					
		}
	}
	
	/**
	 * SHOW PATIENT SEARCH RESULT
	 */
	function showPatientSearchResult(){
		jQuery('#patientSearchResultSection').show();
	}
</script> 

<div class="boxHeader"> 
	<strong>See patient List by choosing lab</strong>
</div>
<div class="box">
	Date:
	<input id="date" value="${currentDate}" style="text-align:right;"/>	
	Investigation:
	<select name="investigation" id="investigation">
		<option value="0">Select an investigation</option>
		<c:forEach var="investigation" items="${investigations}">
			<option value="${investigation.id}">${investigation.name.name}</option>
		</c:forEach>	
	</select>
	<a href="javascript:showPatientSearchResult()">Show search results</a>
	
	<div id="searchbox"></div>	
</div>

<br/>

<div id="patientSearchResultSection" style="display:none;">
	<div class="boxHeader">Found Patients</div>
	<div class="box" id="patientResult"></div>
</div>

<div id="completedTests">
</div>

<%@ include file="/WEB-INF/template/footer.jsp" %>  