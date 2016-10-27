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
<%@ include file="/WEB-INF/template/include.jsp"%>
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
                    yearRange: 'c-100:c+100',
                    dateFormat: 'dd/mm/yy',
                    changeMonth: true,
                    changeYear: true
                });
                jQuery('#birthdate').change(PAGE.checkBirthDate);
                PAGE.fillOptions("#districts", {
                    data: MODEL.districts
                });
                PAGE.fillOptions("#upazilas", {
                    data: MODEL.upazilas[0].split(',')
                });

                MODEL.OPDs = // " ,Please select an OPD room to visit|"
                        //+ MODEL.OPDs;
                        PAGE.fillOptions("#opdWard", {
                            data: MODEL.OPDs,
                            delimiter: ",",
                            optionDelimiter: "|"
                        });
                PAGE.fillOptions("#referralHospitals", {
                    data: MODEL.referralHospitals,
                    delimiter: ",",
                    optionDelimiter: "|"
                });
                PAGE.fillOptions("#referralReasons	", {
                    data: MODEL.referralReasons,
                    delimiter: ",",
                    optionDelimiter: "|"
                });
                jQuery("#searchbox").showPatientSearchBox(
                        {
                            searchBoxView: hospitalName + "/registration",
                            resultView: "/module/registration/patientsearch/"
                                    + hospitalName + "/findCreate",
                            success: function(data) {
                                PAGE.searchPatientSuccess(data);
                            },
                            beforeNewSearch: PAGE.searchPatientBefore
                        });

                // hide free reason
                //ghanshyam 25-feb-2013 New Requirement #966[Billing]Add Paid Bill/Add Free Bill for Bangladesh module(removed Patient Category)

                jQuery("#freeField").hide();
                jQuery("#patCatGeneral").attr("checked", "checked");

                // binding
                jQuery("#dependent").click(function() {
                    VALIDATORS.dependentCheck();
                });
                jQuery("#patCatGeneral").click(function() {
                    VALIDATORS.governmentCheck();
                });

                jQuery("#patCatNonGov").click(function() {
                    VALIDATORS.nonGovCheck();
                });

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
        submit: function() {

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

            jQuery('#selectedDocId option').each(function(i) {
                jQuery(this).attr("selected", "selected");
            });

            jQuery('#selectedMarId option').each(function(i) {
                jQuery(this).attr("selected", "selected");
            });



            // Validate and submit
            if (this.validateRegisterForm()) {
                jQuery("#patientRegistrationForm")
                        .mask(
                                "<img src='" + openmrsContextPath + "/moduleResources/hospitalcore/ajax-loader.gif" + "'/>&nbsp;");
                jQuery("#patientRegistrationForm")
                        .ajaxSubmit(
                                {
                                    success: function(responseText,
                                            statusText, xhr) {
                                        json = jQuery.parseJSON(responseText);
                                        if (json.status == "success") {
                                            window.location.href = openmrsContextPath
                                                    // + "/module/registration/showPatientInfo.form?patientId="
                                                    // + json.patientId
                                                    // + "&encounterId="
                                                    // + json.encounterId;
                                                    + "/findPatient.htm" // this for only show current page
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
        checkHealthNationalID: function() {
            healthId = jQuery("#patientHealthId").val();
            nationalId = jQuery("#patientNationalId").val();
            jQuery.ajax({
                type: "GET",
                url: getContextPath() + "/module/registration/validatenationalidandhealthidreg.form",
                data: ({
                    healthId: healthId,
                    nationalId: nationalId
                }),
                success: function(data) {
                    jQuery("#validationMessage").html(data);

                }
            });
        },
        /** VALIDATE BIRTHDATE */
        checkBirthDate: function() {
            jQuery
                    .ajax({
                        type: "GET",
                        url: getContextPath()
                                + "/module/registration/ajax/processPatientBirthDate.htm",
                        data: ({
                            birthdate: $("#birthdate").val()
                        }),
                        dataType: "json",
                        success: function(json) {
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
                        error: function(xhr, ajaxOptions, thrownError) {
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
        fillOptions: function(divId, option) {
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
        changeDistrict: function() {

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
                data: upazilaList.split(",")
            });
        },
        /** SHOW OR HIDE REFERRAL INFO */
        toogleReferralInfo: function(obj) {
            checkbox = jQuery(obj);
            if (checkbox.is(":checked")) {
                jQuery("#referralDiv").show();
            } else {
                jQuery("#referralDiv").hide();
            }
        },
        /** CALLBACK WHEN SEARCH PATIENT SUCCESSFULLY */
        searchPatientSuccess: function(data) {
            jQuery("#numberOfFoundPatients")
                    .html(
                            "Similar patients: "
                            + data.totalRow
                            + "(<a href='javascript:PAGE.togglePatientResult();'>show/hide</a>)");
        },
        /** CALLBACK WHEN BEFORE SEARCHING PATIENT */
        searchPatientBefore: function(data) {
            jQuery("#numberOfFoundPatients")
                    .html(
                            "<center><img src='" + openmrsContextPath + "/moduleResources/hospitalcore/ajax-loader.gif" + "'/></center>");
            jQuery("#patientSearchResult").hide();
        },
        /** TOGGLE PATIENT RESULT */
        togglePatientResult: function() {
            jQuery("#patientSearchResult").toggle();
        },
        /** VALIDATE FORM */
        validateRegisterForm: function() {

            if (StringUtils.isBlank(jQuery("#patientName").val())) {
                alert("Please enter patient name");
                return false;
            }
            else {
                value = jQuery("#patientName").val();
                value = value.toUpperCase();
                pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 -./";
                for (i = 0; i < value.length; i++) {
                    if (pattern.indexOf(value[i]) < 0) {
                        alert("Please enter patient name/identifier in correct format.");
                        return false;
                    }
                }
            }

            if (StringUtils.isBlank(jQuery("#patientRelativeName").val())) {
                //alert("Please enter relative name");
                return true;
            } else {
                if (jQuery("#patientGender").val() == "M" || jQuery("#patientGender").val() == "F") {
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

            if (!VALIDATORS.validatePatientCategory()) {
                return false;
            }
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
            abc = jQuery("#abc").val();
            def = jQuery("#def").val();
            nd = jQuery("#nId").val();
            hd = jQuery("#hId").val();
            nId = jQuery("#nId").val();
            hId = jQuery("#hId").val();

            if (typeof nId != "undefined" || typeof hId != "undefined") {
                if (nId == "1" && hId == "1") {
                    //document.getElementById("nationalIdValidationMessage").innerHTML="Patient already registered with this National id";
                    //document.getElementById("healthIdValidationMessage").innerHTML="Patient already registered with this Health id";
                    //jQuery("#nationalIdValidationMessage").show();
                    //jQuery("#healthIdValidationMessage").show();
                    alert("Patient already registered with this National id and Health id");
                    return false
                }
                else if (nId == "1") {
                    //document.getElementById("nationalIdValidationMessage").innerHTML="Patient already registered with this National id";
                    //jQuery("#nationalIdValidationMessage").show();
                    //jQuery("#healthIdValidationMessage").hide();
                    alert("Patient already registered with this National id");
                    return false;
                }
                else if (hId == "1") {
                    //document.getElementById("healthIdValidationMessage").innerHTML="Patient already registered with this Health id";
                    //jQuery("#healthIdValidationMessage").show();
                    //jQuery("#nationalIdValidationMessage").hide();
                    alert("Patient already registered with this Health id");
                    return false;
                }
            }
            else {
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

        validatePatientCategory: function() {
            if (jQuery("#patCatGeneral").attr('checked') == false
                    && jQuery("#dependent").attr('checked') == false && jQuery("#patCatNonGov").attr('checked') == false)
            {
                alert('You didn\'t choose any of the patient categories!');
                return false;
            }

            else {
                return true;
            }
        },
        /** CHECK WHEN FREE CATEGORY IS SELECTED */
        //ghanshyam 25-feb-2013 New Requirement #966[Billing]Add Paid Bill/Add Free Bill for Bangladesh module(removed Patient Category)

        dependentCheck: function() {
            if (jQuery("#dependent").is(':checked')) {

                jQuery("#patCatGeneral").removeAttr("checked");
                jQuery("#patCatNonGov").removeAttr("checked");

            }
        },
        /** CHECK WHEN GENERAL CATEGORY IS SELECTED */
        //ghanshyam 25-feb-2013 New Requirement #966[Billing]Add Paid Bill/Add Free Bill for Bangladesh module(removed Patient Category)

        governmentCheck: function(obj) {
            if (jQuery("#patCatGeneral").is(':checked')) {

                jQuery("#dependent").removeAttr("checked");
                if (jQuery("#patCatNonGov").is(":checked")) {
                    jQuery("#patCatNonGov").removeAttr("checked");

                }
            }
        },
        nonGovCheck: function() {
            if (jQuery("#patCatNonGov").is(':checked')) {
                jQuery("#dependent").removeAttr("checked");
                jQuery("#patCatGeneral").removeAttr("checked");

            }
        },
        /*
         * Check patient gender
         */
        genderCheck: function() {

            jQuery("#patientRelativeNameSection").empty();
            if (jQuery("#patientGender").val() == "M") {
                jQuery("#patientRelativeNameSection")
                        .html(
                                '<input type="radio" name="person.attribute.15" value="Son of" checked="checked"/> Son of');
            } else if (jQuery("#patientGender").val() == "F") {
                jQuery("#patientRelativeNameSection")
                        .html(
                                '<input type="radio" name="person.attribute.15" value="Daughter of"/> Daughter of <input type="radio" name="person.attribute.15" value="Wife of"/> Wife of');
            } else if (jQuery("#patientGender").val() == "O") {
                jQuery("#patientRelativeNameSection")
                        .html(
                                '<input hidden type="radio" name="person.attribute.15" value="Relative of" checked="checked"/>');
            }
        }

    };
</script>
<style>
    .div-kha { 
        position:absolute;
        padding:5px 10px 5px 5px;
        left:1500px;
        top:150px;
        background: #D20400;
        font: 14px Arial, Tahoma, Helvetica, sans-serif;
        font-weight:bold;
        color: #FFF; 
    }
</style>

<div id="patientSearchResult"></div>
<form id="patientRegistrationForm" method="POST" class="kha-aero">
    <h1>Patient Registration Form</h1>

    <div class="div-kha">
        Mr. ${user}<br>
        Today Registration :<span style="font-size:20px;"> ${count}</span>
    </div>
    <table cellspacing="0">
        <tr>
            <td valign="top" class="cell"><b>Name <span style="color:red;"> * </span></b></td>
            <td class="cell"><input id="patientName" type="hidden"
                                    name="patient.name" />
                <div id="searchbox"></div>
                <div id="numberOfFoundPatients"></div></td>
            <td class="cell" style="display:none;"><b>ID Number <span style="color:red;"> * </span> &nbsp;&nbsp; 
                    <input readonly  name="patient.identifier" style="border: none; width: 250px; background:none;" /> </b>
            </td> 
        </tr>
        <tr>
            <td class="cell"><b>Demographics <span style="color:red;"> * </span></b></td>
            <td class="cell">dd/mm/yyyy<br />
                <table>
                    <tr>
                        <td>Age</td>
                        <td>Birthdate</td>
                        <td>Gender</td>
                    </tr>
                    <tr>
                        <td><span id="estimatedAge"></span></td>
                        <td><input type="hidden" id="calendar" /> 
                            <input id="birthdate" name="patient.birthdate" /> 
                            <img id="calendarButton" src="moduleResources/registration/calendar.gif" /> 
                            <input id="birthdateEstimated" type="hidden"   name="patient.birthdateEstimate" value="true" />
                        </td>
                        <td><select id="patientGender" name="patient.gender">
                                <option value="Any"></option>
                                <option value="M">Male</option>
                                <option value="F">Female</option>
                                <option value="O">Others</option>
                            </select></td>
                    </tr>
                </table></td>
            <td rowspan="3" class="border">

                <table cellspacing="10" style="line-height: 200%;">

        </tr>

        <!--End Code Here -->
        <!--
<tr>
    <td><b>National ID:</b></td>
    <td><input id="patientNationalId" name="patient.attribute.20" />
         
    <td><span style="color: red;"
              id="nationalIdValidationMessage"> </span>
    </td>

</tr>

<tr>
    <td><b>Health ID:</b></td>
    <td><input id="patientHealthId" name="patient.attribute.24" />
        
    <td><span style="color: red;" id="healthIdValidationMessage">
        </span>
    </td>
</tr>
        -->
        <tr>
            <td><b>Phone Number:</b></td>
            <td><input id="patientPhoneNumber"  name="person.attribute.16" style="width: 200px;" />
                <!-- ghanshya,3-july-2013 #1962 Create validation for length of Health ID and National ID -->
            <td><span style="color: red;" id="healthIdValidationMessage">
                </span>
            </td>

        </tr>
        <!-- ghanshya,3-july-2013 #1962 Create validation for length of Health ID and National ID -->
        <div id="validationMessage"></div>
    </table>
</td>
</tr>

<tr>
</tr>

<tr><!--
    <td class="cell"><b>Address</b></td>
    <td class="cell">
        <table style="line-height: 170%;">
            <tr>
                <td>Postal Address:</td>
                <td><input id="patientPostalAddress"
                           name="patient.address.postalAddress" style="width: 300px;" /></td>
            </tr>
            <tr>
                <td>District:</td>
                <td><select id="districts" name="patient.address.district"
                            onChange="PAGE.changeDistrict();" style="width: 200px;">
                    </select></td>
            </tr>
            <tr>
                <td>Upazila:</td>
                <td><select id="upazilas" name="patient.address.upazila"
                            style="width: 200px;">
                    </select></td>
            </tr>
        </table>
    </td> -->
</tr>
<tr>
    <!--
        <td class="cell"><b>Relative Name <span style="color:red;"> </span></b></td>
        <td class="cell">
            <div id="patientRelativeNameSection"></div> <input
                id="patientRelativeName" name="person.attribute.8"
                style="width: 200px;" />
        </td> -->
    <td><b>Referral Information :</b><br/></td><td></td>

    <td class="cell">

<tr><b>
    <td><b>Referred By</b> </td>
    <td>

        <input placeholder="Click/Enter Here....." type="text"
               class="ui-autocomplete-input ui-widget-content ui-corner-all"
               id="docInfo" style="width: 300px; font-size:16px" value=""
               name="docInfo" ondblclick="this.value = '';" /> 

        <select id="selectedDocId" size="4" style="display:none;" name="selectedDocId" ><option value="0">Please Select</option></select>

    </td>
    </tr>
    <tr>
        <td><b>Marketed By</b> </td>
        <td>

            <input placeholder="Click/Enter Here....." type="text"
                   class="ui-autocomplete-input ui-widget-content ui-corner-all"
                   id="marName" style="width: 300px; font-size:16px" value=""
                   name="marName" ondblclick="this.value = '';" /> 

            <select id="selectedMarId" size="4" style="display:none;" name="selectedMarId" ><option value="0">Please Select</option></select>
        </td>
    </tr>
    <div style="display:none;">
        <b>Doctor Visit Room:<span style="color:red;"> * </span></b> 
        <select id="opdWard" name="patient.opdWard"></select>
    </div>
    </td>

    </tr>
    <tr>

    <br />

    <td class="cell">

        <div style="display:none;">
            <b>OPD Room to Visit:<span style="color:red;"> * </span></b> <select id="opdWard" name="patient.opdWard">
        </div>
        </select>
    </td>
    </tr>
    </table>
    <span style="color:red; background:none;"> Fields marked with * are mandatory! </span>

    <input class="button" type="button" style="float: right;" value="Reset" onclick="window.location.href = window.location.href" />
    <input class="button" type="button" style="float: right;" value="Save" onclick="PAGE.submit();" />  <br> <br>

    <input class="button" type="button" style="float: center;" value="Add/Edit Ref By Name" onclick="window.open('refDoc.htm?', '_blank');")/>
    <input class="button" type="button" style="float: center;" value="Add/Edit Marketed By Name" onclick="window.open('marketedBy.htm?', '_blank');")/>

</form> 
<script>
    function myFunction() {
        var url = "refDoc.htm?KeepThis=true&TB_iframe=true&width=600&height=500";
        tb_show("Add Doctor Name", url);
    }
</script> 