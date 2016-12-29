<%-- 
    Document   : comView
    Created on : Mar 27, 2016, 11:28:11 AM
    Author     : Khairul
--%>
<%@ include file="/WEB-INF/template/include.jsp"%>
<%@ include file="/WEB-INF/template/header.jsp"%>
<%@ include file="../includes/js_css.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

        /// auto calculation commission net amount
        var r = r;
        $('.netamount').attr('value', function() {
            $('.netamount').each(function(incon) {
                var con = incon.toString();
                var serqunid = con.concat("commission");
                var serpriid = con.concat("serPrice");
                var netAm = con.concat("netamount");
                var l = con.concat("lessAm");
                serqun = jQuery("#" + serqunid).val();
                unpri = jQuery("#" + serpriid).val();
                less = jQuery("#" + l).val();
                var ll = ((serqun * unpri) / 100);
                if (less < ll) {
                    jQuery("#" + netAm).val(ll);
                }
                else {
                    jQuery("#" + netAm).val("0");
                }
            });
            return r;
        });
    });

    function saveCommission() {
        var paid = document.getElementById("paid").value;
        //  var docNet = document.getElementById("docNet").value;
        if (paid == null || paid == "")
        {
            alert("Paid Amount Empty or Zero !!!");
            $("#paid").focus();
            return false;
        }
        jQuery("#commissionCalForm").mask("<img src='" + openmrsContextPath + "/moduleResources/billing/spinner.gif" + "'/>&nbsp;");

        var comId = jQuery("#comId").val();
        var indCount = jQuery("#indCount").val();
        var sDateValue = jQuery("#sDateValue").val();
        var eDateValue = jQuery("#eDateValue").val();
        var totalBill = jQuery("#totalBill").val();
        var dcomm = jQuery("#dcomm").val();
        var lamount = jQuery("#lamount").val();
        var docNet = jQuery("#docNet").val();
        var docId = jQuery("#docId").val();
        var note = jQuery("#note").val();
        var paid = jQuery("#paid").val();
        var due = jQuery("#due").val();
        var status = 0;

        jQuery.ajax({
            type: "POST",
            url: getContextPath() + "/module/billing/comSave.form",
            data: ({
                comId: comId,
                sDateValue: sDateValue,
                eDateValue: eDateValue,
                totalBill: totalBill,
                dcomm: dcomm,
                docNet: docNet,
                lamount: lamount,
                docId: docId,
                note: note,
                paid: paid,
                due: due,
                status: status,
                indCount: indCount
            }),
            success: function(data) {
                alert("Successfully added!");
                window.location.href = openmrsContextPath + "/module/billing/comView.htm"
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

    function printDiv3() {
        var printer = window.open('left=0', 'top=0', 'width=300,height=300');
        printer.document.open("text/html");
        printer.document.write(document.getElementById('p').innerHTML);
        printer.print();
        printer.document.close();
        printer.window.close();
        document.getElementById('printbill').value = "Printed !!!";
        $('#printbill').css({"background-color": "#eee", "color": "red", "font-weight": "bold"});
        //  jQuery("#billPrint").submit();
        // window.location = "directbillingqueue.form";
    }
    function back() {
        window.location = "reportsView.form";
    }
 
    function viewCommission() {
        if (SESSION.checkSession()) {
            var dName = document.getElementById("docIdName").value;
            var sDate = document.getElementById("sDate").value;
            var eDate = document.getElementById("eDate").value;
            var status = document.getElementById("status").value;

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
            else {
                if (status == "0") {
                    jQuery("#commissionCalForm").submit();
                }
                else if (status == "1") {
                    jQuery("#commissionCalForm").submit();
                }
            }

        }
    }
</script>
<input type="hidden" id="pageId" value="commissionCalPage" />
<form class="form-rep-view" method="get" action="comResult.htm" id="commissionCalForm" onsubmit="return validate()" > 


    <div class="boxHeader1">   <strong>Doctor Commission Calculation</strong></div>
    <div class="box1">
        <input type="hidden" id="indCount" name="indCount" value="${diaComCalSize}" />
        <span style="font-size:14px; font-weight: bold;"> Doctor Id / Name : </span> 
        <input type="text" placeholder="Please Enter Doctor Id / Name " 
               ondblclick="this.value = '';" id="docIdName" name="docIdName" style="width:250px;"/> &nbsp;&nbsp;

        <select id="selectedDocId" size="4" style="display:none;" name="selectedDocId" ><option value="0">Please Select</option></select>
        <span style="font-size:14px; font-weight: bold;"> Start Date : </span> 
        <input type="text" placeholder="Please Enter Start Date " id="sDate" name="sDate" style="width:250px;"/> &nbsp;&nbsp;
        <span style="font-size:14px; font-weight: bold;"> End Date : </span>  
        <input type="text" placeholder="Please Enter End Date " id="eDate" name="eDate" style="width:250px;"/> &nbsp;&nbsp;

        <select id="status" name="status" class="styled-select blue semi-square" style="width:140px; height:32px;" >
            <option value="0"  > Due  </option>
            <option value="1"  >  Paid </option>
        </select>

        <!-- <input type="submit"  value="Get View" class="bu-normal"  />  -->
        <input type="button" onclick="viewCommission();" value="Get View" class="bu-normal"  /> 
        <div id="billingqueue" style="padding:4px;"></div> 
    </div>

    <div id="paidData" style="padding:4px;"></div>


    <div class="box1" >
        <c:if test="${status eq '0'}">
            <center> <span style="font-size:16px;  font-weight:bold;"> Due </span> </center>
            </c:if>
            <c:if test="${status eq '1'}">
            <center> <span style="font-size:16px;  font-weight:bold;"> Paid </span> </center>
            </c:if>
            <c:if test="${not empty docInfo.id}">
            <div style="padding-left:100px; padding-bottom:7px; color:#000;"> Dr Code : <span style="font-size:16px; font-weight:bold;"> ${docInfo.id} </span> ||  
                Doctor Name : <span style="font-size:16px; font-weight:bold;"> ${docInfo.doctorName} </span>  
                <label style="float:right; padding-right:100px; font-size:14px;"> Commission Showing Date : <openmrs:formatDate date="${startDate}" /> - <openmrs:formatDate date="${endDate}" /> </label>
            </div>
            <input type="hidden" value="<%= request.getParameter("sDate") %>" id="sDateValue" name="sDateValue" /> 
            <input type="hidden" value="<%= request.getParameter("eDate") %>" id="eDateValue" name="eDateValue" />
            <input type="hidden" value="<%= request.getParameter("docIdName") %>" id="docId" name="docId" />

        </c:if>
        <div class="container" style="width:90%" >
            <c:set var="serPriceTotal" value="${0.00}"/> 
            <c:set var="totalLess" value="${0.00}"/> 
            <c:set var="totalReferral" value="${0.00}"/>
            <c:set var="refPayable" value="${0.00}"/>
            <c:choose>
                <c:when test="${not empty diaComCal}">
                    <table id="patientInfo" class="table_data table-striped text-left">     						
                        <thead class="text-left">
                            <tr>
                                <th style="align:left;"><b>Date</b></th>
                                <th><b>Bill Id</b></th>
                                <th><b>Patient Name</b></th>
                                <th><b>Investigation</b></th>
                                <th width="7%"><b>Service Price (Tk)</b></th>							
                                <th width="7%"><b>Less Amount (Tk)</b></th>
                                <th width="7%"><b>Referral Amount (Tk)</b></th>
                                <th width="7%"><b>Discount(%)</b></th>
                                <th width="7%"><b>Total Referral (Tk)</b></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${diaComCal}" var="patient"  varStatus="index">
                                <c:set var="com" value="${patient.commission}"/>
                                <c:set var="ser" value="${patient.servicePrice}"/>
                                <c:set var="refAmount" value="${ (ser * com)/100 }"/>
                                <c:set var="lessAm"><fmt:parseNumber  type="number"    value="${patient.lessAmount}" /> </c:set>
                                <c:set var="serPri"><fmt:parseNumber  type="number"    value="${patient.servicePrice}" /> </c:set>
                                <c:set var="lessAmPercentage" value="${ (lessAm /serPri)*100 }"/>

                                <c:if test="${ refAmount >= lessAm }">
                                    <c:set var="payable" value="${refAmount - lessAm }"/>
                                </c:if>
                                <c:if test="${ refAmount < lessAm }">
                                    <c:set var="payable" value="${0.00}"/>
                                </c:if>
                                <tr> 
                                    <td style="display:none;"><input type="text" value="${patient.refId}"  id="comId" name="comId" /> </td>
                                    <td style="border-right:1px solid #D8D8D8;"><openmrs:formatDate date="${patient.createdDate}" /></td>  
                                    <td style="border-right:1px solid #D8D8D8;padding-left:10px;"> ${patient.diaPatientServiceBill.billId}  </td>
                                    <td style="border-right:1px solid #D8D8D8;">${patient.patient.givenName} ${patient.patient.familyName}  </td>
                                    <td style="border-right:1px solid #D8D8D8;"> ${patient.serviceName}  </td>
                                    <td style="border-right:1px solid #D8D8D8; text-align:right;"> 
                                        ${patient.servicePrice} 
                                    </td>
                                    <td style="border-right:1px solid #D8D8D8; text-align:right;"> 
                                        ${patient.lessAmount}
                                    </td>
                                    <td style="border-right:1px solid #D8D8D8; text-align:right;" title=" ${patient.commission} % ">
                                        ${refAmount} 
                                    </td> <!-- Referral amount -->
                                    <td style="border-right:1px solid #D8D8D8; text-align:center;"> 
                                        <fmt:formatNumber type="number" maxFractionDigits="2" value="${lessAmPercentage}" /> 	  
                                    </td>
                                    <td style="border-right:1px solid #D8D8D8; text-align:right;"> ${payable}</td>
                                </tr>
                                <c:set var="serPriceTotal" value="${serPriceTotal + patient.servicePrice}"/>
                                <c:set var="totalLess" value="${totalLess + lessAm }"/> 
                                <c:set var="totalReferral" value="${totalReferral + refAmount}"/>
                                <c:set var="refPayable" value="${ refPayable + payable }"/>
                            </c:forEach>
                            <tr>
                                <td colspan="4" style="border-right:1px solid #D8D8D8; text-align:right; font-weight:bold; font-size:16px; color:#000;"> Total &emsp;</td>
                                <td style="border-right:1px solid #D8D8D8; text-align:right; font-weight:bold; font-size:14px; color:#000;"> ${serPriceTotal} </td>
                                <td style="border-right:1px solid #D8D8D8; text-align:right; font-weight:bold; font-size:14px; color:#000;"> ${totalLess}</td>
                                <td style="border-right:1px solid #D8D8D8; text-align:right; font-weight:bold; font-size:14px; color:#000;"> ${totalReferral} </td>
                                <td style="border-right:1px solid #D8D8D8; text-align:right; font-weight:bold; font-size:14px; color:#000;"> </td>
                                <td style="border-right:1px solid #D8D8D8; text-align:right; font-weight:bold; font-size:14px; color:#000;"> ${refPayable} </td>
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
    <c:if test="${not empty diaComCal}">
        <c:if test="${status eq '0'}">
            <div  style="margin-left:100px;">
                <span style="font-size:16px; font-weight:bold; color:#000;">Total Service Amount    : </span>
                <input type="value" id="totalBill" name="totalBill"  readOnly="true" value="${serPriceTotal}"
                       style="width:150px; text-align:right;  color:blue;  font-size:18px; font-weight:bold; background-color:#fff; "/> 

                <span style="font-size:16px; padding-left:50px; font-weight:bold; color:#000;">Total Payable Amount : &nbsp; </span> 
                <input type="value" id="dcomm" name="dcomm"  readOnly="true" value="${refPayable}"  style="width:150px; text-align:right;  color:blue;  font-size:18px; font-weight:bold; background-color:#fff; "/>   &emsp;&emsp;
                <br><br>
                <span style="font-size:16px; padding-left: 0px; font-weight:bold; color:#000;">Doctor Commission : &emsp; </span> 
                <input type="value" id="docNet" name="docNet"  readOnly="true" value="${refPayable}"  style="width:150px; height:35px; text-align:right;  color:green;  font-size:18px; font-weight:bold; background-color:#fff;"/>   
                &emsp;&emsp;&emsp;
                <span style="font-size:16px; padding-left: 0px; font-weight:bold; color:#000;">Paid Amount : </span> &emsp;  &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="value" id="paid" name="paid" style="width:150px; text-align:center; height:35px; color:red;  font-size:18px; font-weight:bold; background-color:#fff;"
                       onkeyup="dueamountcal(this)" onkeypress="return isNumberKey(event)"	/>
                &emsp;&emsp;&emsp; &emsp;&emsp;&emsp;
                <span style="font-size:16px; padding-left: 0px; font-weight:bold; color:#000;">Due Amount : </span> &emsp;  &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="value" id="due" name="due" style="width:150px; text-align:center;  color:blue;  font-size:18px; font-weight:bold; background-color:#fff;" />
            </div>
            <br>
            <textarea style="border-radius:10px 2px 10px 2px; height:50px; width:45%; padding:5px; font-size:18px; line-height: 180%; margin-left:100px;" placeholder="note"
                      type="text" id="note" name="note"></textarea> &nbsp;&nbsp;&nbsp;&nbsp;
            <input type="button" class="bs" value="Save" onclick="saveCommission();" /> &nbsp;&nbsp;&nbsp;
            <input type="button" id="printbill" class="bs" value="Print" onclick="printDiv3();" /> 
        </c:if>
    </c:if>

    <c:if test="${not empty diaComCal}">
        <c:if test="${status eq '1'}">
            <div  style="margin-left:100px;">
                <span style="font-size:16px; font-weight:bold; color:#000;">Total Service Amount    : </span>
                <input type="value" id="totalBill" name="totalBill"  readOnly="true" value="${serPriceTotal}"
                       style="width:150px; text-align:right;  color:blue;  font-size:18px; font-weight:bold; background-color:#fff; "/> 
                <span style="font-size:16px; padding-left:50px; font-weight:bold; color:#000;">Total Payable Amount : &nbsp; </span> 
                <input type="value" id="dcomm" name="dcomm"  readOnly="true" value="${refPayable}"  style="width:150px; text-align:right;  color:blue;  font-size:18px; font-weight:bold; background-color:#fff; "/>   &emsp;&emsp;
                <br><br>
                <span style="font-size:16px; padding-left: 0px; font-weight:bold; color:#000;">Doctor Commission : &emsp; </span> 
                <input type="value" id="docNet" name="docNet"  readOnly="true" value="${refPayable}"  style="width:150px; height:35px; text-align:right;  color:green;  font-size:18px; font-weight:bold; background-color:#fff;"/>   
            </div>
            <br>
            <input type="button" id="printbill" class="bs" value="Print" onclick="printDiv3();" /> 
        </c:if>
    </c:if>
    &emsp; &emsp; <input type="button" class="bs" value="Back" onclick="back();" />

</form> 

<form>
    <div style="display:none; font-size:14px;"   id="p" >
        <center> <b style="font-size:18px;"> BILL </b> </br> 
            Period :  <%= request.getParameter("sDate") %> - <%= request.getParameter("eDate") %>
        </center> <br>
        <b> Dr Code : ${docInfo.id}  &emsp;&emsp;&emsp; ${docInfo.doctorName}, ${docInfo.degree} </b> <br>
        <c:if test="${not empty docInfo.address}" > <b> Address : </b> ${docInfo.address} </c:if> </br> &nbsp;

        <c:set var="serPriceTotal1" value="${0.00}"/> 
        <c:set var="totalLess1" value="${0.00}"/> 
        <c:set var="totalReferral1" value="${0.00}"/>
        <c:set var="refPayable1" value="${0.00}"/>

        <table style=" font-size:12px;  border-collapse: collapse; border :1pt solid #999; width: 100%;  font-family:arial;"  >  						
            <tr>
                <th width="5%" class="a left"><b>Date</b></th>
                <th width="7%" class="a left"><b>Patient Id</b></th>
                <th class="a"><b>Patient Name</b></th>
                <th width="40%" class="a right"><b>Investigation</b></th>
                <th width="7%" class="a right"><b>Service Price (Tk)</b></th>							
                <th width="7%" class="a right"><b>Less Amount (Tk)</b></th>
                <th width="7%" class="a right"><b>Referral Amount (Tk)</b></th>
                <th width="3%" class="a right"><b>Discount (%)</b></th>
                <th width="7%" class="a right"><b>Total Referral (Tk)</b></th>
            </tr>

            <tbody>

                <c:forEach items="${listDiaComAll}" var="d"  varStatus="index">
                    <c:set var="toser" value="${0.00}"/>
                    <c:set var="ref" value="${0.00}"/>
                    <c:set var="totalRef" value="${0.00}"/>
                    <c:set var="allSerName" value="${'null'}"/>
                    <c:set var="totalLessByPatient" value="${0.00}"/>

                    <c:forEach items="${diaComCal}" var="patient"  varStatus="index">

                        <c:if test="${patient.diaPatientServiceBill.billId eq d.diaPatientServiceBill.billId}">

                            <c:set var="com" value="${patient.commission}"/>
                            <c:set var="ser" value="${patient.servicePrice}"/>
                            <c:set var="refAmount" value="${ (ser * com)/100 }"/>
                            <c:set var="ref" value="${ref + refAmount }"/> 
                            <c:set var="toser" value="${toser + patient.servicePrice }"/> 
                            <c:set var="lessAm"><fmt:parseNumber  type="number"    value="${patient.lessAmount}" /> </c:set>
                            <c:set var="serPri"><fmt:parseNumber  type="number"    value="${patient.servicePrice}" /> </c:set>
                            <c:set var="lessAmPercentage" value="${ (lessAm /serPri)*100 }"/>

                            <c:if test="${ refAmount >= lessAm }">
                                <c:set var="payable" value="${refAmount - lessAm }"/>
                                <c:set var="totalRef" value="${totalRef + payable }"/> 
                            </c:if>
                            <c:if test="${ refAmount < lessAm }">
                                <c:set var="payable" value="${0.00}"/>
                            </c:if>

                            <c:set var="allSerName" value="${patient.serviceName}, ${allSerName}"/>							
                            <c:set var="allSerName" value="${fn:replace(allSerName, ', null', '')}" />
                            <c:set var="totalLessByPatient" value="${totalLessByPatient + lessAm }"/> 
                            <c:set var="t"><fmt:parseNumber  type="number"    value="${totalLessByPatient}" /> </c:set> <!-- Total less by patient convert number format -->
                            <c:set var="tt"><fmt:parseNumber  type="number"    value="${toser}" /> </c:set> <!-- Total service by patient convert number format -->
                        </c:if>

                    </c:forEach>

                    <c:set var="lessper" value="${(t/tt)*100 }"/>    <!-- Less Percentage -->

                    <tr>
                        <td class="a left"><openmrs:formatDate date="${d.createdDate}" /> </td>
                        <td class="a left"><!-- ${d.diaPatientServiceBill.billId} -->
                            ${d.patient.patientIdentifier.identifier} 
                        </td>
                        <td class="a left"> ${d.patient.givenName} ${d.patient.familyName} </td>
                        <td class="a left"> ${allSerName} </td>
                        <td align="right" class="a right"> ${toser}  </td>
                        <td align="right" class="a right"> ${totalLessByPatient} </td>
                        <td align="right" class="a right"> ${ref} </td>
                        <td align="center" class="a right">  

                            <fmt:formatNumber type="number" maxFractionDigits="2" value="${lessper}" /> 

                        </td>
                        <td align="right" class="a right"> ${totalRef}  </td>
                    </tr>

                </c:forEach>

                <c:forEach items="${diaComCal}" var="patient"  varStatus="index">
                    <c:set var="com" value="${patient.commission}"/>
                    <c:set var="ser" value="${patient.servicePrice}"/>
                    <c:set var="refAmount" value="${ (ser * com)/100 }"/>
                    <c:set var="lessAm"><fmt:parseNumber  type="number"    value="${patient.lessAmount}" /> </c:set>
                    <c:set var="serPri"><fmt:parseNumber  type="number"    value="${patient.servicePrice}" /> </c:set>
                    <c:set var="lessAmPercentage" value="${ (lessAm /serPri)*100 }"/>
                    <c:if test="${ refAmount >= lessAm }">
                        <c:set var="payable" value="${refAmount - lessAm }"/>
                    </c:if>
                    <c:if test="${ refAmount < lessAm }">
                        <c:set var="payable" value="${0.00}"/>
                    </c:if>

                    <c:set var="serPriceTotal1" value="${serPriceTotal1 + patient.servicePrice}"/>
                    <c:set var="totalLess1" value="${totalLess1 + lessAm }"/> 
                    <c:set var="totalReferral1" value="${totalReferral1 + refAmount}"/>
                    <c:set var="refPayable1" value="${ refPayable1 + payable }"/>
                </c:forEach>
                <tr>
                    <td colspan="4" style="border-right:1px solid #D8D8D8; text-align:right; font-weight:bold; font-size:16px; color:#000;"> Total &emsp;</td>
                    <td style="border-right:1px solid #D8D8D8; text-align:right; font-weight:bold; font-size:14px; color:#000;"> ${serPriceTotal1} </td>
                    <td style="border-right:1px solid #D8D8D8; text-align:right; font-weight:bold; font-size:14px; color:#000;"> ${totalLess1}</td>
                    <td style="border-right:1px solid #D8D8D8; text-align:right; font-weight:bold; font-size:14px; color:#000;"> ${totalReferral1} </td>
                    <td style="border-right:1px solid #D8D8D8; text-align:right; font-weight:bold; font-size:14px; color:#000;"> </td>
                    <td style="border-right:1px solid #D8D8D8; text-align:right; font-weight:bold; font-size:14px; color:#000;"> ${refPayable1} </td>
                </tr>
            </tbody>
        </table>

        <style>
            .greenText{ 
                background-color:blue;
                color:white;
                font-weight:bold;
            }
            .styled-select {
                height: 40px;
                overflow: hidden;
                width: 280px;
                cursor:pointer;
                text-align: center;
            }
            .semi-square {
                -webkit-border-radius: 5px;
                -moz-border-radius: 5px;
                border-radius: 5px;
                background-color: #3b8ec2;
                color: #000;
                font-size:14px;
            }
            .styled-select option {
                -webkit-border-radius:4px;
                -moz-border-radius:4px;
                border-radius:2px;
                -webkit-box-shadow: 0 3px 0 #ccc, 0 -1px #fff inset;
                -moz-box-shadow: 0 3px 0 #ccc, 0 -1px #fff inset;
                box-shadow: 0 3px 0 #ccc, 0 -1px #fff inset;
                background-color: #eee;
                padding: 5px 5px;
                height:auto;
                width:100%;
            }
            .abc{
                border:1px solid #585858;
                border-collapse:collapse;
                width:100%;	
            }
            .normal{border: 0;
                    outline: none;
                    text-align:right;
                    width:100%;}
            .a{
                padding-left: 5px;
                border-bottom:1pt solid #999;
                border-right: 1px solid #585858;	
            }
            .a td{
                padding-left: 5px;
                border-bottom:1pt solid #999;
                border-right: 1px solid #585858;
            }
            .a left { text-align:center;}
            .a center {  text-align:center; }
            .a  right { text-align:right;}
        </style>
    </div>
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
    function dueamountcal(incon)
    {
        var paidamount = incon.value;
        var netamount = $('#docNet').val();
        $('#due').val(netamount - paidamount);
        var paid = document.getElementById("paid").value;
        var docNet = document.getElementById("docNet").value;
        var due = document.getElementById("due").value;
        if (due < 0)
        {
            alert("Paid Amount Grether than Doctor Commission Amount !!!");
            $("#paid").focus();
            $("#paid").val("");
            $("#due").val("");
            return false;
        }
    }
</script>
