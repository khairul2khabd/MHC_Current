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
<!-- <center><img src="${pageContext.request.contextPath}/images/hospital_logo.bmp" width="504" height="75" alt="logo"/></center>
 <center><font size="6"><u>Pathology Report</u></font></center> <br> <br/> -->	

<center>
    <table  style="border-collapse: collapse; border: 1px solid black;" width="100%">  
        <!-- <table border='1' style="border-collapse: collapse;" width="100%"> -->
        <tr>
            <td height="30" style="text-align:left; font-size:16px; padding-left:10px;" >ID No  </td>
            <td style="padding-left:10px;"><b>${patient_identifier}</b></td>
            <td style="text-align:left; font-size:16px; padding-left:10px;">Received date  </td>
            <td style="padding-left:10px;"> rd </td>
            <td style="text-align:left; font-size:16px; padding-left:10px;">Delivery date  </td>
            <td style="padding-left:10px;"> ${test_orderDate} </td>
        </tr>
        <tr>		
            <td height="30" style="text-align:left; font-size:16px; padding-left:10px;">Patient's Name </td>
            <td style="padding-left:10px;"> ${patient_name} </td>
            <td style="text-align:left; font-size:16px; padding-left:10px;">Age </td>
            <td style="padding-left:10px;"> ${age} </td>
            <td style="text-align:left; font-size:16px; padding-left:10px;"> Gender </td>
            <td style="padding-left:10px;">		
                <b><c:choose> 
                        <c:when test="${patient_gender eq 'M'}">Male</c:when>
                        <c:otherwise>Female</c:otherwise>
                    </c:choose>
                </b>
            </td>	
        </tr>
        <tr>		
            <td height="30" style="padding-left:10px;">Refd by </td>
            <td colspan="5" style="padding-left:10px;">Refd by </td>	
        </tr>
        <tr>		
            <td height="30" style="padding-left:10px;">Specimen </td>
            <td colspan="5" style="padding-left:10px;">specime </td>	
        </tr>
    </table>
</center>