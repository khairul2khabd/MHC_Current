<%--
 *  Copyright 2013 Society for Health Information Systems Programmes, India (HISP India)
 *
 *  This file is part of Billing module.
 *
 *  Billing module is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.

 *  Billing module is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with Billing module.  If not, see <http://www.gnu.org/licenses/>.
 *  author: Ghanshyam
 *  date:   25-02-2013
 *  New Requirement #966[Billing]Add Paid Bill/Add Free Bill for Bangladesh module
--%>
<%@ include file="/WEB-INF/template/include.jsp"%>
<%@ include file="/WEB-INF/template/header.jsp"%>
<%@ include file="../includes/js_css.jsp"%>
<%@ page import="java.util.Map"%>
<%@ page import="org.openmrs.Patient"%>
<openmrs:require privilege="View Bills" otherwise="/login.htm" />
<style type="text/css">
    .hidden {
        display: none;
    }
</style>

<style>
    @media print {
        .donotprint {
            display: none;
        }
        .spacer {
            margin-top: 70px;
            font-family: "Dot Matrix Normal", Arial, Helvetica, sans-serif;
            font-style: normal;
            font-size: 14px;
        }
        .printfont {
            font-family: "Dot Matrix Normal", Arial, Helvetica, sans-serif;
            font-style: normal;
            font-size: 14px;
        }
    </style>

    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath}/moduleResources/billing/styles/paging.css" />
    <script type="text/javascript"
    src="${pageContext.request.contextPath}/moduleResources/billing/scripts/paging.js"></script>
    <script type="text/javascript"
    src="${pageContext.request.contextPath}/moduleResources/billing/scripts/jquery/jquery-1.4.2.min.js"></script>
    <script type="text/javascript"
    src="${pageContext.request.contextPath}/moduleResources/billing/scripts/common.js"></script>
    <script type="text/javascript"
    src="${pageContext.request.contextPath}/moduleResources/billing/scripts/jquery/jquery-ui-1.8.2.custom.min.js"></script>
    <script type="text/javascript"
    src="${pageContext.request.contextPath}/moduleResources/billing/scripts/jquery/jquery.PrintArea.js"></script>
    <%-- ghanshyam 25-02-2013 New Requirement #966[Billing]Add Paid Bill/Add Free Bill for Bangladesh module --%>
    <script type="text/javascript">
        jQuery(document).ready(
                function() {
                    // hide comment
                    jQuery("#commentField").hide();
                    jQuery("#okButton").hide();
                });
    </script>
    <script type="text/javascript">
        function showAndHide() {
            jQuery("#commentField").toggle();
            jQuery("#okButton").toggle()
        }
    </script>
    <script type="text/javascript">
        function validate() {
            if (StringUtils.isBlank(jQuery("#comment").val())) {
                alert("Please enter comment");
                return false;
            }
            else {
                var patientId = ${patient.patientId};
                var billType = "free";
                var comment = jQuery("#comment").val();
                window.location.href = "addPatientServiceBillForBD.form?patientId=" + patientId + "&billType=" + billType + "&comment=" + comment;
            }
        }
    </script>
    <p>
        <b>
            <td><input type="button" value="Add Paid Bill"
                       onclick="window.location.href = 'addPatientServiceBillForBD.form?patientId=${patient.patientId}&billType=paid'" />
            </td>
            <td><input type="button" value="Add Free Bill" style="color: red"
                       onclick="showAndHide();" /></td>
            <td><span id="commentField">Comment <input id="comment"
                                                       name="comment" /> </span>
            </td>
            <td><span id="okButton"><input type="button" value="Ok"
                                           onclick="return validate();" /> </span></td> </b>

    </p>
    <c:forEach items="${errors}" var="error">
        <span class="error"><spring:message
                code="${error.defaultMessage}" text="${error.defaultMessage}" /> </span>
        </c:forEach>
        <c:if test="${not empty bill}">
        <div id="billContainer" style="margin: 10px auto; width: 981px;">
            <table>
                <!-- <img src="${pageContext.request.contextPath}/images/hospital_logo.bmp" width="504" height="75" alt="logo"/> -->
                <img src="${pageContext.request.contextPath}/images/hospital_logo.bmp" width="504" height="75" alt="logo"/>
                <tr>
                    <td>Patient ID :</td>
                    <td>${patient.patientIdentifier.identifier}</td>
                </tr>
                <!--New Code Entry here -->
                <tr>
                    <td>Patient Name :</td>
                    <td>${patient.givenName}&nbsp;&nbsp;${patient.middleName}&nbsp;&nbsp;
                        ${patient.familyName}</td>
                </tr>
                <tr>
                    <td>${relationType }:</td>
                    <td> ${relationName }</td>
                <tr>
                    <td>Patient Age :</td>
                    <td>${age}</td>
                </tr>
                <tr>
                    <td colspan="2"><c:if test="${not empty admittedStatus }">
                            <span style="background-color: red; color: white; font-size:16px;">Admitted To : ${admittedWard.name} &nbsp; &nbsp; Bed No : ${bed}</span>

                        </c:if>
                    </td>
                </tr>
                <!--End Code -->
                <tr>
                    <td>Date:</td>
                    <td><openmrs:formatDate date="${bill.createdDate}"
                                        type="textbox" /></td>
                </tr>
                <tr>
                    <td>Bill ID:</td>
                    <td>${bill.receipt.id}</td>
                </tr>
                <c:if test="${bill.voided==true }">
                    <tr>
                        <td>Bill Description:</td>
                        <td>${bill.description}</td>
                    </tr>
                </c:if>
            </table>
            <table width="100%" border="1">
                <tr>
                    <!-- Sept 22,2012 -- Sagar Bele -- Issue 387 --Adjust allignment in table-->
                    <th align="center">Service Name</th>
                        <%--Kesavulu 26-2-2013 support #962 [Billing]change RS to TK for Bangladesh module --%>
                    <th align="center">Price (Tk)</th>
                    <th align="center">Quantity</th>
                    <th align="center">Amount</th>
                </tr>
                <c:forEach items="${bill.billItems}" var="item" varStatus="status">
                    <%-- ghanshyam Support #339 [Billing]print of void bill [3.2.7 snapshot][DDU,Mohali,Solan,Tanda,] --%>
                    <c:if test="${item.voidedDate==null}">
                        <tr>
                            <td>${item.name}</td>
                            <td align="right">${item.unitPrice}</td>
                            <td align="right">${item.quantity}</td>
                            <td class="printfont" height="20" align="right" style=""><c:choose>
                                    <c:when test="${not empty item.actualAmount}">
                                        <c:choose>
                                            <c:when test="${item.actualAmount eq item.amount}">
                                                ${item.amount}
                                            </c:when>
                                            <c:otherwise>
                                                <span style="text-decoration: line-through;">${item.amount}</span>
                                                <b>${item.actualAmount}</b>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:when>
                                    <c:otherwise>
                                        ${item.amount}
                                    </c:otherwise>

                                </c:choose></td>
                        </tr>
                    </c:if>
                </c:forEach>
                <tr>
                    <!-- Sept 22,2012 -- Sagar Bele -- Issue 387 --Adjust allignment in table-->
                    <td colspan="3" align='right'><b>Total 
                    </td>
                    <td align="right"><c:choose>
                            <c:when test="${not empty bill.actualAmount}">
                                <c:choose>
                                    <c:when test="${bill.actualAmount eq bill.amount}">
                                        <c:choose>
                                            <c:when test="${bill.voided==true }">
                                                <span style="text-decoration: line-through;"> <b>${bill.amount}</b>
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <b>${bill.amount}</b>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:when>
                                    <c:otherwise>
                                        <span style="text-decoration: line-through;">${bill.amount}</span>
                                        <c:choose>
                                            <c:when test="${bill.voided==true }">
                                                <span style="text-decoration: line-through;"> <b>${bill.actualAmount}</b>
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <b>${bill.actualAmount}</b>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:otherwise>
                                </c:choose>
                            </c:when>
                            <c:otherwise>
                                ${bill.amount}
                            </c:otherwise>
                        </c:choose></td>
                </tr>
            </table>
            <br>
            <form method="POST" id="billForm">
                <center>
                    <input type="button" value='<spring:message code="billing.print" />'  onClick="printDiv2();" />&nbsp;&nbsp; 
                    <a href="#"  onclick="javascript:jQuery('#billContainer').hide();">Hide</a>
                </center>
            </form>
        </div>

        <!-- PRINT DIV -->

        <div id="printDiv" class="hidden"
             style="width: 1280px; font-size: 0.8em">
            <style>
                
                @media print {
                    .donotprint {
                        display: none;
                    }
                    .spacer {
                        margin-top: 10px;
                        font-family: "Dot Matrix Normal", Arial, Helvetica, sans-serif;
                        font-style: normal;
                        font-size: 14px;
                    }
                    .printfont {
                        font-family: "Dot Matrix Normal", Arial, Helvetica, sans-serif;
                        font-style: normal;
                        font-size: 14px;

                    }
                </style>
                <input type="hidden" id="contextPath"
                       value="${pageContext.request.contextPath}" /> 
                <img  class="donotprint"  src="${pageContext.request.contextPath}/moduleResources/billing/mchti.jpg"
                       width="981" height="212"></img>
                <table class="spacer" style="margin-left: 60px;">
                    <tr>
                      <!--  <td colspan="5"><img src="${pageContext.request.contextPath}/images/hospital_logo.bmp" width="504" height="75" alt="logo"/></td> -->
                        <td colspan="5"> 
                          <!--  <img  src="${pageContext.request.contextPath}/images/hospital_logo.bmp" width="504" height="75" alt="logo"/></td> -->
                    </tr>   
                    
                    
                    <!--  New Code Enter -->
                    
                    
                    <tr>
                        <td><strong>Patient ID :</strong> &nbsp; ${patient.patientIdentifier}</td>
                        <td><strong>${relationType } :</strong> &nbsp; ${relationName } </td>
                    </tr>
                    <tr>
                        <td><strong>Patient Name :</strong> &nbsp; ${patient.givenName}&nbsp;&nbsp;${patient.middleName}&nbsp;&nbsp;
                            ${patient.familyName}</td>
                        <td><strong>Date :</strong> &nbsp;<openmrs:formatDate date="${bill.createdDate}" type="textbox" /></td>
                    </tr>
                    <tr>
                        <td><strong>Patient Age :</strong> &nbsp;&nbsp;&nbsp;&nbsp;${age}</td>
                    </tr>
                    <tr>
                         <td colspan="2"><c:if test="${not empty admittedStatus }">
                                 <span style="background-color: red; color: white; font-size:16px;"><strong>Admitted Ward :</strong> ${admittedWard.name} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Bed No :</strong> ${bed}</span>

                        </c:if>
                    </td>
                    </tr>
                    <!--End-->

                    <td colspan="3"><strong>Bill ID:</strong> &nbsp; ${bill.receipt.id}</td>
                    </tr>
                    <c:if test="${bill.voided==true }">
                        <tr>
                            <td>Bill Description:</td>
                            <td>${bill.description}</td>
                        </tr>
                    </c:if>
                </table>
                <table class="printfont"
                       style="margin-left: 60px; margin-top: 10px; font-family: 'Dot Matrix Normal', Arial, Helvetica, sans-serif; font-style: normal;"
                       width="80%">
                    <thead>
                    <th class="printfont" align="left" style="">Service Name</th>
                        <%--Kesavulu 26-2-2013 support #962 [Billing]change RS to TK for Bangladesh module --%>
                    <th class="printfont" style="">Price (Tk)</th>
                    <th class="printfont" style="">Quantity</th>
                    <th class="printfont" style="">Amount</th>
                    </thead>
                    <c:forEach items="${bill.billItems}" var="item" varStatus="status">
                        <%-- ghanshyam Support #339 [Billing]print of void bill [3.2.7 snapshot][DDU,Mohali,Solan,Tanda,] --%>
                        <c:if test="${item.voidedDate==null}">
                            <tr>
                                <td class="printfont" height="20" align="" style="">${item.name}</td>
                                <td class="printfont" height="20" align="center" style="">${item.unitPrice}</td>
                                <td class="printfont" height="20" align="center" style="">${item.quantity}</td>
                                <td class="printfont" height="20" align="center" style="">
                                    ${item.actualAmount}</td>
                            </tr>
                        </c:if>
                    </c:forEach>
                    <style>
                        tr.line td{ 
                            border-top: 1px solid #B4B5B0; 
                        }
                    </style>
                    <tr class="line">

                        <td colspan="3">Total</td>
                        <c:choose>
                            <c:when test="${bill.voided}">
                                <td align="center"><span style="text-decoration: line-through;">${bill.actualAmount}</span>
                                </td>

                            </c:when>
                            <c:otherwise>
                                <td align="center">${bill.actualAmount}</td>
                            </c:otherwise>
                        </c:choose>
                    </tr>
                </table>
                <%--Kesavulu 26-2-2013 support #962 [Billing]change RS to TK for Bangladesh module --%>
                <br> <span class="printfont" style="margin-left: 60px;">Total Amount:</span> Taka <span id="totalValue2" class="printfont"> </span> only
                <br /> <br /> <br /> <br /> <br /> <br /> <span
                    class="printfont" style="margin-left: 200px;">Signature of billing clerk/ Stamp</span>
            </div>


        </c:if>

        <!-- END PRINT DIV -->


        <script>
            function printDivNoJQuery() {
                var divToPrint = document.getElementById('printDiv');
                var newWin = window
                        .open('', '',
                                'letf=0,top=0,width=1,height=1,toolbar=0,scrollbars=0,status=0');
                newWin.document.write(divToPrint.innerHTML);
                newWin.print();
                newWin.close();
                //setTimeout(function(){window.location.href = $("#contextPath").val()+"/getBill.list"}, 1000);	
            }
            function printDiv2() {
                var printer = window.open('left=0', 'top=0', 'width=300,height=300');
                printer.document.open("text/html");
                printer.document.write(document.getElementById('printDiv').innerHTML);
                printer.document.close();
                printer.window.close();
                printer.print();
                jQuery("#billForm").submit();
                //alert("Printing ...");
            }
        </script>

        <c:if test="${not empty listBill}">
            <!-- Sept 22,2012 -- Sagar Bele -- Issue 387 --update title-->
            <span class="boxHeader">List of Bills</span>
            <table class="box">
                <thead>
                <th>#</th>
                <th>Bill Name</th>
                <th>Description</th>
                <th>Action</th>
            </thead>
            <c:forEach items="${listBill}" var="bill" varStatus="varStatus">
                <tr class='${varStatus.index % 2 == 0 ? "oddRow" : "evenRow" } '>
                    <td class='<c:if test="${bill.voided}">retired </c:if>'><c:out
                            value="${(( pagingUtil.currentPage - 1  ) * pagingUtil.pageSize ) + varStatus.count }" />
                    </td>
                    <td class='<c:if test="${bill.voided}">retired </c:if>'><c:choose>
                            <c:when
                                test="${bill.voided == false && ( bill.printed == false || ( bill.printed == true && canEdit == true ) )}">
                                <%-- ghanshyam 25-02-2013 New Requirement #966[Billing]Add Paid Bill/Add Free Bill for Bangladesh module --%>
                                <a
                                    href="${pageContext.request.contextPath}/module/billing/editPatientServiceBillForBD.form?billId=${bill.patientServiceBillId}&patientId=${patient.patientId}">Bill
                                    ID <b>${bill.receipt.id}</b>,<openmrs:formatDate
                                        date="${bill.createdDate }" type="textbox" /> </a>
                            </td>
                        </c:when>
                        <c:otherwise>
                            Bill ID <b>${bill.receipt.id}</b>,
                            <openmrs:formatDate date="${bill.createdDate }" />
                        </c:otherwise>
                    </c:choose>
                <td>${bill.description}</td>
                <td class='<c:if test="${bill.voided}">retired </c:if>'>
                    <%-- ghanshyam Support #339 [Billing]print of void bill [3.2.7 snapshot][DDU,Mohali,Solan,Tanda,] --%>
                    <c:choose>
                        <c:when test="${bill.voided}">
                            <input type="button" value="View"
                                   onclick="javascript:window.location.href = 'patientServiceVoidedBillViewForBD.list?patientId=${patient.patientId}&billId=${bill.patientServiceBillId}'" />
                        </c:when>
                        <c:otherwise>
                            <input type="button" value="View"
                                   onclick="javascript:window.location.href = 'patientServiceBillForBD.list?patientId=${patient.patientId}&billId=${bill.patientServiceBillId}'" />
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
        <tr class="paging-container">
            <td colspan="3"><%@ include file="../paging.jsp"%></td>
        </tr>
    </table>
</c:if>

<%--ghanshyam 12-dec-2012 Bug #458 [BILLING 3.2.8-SNAPSHOT] Edit in patient category, the amount in figures and words in the print out of the previous bill is not same--%>
<input type="hidden" id="total" value="${bill.actualAmount}">

<script>
    function printDiv() {
        jQuery("div#printDiv").printArea({
            mode: "iframe"
        });
        jQuery("#billForm").submit();

        //setTimeout(function(){window.location.href = $("#contextPath").val()+"/module/billing/getBill.list"}, 1000);
    }
    jQuery(document).ready(function() {
        jQuery("#totalValue2").html(toWords(jQuery("#total").val()));
    });
</script>

<%@ include file="/WEB-INF/template/footer.jsp"%>
</div>