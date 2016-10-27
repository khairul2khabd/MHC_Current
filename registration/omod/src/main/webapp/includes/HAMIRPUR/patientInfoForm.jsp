<script type="text/javascript">
	jQuery(document).ready(function(){		
		jQuery("#patientId").val(MODEL.patientId);
		jQuery("#revisit").val(MODEL.revisit);
		jQuery("#identifier").html(MODEL.patientIdentifier);
		jQuery("#age").html(MODEL.patientAge);
		jQuery("#name").html(MODEL.patientName);
		jQuery("#category").html(MODEL.patientAttributes[14]);
		jQuery("#gender").html(MODEL.patientGender);
		jQuery("#datetime").html(MODEL.currentDateTime);
		MODEL.OPDs = " ,Please select an OPD room to visit|" + MODEL.OPDs;
		PAGE.fillOptions("#opdWard", {
			data:MODEL.OPDs,
			delimiter: ",",
			optionDelimiter: "|"
		});
		
		// Set the selected OPD (only 
		if(!StringUtils.isBlank(MODEL.selectedOPD)){			
			jQuery("#opdWard").val(MODEL.selectedOPD);
			jQuery("#opdWard").attr("disabled", "disabled");
		}
		jQuery("#buySlip").hide();
		
		// Set data for reprint page
		if(MODEL.reprint=="true"){
			jQuery("#opdWard").val(MODEL.observations[6148]);
			if(!StringUtils.isBlank(MODEL.observations[7515])){
				jQuery.each(MODEL.observations[7515].split(","), function(index, value){
					jQuery("input[name=temporary.attribute.7515][value='" + value + "']").attr("checked", "checked");
				});		
			}
			jQuery("#printSlip").hide();
		} else {
			jQuery("#reprint").hide();
		}
		
		/*
		if(MODEL.dueDate.length>0){
			jQuery("#buySlip").hide();
			
			value = "Validate until " + MODEL.dueDate;
			if(parseInt(MODEL.daysLeft)>1){
				value += " (" + MODEL.daysLeft + " days left).";				
			} else {
				value += " (1 day left).";
			}
			jQuery("#validationDate").html(value);
				
		} else {
			jQuery("#printSlip").hide();
		}		
		*/
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
					window.location.href = getContextPath() + "/findPatient.htm";
				}
				
			}
		},
		
		// Print the slip
		print: function(){
			jQuery(".patientInfoTable").attr("style", "margin-left:120px; margin-top:60px; font-family:Verdana,'Lucida Grande','Trebuchet MS',Arial,Sans-Serif; font-style:normal; font-size:11px;");
			jQuery("img", jQuery("#patientInfoPrintArea")).each(function(index, item){
				jQuery(item).remove();
			});
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
		}
	};
</script>
<input id="printSlip" type="button" value="Print" onClick="PAGE.submit(false);"/>
<input id="reprint" type="button" value="RePrint" onClick="PAGE.submit(true);"/>
<input id="buySlip" type="button" value="Buy a new slip" onClick="PAGE.buySlip();"/>
<span id="validationDate"></span>
<div id="patientInfoPrintArea">
	<center>
		<span style="font-size:20px;">
			<b>Regional Hospital, Hamirpur</b><br/>
			(HP Govt. Hospital)
		</span>
		<form id="patientInfoForm" method="POST">	
			<table class="patientInfoTable" cellspacing="1">			
				<tr>
					<td colspan="3"><b>ID.NO:</b><span id="identifier"/>
					</td>
					<td colspan="3"><b>Age:</b>					
						<span id="age"/>
					</td>
				</tr>
				<tr>
					<td><b>Name:</b></td>
					<td colspan="5">
						<span id="name"/>
					</td>
				</tr>
				<tr>
					<td><b>Dept:</b></td>
					<td colspan="5">
						<select id="opdWard" name="patient.opdWard">
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
								<b>Category:</b>
									<span id="category"/>
					</td>
					<td colspan="2">
								<b>Gender:</b>
									<span id="gender"/>
					<td colspan="2">
								<b>Date/Time:</b>
									<span id="datetime"/>							
					</td>
					
				</tr>
				<tr id="temporaryCategories">
					<td valign="top"><b>Temporary Categories:</b></td>
					<td colspan="5">
						<input type="checkbox" name="temporary.attribute.7531" value="MLC"/> MLC <br/>
						<input type="checkbox" name="temporary.attribute.7531" value="Accident"/> Accident <br/>										
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
	</center>	
	<!-- 17/5/2012 Marta: Remove list of investigations from patient info form Issue #214  -->	
	<!-- <img src="${pageContext.request.contextPath}/moduleResources/registration/investigations.jpg"/> -->
</div>
