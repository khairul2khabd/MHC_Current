<%-- 
    Document   : rmpPaymentView
    Created on : Jul 12, 2016, 1:32:59 PM
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

        var serTotal = 0;
        $('#serTot').attr('value', function() {
            $('.serAmn').each(function() {
                if ($(this).val() !== '') {
                    serTotal += parseFloat($(this).val());
                }
            });
            return serTotal;
        });

        var comTotal = 0;
        $('#comTot').attr('value', function() {
            $('.comAmn').each(function() {
                if ($(this).val() !== '') {
                    comTotal += parseFloat($(this).val());
                }
            });
            return comTotal;
        });

        var lessTotal = 0;
        $('#lesTot').attr('value', function() {
            $('.lesAmn').each(function() {
                if ($(this).val() !== '') {
                    lessTotal += parseFloat($(this).val());
                }
            });
            return lessTotal;
        });

        var docTotal = 0;
        $('#docTot').attr('value', function() {
            $('.docAmn').each(function() {
                if ($(this).val() !== '') {
                    docTotal += parseFloat($(this).val());
                }
            });
            return docTotal;
        });

        var paidAmn = 0;
        $('#TotPaid').attr('value', function() {
            $('.docPaid').each(function() {
                if ($(this).val() !== '') {
                    paidAmn += parseFloat($(this).val());
                }
            });
            return paidAmn;
        });

        var dueAmn = 0;
        $('#TotDue').attr('value', function() {
            $('.docDue').each(function() {
                if ($(this).val() !== '') {
                    dueAmn += parseFloat($(this).val());
                }
            });
            return dueAmn;
        });


    });


    function validate() {
        var dName = document.getElementById("rmpIdName").value;
        var sDate = document.getElementById("sDate").value;
        var eDate = document.getElementById("eDate").value;

        if (dName == null || dName == "")
        {
            //alert("Please Enter Doctor Name / ID!!"); 
            //$("#docIdName").focus();
            return true;
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

<input type="hidden" id="pageId" value="commissionCalPageRmp" />
<form class="form-doc-rep" method="get" action="rmpPaymentView.htm" id="commissionCalForm" onsubmit="return validate()" >
    <div class="boxHeader1">   <strong>RMP Commission Payment View</strong></div>
    <div class="box1">
        <input type="hidden" id="indCount" name="indCount" value="${diaComCalSize}" />
        <span style="font-size:14px; font-weight: bold;"> RMP Id / Name : </span> 
        <input type="text" placeholder="Please Enter Rmp Id / Name " 
               ondblclick="this.value = '';" id="rmpIdName" name="rmpIdName" style="width:250px;"/> &nbsp;&nbsp;&nbsp;

        <select id="selectedDocId" size="4" style="display:none;" name="selectedDocId" ><option value="0">Please Select</option></select> 
        <span style="font-size:14px; font-weight: bold;"> Start Date : </span> 
        <input type="text" placeholder="Please Enter Start Date " id="sDate" name="sDate" style="width:250px;"/> &nbsp;&nbsp;&nbsp;
        <span style="font-size:14px; font-weight: bold;"> End Date : </span>  
        <input type="text" placeholder="Please Enter End Date " id="eDate" name="eDate" style="width:250px;"/> &nbsp;&nbsp;&nbsp;
        <input type="submit" value="Get View" class="bu-normal"  /> 
        <div id="billingqueue" style="padding:4px;"></div>
    </div>

    <div class="box1" >
        <c:if test="${not empty rmpInfo.id}">
            <div style="padding-left:100px; padding-bottom:7px; color:#000;"> RMP Code : <span style="font-size:16px; font-weight:bold;"> ${rmpInfo.id} </span> ||  
                RMP Name : <span style="font-size:16px; font-weight:bold;"> ${rmpInfo.name} </span>  
                <label style="float:right; padding-right:100px; font-size:14px;"> RMP Commission Showing Date : <openmrs:formatDate date="${startDate}" /> - <openmrs:formatDate date="${endDate}" /> </label>
            </div>
            <input type="hidden" value="<%= request.getParameter("sDate") %>" id="sDateValue" name="sDateValue" /> 
            <input type="hidden" value="<%= request.getParameter("eDate") %>" id="eDateValue" name="eDateValue" />
            <input type="hidden" value="<%= request.getParameter("rmpIdName") %>" id="rmpId" name="rmpId" />
        </c:if>
        <c:if test="${ empty rmpInfo.id}">
            <div style="padding-left:100px; padding-bottom:7px; color:#000;"> <span style="font-size:16px; font-weight:bold;"> All RMP </span>
                <label style="float:right; padding-right:100px; font-size:14px;">
                    RMP Commission Showing Date : <openmrs:formatDate date="${startDate}" /> - <openmrs:formatDate date="${endDate}" /> </label> <br>
            </div>
            <input type="hidden" value="<%= request.getParameter("sDate") %>" id="sDateValue" name="sDateValue" /> 
            <input type="hidden" value="<%= request.getParameter("eDate") %>" id="eDateValue" name="eDateValue" />
            <input type="hidden" value="<%= request.getParameter("rmpIdName") %>" id="docId" name="rmpId" />
        </c:if>
        <div class="container" style="width:90%" >
            <c:choose>
                <c:when test="${not empty diaRmpPaid}"> 
                    <table id="patientInfo" class="table_data table-striped   ">     						
                        <thead  >
                            <tr>
                                <th><b>Date</b></th>
                                <th><b>Service Amount</b></th>
                                <th><b>Commission Amount</b></th> 
                                <th><b>Less Amount</b></th>
                                <th><b>RMP Commission</b></th>
                                <th><b>Paid Amount</b></th>
                                <th><b>Due Amount</b></th>
                                <th><b>RMP Id/Name</b></th>
                                <th><b>Action</b></th>
                                <!-- <th><b>Note</b></th> --> 
                            </tr>   
                        </thead>
                        <tbody>
                            <c:forEach items="${diaRmpPaid}" var="d"  varStatus="index">
                                <tr> 
                                    <td style="border-right:1px solid #D8D8D8;"><openmrs:formatDate date="${d.createdDate}" /></td> 
                                    <td style="border-right:1px solid #D8D8D8;" class="text-right"><input type="value" value="${d.serviceAmount}"  id="${index.count}serAmn" name="${index.count}serAmn" class="serAmn" /> </td>	
                                    <td style="border-right:1px solid #D8D8D8;" class="text-right"><input type="value" value="${d.netAmount}"  id="${index.count}netAmn" name="${index.count}netAmn" class="comAmn"/> </td>
                                    <td style="border-right:1px solid #D8D8D8;" class="text-right"><input type="value" value="${d.lessAmount}"  id="${index.count}lessAmn" name="${index.count}lessAmn" class="lesAmn"/> </td>	
                                    <td style="border-right:1px solid #D8D8D8;" class="text-right"><input type="value" value="${d.rmpCommission}"  id="${index.count}docAmn" name="${index.count}docAmn" class="docAmn"/></td>
                                    <td style="border-right:1px solid #D8D8D8;" class="text-right"><input type="value" value="${d.paidAmount}"  id="${index.count}docPaid" name="${index.count}docPaid" class="docPaid"/></td>
                                    <td style="border-right:1px solid #D8D8D8;" class="text-right"><input type="value" value="${d.dueAmount}"  id="${index.count}docDue" name="${index.count}docDue" class="docDue"/></td>
                                    <td style="border-right:1px solid #D8D8D8;" class="text-center"> <span style="font-size:18px; font-weight:bold;"> ${d.rmpId} </span> </td>
                                    <td style="border-right:1px solid #D8D8D8;" class="text-center"> 

                                        <c:if test="${ d.dueAmount > 0}">
                                            <input type="button" class="bu-normal" value="Update Payment"  onClick="updatePayment('${d.id}');" /> 
                                        </c:if>

                                    </td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <td style="border-right:1px solid #D8D8D8;"> <span style="float:right; padding-right:5px; font-size:16px; font-weight:bold;"> Total : </span></td> 
                                <td style="border-right:1px solid #D8D8D8;" class="text-right"><input type="text"  id="serTot" name="serTot" style="text-align:right;" /> </td>	
                                <td style="border-right:1px solid #D8D8D8;" class="text-right"><input type="text"  id="comTot" name="comTot" style="text-align:right;"  /> </td>
                                <td style="border-right:1px solid #D8D8D8;" class="text-right"><input type="text"  id="lesTot" name="lesTot"  style="text-align:right;" /> </td>	
                                <td style="border-right:1px solid #D8D8D8;" class="text-right"><input type="text"  id="docTot" name="docTot"  style="text-align:right;" /></td>
                                <td style="border-right:1px solid #D8D8D8;" class="text-right"><input type="text"  id="TotPaid" name="TotPaid"  style="text-align:right;" /></td>
                                <td style="border-right:1px solid #D8D8D8;" class="text-right"><input type="text"  id="TotDue" name="TotDue"  style="text-align:right;" /></td>
                                <td style="border-right:1px solid #D8D8D8;" class="text-right"> </td>
                                <td style="border-right:1px solid #D8D8D8;" class="text-right"> </td>
                            </tr>

                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <span style="color:red">No Bill Found.</span>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <br>
    &emsp; &emsp; <input type="button" class="bs" value="Back" onclick="back();" />
</form> 


<script>
    function isNumberKeyDot(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode
        //if (charCode > 31 && (charCode < 48 || charCode > 57))
        if (charCode > 31 && (charCode < 45 || charCode > 57))
            return false;
        return true;
    }
    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;
        return true;
    }
    function back() {
        window.location = "reportsView.form";
    }
    function updatePayment(id) {
        var url = "rmpRepById.htm?id=" + id + "&KeepThis=true&TB_iframe=true&width=900&height=600";
        tb_show("Update Payment", url);
    }
</script>
