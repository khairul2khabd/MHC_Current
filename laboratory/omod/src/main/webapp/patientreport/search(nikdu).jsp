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
<div id="patientReportTestInfo"></div><br/>
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
            <c:forEach var="test" items="${investigation}">
                <c:choose>
                    <c:when test="${investigation eq '2311'}">
                    <h2>DEPARTMENT OF BIOCHEMISTRY</h2>
                </c:when>
                <c:when test="${investigation eq '2734'}">
                    <h2>DEPARTMENT OF MICROBIOLOGY</h2>
                </c:when>
                <c:when test="${investigation eq '3945'}">
                    <h2>DEPARTMENT OF IMMUNOLOGY</h2>
                </c:when>
                <c:when test="${investigation eq '2563'}">
                    <h2>DEPARTMENT OF HISTOPATHOLOGY</h2>
                </c:when>
                <c:when test="${investigation eq '4569'}">
                    <h2>TRANSFUSION MEDICINE DEPARTMENT</h2>
                </c:when> 
                <c:when test="${investigation eq '2401'}">
                    <h2>DEPARTMENT OF HAEMATOLOGY</h2>
                </c:when> 
                <c:otherwise>
                    <h2>ALL TESTS BY GROUP</h2>
                </c:otherwise>                
            </c:choose>
        </c:forEach>           


        <c:forEach var="test" items="${tests}">
            <tr> <%-- 		
                <c:if test="${(test.investigation eq 'BIOCHEMISTRY' && investigation eq '2311') 
                              || (test.investigation eq 'MICROBIOLOGY' && investigation eq '2734') 
                              || (test.investigation eq 'IMMUNOLOGY' && investigation eq '3945') 
                              || (test.investigation eq 'HISTOPATHOLOGY' && investigation eq '2563')
                              || (test.investigation eq 'HAEMATOLOGY' && investigation eq '2401')
                              || (test.investigation eq 'ROUTINE ANC TESTS (PATHOLOGY)' && investigation eq '4121')}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
                      <td>${test.set}</td>
                      <td>${test.value}</td>
                      <td>${test.unit}</td>
                      <td>
                          ${test.lowNormal}
                          <c:if test="${not empty test.lowNormal and not empty test.hiNormal}">//</c:if>
                          ${test.hiNormal}
                      </td>
                </c:if> --%>
                
                <!--Only For NIKDU -->
                <c:if test="${(test.investigation eq 'DEPARTMENT OF BIOCHEMISTRY' && investigation eq '2311') 
                              || (test.investigation eq 'DEPARTMENT OF MICROBIOLOGY' && investigation eq '2734') 
                              || (test.investigation eq 'DEPARTMENT OF CLINICAL IMMUNOLOGY' && investigation eq '3945') 
                              || (test.investigation eq 'DEPARTMENT OF HISTOPATHOLOGY' && investigation eq '2563')
                              || (test.investigation eq 'DEPARTMENT OF HAEMATOLOGY' && investigation eq '2401')
                              || (test.investigation eq 'TRANSFUSION MEDICINE DEPARTMENT' && investigation eq '4569')}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
                      <td>${test.set}</td>
                      <td>${test.value}</td>
                      <td>${test.unit}</td>
                      <td>
                          ${test.lowNormal}
                          <c:if test="${not empty test.lowNormal and not empty test.hiNormal}">//</c:if>
                          ${test.hiNormal}
                      </td>
                </c:if>
                <c:if test="${investigation eq 'select'}">

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
                </c:if>

            </tr>	
        </c:forEach>
        </tbody>
    </table>

</center>

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
            background-color: #e6EEEE;
            padding:4px;
        }


        table.wltable tr {
            padding: 0px 5px 0px 5px;
            border-bottom: 1px solid;
            border-right: 1px solid;

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
        .abc {
            padding: 0px 5px 0px 5px;
            border-bottom: 1px solid black;
            border-right: 1px solid black;
            padding:4px; 
	    font-size: 13px;
        }
    </style>
    <div id="printAreaTestInfo"></div><br><br><br/><br/>
    <center>
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
                <c:forEach var="test" items="${investigation}">
                <c:choose>
                    <c:when test="${investigation eq '2311'}">
                    <h2>DEPARTMENT OF BIOCHEMISTRY</h2>
                </c:when>
                <c:when test="${investigation eq '2734'}">
                    <h2>DEPARTMENT OF MICROBIOLOGY</h2>
                </c:when>
                <c:when test="${investigation eq '3945'}">
                    <h2>DEPARTMENT OF IMMUNOLOGY</h2>
                </c:when>
                <c:when test="${investigation eq '2563'}">
                    <h2>DEPARTMENT OF HISTOPATHOLOGY</h2>
                </c:when>
                <c:when test="${investigation eq '4569'}">
                    <h2>TRANSFUSION MEDICINE DEPARTMENT</h2>
                </c:when> 
                <c:when test="${investigation eq '2401'}">
                    <h2>DEPARTMENT OF HAEMATOLOGY</h2>
                </c:when> 
                <c:otherwise>
                    <h2>ALL TESTS BY GROUP</h2>
                </c:otherwise>                
            </c:choose>
        </c:forEach>          


            <c:forEach var="test" items="${tests}">
                <tr> 		
                     <c:if test="${(test.investigation eq 'DEPARTMENT OF BIOCHEMISTRY' && investigation eq '2311') 
                              || (test.investigation eq 'DEPARTMENT OF MICROBIOLOGY' && investigation eq '2734') 
                              || (test.investigation eq 'DEPARTMENT OF CLINICAL IMMUNOLOGY' && investigation eq '3945') 
                              || (test.investigation eq 'DEPARTMENT OF HISTOPATHOLOGY' && investigation eq '2563')
                              || (test.investigation eq 'DEPARTMENT OF HAEMATOLOGY' && investigation eq '2401')
                              || (test.investigation eq 'TRANSFUSION MEDICINE DEPARTMENT' && investigation eq '4569')}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
                      <td>${test.set}</td>
                      <td>${test.value}</td>
                      <td>${test.unit}</td>
                      <td>
                          ${test.lowNormal}
                          <c:if test="${not empty test.lowNormal and not empty test.hiNormal}">//</c:if>
                          ${test.hiNormal}
                      </td>
                </c:if>
                    <c:if test="${investigation eq 'select'}">
                        <td class="abc">
                            <c:if test="${test.level eq 'LEVEL_INVESTIGATION'}"><b>${test.investigation}</b></c:if>
                            &nbsp;&nbsp; <c:if test="${test.level eq 'LEVEL_SET'}">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	${test.set}
                            </c:if>
                            <c:if test="${test.level eq 'LEVEL_TEST'}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                ${test.test}</c:if>  
                            </td>
                            <td class="abc">&nbsp;&nbsp;${test.value}</td>
                        <td class="abc">${test.unit}</td>
                        <td class="abc">
                            ${test.lowNormal}
                            <c:if test="${not empty test.lowNormal and not empty test.hiNormal}">//</c:if>
                            ${test.hiNormal}
                        </td>
                    </c:if>

                </tr>	
            </c:forEach>
            </tbody>                        
        </table>
    </center>
    <br>
    <br>
    <%--	
	<div class="absolute">
	<div style="text-align: left; margin-top: 33px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Medical Technologist</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
	<div style="text-align: right; margin-top: -20px;"><b>Pathologist</b> &nbsp; &nbsp; &nbsp;</div>
	</div>
	--%>
</div>