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
<%@ include file="/WEB-INF/template/include.jsp"%>

<script type="text/javascript">
	jQuery(document).ready(function() {
		jQuery('#rescheduledDate').datepicker({yearRange:'c-30:c+30', dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true});
    });
</script>

<style>
	.info {
		font-weight: bold;
		text-align:right
	}
</style>

<center>
	<c:choose>
		<c:when test="${not empty test}">
			<table class="testInfo" cellspacing="15">
				<tr>
					<td class='info'>Patient Name</td>
					<td>${test.patientName}</td>
					<td></td>
					<td class='info'>Patient Identifier</td>
					<td>${test.patientIdentifier}</td>
				</tr>
				<tr>
					<td class='info'>Date</td>
					<td>${test.startDate}</td>
					<td width="30px"></td>
					<%-- ghanshyam 19/07/2012 New Requirement #309: [LABORATORY] Show Results in Print WorkList.introduced the column 'Lab' 'Test' 'Test name' 'Result' --%>
					<td class='info'>Test</td>
					<td>${test.test.name}</td>
				</tr>
				<tr>
					<td class='info'>Gender</td>
					<td>${test.gender}</td>
					<td></td>
					<td class='info'>Age</td>
					<td>${test.age}</td>
				</tr>
			</table>
			<b>Reschedule Date</b>: <input id="rescheduledDate" value="${currentDate}" style="text-align:right;"/>
			<input type="button" onClick="javascript:window.parent.rescheduleTest(${test.orderId}, $('#rescheduledDate').val()); tb_remove();" value="Reschedule" />
			<input type="button" onClick="tb_remove();" value="Cancel" />
		</c:when>
		<c:otherwise>
			Not found<br />
			<input type="button" onClick="tb_remove();" value="Cancel" />
		</c:otherwise>
	</c:choose>
</center>