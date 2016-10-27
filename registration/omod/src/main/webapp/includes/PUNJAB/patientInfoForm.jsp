<script type="text/javascript">
	jQuery(document).ready(function(){		
		jQuery("#patientId").val(MODEL.patientId);
		jQuery("#revisit").val(MODEL.revisit);
		jQuery("#identifier").html(MODEL.patientIdentifier);
		jQuery("#age").html(MODEL.patientAge);
		jQuery("#name").html(MODEL.patientName);
		jQuery("#category").html(MODEL.patientAttributes[14]);
		jQuery("#phoneNumber").html(MODEL.patientAttributes[16]);
		jQuery("#gender").html(MODEL.patientGender);
		jQuery("#datetime").html(MODEL.currentDateTime);
		MODEL.OPDs = " ,Please select an OPD room to visit|" + MODEL.OPDs;
		PAGE.fillOptions("#opdWard", {
			data:MODEL.OPDs,
			delimiter: ",",
			optionDelimiter: "|"
		});
		
		// Set the selected OPD
		if(!StringUtils.isBlank(MODEL.selectedOPD)){			
			jQuery("#opdWard").val(MODEL.selectedOPD);
			jQuery("#opdWard").attr("disabled", "disabled");
		}
		
		// jQuery("#buySlip").hide();
		
		// Set data for reprint page
		if(MODEL.reprint=="true"){
			// 28/04/12: Changed MODEL.observations[3] for MODEL.observations[6148] by Marta - Bug #161

			var opdWardId=MODEL.opdWardId;
			jQuery("#opdWard").val(MODEL.observations[opdWardId]);

			jQuery("#opdWard").val(MODEL.observations[6148]);	
			// 15/06/2012 OPD & Temp Categories appear and disable on reprint page by Kesavulu - Support #263
			jQuery("#opdWard").attr("disabled", "disabled");
			jQuery("input[name='temporary.attribute.8076']").attr("disabled", "disabled");

			// 28/04/12: Changed MODEL.observations[11] for MODEL.observations[8060] by Marta - Bug #160
			// 01/05/12: Marta, avoid error from empty string. Bug #180
			// 11/06/12: Thai Chuong changed from 8060 to 8076
			// 2/7/2012: harsh: removed dependency on hardcoded id for temp category and opd ward.
			var tempCategoryId=MODEL.tempCategoryId;
			if(!StringUtils.isBlank(MODEL.observations[tempCategoryId])){
			jQuery.each(MODEL.observations[tempCategoryId].split(","), function(index, value){
				jQuery("input[name=temporary.attribute.8076][value='" + value + "']").attr("checked", "checked");
			});	}	
			jQuery("#printSlip").hide();
			// 14/06/12: Buy new slip is hided by Kesavulu - Support #263
			jQuery("#buySlip").hide();
		} else {
			jQuery("#reprint").hide();
		}
		
		if(MODEL.dueDate.length>0){
			jQuery("#buySlip").hide();
		//	harsh 6/12/2012 #244 save button appears when one buys slip(14/6/2012)-> and reprint is hidden!
			if (jQuery("#reprint").is(":hidden")) {
					jQuery("#save").show();
				}		
			value = "Validate until " + MODEL.dueDate;
			if(parseInt(MODEL.daysLeft)>1){
				value += " (" + MODEL.daysLeft + " days left).";				
			} else {
				value += " (1 day left).";
			}
			jQuery("#validationDate").html(value);			
				
		} else {
			jQuery("#printSlip").hide();						
			// 01/05/12: Marta, not to allow to store information in this step. Bug #182
			// 14/06/2012 OPD & Temp Categories appear and disable on reprint page by Kesavulu - Support #263
			// 14/06/2012: OPD disabled on reprint page by Kesavulu - Support #263
			if(jQuery("#reprint").is(":visible")){
				jQuery("#opdWard").attr("disabled", "disabled");
				jQuery("input[name='temporary.attribute.8076']").attr("disabled", "disabled");
			} else{			
			jQuery("#opdWardLabel").hide();
			jQuery("#temporaryCategories").hide(); 
			}
		}	
	});
	
	/**
	 ** PAGE METHODS
	 **/
	PAGE = {
		/** Validate and submit */
		submit: function(reprint){
		
			if(PAGE.validate()){
				
				// Hide print button
				jQuery("#printSlip").hide();
				jQuery("#reprint").hide();
				
				// Convert OPDWard dropdown to printable format
				jQuery("#opdWard").hide();
				jQuery("#opdWard").after("<span>" + jQuery("#opdWard option:checked").html() +  "</span>");

				// Convert temporary categories to printable format
				jQuery("#temporaryCategories input").each(function(index, value){				
					if(jQuery(value).is(":checked")){
						jQuery("#printableTemporaryCategories").append("<span style='margin:5px;'>" + jQuery(value).val() + "</span>");
					}
				});
				
				if(!StringUtils.isBlank(jQuery("#printableTemporaryCategories").html())){
					jQuery("#printableTemporaryCategories").prepend("<b>Temporary Categories:</b>");
				}
				
				jQuery("#temporaryCategories").hide();
				
				// submit form and print		
				if(!reprint){
					jQuery("#patientInfoForm").ajaxSubmit({
						success: function (responseText, statusText, xhr){
							if(responseText=="success"){						
								PAGE.print();
								window.location.href = getContextPath() + "/findPatient.htm";
							}					
						}
					});
				} else {
					PAGE.print();
					//6/6/2012 - Marta: to redirect to search page after reprint
					window.location.href = getContextPath() + "/findPatient.htm";
				}
				
			}
		},
		
		// Print the slip
		print: function(){
			jQuery("#patientInfoPrintArea").printArea({
				mode : "popup",
				popClose : true
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
			if(option.delimiter == undefined){
				if(option.index == undefined){
					jQuery.each(option.data, function(index, value){	
						if(value.length>0){
							jQuery(divId).append("<option value='" + value + "'>" + value + "</option>");
						}
					});				
				} else {
					jQuery.each(option.data, function(index, value){	
						if(value.length>0){
							jQuery(divId).append("<option value='" + option.index[index] + "'>" + value + "</option>");
						}
					});
				}
			} else {
				options = option.data.split(option.optionDelimiter);
				jQuery.each(options, function(index, value){
					values = value.split(option.delimiter);
					optionValue = values[0];
					optionLabel = values[1];
					if(optionLabel != undefined){
						if(optionLabel.length>0){
							jQuery(divId).append("<option value='" + optionValue + "'>" + optionLabel + "</option>");
						}
					}					
				});
			}
		},
		
		/** Buy A New Slip */		
		buySlip: function(){
			jQuery.ajax({
				type : "GET",
				url : openmrsContextPath + "/module/registration/ajax/buySlip.htm",
				data : ({
					patientId: MODEL.patientId
				}),				
				success : function(data) {	
					window.location.href = window.location.href;
				},
				error : function(xhr, ajaxOptions, thrownError) {
					alert(thrownError);
				}
			});
		},
		
		/** Validate Form */
		validate: function(){
			if(StringUtils.isBlank(jQuery("#opdWard").val())){
				alert("Please select OPD ward");
				return false;
			};
			return true;
		},
		
		<!-- harsh  6/12/2012 #244 added a save button -->
		/*** SAVE  ***/
		save: function(){
			if (PAGE.validate()){
			<%-- ghanshyam 13-sept-2012 Bug #359 [REGISTRATION] Duplication of revisit patients when saving.Duplication of data being happen in "encounter" table 
                 and "opd_patient_queue" table --%>	
			var save=document.getElementById("save");
			if(save==save){
			document.getElementById("save").disabled = true;
			}
			jQuery("#patientInfoForm").ajaxSubmit({
				success: function (responseText, statusText, xhr){
					if(responseText=="success"){								
						window.location.href = getContextPath() + "/findPatient.htm";
					}					
				}
			});
			}
			}

	};
</script>
<input id="printSlip" type="button" value="Print" onClick="PAGE.submit(false);"/>
<!-- Sept 22,2012 -- Sagar Bele -- Issue 387 --Change case of word Reprint-->
<input id="reprint" type="button" value="Reprint" onClick="PAGE.submit(true);"/>
<input id="buySlip" type="button" value="Buy a new slip" onClick="PAGE.buySlip();"/>
<!-- harsh  6/12/2012 #244 added a save button; initially hidden only appears when you buy a slip-->
<input id="save" type="button" value="Save" hidden onClick="PAGE.save();" />
<span id="validationDate"></span>

<!------------------------------------------------------------------------------------------------------------->
<div id="patientInfoPrintArea">
	<table border=0>
		<tr height=115>
		</tr>
		<tr>
		<td width=800>
		</td>
		<td>	
		<form id="patientInfoForm" method="POST">				
			<table border=0  width="400">
				<tr>
					<td colspan="1""><b>ID.No:</b></td>
					<td  colspan="5"">
						<span id="identifier"/>
					</td>
				</tr>
				<tr>
					<td colspan="1"><b>Name:</b></td>
					<td  colspan="5">
						<span id="name"/>
					</td>
				</tr>
				<tr>
					<td colspan="1"><b>Age:</b></td>
					<td colspan="5">
						<span id="age"/>
					</td>
				</tr>
				<tr>
					<td colspan="1"><b>Gender:</b></td>
					<td colspan="5">
						<span id="gender"/>
					</td>
				</tr>
				<tr>
					<td colspan="1" valign="top"><b>Phone number:</b></td>
					<td colspan="5">
						<span id="phoneNumber"/>			
					</td>
				</tr>
				<!-- 03/05/2012 Thai Chuong: Supported issue #182 -->
				<tr id="opdWardLabel">
					<td colspan="1"><b>OPD room to visit:</b></td>
					<td colspan="5">
						<select id="opdWard" name="patient.opdWard">
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="1"><b>Date/Time:</b></td>
					<td colspan="5">
						<span id="datetime"/>
					</td>
				</tr>
				<tr>
					<td colspan="1"><b>Category:</b></td>
					<td colspan="5">
						<span id="category"/>
					</td>
				</tr>
				<tr id="temporaryCategories">
				<!-- 01/05/12: Marta, Painting Temporary Category in red. Bug #182  -->
					<td colspan="1" valign="top"><b> <font color="red">Temporary Categories: </font></b></td>
					<td colspan="5">
						<!-- 28/04/12: Changed MODEL.observations[11] for MODEL.observations[8060] by Marta - Bug #160 -->
						<!-- 11/06/12: Thai Chuong changed from 8060 to 8076 -->
					    <input type="checkbox" name="temporary.attribute.8076" value="MLC"/> MLC <br/>
						<input type="checkbox" name="temporary.attribute.8076" value="Accident"/> Accident <br/>										
					</td>
				</tr>
				<tr>
					<td colspan="6">
						<div id="printableTemporaryCategories">
							
						</div>
					</td>						
				</tr>
			</table>
		</form>
		</td>
	</tr>
	</table>
</div>
