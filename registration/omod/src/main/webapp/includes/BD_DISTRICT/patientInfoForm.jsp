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

<script type="text/javascript">
    jQuery(document).ready(function() {
        jQuery("#patientId").val(MODEL.patientId);
        jQuery("#revisit").val(MODEL.revisit);
        jQuery("#identifier").html(MODEL.patientIdentifier);
        jQuery("#age").html(MODEL.patientAge);
        jQuery("#name").html(MODEL.patientName);
		
        jQuery("#ref").html(MODEL.selectedReffered);
		
		//ghanshyam  20-may-2013 #1648 capture Health ID and Registration Fee Type
        jQuery("#freeRegField").hide();
        //ghanshyam 17-june-2013 (note:commented below line as per chahat suggestion for issue #1648)
        //jQuery("#paidReg").attr("checked", "checked");
        jQuery("#freeReg").click(function() {
            VALIDATORS.freeRegCheck();
        });
        jQuery("#paidReg").click(function() { 
            VALIDATORS.paidRegCheck();
        });


        // ghanshyam 27-02-2013 Feedback #966[Billing]Add Paid Bill/Add Free Bill for Bangladesh module(remove category from registration,OPD,IPD,Inventory)
        /*
         if(MODEL.patientAttributes[14]){
         pattern = /[A-Z]+[,][A-Z]/;
         if(pattern.test(MODEL.patientAttributes[14])){
         
         jQuery("#FREE").html("Free Reason.: " + MODEL.patientAttributes[19]);
         
         
         }else{			
         if("Free" == MODEL.patientAttributes[14])
         jQuery("#FREE").html(MODEL.patientAttributes[19]);
         
         jQuery("#category").html(MODEL.patientAttributes[14]);
         }
         
         }
         */
        jQuery("#category").html(MODEL.patientAttributes[14]);

        jQuery("#workPlace").html(MODEL.patientAttributes[25]);

        jQuery("#designation").html(MODEL.patientAttributes[26]);

        jQuery("#nationalId").html(MODEL.patientAttributes[20]);



        //ghanshyam  20-may-2013 #1648 capture Health ID and Registration Fee Type
        //
        //add relative name
        jQuery("#patientRelativeName").html(MODEL.patientAttributes[8]);
        jQuery("#patientSonofWifeof").html(MODEL.patientAttributes[15]);

        jQuery("#healthId").html(MODEL.patientAttributes[24]);
        jQuery("#phoneNumber").html(MODEL.patientAttributes[16]);
        jQuery("#gender").html(MODEL.patientGender);
        jQuery("#datetime").html(MODEL.currentDateTime);
        
        jQuery("#currentVisit").html(MODEL.currentDateVisit);
        jQuery("#lastV").html(MODEL.lastVisit);
        
        // Skh Condition Remove here
        /*
        if (MODEL.currentDateVisit == MODEL.lastVisit ) { 
            jQuery("#save").hide();
             document.getElementById("pa").innerHTML = "This Patient Already Visited Today!!";
			 jQuery("#printSlip").hide();
        }  
		else if (MODEL.currentDateVisit != MODEL.lastVisit ) { 
            jQuery("#save").show();
            jQuery("#onlyPrint").hide();
        }
        */
        
        
        MODEL.OPDs = " ,Please select an OPD room to visit|" + MODEL.OPDs;
        PAGE.fillOptions("#opdWard", {
            data: MODEL.OPDs,
            delimiter: ",",
            optionDelimiter: "|"
        });


        // Set the selected OPD
       
		
		if (!StringUtils.isBlank(MODEL.selectedOPD)) {
            jQuery("#opdWard").val(MODEL.selectedOPD);
            jQuery("#opdWard").attr("disabled", "disabled");
        }
		 
        jQuery("#buySlip").hide();

        // Set data for reprint page
        if (MODEL.reprint == "true") {
            var opdWardId = MODEL.opdWardId;
            jQuery("#opdWard").val(MODEL.observations[opdWardId]);

            var tempCategoryId = MODEL.tempCategoryId;
            if (!StringUtils.isBlank(MODEL.observations[tempCategoryId])) {

                jQuery.each(MODEL.observations[tempCategoryId].split(","), function(index, value) {
                    jQuery("input[name=temporary.attribute.11][value='" + value + "']").attr("checked", "checked");
                });
            }
            jQuery("#printSlip").hide();
            jQuery("#save").hide();
            //ghanshyam  20-may-2013 #1648 capture Health ID and Registration Fee Type
            jQuery("#regFee").hide()
            jQuery("#tempCat").hide();
        } else {
            jQuery("#reprint").hide();
            //ghanshyam  20-may-2013 #1648 capture Health ID and Registration Fee Type
            jQuery("#regFee").hide()
            jQuery("#tempCat").hide();
        }

    });

    /**
     ** PAGE METHODS
     **/
    PAGE = {
        /** Validate and submit */
        submit: function(reprint) {

            if (PAGE.validate()) {

                // Hide print button
                jQuery("#printSlip").hide();
                jQuery("#reprint").hide();

                // Convert OPDWard dropdown to printable format
                jQuery("#opdWard").hide();
                jQuery("#opdWard").after("<span>" + jQuery("#opdWard option:checked").html() + "</span>");

                //ghanshyam  20-may-2013 #1648 capture Health ID and Registration Fee Type	
                jQuery("#regFeeType input").each(function(index, value) {
                    if (jQuery(value).is(":checked")) {
                        jQuery("#printableRegFee").append("<span style='margin:5px;'>" + jQuery(value).val() + "</span>");
                        jQuery("#regFee").show();
                    }
                });
                jQuery("#regFeeType").hide();

                // Convert temporary categories to printable format
                jQuery("#temporaryCategories input").each(function(index, value) {
                    if (jQuery(value).is(":checked")) {
                        jQuery("#printableTemporaryCategories").append("<span style='margin:5px;'>" + jQuery(value).val() + "</span>");
                        jQuery("#tempCat").show();
                    }
                });

                /*				Sagar Bele, 11-01-2013: Issue #663 Registration alignment				
                 if(!StringUtils.isBlank(jQuery("#printableTemporaryCategories").html())){
                 jQuery("#printableTemporaryCategories").prepend("<b>Temporary Categories:</b>");
                 }
                 */
                jQuery("#temporaryCategories").hide();
//				jQuery("#tempCat").show();

                // submit form and print		
                if (!reprint) {
                    jQuery("#patientInfoForm").ajaxSubmit({
                        success: function(responseText, statusText, xhr) {
                            if (responseText == "success") {
                                PAGE.print();
                                window.location.href = getContextPath() + "/findPatient.htm";
                            }
                        }
                    });
                } else {
                    PAGE.print();
                    window.location.href = getContextPath() + "/findPatient.htm";
                }

            }
        },
        // Print the slip
        print: function() {
            jQuery("#patientInfoPrintArea").printArea({
                mode: "popup",
                popClose: true
            });
        },
        // harsh #244 Added a save button.
        save: function() {
            if (PAGE.validate()) {
                var save = document.getElementById("save");
                if (save == save) {
                    document.getElementById("save").disabled = true;
                }
                jQuery("#patientInfoForm").ajaxSubmit({
                    success: function(responseText, statusText, xhr) {
                        if (responseText == "success") {

                            window.location.href = getContextPath() + "/findPatient.htm";
                        }
                    }
                });
            }
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
                            jQuery(divId).append("<option value='" + value + "'>" + value + "</option>");
                        }
                    });
                } else {
                    jQuery.each(option.data, function(index, value) {
                        if (value.length > 0) {
                            jQuery(divId).append("<option value='" + option.index[index] + "'>" + value + "</option>");
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
                            jQuery(divId).append("<option value='" + optionValue + "'>" + optionLabel + "</option>");
                        }
                    }
                });
            }
        },
        /** Buy A New Slip */
        buySlip: function() {
            jQuery.ajax({
                type: "GET",
                url: openmrsContextPath + "/module/registration/ajax/buySlip.htm",
                data: ({
                    patientId: MODEL.patientId
                }),
                success: function(data) {
                    window.location.href = window.location.href;
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    alert(thrownError);
                }
            });
        },
        /** Validate Form */
        validate: function() {
            if (StringUtils.isBlank(jQuery("#opdWard").val())) {
                alert("Please select OPD ward");
                return false;
            }
            ;

            //ghanshyam  20-may-2013 #1648 capture Health ID and Registration Fee Type
            if (jQuery("#paidReg").attr('checked') == false
                    && jQuery("#freeReg").attr('checked') == false) {
                alert('Please select Registration Type!');
                return false;
            } else {
                if (jQuery("#freeReg").attr('checked')) {
                    if (jQuery("#freeRegReason").val().length <= 0) {
                        alert('Please enter Free reason');
                        return false;
                    }
                }
            }

            return true;
        }
    };

    //ghanshyam  20-may-2013 #1648 capture Health ID and Registration Fee Type
    VALIDATORS = {
        freeRegCheck: function() {
            if (jQuery("#freeReg").is(':checked')) {
                jQuery("#freeRegField").show();
                if (jQuery("#paidReg").is(":checked"))
                    jQuery("#paidReg").removeAttr("checked");
            } else {
                jQuery("#freeRegReason").val("");
                jQuery("#freeRegField").hide();
            }
        },
        paidRegCheck: function(obj) {
            if (jQuery("#paidReg").is(':checked')) {
                if (jQuery("#freeReg").is(":checked")) {
                    jQuery("#freeReg").removeAttr("checked");
                    jQuery("#freeRegReason").val("");
                    jQuery("#freeRegField").hide();
                }
            }
        }

    };
</script>
<script type="text/javascript">
    function paidClick() {
        if (jQuery("#paidReg").attr('checked') == true) {
            document.getElementById("message").innerHTML = "Please collect " +${regFee} + " TK";
            jQuery("#message").show();
        }
        else {
            jQuery("#message").hide();
        }
    }

    function freeClick() {
        jQuery("#message").hide();
    }
</script>
<!-- ghanshyam  20-may-2013 #1648 capture Health ID and Registration Fee Type -->
<!--  
<tr>
        <FONT SIZE="4" FACE="courier" COLOR=blue><MARQUEE WIDTH=1150
                        BEHAVIOR=ALTERNATE BGColor=yellow>
                        Please collect <font color="#FF0000">${regFee} TK </font>for Paid
                        Registration
                </MARQUEE> </FONT>
</tr>
<br />
-->
<span id="validationDate"></span>
<div id="patientInfoPrintArea">
    <center>
        <p id="pa" style="color:red; font-size:18px;"><p/>
        <form id="patientInfoForm" method="POST">
            <input id="lastV" type="hidden" />
            <input id="currentVisit" type="hidden" />
            
            <table border=0 width="550" cellspacing="3px">
                <%--   <img src="${pageContext.request.contextPath}/moduleResources/registration/r_slip.bmp"/> --%>
                <img src="${pageContext.request.contextPath}/images/hospital_logo.bmp" alt="logo" width="504" height="75"/>
                <tr>

                </tr>
                <tr>
                    <td colspan="1"><b>Patient ID.</b></td>
                    <td colspan="5">: &nbsp;&nbsp;<span id="identifier"></span></td>
                </tr>
                <tr>
                    <td colspan="1"><b>Patient Name</b></td>
                    <td colspan="5">: &nbsp;&nbsp;<span id="name"></span></td>
                </tr>
                <!-- Add Relative Name -->
                <!--
<tr>
    <td colspan="1" valign="top"><b><span id="patientSonofWifeof"></span></b></td>
    <td colspan="5">: &nbsp;&nbsp;<span id="patientRelativeName"></span></td>
</tr> 
                -->

                <tr>
                    <td colspan="1"><b>Age</b></td>
                    <td colspan="5">: &nbsp;&nbsp;<span id="age"></span></td>
                </tr>
                <tr>
                    <td colspan="1"><b>Gender</b></td>
                    <td colspan="5">: &nbsp;&nbsp;<span id="gender"></span></td>
                </tr>
                <tr>
                    <td colspan="1"><b>Category</b></td>
                    <td colspan="5">: &nbsp;&nbsp;<span id="category"></span></td>
                </tr>
				
				<tr>
				<script type="text/javascript">
				if(MODEL.patientAttributes[25]!=null){
				var wPlace=MODEL.patientAttributes[25];
				document.write('<td colspan="1"><b>Working Place </b><\/td>');
				document.write('<td colspan="2">: &nbsp;&nbsp;' + wPlace + '<\/td>');
				}
				else
				{
				document.write(' ');
				document.write(' ');
				}
				</script>
                </tr>
				
                <tr>
				<script type="text/javascript">				
				if(MODEL.patientAttributes[26]!=null){
				var Deg=MODEL.patientAttributes[26];
				document.write('<td colspan="1"><b>Designation </b><\/td>');
				document.write('<td colspan="2">: &nbsp;&nbsp;' + Deg + '<\/td>');
				}
				else
				{
				document.write(' ');
				document.write(' ');
				}
				</script>
                </tr>

                
				<tr>
				<td colspan="1" valign="top"><b><span id="patientSonofWifeof"></span></b></td>
				<td colspan="5">: &nbsp;&nbsp;<span id="patientRelativeName"></span></td>
				</tr>
				
				<tr>
				<script type="text/javascript">				
				if(MODEL.patientAttributes[16]!=null){
				var phoneNo=MODEL.patientAttributes[16];
				document.write('<td colspan="1"><b>Phone Number </b><\/td>');
				document.write('<td colspan="2">: &nbsp;&nbsp;' + phoneNo + '<\/td>');
				}
				else
				{
				document.write(' ');
				document.write(' ');
				}
				</script>
                </tr>
				<!--
                <tr>
                    <td colspan="1" valign="top"><b>Phone number</b></td>
                    <td colspan="5">: &nbsp;&nbsp;<span id="phoneNumber"></span></td>
                </tr> 
				-->
				<!--
                <tr>
                    <td colspan="1"><b>National ID</b></td>
                    <td colspan="2">: &nbsp;&nbsp;<span id="nationalId"></span></td>
                </tr> -->
                <%-- ghanshyam  20-may-2013 #1648 capture Health ID and Registration Fee Type --%>
				<!--
                <tr>
                    <td colspan="1"><b>Health ID</b></td>
                    <td colspan="2">: &nbsp;&nbsp;<span id="healthId"></span></td> 
                </tr>
				-->		
				
				<tr>
                <script type="text/javascript">
                    < script type = "text/javascript" >
                        if MODEL.selectedReffered != null) {
                        var reff = MODEL.selectedReffered;
                        document.write('<td colspan="1"><b>Referral Hospital </b><\/td>');
                        document.write('<td colspan="2">: &nbsp;&nbsp;' + reff + '<\/td>');
                    }
                    else
                    {
                        document.write(' ');
                        document.write(' ');
                    }
                </script>
                </tr>


				<!--
				<tr>
                    <td colspan="1"><b>Referral Hospital</b></td>
                    <td colspan="2">: &nbsp;&nbsp;<span id="ref" name="patient.referred.from" ></span></td>
                </tr>
				-->

                <tr id="opdWardLabel">
                    <td colspan="1"><b>OPD room to visit:</b></td>
                    <td colspan="5"><select id="opdWard" name="patient.opdWard">
                        </select></td>
                </tr>

                <tr>
                    <td colspan="1"><b>Date/Time:</b></td>
                    <td colspan="5"><span id="datetime"></span></td>
                </tr>                
                <%-- ghanshyam 27-02-2013 Feedback #966[Billing]Add Paid Bill/Add Free Bill for Bangladesh module(remove category from registration,OPD,IPD,Inventory)--%>
                <!--
                <tr>
                        <td colspan="1"><b>Category:</b></td>
                        <td colspan="2"><span id="category" /></td>
                        <td><span id="FREE" /></td>
                </tr>
                -->


                <tr id="regFeeType">
                    <td><b> <font color="red"> Registration Fee Type:</font> </b>
                    </td>
                    <td><input id="paidReg" type="checkbox"
                               name="patient.registration.fee.attribute.${regFeeConId}" value="${regFee}" onClick="paidClick();" />
                        Paid</td>
                    <td><input id="freeReg" type="checkbox"
                               name="patient.registration.fee.attribute.${regFeeConId}" value="0" onClick="freeClick();" /> Free</td>
                    <td><span id="freeRegField">Reason <input
                                id="freeRegReason"
                                name="patient.registration.fee.free.reason.attribute.${regFeeReasonConId}"/> </span></td>
                    <td><span style="color:red;" id="message" > </span></td>
                </tr>
                <tr id="temporaryCategories">
                    <td colspan="1" valign="top"><b> <font color="red">Temporary
                            Categories: </font> </b></td>
                    <td colspan="5"><input type="checkbox"
                                           name="temporary.attribute.11" value="MLC" /> MLC <br /> <input
                                           type="checkbox" name="temporary.attribute.11" value="Accident" />
                        Accident <br />
                    </td>
                </tr>
                <!-- ghanshyam  20-may-2013 #1648 capture Health ID and Registration Fee Type -->
                <tr id="regFee">
                    <td colspan="1" valign="top"><b>Registration Fee:</b></td>
                    <td colspan="5">
                        <div id="printableRegFee">TK</div>
                    </td>
                </tr>
                <!-- Sagar Bele, 11-01-2013: Issue #663 Registration alignment -->
                <tr id="tempCat">
                    <td colspan="1" valign="top"><b>Temporary Categories:</b></td>
                    <td colspan="5">
                        <div id="printableTemporaryCategories"></div>
                    </td>
                </tr>
            </table>
        </form>
    </center>
</div>
<center>
    <input class="button" id="printSlip" type="button" value="Print" onClick="PAGE.submit(false);" />
    <input class="button" id="reprint" type="button" value="Reprint"  onClick="PAGE.submit(true);" />
    <input class="button" id="buySlip" type="button" value="Buy a new slip" onClick="PAGE.buySlip();" />
    <input class="button no-print" id="save" type="button" value="Save" onClick="PAGE.save();" />
</center>
<style>
    .button{
        padding: 10px 30px 10px 30px;
        background: #66C1E4;
        border: none;
        color: #08088A;
        box-shadow: 1px 1px 1px #4C6E91;
        -webkit-box-shadow: 1px 1px 1px #4C6E91;
        -moz-box-shadow: 1px 1px 1px #4C6E91;
        border-radius:5px;
        text-shadow: 3px 1px 5px #ffffff;
        font-size:16px;
        font-weight:bold; 
    }
    .button:hover{
        background: #EDF0F1;
        text-shadow: 3px 1px 5px 4px #F7FE2E;
        font-weight:bold;
    }

</style>