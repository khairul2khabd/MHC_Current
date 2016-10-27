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
<openmrs:require privilege="Manage Laboratory Worklist" otherwise="/login.htm" redirect="/module/laboratory/worklist.form" />
<openmrs:globalProperty key="laboratory.worklist.findAllInvestigation" defaultValue="false" var="findAllInvestigation" />
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
	
	.chosen {		
		background-color:yellow;
	}
</style>

<script type="text/javascript">

	var GLOBAL = {
		findAllInvestigation: ${findAllInvestigation}
	};

	jQuery(document).ready(function() {
		jQuery('#date').datepicker({yearRange:'c-30:c+30', dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true});
                
             jQuery("#phrase").keyup(function(event) {
            if (event.keyCode == 13) {
                getTests();
            }
        });   
                
    });
	
	/**
	 * GET ALL TESTS
	 */
	function getTests(){
		var date = jQuery("#date").val();
		var phrase = jQuery("#phrase").val();
		var investigation = jQuery("#investigation").val();
		
		validation = validate(investigation);		
		
		// GETTING THE TESTS
		if(validation.status){			
			jQuery.ajax({
				type : "GET",
				url : getContextPath() + "/module/laboratory/searchWorklist.form",
				data : ({
					date			: date,
					phrase			: phrase,
					investigation	: investigation
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
		} else {
			alert(validation.message);
		}		
	}
	
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
		
		<!-- ghanshyam 07/07/2012 New Requirement #307 Generate Consolidated Work List in laboratory module-->
		
		if(investigation>0){			
			validation.status = true;
		} 
		<%--ghanshyam 8-august-2012  New Requirement #319 [LABORATORY] Make Consolidated Work List an Option in the investigation drop down list --%>
		else if(investigation=="select"){
		        validation.status = false;
				validation.message = "Please select an investigation!";
		}
		else{
			if(GLOBAL.findAllInvestigation){
				validation.status = true;
			} 
			
		}		
		
		return validation;
	}
	
	// reschedule a test
		function rescheduleTest(orderId, rescheduledDate) {
			validateRescheduleDate(orderId, rescheduledDate);
		}
		
		// validate reschedule date
		function validateRescheduleDate(orderId, rescheduledDate){			
			validateRescheduleDateResult = false;
			jQuery.ajax({
				type : "GET",
				url : getContextPath() + "/module/laboratory/ajax/validateRescheduleDate.htm",
				data : ({				
					rescheduleDate : rescheduledDate
				}),
				success : function(data) {
					
					if (data.indexOf('success')>=0) {						
						jQuery.ajax({
							type : "POST",
							url : getContextPath() + "/module/laboratory/rescheduleTest.form",
							data : ({
								orderId : orderId,
								rescheduledDate : rescheduledDate
							}),
							success : function(data) {
								if (data.indexOf('success')>=0) {
									getTests();
								} else {
									alert(data);
								}
							},
							error : function(xhr, ajaxOptions, thrownError) {
								alert("ERROR " + xhr);
							}
						});
						tb_remove();
					} else {
						alert('Invalid reorder date! It must be after the current date');
					}
				},
				error : function(xhr, ajaxOptions, thrownError) {
					
				}
			});		
		}
	
	// complete a test
	function completeTest(testId) {		

		jQuery.ajax({
			type : "GET",
			url : getContextPath() + "/module/laboratory/ajax/completeTest.htm",
			data : ({
				testId : testId
			}),
			success : function(data) {
				if (data.indexOf('success')>=0) {
					getTests();
				} else {
					
				}
			},
			error : function(xhr, ajaxOptions, thrownError) {
				alert(thrownError);
			}
		});
	}
	
	//  enter result for a test
	function enterResult(testId){
		
		jQuery(".resultParameter").hide();
		
		jQuery.ajax({
			type : "GET",
			url : getContextPath() + "/module/laboratory/enterResult.form",
			data : ({
				testId : testId
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
	
</script> 

<div class="boxHeader"> 
	<strong>See patient List by choosing lab</strong>
</div>
<div class="box">
	Date:
	<input id="date" value="${currentDate}" style="text-align:right;"/>
	Patient ID/Name:
        <input id="phrase" value="MHC-"/>
	Investigation:
	<select name="investigation" id="investigation">
		<option value="0">Select Department</option>	
		<c:forEach var="investigation" items="${investigations}">
			<option value="${investigation.id}">${investigation.name.name}</option>
		</c:forEach>
		<option value="0">CONSOLIDATED LIST</option>	
	</select>
	 
        <input type="button" class="bu-normal" value="Get worklist" onClick="getTests();"/>
</div>

<div id="tests">
</div>

<%@ include file="/WEB-INF/template/footer.jsp" %>  