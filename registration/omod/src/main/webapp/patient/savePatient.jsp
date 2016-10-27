 <%--
 *  Copyright 2009 Society for Health Information Systems Programmes, India (HISP India)
 *
 *  This file is part of Registration module.
 *
 *  Registration module is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.

 *  Registration module is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with Registration module.  If not, see <http://www.gnu.org/licenses/>.
 *
--%> 
<%@ include file="/WEB-INF/template/include.jsp" %>
<c:choose>
	<c:when test="${status eq 'success'}">
		{
			"status": "${status}",
			"patientId": "${patientId}",
			"encounterId": "${encounterId}",
                         
                        "refDocId": "${refDocId}",
                        "refMarId": "${refMarId}",
                        "orderId": "${orderId}",
                        "refRmpId": "${refRmpId}"
 
		}
	</c:when>	
	<c:otherwise>
		{
			"status": "${status}",
			"message": "${message}"
		}
	</c:otherwise>
</c:choose>
