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
<%@ include file="/WEB-INF/template/header.jsp" %>
<%@ include file="../includes/js_css.jsp" %>
<br/>
<openmrs:require privilege="Manage Laboratory" otherwise="/login.htm" redirect="/module/laboratory/listDepartment.form" />
<%@ include file="../localHeader.jsp" %>
<script type="text/javascript">
	$(document).ready(function() 
		{ 
			$("#myTable").tablesorter({sortList: [[0,0]]}); 
		} 
	); 
</script>
<a href="editDepartment.form">Add new department</a>
<table id="myTable" class="tablesorter">
	<thead>
		<tr> 
			<th>No</th>
			<th>Name</th>
			<th>Description</th>
			<th>Role</th>
			<th width="100px;"></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="department" items="${departments}" varStatus="index">
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
				<td>
					<a href="editDepartment.form?id=${department.labId}">${department.name}</a>
				</td>
				<td>
					${department.description}
				</td>
				<td>
					${department.role.role}
				</td>
				<td>
					<center>
						<a href="deleteDepartment.form?id=${department.labId}">
							Delete
						</a>
					</center>
				</td>
			</tr>	
		</c:forEach>
	</tbody>
</table>

<%@ include file="/WEB-INF/template/footer.jsp" %>  