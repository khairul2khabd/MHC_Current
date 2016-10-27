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
<openmrs:require privilege="Print Laboratory Worklist" otherwise="/login.htm" redirect="/module/laboratory/printWorklist.form" />
<%--ghanshyam 8-august-2012  New Requirement #319 [LABORATORY] Make Consolidated Print Work List an Option in the investigation drop down list --%>
<openmrs:globalProperty key="laboratory.printworklist.findAllInvestigation" defaultValue="false" var="findAllInvestigation" />
<%@ include file="../localHeader.jsp" %>

<script type="text/javascript">
<%--ghanshyam 8-august-2012  New Requirement #319 [LABORATORY] Make Consolidated Print Work List an Option in the investigation drop down list --%>
var GLOBAL = {
		findAllInvestigation: ${findAllInvestigation}
	};

	jQuery(document).ready(function() {
		jQuery('#date').datepicker({yearRange:'c-30:c+30', dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true});
    });
	
	// get all tests
	function getTests(){
		var date = jQuery("#date").val();
		var phrase = jQuery("#phrase").val();
		var investigation = jQuery("#investigation").val();
		<%--ghanshyam 8-august-2012  New Requirement #319 [LABORATORY] Make Consolidated Print Work List an Option in the investigation drop down list --%>
		validation = validate(investigation);	
		//ghanshyam 20/07/2012 New Requirement #320 [LABORATORY] Show Results as an Option
		var showResults=document.getElementById("showResults").checked;
		<%--ghanshyam 8-august-2012  New Requirement #319 [LABORATORY] Make Consolidated Print Work List an Option in the investigation drop down list --%>
		if(validation.status){			
			jQuery.ajax({
			type : "GET",
			url : getContextPath() + "/module/laboratory/searchPrintWorklist.form",
			data : ({
				date			: date,
				phrase			: phrase,
				investigation	: investigation,
				//ghanshyam 20/07/2012 New Requirement #320 [LABORATORY] Show Results as an Option
				showResults		: showResults
			}),
			success : function(data) {
				jQuery("#tests").html(data);	
				if(testNo>0){
					tb_init("a.thickbox"); // init to show thickbox
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert(thrownError);
			}
		});
	} 
	<%--ghanshyam 8-august-2012  New Requirement #319 [LABORATORY] Make Consolidated Print Work List an Option in the investigation drop down list --%>
	else {
			alert(validation.message);
		}		
	}
	
	<%--ghanshyam 8-august-2012  New Requirement #319 [LABORATORY] Make Consolidated Work List an Option in the investigation drop down list --%>
	/*
	 * Check whether user is allowed to get tests from all investigations
	 * return @validated {status, message}
	 */
	function validate(investigation){
	//alert(investigation);
		var validation = {
			status: "true",
			message: "fine"
		};
		
		if(investigation>0){			
			validation.status = true;
		} 
		else if(investigation=="select"){
		        validation.status = false;
				validation.message = "Please select an investigation to proceed!";
		}
		else{
			if(GLOBAL.findAllInvestigation){
				validation.status = true;
			} 
			
		}		
		
		return validation;
	}
	
	function printWorklist(){
		jQuery("#printArea").printArea({
			mode : "popup",
			popClose : true
		});
	}
	
	// ghanshyam 24-sept-2012 New Requirement #361 [Laboratory] Export to Excel option in print worklist
	function exportWorklist(){
		var date = jQuery("#date").val();
		var phrase = jQuery("#phrase").val();
		var investigation = jQuery("#investigation").val();
		validation = validate(investigation);	
		var showResults=document.getElementById("showResults").checked;
		if(validation.status){			
		window.location = getContextPath() + "/module/laboratory/download.form?date=" + date + "&phrase=" + phrase + "&investigation=" + investigation + "&showResults=" + showResults;
	} 
	else {
			alert(validation.message);
		}		
	}
	
</script> 

<div class="boxHeader"> 
	<strong>See patient List by choosing lab</strong>
</div>
<div class="box">
	Date:
	<input id="date" value="${currentDate}" style="text-align:right;"/>
	Patient ID/Name:
	<input id="phrase"/>
	Investigation:
	<select name="investigation" id="investigation">
	<option value="select">Select</option>	
		<c:forEach var="investigation" items="${investigations}">
			<option value="${investigation.id}">${investigation.name.name}</option>
		</c:forEach>
		<option value="0">CONSOLIDATED LIST</option>	
	</select>
	<input type="button" value="Print worklist" class="bu-normal" onClick="printWorklist();"/>
	<input type="button" value="Export worklist" class="bu-normal" onClick="exportWorklist();" />
	<br/>
	<input type="button" value="Get worklist" class="bu-normal" onClick="getTests();"/>
	<%-- ghanshyam 20/07/2012 New Requirement #320 [LABORATORY] Show Results as an Option --%>
	<input type="checkbox" name="showResults" id="showResults" checked="checked"> with results<BR>
</div>

<div id="tests">
</div>

<%@ include file="/WEB-INF/template/footer.jsp" %>  