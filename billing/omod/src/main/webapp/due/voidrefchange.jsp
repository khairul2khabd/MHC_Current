<%-- 
    Document   : voidrefchange
    Created on : Oct 30, 2016, 3:38:23 PM
    Author     : Khairul
--%>

<%@ include file="/WEB-INF/template/include.jsp"%>
<%@ include file="/WEB-INF/template/headerMinimal.jsp"%>
<%@ include file="../includes/js_css.jsp"%>

<script type="text/javascript" 
src="${pageContext.request.contextPath}/moduleResources/billing/scripts/jquery/jquery.PrintArea.js"></script>

<script>
    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;
        return true;
    }
</script>

<script type="text/javascript">
    if (SESSION.checkSession()) {
        jQuery(document).ready(function() {
            jQuery('#dDate').datepicker({yearRange: 'c-30:c+30', dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true});
            jQuery("#paidamount").keyup(function(event) {
                if (event.keyCode == 13) {
                    subPrint();
                }
            });
            $("#voidReason").hide("fast");

            $("#billVoid").click(function() {
                if (jQuery("#billVoid").is(':checked')) {
                    $('#rmpIdName').attr("disabled", "disabled");
                    $('#docIdName').attr("disabled", "disabled");
                    $("#voidReason").show("fast");
                }
                if (jQuery("#billVoid").is(':unchecked')) {
                    $("#voidReason").hide("fast");
                    $('#rmpIdName').removeAttr("disabled");
                    $('#docIdName').removeAttr("disabled");
                }
            });
    <c:if test="${dpsb.voided eq 'true'}">
            $('#rmpIdName').attr("disabled", "disabled");
            $('#docIdName').attr("disabled", "disabled");
            $('#billVoid').attr("disabled", "disabled");
            $('#billVoid').attr("disabled", "disabled");
            $('#save').hide("fast");
    </c:if>
        });
    }
</script>

<script type="text/javascript">
    function showMe(it, box) {
        var vis = (box.checked) ? "block" : "none";
        document.getElementById(it).style.display = vis;
    }
    function back() {
        window.location = "directbillingqueue.form";
    }
    function c() {
        var a = jQuery("#docIdName").val();
        var b = jQuery("#rmpIdName").val();
        var c = jQuery("#billVoid").val();

        alert(a + b + c);

        jQuery.ajax({
            type: "GET",
            url: getContextPath() + "/module/billing/commUpdate.htm",
            data: ({
                id: id,
                commission: commission
            }),
            success: function(data) {
                alert("Successfully added!");
            },
            error: function() {
                //alert("Successfully Paid Commission!");
                //window.location = "compay.htm";
            }
        });
    }

    function validate() {
        if (SESSION.checkSession()) {
            var dName = document.getElementById("docIdName").value;
            var rmpName = document.getElementById("rmpIdName").value;

            if (jQuery("#billVoid").is(':unchecked')) {

                if (dName == null || dName == "" || dName == ",")
                {
                    if (confirm('Are you sure you want to continue without Referred?')) {
                        jQuery("#docIdName").val("0");
                    }
                    else {
                        $("#docIdName").focus();
                        return false;
                    }
                }
                else {
                    if (confirm('Are you sure you want to continue...')) {
                    }
                    else {
                        $("#docIdName").focus();
                        return false;
                    }
                }
                // CH
                if (rmpName == null || rmpName == "" || rmpName == ",")
                {
                    if (confirm('Are you sure you want to continue without CH ??')) {
                        jQuery("#rmpIdName").val("0");
                    }
                    else {
                        $("#rmpIdName").focus();
                        return false;
                    }
                }
                else {
                    if (confirm('Are you sure you want to continue...')) {
                    }
                    else {
                        $("#rmpIdName").focus();
                        return false;
                    }
                }
            }
            else {
                if (jQuery("#voidReason").val().length <= 0) {
                    alert('Please enter Free reason');
                    $("#voidReason").focus();
                    return false;
                }

                if (confirm('Are you sure you want to void this bill !!!')) {
                }
                else {
                    return false;
                }
            }

        }
    }

</script>

<input type="hidden" id="pageId" value="voidrefchangePage" />
<form id="billDetailsForm" action="voidrefchange.htm" style="min-height:600px;" class="kha-boot" method="POST" onsubmit="return validate()"  >
    <h1> &#9899;Bill Void &#9899; Change Referral </h1>
    <input type="hidden" id="billId" name="billId"  value="${dpsb.billId}" />

    <c:if test="${dpsb.voided eq 'true'}">
        <span style="color:red; font-size:20px; font-weight:bold; padding-left:150px;">This Bill is Voided! </span> 
        <span style="color:red; font-size:20px; font-weight:bold; padding-left:20%;">Void Reason : ${dpsb.voidedDesc} </span> 
    </c:if>

    <table style="width:70%; margin:10px 0pt 15px 150px;">
        <tr> 
            <td width="20%">Patient Name :   <span style="font-weight:bold; font-size:16px; color:blue;">
                    ${dpsb.patient.givenName} ${dpsb.patient.middleName} ${dpsb.patient.familyName}</span> </td>
            <td width="20%">Patient ID : <span style="font-weight:bold; font-size:16px; color:blue;">
                    ${identifier} </span> </td>
            <td width="20%">Bill Id :<span style="font-weight:bold; font-size:20px; color:blue;">  ${dpsb.billId}  </span> </td>
        </tr>
        <tr><td> &nbsp; </td> </tr>
        <tr> 
            <td> <span style="font-size:16px; font-weight:bold;"> Referred Doctor : </span>   <br>
                <input placeholder="Click/Enter Here....." type="text" value="${docInfo.id}${docInfo.doctorName}"
                       id="docIdName"  name="docIdName" ondblclick="this.value = '';" />
                <select id="selectedDocId" size="4" style="display:none;" name="selectedDocId" ><option value="0">Please Select</option></select>
            </td>
            <td align="center">  &nbsp;
            </td>
            <td> <span style="font-size:16px; font-weight:bold;"> Referred RMP : </span> <br>
                <input placeholder="Click/Enter Here....." type="text" value="${rmpInfo.id}${rmpInfo.name}" id="rmpIdName"  name="rmpIdName" ondblclick="this.value = '';" />
                <select id="selectedRmpId" size="4" style="display:none;" name="selectedRmpId" ><option value="${rmpInfo.id}">${rmpInfo.id}</option></select>
            </td>
        </tr>  
    </table>
    <table id="myTable" class="kha" style="font-size:14px;"  width="100%">
        <thead>
            <tr>
                <th style="text-align: center;">S.No</th>
                <th style="text-align: left; padding-left:5px;">Service Name</th>
                <th style="text-align: center;">Rate</th>
            </tr>
        </thead>
        <tbody>
            <c:set var="total" value="${0}"/>
            <c:forEach var="sol" items="${diaBillItemList}" varStatus="index">
                <c:choose>
                    <c:when test="${index.count mod 2 == 0}">
                        <c:set var="klass" value="odd" />
                    </c:when>
                    <c:otherwise>
                        <c:set var="klass" value="even" />
                    </c:otherwise>
                </c:choose>
                <tr class="${klass}" id="">
                    <td align="center">${index.count}</td>
                    <td align="left">
                        ${sol.name}
                    </td>
                    <td align="right"> 
                        ${sol.amount}
                    </td>
                    <td align="right" style="display:none;"> ${sol.amount}
                    </td>
                </tr>
                <c:set var="total" value="${total + sol.unitPrice}"/>
            </c:forEach>
            <tr>
                <td colspan="3" align="right" ><span style="font-size:20px; font-weight:bold; ">Total Bill : </span>  &emsp; 
                    <span style="font-size:20px; font-weight:bold; ">  ${total} </span> </td>
            </tr>
            <tr>
                <td colspan="1" align="center" width="15%"> <span style="font-size:16px; font-weight:bold;">  Void  </span> 
                    <input type="checkbox" id="billVoid" name="billVoid" value="1" /> </td>
                <td colspan="2">
                    <input type="value" style="height:30px; width:100%"   placeholder="Void Reason" id="voidReason" name="voidReason" />
                </td>
            </tr>
        </tbody>
    </table> 
    <table  style="font-family:arial;   margin:10px 0pt 15px 150px; font-size: 8pt; width: 70%; text-align: left;" >
        <tr>
            <td colspan="3"> 
                <input type="button" class="bu" value="Back"  onClick="back();" /> &emsp;
                <input type="submit" class="bu" value="Save" id="save" /> &emsp;  
            </td>
        </tr>
    </table>
</form>

<style>
    input[type=checkbox] {
        cursor: pointer;
    }
</style>