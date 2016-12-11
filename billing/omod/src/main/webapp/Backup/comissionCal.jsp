<%-- 
    Document   : comissionCal
    Created on : Jan 31, 2016, 11:57:58 AM
    Author     : Khairul
--%>

<%@ include file="/WEB-INF/template/include.jsp"%>
<%@ include file="/WEB-INF/template/header.jsp"%>
<%@ include file="../includes/js_css.jsp"%>

<script type="text/javascript">
// get context path in order to build controller url
    function getContextPath() {
        pn = location.pathname;
        len = pn.indexOf("/", 1);
        cp = pn.substring(0, len);
        return cp;
    }
</script>
<script>
    jQuery(document).ready(function() {
        jQuery('#eDate, #sDate').datepicker({yearRange: 'c-30:c+30', dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true});

        jQuery("#searchKey").keyup(function(event) {
            if (event.keyCode == 13) {
                getBillingQueue(1);
            }
        });

    });

    function getBillingQueue(docIdName, sDate, eDate, pathology, radiology) {
        var docIdName = jQuery("#docIdName").val();
        var sDate = jQuery("#sDate").val();
        var eDate = jQuery("#eDate").val();
        var pathology = jQuery("#pathology").val();
        var radiology = jQuery("#radiology").val();
        jQuery.ajax({
            type: "GET",
            url: getContextPath() + "/module/billing/comCalGet.htm",
            data: ({
                docIdName: docIdName,
                sDate: sDate,
                eDate: eDate,
                pathology: pathology,
                radiology: radiology
            }),
            success: function(data) {
                jQuery("#billingqueue").html(data);
            },
        });
    }

    function validate() {
        var dName = document.getElementById("docIdName").value;
        var sDate = document.getElementById("sDate").value;
        var eDate = document.getElementById("eDate").value;

        if (dName == null || dName == "")
        {
            alert("Please Enter Doctor Name / ID!!");
            $("#docIdName").focus();
            return false;
        }
        else if (sDate == null || sDate == "")
        {
            alert("Please Enter Start Date!!");
            $("#sDate").focus();
            return false;
        }
        else if (eDate == null || eDate == "")
        {
            alert("Please Enter End Date !!");
            $("#eDate").focus();
            return false;
        }
    }
</script>
<input type="hidden" id="pageId" value="commissionCalPage" />
<form class="form-rep-view" method="get" action="comCalGet.htm" id="commissionCalForm" onsubmit="return validate()">
    <div class="boxHeader1">   <strong>Commission Calculation</strong></div>
    <div class="box1">

        <span style="font-size:14px; font-weight: bold;"> Doctor Id / Name : </span> 
        <input type="text" placeholder="Please Enter Doctor Id / Name " 
               ondblclick="this.value = '';" id="docIdName" name="docIdName" style="width:250px;"/> &nbsp;&nbsp;&nbsp;

        <select id="selectedDocId" size="4" style="display:none;" name="selectedDocId" ><option value="0">Please Select</option></select>


        <span style="font-size:14px; font-weight: bold;"> Start Date : </span> 
        <input type="text" placeholder="Please Enter Start Date " id="sDate" name="sDate" style="width:250px;"/> &nbsp;&nbsp;&nbsp;

        <span style="font-size:14px; font-weight: bold;"> End Date : </span>  
        <input type="text" placeholder="Please Enter End Date " id="eDate" name="eDate" style="width:250px;"/> &nbsp;&nbsp;&nbsp;

        <!-- <input type="checkbox" value="1" id="pathology" name="pathology" />  Pathology &nbsp;&nbsp;&nbsp;
        <input type="checkbox" value="2" id="radiology" name="radiology" />  Radiology &nbsp;&nbsp;&nbsp; -->

        <!-- <input type="button" class="bu-normal" id="find" value="View" onClick="getBillingQueue();" />  -->
        <input type="submit" value="Get View" class="bu-normal"  /> 

        <div id="billingqueue" style="padding:4px;"></div>
    </div>

    <div class="box1" >
        <c:if test="${not empty docInfo.id}">
            <div style="padding-left:100px; padding-bottom:7px; color:#000;"> Dr Code : <span style="font-size:16px; font-weight:bold;"> ${docInfo.id} </span> ||  
                Doctor Name : <span style="font-size:16px; font-weight:bold;"> ${docInfo.doctorName} </span>  </div> </c:if>
            <div class="container" style="width:90%" >
            <c:choose>
                <c:when test="${not empty diaList}">

                    <table id="patientInfo" class="table_data table-striped text-center">     						
                        <thead>
                            <tr>
                                <th><b>Date</b></th>
                                <th><b>Bill Id</b></th>
                                <th><b>Patient Name</b></th>
                                <th><b>Investigation</b></th>
                                <th><b>Path</b></th>
                                <th><b>XRAY</b></th>
                                <th><b>ECG/Echo</b></th>
                                <th><b>Usg</b></th>
                                <th><b>Less</b></th>
                                <th><b>DueAmt</b></th>
                                <th><b>Remarks</b></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${diaList}" var="patient"  >
                                <tr >

                                    <td style="border-right:1px solid #D8D8D8;"><openmrs:formatDate date="${patient.createdDate}" /></td>  
                                    <td style="border-right:1px solid #D8D8D8;">${patient.billId}</td>
                                    <td style="border-right:1px solid #D8D8D8;">${patient.patient.givenName} ${patient.patient.familyName}  </td>
                                    <td style="border-right:1px solid #D8D8D8;"></td>
                                    <td style="border-right:1px solid #D8D8D8;">${patient.actualAmount}  </td>
                                    <td style="border-right:1px solid #D8D8D8;">${patient.refDocId}</td>
                                    <td style="border-right:1px solid #D8D8D8;">  </td>
                                    <td style="border-right:1px solid #D8D8D8;"> </td>
                                    <td style="border-right:1px solid #D8D8D8;">${patient.discountAmount} </td>
                                    <td style="border-right:1px solid #D8D8D8;">${patient.dueAmount} </td>
                                    <td style="border-right:1px solid #D8D8D8;"> </td>
                                </tr>

                            </c:forEach>

                        </tbody>
                    </table>
                </c:when>

                <c:otherwise>
                    <span style="color:red">No Bill Found.</span>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

</form> 



