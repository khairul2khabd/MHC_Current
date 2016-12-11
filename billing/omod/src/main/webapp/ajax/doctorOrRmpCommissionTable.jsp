<%-- 
    Document   : doctorOrRmpCommissionTable
    Created on : Dec 5, 2016, 4:03:50 PM
    Author     : Khairul
--%>


<%@ include file="/WEB-INF/template/include.jsp" %>

<center>
    <h2>Doctor Or RMP Commission Report</h2><br>
    <c:choose>
        <c:when test="${doctorOrRmp =='doctor'}">
            <c:choose>
                <c:when test="${not empty doctorPerformanceInfoList && singlePatient ==0}">        
                    <b> Doctor :</b> ${doctorPerformanceInfoList[0].doctorOrRmpName}
                </c:when>
                <c:otherwise>										
                    <b> Doctor</b>
                </c:otherwise>
            </c:choose>
            <br />
        </c:when>

        <c:when test="${doctorOrRmp =='rmp'}">

            <c:choose>
                <c:when test="${not empty doctorPerformanceInfoList && singlePatient ==0}">        
                    <b>  RMP : </b> ${doctorPerformanceInfoList[0].doctorOrRmpName}
                </c:when>
                <c:otherwise>										
                    <b> RMP</b>
                </c:otherwise>
            </c:choose>
            <br />
        </c:when>  
    </c:choose> <br>

    <b>Start Date: </b> ${sDate}   &nbsp;&nbsp;&nbsp;  <b>End Date: </b> ${eDate} </br></br></br>

</center>

<c:choose>
    <c:when test="${not empty doctorPerformanceInfoList}">
        <table border="1px"  style="width:100%;"  class="table_data ">
            <thead>
                <tr>
                    <th style="text-align: center;">SL NO.</th>
                    <th style="text-align: center;">Date</th>
                        <c:if test="${singlePatient!=0}">
                        <th style="text-align: center;">Doctor Or RMP Name</th>
                        </c:if>
                    <th style="text-align: center;">Bill Id</th>
                    <th style="text-align: center;">Patient Id</th>                  
                    <th style="text-align: center;">Patient Name</th>
                    <th style="text-align: center;">Actual Amount</th>
                    <th style="text-align: center;">Discount</th>
                    <th style="text-align: center;">Net Amount</th>
                    <th style="text-align: center;">Cash Paid Amount</th>
                    <th style="text-align: center;">C/O Paid Amount</th>
                    <th style="text-align: center;">Cash Amount</th>
                    <th style="text-align: center;">Due Amount</th>
                </tr>
            </thead>

            <c:set var="totalDiscountAmount" value="${0}"/>
            <c:set var="totalNetAmount" value="${0}"/>
            <c:set var="totalCashPaidAmount" value="${0}"/>
            <c:set var="totalCareOfPaidAmount" value="${0}"/>
            <c:set var="totalCashAmount" value="${0}"/><c:set var="totalActualAmount" value="${0}"/>
            <c:set var="totalDueAmount" value="${0}"/>
            <c:set var="temporaryPatientId" value=""/>
            <c:forEach items="${doctorPerformanceInfoList}" var="doctorPerformanceInfo" varStatus="varStatus">
                <c:choose>
                    <c:when test="${not empty temporaryPatientId && temporaryPatientId != doctorPerformanceInfo.doctorOrRmpId}">
                        <tr align="center"  >
                            <td></td>
                            <td></td>
                            <c:if test="${singlePatient!=0}">
                                <td></td>
                            </c:if>
                            <td></td>
                            <td></td>
                            <td></td>					
                            <td style="text-align: left;"><b>Total = <c:out value="${totalActualAmount }" /></b></td>
                            <td style="text-align: left;"><b>Total = <c:out value="${totalDiscountAmount }" /></b></td>
                            <td style="text-align: left;"><b>Total = <c:out value="${totalNetAmount }" /></b></td>
                            <td style="text-align: left;"><b>Total = <c:out value="${totalCashPaidAmount }" /></b></td>
                            <td style="text-align: left;"><b>Total = <c:out value="${totalCareOfPaidAmount }" /></b></td>
                            <td style="text-align: left;"><b>Total = <c:out value="${totalCashAmount }" /></b></td>
                            <td style="text-align: left;"><b>Total = <c:out value="${totalDueAmount }" /></b></td>			
                        </tr>
                        <c:set var="totalActualAmount" value="${0}"/>
                        <c:set var="totalDiscountAmount" value="${0}"/>
                        <c:set var="totalNetAmount" value="${0}"/>
                        <c:set var="totalCashPaidAmount" value="${0}"/>
                        <c:set var="totalCareOfPaidAmount" value="${0}"/>
                        <c:set var="totalCashAmount" value="${0}"/>
                        <c:set var="totalDueAmount" value="${0}"/>
                    </c:when>    
                </c:choose>

                <tr align="center" class='${varStatus.index % 2 == 0 ? "oddRow" : "evenRow" } '>
                    <td><c:out value="${varStatus.count }"/></td>	
                    <td>${doctorPerformanceInfo.createdDate}</td>
                    <c:if test="${singlePatient!=0}">
                        <td>${doctorPerformanceInfo.doctorOrRmpName}</td>
                    </c:if>
                    <td>${doctorPerformanceInfo.billId}</td>
                    <td>${doctorPerformanceInfo.patientIdentifier}</td>
                    <td>${doctorPerformanceInfo.patientName}</td>
                    <td style="text-align: right;">${doctorPerformanceInfo.actualAmount}</td>
                    <td style="text-align: right;">${doctorPerformanceInfo.discount}</td>
                    <td style="text-align: right;">${doctorPerformanceInfo.netAmount}</td>
                    <td style="text-align: right;">${doctorPerformanceInfo.cashPaidAmount}</td>
                    <td style="text-align: right;">${doctorPerformanceInfo.careOfPaidAmount}</td>
                    <td style="text-align: right;">${doctorPerformanceInfo.cashAmount}</td>
                    <td style="text-align: right;">${doctorPerformanceInfo.dueAmount}</td>
                    <c:set var="totalAmout" value="${totalAmout + doctorPerformanceInfo.cashAmount}"/>
                    <c:set var="totalActualAmount" value="${ totalActualAmount+doctorPerformanceInfo.actualAmount}"/>
                    <c:set var="totalDiscountAmount" value="${totalDiscountAmount +doctorPerformanceInfo.discount}"/>
                    <c:set var="totalNetAmount" value="${totalNetAmount +doctorPerformanceInfo.netAmount}"/>
                    <c:set var="totalCashPaidAmount" value="${totalCashPaidAmount +doctorPerformanceInfo.cashPaidAmount}"/>
                    <c:set var="totalCareOfPaidAmount" value="${totalCareOfPaidAmount +doctorPerformanceInfo.careOfPaidAmount}"/>
                    <c:set var="totalCashAmount" value="${ totalCashAmount+doctorPerformanceInfo.cashAmount}"/>
                    <c:set var="totalDueAmount" value="${totalDueAmount +doctorPerformanceInfo.dueAmount}"/>
                </tr>

                <c:set var="temporaryPatientId" value="${doctorPerformanceInfo.doctorOrRmpId}"/>
            </c:forEach>

            <tr align="center">
                <td></td>
                <td></td>
                <c:if test="${singlePatient!=0}">
                    <td></td>
                </c:if>
                <td></td>
                <td></td>
                <td></td>					
                <td style="text-align: left;"><b>Total = <c:out value="${totalActualAmount }" /></b></td>
                <td style="text-align: left;"><b>Total = <c:out value="${totalDiscountAmount }" /></b></td>
                <td style="text-align: left;"><b>Total = <c:out value="${totalNetAmount }" /></b></td>
                <td style="text-align: left;"><b>Total = <c:out value="${totalCashPaidAmount }" /></b></td>
                <td style="text-align: left;"><b>Total = <c:out value="${totalCareOfPaidAmount }" /></b></td>
                <td style="text-align: left;"><b>Total = <c:out value="${totalCashAmount }" /></b></td>
                <td style="text-align: left;"><b>Total = <c:out value="${totalDueAmount }" /></b></td>			
            </tr>

        </table>

    </c:when>
    <c:otherwise>										
        No reports found.
    </c:otherwise>
</c:choose>

</center>
 
