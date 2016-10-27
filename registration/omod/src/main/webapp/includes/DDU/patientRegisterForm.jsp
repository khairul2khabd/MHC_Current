 <%--
 *  Copyright 2012 Society for Health Information Systems Programm's, India (HISP India)
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
 *  Author : Sagar Bele
 *  Date: 15-12-2012
--%>

<style>
.cell {
	border-top: 1px solid lightgrey;
	padding: 20px;
}

td.border {
	border-width: 1px;
	border-right: 0px;
	border-bottom: 1px;
	border-color: lightgrey;
	border-style: solid;
}
</style>
<script type="text/javascript">
	jQuery(document).ready(
			function() {
				jQuery("#patientRegistrationForm").fillForm(
						"patient.identifier==" + MODEL.patientIdentifier);
				jQuery('#calendar').datepicker({
					yearRange : 'c-100:c+100',
					dateFormat : 'dd/mm/yy',
					changeMonth : true,
					changeYear : true
				});
				jQuery('#birthdate').change(PAGE.checkBirthDate);
				PAGE.fillOptions("#districts", {
					data : MODEL.districts
				});
				PAGE.fillOptions("#upazilas", {
					data : MODEL.upazilas[0].split(',')
				});

				MODEL.OPDs = " ,Please select an OPD room to visit|"
						+ MODEL.OPDs;
				PAGE.fillOptions("#opdWard", {
					data : MODEL.OPDs,
					delimiter : ",",
					optionDelimiter : "|"
				});
				PAGE.fillOptions("#referralHospitals", {
					data : MODEL.referralHospitals,
					delimiter : ",",
					optionDelimiter : "|"
				});
				PAGE.fillOptions("#referralReasons	", {
					data : MODEL.referralReasons,
					delimiter : ",",
					optionDelimiter : "|"
				});

				jQuery("#searchbox").showPatientSearchBox(
						{
							searchBoxView : hospitalName + "/registration",
							resultView : "/module/registration/patientsearch/"
									+ hospitalName + "/findCreate",
							success : function(data) {
								PAGE.searchPatientSuccess(data);
							},
							beforeNewSearch : PAGE.searchPatientBefore
						});

				// hide free reason
				//ghanshyam 25-feb-2013 New Requirement #966[Billing]Add Paid Bill/Add Free Bill for Bangladesh module(removed Patient Category)
				/*
				jQuery("#freeField").hide();
				jQuery("#patCatGeneral").attr("checked", "checked");

				// binding
				jQuery("#free").click(function() {
					VALIDATORS.freeCheck();
				});
				jQuery("#patCatGeneral").click(function() {
					VALIDATORS.generalCheck();
				});
				*/
				
				jQuery("#calendarButton").click(function() {
					jQuery("#calendar").datepicker("show");
				});
				jQuery("#calendar").change(function() {
					jQuery("#birthdate").val(jQuery(this).val());
					PAGE.checkBirthDate();
				});
				jQuery("#birthdate").click(function() {
					jQuery("#birthdate").select();
				});
				
				jQuery("#patientGender").change(function() {
					VALIDATORS.genderCheck();
				});
				
			});

	/**
	 ** FORM
	 **/
	PAGE = {
		/** SUBMIT */
		submit : function() {

			// Capitalize fullname and relative name
			fullNameInCapital = StringUtils.capitalize(jQuery(
					"#nameOrIdentifier", jQuery("#patientSearchForm")).val());
			jQuery("#patientName", jQuery("#patientRegistrationForm")).val(
					fullNameInCapital);
			jQuery("#nameOrIdentifier", jQuery("#patientSearchForm")).val(
					fullNameInCapital);
			jQuery("#patientName", jQuery("#patientRegistrationForm")).val(
					fullNameInCapital);
			relativeNameInCaptital = StringUtils.capitalize(jQuery(
					"#patientRelativeName").val());
			jQuery("#patientRelativeName").val(relativeNameInCaptital);

			// Validate and submit
			if (this.validateRegisterForm()) {
				jQuery("#patientRegistrationForm")
						.mask(
								"<img src='" + openmrsContextPath + "/moduleResources/hospitalcore/ajax-loader.gif" + "'/>&nbsp;");
				jQuery("#patientRegistrationForm")
						.ajaxSubmit(
								{
									success : function(responseText,
											statusText, xhr) {
										json = jQuery.parseJSON(responseText);
										if (json.status == "success") {
											window.location.href = openmrsContextPath
													+ "/module/registration/showPatientInfo.form?patientId="
													+ json.patientId
													+ "&encounterId="
													+ json.encounterId;
										} else {
											alert(json.message);
										}
										jQuery("#patientRegistrationForm")
												.unmask();
									}
								});
			}
		},
		
		 //ghanshya,3-july-2013 #1962 Create validation for length of Health ID and National ID
		//Add Validation for checking duplicate National Id and Health Id
		checkHealthNationalID : function() {
		healthId=jQuery("#patientHealthId").val();
				nationalId=jQuery("#patientNationalId").val();
				jQuery.ajax({
				type : "GET",
				url : getContextPath() + "/module/registration/validatenationalidandhealthidreg.form",
				data : ({
					healthId			: healthId,
					nationalId			: nationalId
				}),
				success : function(data) {	
				    jQuery("#validationMessage").html(data);	
					 
		           } 
               });
			},	

		/** VALIDATE BIRTHDATE */
		checkBirthDate : function() {
			jQuery
					.ajax({
						type : "GET",
						url : getContextPath()
								+ "/module/registration/ajax/processPatientBirthDate.htm",
						data : ({
							birthdate : $("#birthdate").val()
						}),
						dataType : "json",
						success : function(json) {
							if (json.error == undefined) {
								if (json.estimated == "true") {
									jQuery("#birthdateEstimated").val("true")
								} else {
									jQuery("#birthdateEstimated").val("false");
								}

								jQuery("#estimatedAge").html(json.age);
								jQuery("#birthdate").val(json.birthdate);
								jQuery("#calendar").val(json.birthdate);
							} else {
								alert(json.error);
								jQuery("#birthdate").val("");
							}
						},
						error : function(xhr, ajaxOptions, thrownError) {
							alert(thrownError);
						}
					});
		},

		/** FILL OPTIONS INTO SELECT 
		 * option = {
		 * 		data: list of values or string
		 *		index: list of corresponding indexes
		 *		delimiter: seperator for value and label
		 *		optionDelimiter: seperator for options
		 * }
		 */
		fillOptions : function(divId, option) {
			jQuery(divId).empty();
			if (option.delimiter == undefined) {
				if (option.index == undefined) {
					jQuery.each(option.data, function(index, value) {
						if (value.length > 0) {
							jQuery(divId).append(
									"<option value='" + value + "'>" + value
											+ "</option>");
						}
					});
				} else {
					jQuery.each(option.data, function(index, value) {
						if (value.length > 0) {
							jQuery(divId).append(
									"<option value='" + option.index[index] + "'>"
											+ value + "</option>");
						}
					});
				}
			} else {
				options = option.data.split(option.optionDelimiter);
				jQuery.each(options, function(index, value) {
					values = value.split(option.delimiter);
					optionValue = values[0];
					optionLabel = values[1];
					if (optionLabel != undefined) {
						if (optionLabel.length > 0) {
							jQuery(divId).append(
									"<option value='" + optionValue + "'>"
											+ optionLabel + "</option>");
						}
					}
				});
			}
		},

		/** CHANGE DISTRICT */
		changeDistrict : function() {

			// get the list of upazilas
			upazilaList = "";
			selectedDistrict = jQuery("#districts option:checked").val();
			jQuery.each(MODEL.districts, function(index, value) {
				if (value == selectedDistrict) {
					upazilaList = MODEL.upazilas[index];
				}
			});

			// fill upazilas into upazila dropdown
			this.fillOptions("#upazilas", {
				data : upazilaList.split(",")
			});
		},

		/** SHOW OR HIDE REFERRAL INFO */
		toogleReferralInfo : function(obj) {
			checkbox = jQuery(obj);
			if (checkbox.is(":checked")) {
				jQuery("#referralDiv").show();
			} else {
				jQuery("#referralDiv").hide();
			}
		},

		/** CALLBACK WHEN SEARCH PATIENT SUCCESSFULLY */
		searchPatientSuccess : function(data) {
			jQuery("#numberOfFoundPatients")
					.html(
							"Similar patients: "
									+ data.totalRow
									+ "(<a href='javascript:PAGE.togglePatientResult();'>show/hide</a>)");
		},

		/** CALLBACK WHEN BEFORE SEARCHING PATIENT */
		searchPatientBefore : function(data) {
			jQuery("#numberOfFoundPatients")
					.html(
							"<center><img src='" + openmrsContextPath + "/moduleResources/hospitalcore/ajax-loader.gif" + "'/></center>");
			jQuery("#patientSearchResult").hide();
		},

		/** TOGGLE PATIENT RESULT */
		togglePatientResult : function() {
			jQuery("#patientSearchResult").toggle();
		},

		/** VALIDATE FORM */
		validateRegisterForm : function() {

			if (StringUtils.isBlank(jQuery("#patientName").val())) {
				alert("Please enter patient name");
				return false;
			} 
			else {
				value = jQuery("#patientName").val();
				value = value.toUpperCase();
				pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 -";
				for (i = 0; i < value.length; i++) {
					if (pattern.indexOf(value[i]) < 0) {
						alert("Please enter patient name/identifier in correct format.");
						return false;
					}
				}
			}

			if (StringUtils.isBlank(jQuery("#patientRelativeName").val())) {
				alert("Please enter relative name");
				return false;
			} else {
				if (jQuery("#patientGender").val() == "M"||jQuery("#patientGender").val() == "F") {
					if (jQuery("#patientRegistrationForm input[name=person.attribute.15]:checked").length == 0) {
						alert("Please select relative name type");
						return false;
					}
				}
			}

			if (StringUtils.isBlank(jQuery("#birthdate").val())) {
				alert("Please enter birthdate or age");
				return false;
			} 
			
			if (jQuery("#patientGender").val() == "Any") {
				alert("Please select gender");
				return false;
			} 
			
			if (StringUtils.isBlank(jQuery("#opdWard").val())) {
				alert("Please select OPD ward");
				return false;
			}
			;

			 //ghanshyam 25-feb-2013 New Requirement #966[Billing]Add Paid Bill/Add Free Bill for Bangladesh module(removed Patient Category)
            /*
			if (!VALIDATORS.validatePatientCategory()) {
				return false;
			}
			*/

			if (!StringUtils.isBlank(jQuery("#patientPhoneNumber").val())) {
				if (!StringUtils.isDigit(jQuery("#patientPhoneNumber").val())) {
					alert("Please enter phone number in correct format");
					return false;
				}
			}

			        //ghanshya,3-july-2013 #1962 Create validation for length of Health ID and National ID
			       //Add Validation for checking duplicate National Id and Health Id
			        PAGE.checkHealthNationalID();
		            alert("click ok to proceed");
		            abc=jQuery("#abc").val();
					def=jQuery("#def").val();
					nd=jQuery("#nId").val();
					hd=jQuery("#hId").val();
					nId=jQuery("#nId").val();
					hId=jQuery("#hId").val();
				
					if(typeof nId!="undefined" || typeof hId!="undefined"){
					if(nId=="1" && hId=="1"){
					//document.getElementById("nationalIdValidationMessage").innerHTML="Patient already registered with this National id";
					//document.getElementById("healthIdValidationMessage").innerHTML="Patient already registered with this Health id";
                    //jQuery("#nationalIdValidationMessage").show();
                    //jQuery("#healthIdValidationMessage").show();
		            alert("Patient already registered with this National id and Health id");
					return false
		            }
		            else if(nId=="1"){
                    //document.getElementById("nationalIdValidationMessage").innerHTML="Patient already registered with this National id";
                    //jQuery("#nationalIdValidationMessage").show();
                    //jQuery("#healthIdValidationMessage").hide();
		            alert("Patient already registered with this National id");
                    return false;					
		            }
		            else if(hId=="1"){
		             //document.getElementById("healthIdValidationMessage").innerHTML="Patient already registered with this Health id";
                     //jQuery("#healthIdValidationMessage").show();
                     //jQuery("#nationalIdValidationMessage").hide();
		             alert("Patient already registered with this Health id");	
					 return false;
		            }
		            }
		            else{
		            alert("please try again");
		            return false;
		            }
			
			return true;
		}
	};

	/**
	 ** VALIDATORS
	 **/
	VALIDATORS = {

		/** VALIDATE PATIENT CATEGORY */
		//ghanshyam 25-feb-2013 New Requirement #966[Billing]Add Paid Bill/Add Free Bill for Bangladesh module(removed Patient Category)
		/*
		validatePatientCategory : function() {
			if (jQuery("#patCatGeneral").attr('checked') == false
					&& jQuery("#free").attr('checked') == false) {
				alert('You didn\'t choose any of the patient categories!');
				return false;
			} else {
				if (jQuery("#free").attr('checked')) {
					if (jQuery("#freeReason").val().length <= 0) {
						alert('Please enter Reason for Free');
						return false;
					}
				}
				
				return true;
			} 
		},
		*/

	
		/** CHECK WHEN FREE CATEGORY IS SELECTED */
		//ghanshyam 25-feb-2013 New Requirement #966[Billing]Add Paid Bill/Add Free Bill for Bangladesh module(removed Patient Category)
		/*
		freeCheck : function() {
			if (jQuery("#free").is(':checked')) {
				jQuery("#freeField").show();
				if (jQuery("#patCatGeneral").is(":checked"))
					jQuery("#patCatGeneral").removeAttr("checked");
			} else {
				jQuery("#freeReason").val("");
				jQuery("#freeField").hide();
			}
		},
		*/

	

		/** CHECK WHEN GENERAL CATEGORY IS SELECTED */
		//ghanshyam 25-feb-2013 New Requirement #966[Billing]Add Paid Bill/Add Free Bill for Bangladesh module(removed Patient Category)
		/*
		generalCheck : function(obj) {
			if (jQuery("#patCatGeneral").is(':checked')) {
				
				if (jQuery("#free").is(":checked")) {
					jQuery("#free").removeAttr("checked");
					jQuery("#freeReason").val("");
					jQuery("#freeField").hide();
				}
			}
		},
		*/

			
		/*
		 * Check patient gender
		 */
		genderCheck : function() {

			jQuery("#patientRelativeNameSection").empty();
			if (jQuery("#patientGender").val() == "M") {
				jQuery("#patientRelativeNameSection")
						.html(
								'<input type="radio" name="person.attribute.15" value="Son of" checked="checked"/> Son of');
			} else if(jQuery("#patientGender").val() == "F"){
				jQuery("#patientRelativeNameSection")
						.html(
								'<input type="radio" name="person.attribute.15" value="Daughter of"/> Daughter of <input type="radio" name="person.attribute.15" value="Wife of"/> Wife of');
			}else if(jQuery("#patientGender").val() == "O"){
				jQuery("#patientRelativeNameSection")
				.html(
				'<input hidden type="radio" name="person.attribute.15" value="Relative of" checked="checked"/>');
			}
		}


	};
</script>

<center><h2><font size="5"><span style="color: highlight">Patient Registration</span></font></h2></center> 
<div id="patientSearchResult"></div>
<form id="patientRegistrationForm" method="POST">
	<table cellspacing="0">
		<tr>
                    <td valign="top" class="cell"><b>Name <span style="color: red">*</span></b>
			</td>
			<td class="cell"><input id="patientName" type="hidden"
				name="patient.name" />
				<div id="searchbox"></div>
				<div id="numberOfFoundPatients"></div>
			</td>
			<td class="cell"><b>ID Number <span style="color: red">* &nbsp;&nbsp; <input readonly
						name="patient.identifier" style="border: none;width: 250px;" />
			</b>
			</td>

		</tr>
		<tr>
			<td class="cell"><b>Demographics <span style="color: red">*</span></b>
			</td>
			<td class="cell">dd/mm/yyyy<br />
				<table>
					<tr>
						<td>Age</td>
						<td>Birthdate</td>
						<td>Gender</td>
					</tr>
					<tr>
						<td><span id="estimatedAge"></span>
						</td>
						<td><input type="hidden" id="calendar" /> <input
							id="birthdate" name="patient.birthdate" /> <img
							id="calendarButton"
							src="moduleResources/registration/calendar.gif" /> <input
							id="birthdateEstimated" type="hidden"
							name="patient.birthdateEstimate" value="true" />
						</td>
						<td><select id="patientGender" name="patient.gender">
								<option value="Any"></option>
								<option value="M">Male</option>
								<option value="F">Female</option>
								<option value="O">Others</option>
						</select>
						</td>
					</tr>
				</table>
			</td>
			<td rowspan="3" class="border">
			<%-- ghanshyam 25-02-2013 New Requirement #966[Billing]Add Paid Bill/Add Free Bill for Bangladesh module(removed Patient Category)--%>
			<%--
			<b>&nbsp;&nbsp;Patient category</b><br />
			--%>
				<table cellspacing="10">
				<%--
					<tr>
						<td><input id="patCatGeneral" type="checkbox"
							name="person.attribute.14" value="General" /> General</td>
						<td><input id="free" type="checkbox"
							name="person.attribute.14" value="Free" /> Free</td>
					</tr>
					<tr><td></td>
						<td><span id="freeField"> Reason: <input
								id="freeReason" name="person.attribute.19" />
						</span>
						</td>
					</tr>
					--%>
					<tr>
						<td><b>National ID:</b></td>
							<td> 
								<input id="patientNationalId" name="patient.attribute.20" />
							<!-- ghanshya,3-july-2013 #1962 Create validation for length of Health ID and National ID -->
						    <td><span style="color: red;"
							id="nationalIdValidationMessage"> </span>
						    </td>
							</td>
					</tr>
					
					<%-- ghanshyam  20-may-2013 #1648 capture Health ID and Registration Fee Type --%>
					<tr>
						<td><b>Health ID:</b></td>
						<td><input id="patientHealthId" name="patient.attribute.24" />
						<!-- ghanshya,3-july-2013 #1962 Create validation for length of Health ID and National ID -->
						<td><span style="color: red;" id="healthIdValidationMessage">
						</span>
						</td>
						</td>
					</tr>
					
					<tr>
						<td><b>Weight:</b></td>
							<td> 
								<input id="patientWeight" name="patient.attribute.21"  />
							</td>
					</tr>
					
					<tr>
						<td><b>Blood Pressure:</b></td>
							<td> 
								<input id="patientBloodPressure" name="patient.attribute.22" />
							</td>
					</tr>
					
					<tr>
						<td><b>History:</b></td>
							<td> 
								<input id="patientHistory" name="patient.attribute.23" />
							</td>
					</tr>
					<!-- ghanshya,3-july-2013 #1962 Create validation for length of Health ID and National ID -->
					<div id="validationMessage"></div>
				</table></td>
		</tr>
		<tr>		</tr>
		<tr>
			<td class="cell"><b>Address</b>
			</td>
			<td class="cell">
				<table>
					<tr>
						<td>Postal Address:</td>
						<td> 
							<input id="patientPostalAddress" name="patient.address.postalAddress" style="width: 300px;" />
						</td>
					</tr>
					<tr>
						<td>District:</td>
						<td><select id="districts" name="patient.address.district"
							onChange="PAGE.changeDistrict();" style="width: 200px;">
						</select>
						</td>
					</tr>
					<tr>
						<td>Upazila:</td>
						<td><select id="upazilas" name="patient.address.upazila"
							style="width: 200px;">
						</select>
						</td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td class="cell"><b>Phone number</b>
			</td>
			<td class="cell"><input id="patientPhoneNumber"
				name="person.attribute.16" style="width: 200px;" />
			</td>
		</tr>
		<tr>
			<td class="cell"><b>Relative Name <span style="color: red">*</span></b>
			</td>
			<td class="cell">
				<div id="patientRelativeNameSection"></div> <input
				id="patientRelativeName" name="person.attribute.8"
				style="width: 200px;" /></td>

			<b>Visit Information</b>
			<br />
			<td class="cell"><b>Referral Information</b><br /> <input
				type="checkbox" id="referred"
				onClick="PAGE.toogleReferralInfo(this);" name="patient.referred"
				value="referred" /> Referred<br />
				<div id="referralDiv" style="display: none;">
					<table>
						<tr>
							<td>Referred From</td>
							<td><select id="referralHospitals"
								name="patient.referred.from" style="width: 200px;">
							</select>
							</td>
						</tr>
						<tr>
							<td>Referral Type</td>
							<td><select id="referralReasons"
								name="patient.referred.reason" style="width: 200px;">
							</select>
							</td>
						</tr>
					</table>
				</div> <b>OPD Room to Visit: <span style="color: red">*</span></b> <select id="opdWard"
				name="patient.opdWard">
			</select>
			</td>


		</tr>
		<tr>
			<td colspan="3" style="padding: 0em 30em 0em 30em;"><input
				type="button" value="Save" onclick="PAGE.submit();" /> <input
				type="button" value="Reset"
				onclick="window.location.href=window.location.href" /></td>
		</tr>
	</table>
</form>
