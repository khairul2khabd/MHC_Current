<%-- 
    Document   : comView
    Created on : Mar 27, 2016, 11:28:11 AM
    Author     : Khairul
--%>
2nd page

<form class="form-rep-view"   > 


    <div id="dueDiv">
        <div class="box1">
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
            &nbsp;&nbsp;&nbsp;&nbsp;

            <input type="button" id="printbill" class="bs" value="Print" onclick="printDiv3();" /> 
        </c:if>
    </div>


</form> 
