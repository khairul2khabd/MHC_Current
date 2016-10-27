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
	testNo = ${testNo};
</script>
<table id="myTable" class="tablesorter">
	<thead>
		<tr> 
			<th>No</th>
			<th>Date</th>
			<th>Patient ID</th>
			<th>Name</th>
			<th>Gender</th>
			<th>Age</th>
			<th>Test</th>
			<th>Accept</th>
			<th>Sample ID</th>
			<th>Reschedule</th>			
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
		<c:choose>
				<c:when test="${pagingUtil.currentPage != 1}" >
				<td>${index.count + (pagingUtil.currentPage-1)*pagingUtil.pageSize} </td>
				</c:when>
				<c:otherwise>
					<td>${index.count}</td>
				</c:otherwise>
			</c:choose>
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
				<td id="acceptBox_${test.orderId}">					
					<c:choose>
						<c:when test="${empty test.status}">
							<a href='javascript:getDefaultSampleId(${test.orderId});'>
								Accept 
							</a>
						</c:when>
						<c:when test="${test.status eq 'accepted'}">
							<b>Accepted</b>							
						</c:when>
					</c:choose>
				</td>
				<td id="sampleIdBox_${test.orderId}">
					${test.sampleId}
				</td>
				<td id="rescheduleBox_${test.orderId}">
					<c:choose>
						<c:when test="${empty test.status}">
							<a href="rescheduleTest.form?orderId=${test.orderId}&modal=true&height=200&width=800" class="thickbox" title="Reschedule test">Reschedule</a>
						</c:when>
						<c:when test="${test.status eq 'accepted'}">
							Reschedule					
						</c:when>
					</c:choose> 					
				</td>
			</tr>	
		</c:forEach>
	</tbody>
</table>

<div id='paging'>
	<a style="text-decoration:none" href='javascript:getTests(1);'>&laquo;&laquo;</a>
	<a style="text-decoration:none" href="javascript:getTests(${pagingUtil.prev});">&laquo;</a>		
	${pagingUtil.currentPage} / <b>${pagingUtil.numberOfPages}</b>	
	<a style="text-decoration:none" href="javascript:getTests(${pagingUtil.next});">&raquo;</a>
	<a style="text-decoration:none" href='javascript:getTests(${pagingUtil.numberOfPages});'>&raquo;&raquo;</a>
</div>