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
<hr/>
<div id="patientReportTestInfo"></div> <br/>
<center>
    <table class="tablesorter" style="width:90%"> 
        <thead>
            <tr>		
                <th><center>Test</center></th>
        <th><center>Result</center></th>
        <th><center>Units</center></th>
        <th><center>Reference Range</center></th> 
        </tr>
        </thead>	
        <tbody>
            <c:forEach var="test" items="${tests}">
                <tr>		
                    <td>
                        <c:if test="${test.level eq 'LEVEL_INVESTIGATION'}"><b>${test.investigation}</b></c:if>
                        &nbsp;&nbsp; <c:if test="${test.level eq 'LEVEL_SET'}">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	${test.set}
                        </c:if>
                        <c:if test="${test.level eq 'LEVEL_TEST'}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            ${test.test}</c:if>  
                        </td>
                        <td>${test.value}</td>
                    <td>${test.unit}</td>
                    <td>
                        ${test.lowNormal}
                        <c:if test="${not empty test.lowNormal and not empty test.hiNormal}">//</c:if>
                        ${test.hiNormal}
                    </td>
                </tr>	
            </c:forEach>
        </tbody>
    </table>
    <center>

        <div id="patientReportPrintArea" style="display: none;">
            <style>
                table.wltable {

                    font-family: Verdana, 'Lucida Grande', 'Trebuchet MS', Arial, Sans-Serif;			
                    font-style: normal;
                    font-size: 10px;

                }

                table.wltable th {
                    border-bottom: 1px solid;
                    border-right: 1px solid;
                    font-size: 15px;
                }

                table.wltable td {
                    padding: 0px 5px 0px 5px;
                }

                table.wltable .right {
                    border-right: 1px solid;
                    border-bottom:1px solid;
                    border-color: #A1A0A0;
                    font-size: 12px;
                }
                .absolute {
                    position: absolute;
                    border:thin solid black; 
                    border-style:solid; 
                    border-bottom:thick; 
                    border-left:thick;
                    border-right:thick;
                    top:1070px;
                    right:0px;
                    width: 800px;
                    height: 0px;
                }
            </style>
            <div id="printAreaTestInfo"></div><br><br><br/><br/><br/>
            <table class="wltable" cellspacing="0" style="width:85%; border: 1px solid; margin-left: auto; margin-right: auto;">
                <thead>
                    <tr>
                        <th class="th"><center>Test</center></th>
                <th class="th"><center>Result</center></th>
                <th class="th"><center>Units</center></th>
                <th><center>Reference Range</center></th> 
                </tr>
                </thead>	
                <tbody>
                    <c:forEach var="test" items="${tests}">
                        <tr>		
                            <td height="25" class="right">&nbsp;
                                <c:if test="${test.level eq 'LEVEL_INVESTIGATION'}"><b>${test.investigation}</b></c:if>
                                &nbsp;&nbsp; <c:if test="${test.level eq 'LEVEL_SET'}">
                                    &nbsp;&nbsp;&nbsp;&nbsp; ${test.set}
                                </c:if>
                                <c:if test="${test.level eq 'LEVEL_TEST'}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                    ${test.test}</c:if>  
                                </td>
                                <td class="right" align="center">${test.value}&nbsp;</td>
                            <td class="right" >${test.unit}&nbsp;</td>
                            <td class="right" align="center">&nbsp;
                                ${test.lowNormal}
                                <c:if test="${not empty test.lowNormal and not empty test.hiNormal}">||</c:if>
                                ${test.hiNormal}
                            </td>
                        </tr>	
                    </c:forEach>

                </tbody>
            </table>
            <br>
            <br>
            <%--	
               <div class="absolute">
               <div style="text-align: left; margin-top: 33px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Medical Technologist</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
               <div style="text-align: right; margin-top: -20px;"><b>Pathologist</b> &nbsp; &nbsp; &nbsp;</div>
               </div>
            --%>
        </div>