<%--
*  Copyright 2009 Society for Health Information Systems Programmes, India (HISP India)
*
*  This file is part of Laboratory module.
*
*  Laboratory module is free software: you can redistribute it and/or modify
*  it under the terms of the GNU General Public License as published by
*  the Free Software Foundation, either version 3 of the License, or
*  (at your option) any later version.

 *  Laboratory module is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with Laboratory module.  If not, see <http://www.gnu.org/licenses/>.
 *
--%> 
<%@ include file="/WEB-INF/template/include.jsp" %>
<script type="text/javascript">
    /*
     *Ghanshyam - Sagar 
     Sep 14,2012  
     Bug #360: [Laboratory Module] Same result entered twice in database.
     */
    function refreshLabResult() {
        jQuery.ajax({
            type: "GET",
            url: getContextPath() + "/module/laboratory/searchWorklist.form"
        });
    }
    testNo = ${testNo};
</script>
<table id="myTable" class="tablesorter">
    <thead>
        <tr> 
            <th>Sr. No.</th>
            <th>Sample No.</th>
            <th>Results</th>
            <th>Reorder</th>	
            <th>Date</th>
            <th>Patient ID</th>
            <th>Name</th>
            <th>Gender</th>
            <th>Age</th>
            <th>Test</th>					
        </tr>
    </thead>
    <tbody>
        <c:forEach var="test" items="${tests}" varStatus="index">
            <c:choose>
                <c:when test="${index.count mod 2 == 0}">
                    <c:set var="klass" value="odd"/>
                </c:when>					
                <c:otherwise>
                    <c:set var="klass" value="even"/>
                </c:otherwise>
            </c:choose>
            <tr class="${klass}">
                <td>${index.count}</td>
                <td>${test.sampleId}</td>
                <td>
                    <a href="javascript:enterResult(${test.testId});">
                        Enter results
                    </a>
                </td>
                <td>
                    <a href="rescheduleTest.form?type=reorder&orderId=${test.orderId}&modal=true&height=200&width=800" class="thickbox" title="Reschedule test">Reorder</a> 					
                </td>
                <td>
                    ${test.startDate}
                </td>
                <td>
                    ${test.patientIdentifier}
                </td>
                <td>
                    ${test.patientName}
                </td>
                <td>
                    ${test.gender}
                </td>
                <td>
                    ${test.age}
                </td>
                <%-- ghanshyam 19/07/2012 New Requirement #309: [LABORATORY] Show Results in Print WorkList.introduced the column 'Lab' 'Test' 'Test name' 'Result' --%>
                <td>
                    ${test.test.name}
                </td>
            </tr>				
            <tr class='resultParameter' id='row${test.testId}' style='display:none; bgcolor:#FFFFFF'>
                <td style="width:20px;" colspan="5">
                    <form id="contentForm${test.testId}" method="post" action="showForm.form"/>
                    <div style='clear: both;'></div>
                    &nbsp;&nbsp;
                    <input type="button" value="Save" style= "margin-top:2px;margin-bottom:2px;margin-left:5px;" class="bu-normal" onClick="submit(${test.testId});
                            refreshLabResult();"/> 
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" value="Cancel" style= "margin-top:2px;margin-bottom:2px;margin-left:5px;" class="bu-normal" onClick='jQuery("#row${test.testId}").hide();'/>						
                </td>
                <td colspan='9' style="bgcolor:#FFFFFF"/>
            </tr>

        </c:forEach>
    </tbody>
</table>