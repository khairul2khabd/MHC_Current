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
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%> 
 <center><img src="${pageContext.request.contextPath}/images/hospital_logo.bmp" width="504" height="75" alt="logo"/></center>
 <center><font size="6"><u>Pathology Report</u></font></center> <br> <br/>
	
	<style>
table, th, td {
    border: 0px solid black;
}
</style>
	
	<center>
	<table border='0' width="90%">
	<tr>
		<td height="50" style="text-align:left; font-size:16px;" >ID. No : &nbsp;<b>${patient_identifier}</b></td>
		<td style="text-align:left; font-size:16px;">Age : &nbsp;&nbsp;<b>${age}</b></td>
		<td style="text-align:left; font-size:16px;">Gender: &nbsp;&nbsp;&nbsp;&nbsp;<b><c:choose> 
				<c:when test="${patient_gender eq 'M'}">Male</c:when>
				<c:otherwise>Female</c:otherwise>
			</c:choose>
			</b>
		</td>
	
	</tr>
	<tr>		
		<td style="text-align:left; font-size:16px;">Name : &nbsp;&nbsp;&nbsp;&nbsp;<b>${patient_name}</b></td>
		<td style="text-align:left; font-size:16px;">Order date : &nbsp;&nbsp;&nbsp;&nbsp;<b>${test_orderDate}</b></td>
        <td style="text-align:left; font-size:16px;"><c:if test="${not empty admittedStatus }">
                            <span style="background-color: red; color: white; font-size:16px;">Admitted To : ${admittedWard.name} &nbsp; &nbsp; Bed No : ${bed}</span>

                        </c:if>
                    </td>
                
                <!-- <td>Admitted Ward :${admittedWard.name} &nbsp;&nbsp;&nbsp; Bed No :${bed}</td> -->
	
	</tr>
</table>
</center>