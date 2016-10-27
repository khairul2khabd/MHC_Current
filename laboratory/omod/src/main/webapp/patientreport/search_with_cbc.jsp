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


<center>
    <c:forEach var="test" items="${investigation}">
        <c:choose>
            <c:when test="${investigation eq '2311'}">
                <h2>BIOCHEMISTRY REPORT</h2> <br>
            </c:when>
            <c:when test="${investigation eq '2734'}">
                <h2>MICROBIOLOGY REPORT</h2>
            </c:when>
            <c:when test="${investigation eq '3945'}">
                <h2>IMMUNOLOGY REPORT</h2><br>

            </c:when>
            <c:when test="${investigation eq '2563'}">
                <h2>DEPARTMENT OF HISTOPATHOLOGY</h2>
            </c:when>
            <c:when test="${investigation eq '4569'}">
                <h2>TRANSFUSION MEDICINE DEPARTMENT</h2>
            </c:when> 
            <c:when test="${investigation eq '4679'}">
                <h2>HAEMATOLOGY REPORT</h2>
            </c:when> 
            <c:otherwise>
                <!--  <h2>ALL TESTS BY GROUP</h2> -->
            </c:otherwise>                
        </c:choose>
    </c:forEach>
</center>
<div id="patientReportTestInfo"></div> <br>

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
                        <!--  <h2>DEPARTMENT OF BIOCHEMISTRY</h2> <br> -->
                    <h4>Estimations are carried out by Vitros-250 Random Access Automated Chemistry Analyzer</h4>
                </c:when>
                <c:when test="${investigation eq '2734'}">
                    <h2>DEPARTMENT OF MICROBIOLOGY</h2>
                </c:when>
                <c:when test="${investigation eq '3945'}">
                    <!-- <h2>DEPARTMENT OF IMMUNOLOGY</h2>  Estimations are carried out by Genius-PA54 Random Access Automated Specific Protein Analyzer<br> -->
                    <span style="margin-top:100px"><i>Estimations are carried out by Maglumi-800 Random Access Multibatch chemiluminescence immunoassay (CLIA) Analyzer</i></span>
                </c:when>
                <c:when test="${investigation eq '2563'}">
                    <h2>DEPARTMENT OF HISTOPATHOLOGY</h2>
                </c:when>
                <c:when test="${investigation eq '4569'}">
                    <h2>TRANSFUSION MEDICINE DEPARTMENT</h2>
                </c:when> 
                <c:when test="${investigation eq '4679'}">
                    <!--  <h2>DEPARTMENT OF HAEMATOLOGY</h2> -->
                    <span style="margin-top:100px"><i>(Relevent estimations were carried out by Mythic-22 Automated 5 Part Haematology Analyzer & checked manually)</i></span>
                </c:when> 
                <c:otherwise>
                    <!--  <h2>ALL TESTS BY GROUP</h2> -->
                </c:otherwise>                
            </c:choose>
            <c:forEach var="test" items="${tests}">
                <c:if test="${(test.investigation eq 'DEPARTMENT OF BIOCHEMISTRY' && investigation eq '2311') ||
                              (test.investigation eq 'DEPARTMENT OF MICROBIOLOGY' && investigation eq '2734') ||
                              (test.investigation eq 'DEPARTMENT OF CLINICAL IMMUNOLOGY' && investigation eq '3945') ||
                              (test.investigation eq 'DEPARTMENT OF HISTOPATHOLOGY' && investigation eq '2563') ||
                              (test.investigation eq 'DEPARTMENT OF HAEMATOLOGY' && investigation eq '4679') ||
                              (test.investigation eq 'TRANSFUSION MEDICINE DEPARTMENT' && investigation eq '4569')}">
                      <tr>		
                          <td>
                              <c:if test="${test.level eq 'LEVEL_INVESTIGATION'}"><b>${test.investigation}</b></c:if>
                              <c:if test="${test.level eq 'LEVEL_SET'}">
                                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  ${test.set}
                              </c:if>
                              <c:if test="${test.level eq 'LEVEL_TEST'}"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
                </c:if>
                <c:if test="${(investigation eq 'select')}">
                    <tr>		
                        <td>
                            <c:if test="${test.level eq 'LEVEL_INVESTIGATION'}"><b>${test.investigation}</b></c:if>
                            <c:if test="${test.level eq 'LEVEL_SET'}">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                ${test.set}
                            </c:if>
                            <c:if test="${test.level eq 'LEVEL_TEST'}"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
                </c:if>	
            </c:forEach>
        </c:forEach>
        </tbody>
    </table>

    <c:if test="${((not empty tmn) && (investigation eq 'select')) ||
                  ((not empty tmn) && (investigation eq '4679')) }">
          <table class="tablesorter" style="width:90%"> 

              <tr>
                  <td colspan="4">   
                      <b style="left:20px;">DEPARTMENT OF HAEMATOLOGY </b><br>
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>CBC (Hb Percentage ESR TC DC With PC)</b> 				
                  </td>

              </tr>	

              <tr>
                  <td width="790px;"> 
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '995'}">
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              ${t.testName}  
                          </c:if>	 
                      </c:forEach>
                  </td>
                  <td>  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '995'}">
                              ${t.test}  
                          </c:if>
                      </c:forEach> 
                  </td>
                  <td>  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '995'}">
                              &nbsp; ${t.unit}  
                          </c:if>
                      </c:forEach> 
                  </td>
                  <td>  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '995'}">
                              ${t.lowNormal} 	 ||  ${t.hiNormal}
                          </c:if>
                      </c:forEach> 
                  </td>
              </tr>

              <tr>
                  <td> 
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2220'}">
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              ${t.testName}
                          </c:if>	 
                      </c:forEach>
                  </td>
                  <td>  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2220'}">
                              ${t.test}  
                          </c:if>
                      </c:forEach> 
                  </td>
                  <td>  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2220'}">
                              &nbsp; ${t.unit}  
                          </c:if>
                      </c:forEach> 
                  </td>
                  <td>  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2220'}">
                              ${t.lowNormal} 	 ||  ${t.hiNormal}
                          </c:if>
                      </c:forEach> 
                  </td>
              </tr>

              <tr>
                  <td> 
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '4570'}">
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              ${t.testName}  
                          </c:if>	 
                      </c:forEach>
                  </td> 
                  <td>  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '4570'}">
                              ${t.test}  
                          </c:if>
                      </c:forEach> 
                  </td>
                  <td>  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '4570'}">
                              &nbsp; ${t.unit} 
                          </c:if>
                      </c:forEach> 
                  </td>
                  <td>  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '4570'}">
                              ${t.lowNormal} 	 ||  ${t.hiNormal}
                          </c:if>
                      </c:forEach> 
                  </td>
              </tr>

              <tr>
                  <td colspan="4"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <b>DIFFERENTIAL LEUCOCYTE COUNT</b>
                  </td>
              </tr>
              <tr>
                  <td> 
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2237'}">
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              ${t.testName}  
                          </c:if>	 
                      </c:forEach>
                  </td> 
                  <td>  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2237'}">
                              ${t.test}  
                          </c:if>
                      </c:forEach> 
                  </td>
                  <td>  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2237'}">
                              &nbsp; ${t.unit}  
                          </c:if>
                      </c:forEach> 
                  </td>
                  <td>  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2237'}">
                              ${t.lowNormal} 	 ||  ${t.hiNormal}
                          </c:if>
                      </c:forEach> 
                  </td>
              </tr>

              <tr>
                  <td> 
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2238'}">
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              ${t.testName}  
                          </c:if>	 
                      </c:forEach>
                  </td> 
                  <td>  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2238'}">
                              ${t.test}  
                          </c:if>
                      </c:forEach> 
                  </td>
                  <td>  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2238'}">
                              &nbsp; ${t.unit}   
                          </c:if>
                      </c:forEach> 
                  </td>
                  <td>  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2238'}">
                              ${t.lowNormal} 	 ||  ${t.hiNormal}
                          </c:if>
                      </c:forEach> 
                  </td>
              </tr>

              <tr>
                  <td> 
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2239'}">
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              ${t.testName}  
                          </c:if>	 
                      </c:forEach>
                  </td> 
                  <td>  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2239'}">
                              ${t.test}  
                          </c:if>
                      </c:forEach> 
                  </td>
                  <td>  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2239'}">
                              &nbsp; ${t.unit}  
                          </c:if>
                      </c:forEach> 
                  </td>
                  <td>  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2239'}">
                              ${t.lowNormal} 	 ||  ${t.hiNormal}
                          </c:if>
                      </c:forEach> 
                  </td>
              </tr>

              <tr>
                  <td> 
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2240'}">
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              ${t.testName}  
                          </c:if>	 
                      </c:forEach>
                  </td> 
                  <td>  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2240'}">
                              ${t.test}  
                          </c:if>
                      </c:forEach> 
                  </td>
                  <td>  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2240'}">
                              &nbsp; ${t.unit}  
                          </c:if>
                      </c:forEach> 
                  </td>
                  <td>  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2240'}">
                              ${t.lowNormal} 	 ||  ${t.hiNormal}
                          </c:if>
                      </c:forEach> 
                  </td>
              </tr>

              <tr>
                  <td> 
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2241'}">
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              ${t.testName}  
                          </c:if>	 
                      </c:forEach>
                  </td> 
                  <td>  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2241'}">
                              ${t.test}  
                          </c:if>
                      </c:forEach> 
                  </td>
                  <td>  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2241'}">
                              &nbsp; ${t.unit}   
                          </c:if>
                      </c:forEach> 
                  </td>
                  <td>  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2241'}">
                              ${t.lowNormal} 	 ||  ${t.hiNormal}
                          </c:if>
                      </c:forEach> 
                  </td>
              </tr>

          </table>

    </c:if>

</center>

<div id="patientReportPrintArea" style="display:none;">
    <style>
        table.wltable {

            font-family: Verdana, 'Lucida Grande', 'Trebuchet MS', Arial, Sans-Serif;			
            font-style: normal;
            font-size: 10px;
        }
        table.wltable th {
            border-bottom: 1px solid;
        }
        table.wltable td {
            padding: 5px 5px 5px 5px;
        }
        table.wltable .right {
            border-right: 1px solid;
            border:1px solid #848484;
        }
    </style>
    <center>
        <c:forEach var="test" items="${investigation}">
            <c:choose>
                <c:when test="${investigation eq '2311'}">
                    <h2>BIOCHEMISTRY REPORT</h2> <br>
                </c:when>
                <c:when test="${investigation eq '2734'}">
                    <h2>MICROBIOLOGY REPORT</h2>
                </c:when>
                <c:when test="${investigation eq '3945'}">
                    <h2>IMMUNOLOGY REPORT</h2><br>

                </c:when>
                <c:when test="${investigation eq '2563'}">
                    <h2>HISTOPATHOLOGY REPORT</h2>
                </c:when>
                <c:when test="${investigation eq '4569'}">
                    <h2>TRANSFUSION MEDICINE DEPARTMENT</h2>
                </c:when> 
                <c:when test="${investigation eq '4679'}">
                    <h2>HAEMATOLOGY REPORT</h2>
                </c:when> 
                <c:otherwise>
                    <!--  <h2>ALL TESTS BY GROUP</h2> -->
                </c:otherwise>                
            </c:choose>
        </c:forEach>
    </center>
    <div id="printAreaTestInfo"></div><br/><br/>
    <table class="wltable" cellspacing="0" style="width:100%; border: 1px solid; margin-left: auto; margin-right: auto;">
        <thead>
            <tr>
                <th class="right" style="padding:5px 5px 5px 5px;"><center>Test</center></th>
        <th class="right"><center>Result</center></th>
        <th class="right"><center>Units</center></th>
        <th class="right"><center>Reference Range</center></th> 
        </tr>
        </thead>	
        <tbody>

            <c:forEach var="test" items="${investigation}">
            <center>
                <c:choose>
                    <c:when test="${investigation eq '2311'}">
                        <span style="margin-top:100px; text-align:center;"><i> Estimations are carried out by Vitros-250 Random Access Automated Chemistry Analyzer </i></span>
                    </c:when>
                    <c:when test="${investigation eq '2734'}">
                        <h2>DEPARTMENT OF MICROBIOLOGY</h2>
                    </c:when>
                    <c:when test="${investigation eq '3945'}">
                        <span style="margin-top:100px; text-align:center;"><i>Estimations are carried out by Maglumi-800 Random Access Multibatch chemiluminescence immunoassay (CLIA) Analyzer</i></span>			 
                    </c:when>
                    <c:when test="${investigation eq '2563'}">
                        <h2>DEPARTMENT OF HISTOPATHOLOGY</h2>
                    </c:when>
                    <c:when test="${investigation eq '4569'}">
                        <h2>TRANSFUSION MEDICINE DEPARTMENT</h2>
                    </c:when> 
                    <c:when test="${investigation eq '4679'}">
                        <span style="margin-top:100px; text-align:center;"><i>(Relevent estimations were carried out by Mythic-22 Automated 5 Part Haematology Analyzer & checked manually) </i></span>
                    </c:when> 
                    <c:otherwise>
                        <!--  <h2>ALL TESTS BY GROUP</h2> -->
                    </c:otherwise>                
                </c:choose>
            </center>
            <c:forEach var="test" items="${tests}">
                <c:if test="${(test.investigation eq 'DEPARTMENT OF BIOCHEMISTRY' && investigation eq '2311') ||
                              (test.investigation eq 'DEPARTMENT OF MICROBIOLOGY' && investigation eq '2734') ||
                              (test.investigation eq 'DEPARTMENT OF CLINICAL IMMUNOLOGY' && investigation eq '3945') ||
                              (test.investigation eq 'DEPARTMENT OF HISTOPATHOLOGY' && investigation eq '2563') ||
                              (test.investigation eq 'DEPARTMENT OF HAEMATOLOGY' && investigation eq '4679') ||
                              (test.investigation eq 'TRANSFUSION MEDICINE DEPARTMENT' && investigation eq '4569')}">
                      <tr>		
                          <td class="right">
                              <!-- <c:if test="${test.level eq 'LEVEL_INVESTIGATION'}"><b>${test.investigation}</b></c:if> -->
                              <c:if test="${test.level eq 'LEVEL_SET'}">
                                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  ${test.set}
                              </c:if>
                              <c:if test="${test.level eq 'LEVEL_TEST'}"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  ${test.test}</c:if>  
                              </td>
                              <td class="right">${test.value}</td>
                          <td class="right">${test.unit}</td>
                          <td class="right">
                              ${test.lowNormal}
                              <c:if test="${not empty test.lowNormal and not empty test.hiNormal}"> &nbsp;- &nbsp; </c:if>
                              ${test.hiNormal}
                          </td>
                      </tr>	
                </c:if>
                <c:if test="${(investigation eq 'select')}">
                    <tr>		
                        <td class="right">
                            <c:if test="${test.level eq 'LEVEL_INVESTIGATION'}"><b>${test.investigation}</b></c:if>
                            <c:if test="${test.level eq 'LEVEL_SET'}">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                ${test.set}
                            </c:if>
                            <c:if test="${test.level eq 'LEVEL_TEST'}"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                ${test.test}</c:if>  
                            </td>
                            <td class="right">${test.value}</td>
                        <td class="right">${test.unit}</td>
                        <td class="right">
                            ${test.lowNormal}
                            <c:if test="${not empty test.lowNormal and not empty test.hiNormal}">//</c:if>
                            ${test.hiNormal}
                        </td>
                    </tr>	
                </c:if>	
            </c:forEach>
        </c:forEach>

        <c:if test="${((not empty tmn) && (investigation eq 'select')) ||
                      ((not empty tmn) && (investigation eq '4679')) }">

              <tr>
                  <td colspan="4" class="right">   
                      <b style="left:20px;">DEPARTMENT OF HAEMATOLOGY </b><br>
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>CBC (Hb Percentage ESR TC DC With PC)</b> 				
                  </td>
              </tr>	
              <tr>
                  <td class="right"> 
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '995'}">
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              ${t.testName}  
                          </c:if>	 
                      </c:forEach>
                  </td>
                  <td class="right">  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '995'}">
                              ${t.test}  
                          </c:if>
                      </c:forEach> 
                  </td>
                  <td class="right">  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '995'}">
                              &nbsp; ${t.unit} 
                          </c:if>
                      </c:forEach> 
                  </td>
                  <td class="right">  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '995'}">
                              ${t.lowNormal} 	 ||  ${t.hiNormal}
                          </c:if>
                      </c:forEach> 
                  </td>
              </tr>

              <tr>
                  <td class="right">  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2220'}">
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              ${t.testName}
                          </c:if>	 
                      </c:forEach>
                  </td>
                  <td class="right">  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2220'}">
                              ${t.test}  
                          </c:if>
                      </c:forEach> 
                  </td>
                  <td class="right">  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2220'}">
                              &nbsp; ${t.unit}  
                          </c:if>
                      </c:forEach> 
                  </td>
                  <td class="right">  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2220'}">
                              ${t.lowNormal} 	 ||  ${t.hiNormal}
                          </c:if>
                      </c:forEach> 
                  </td>
              </tr>

              <tr>
                  <td class="right">  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '4570'}">
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              ${t.testName}  
                          </c:if>	 
                      </c:forEach>
                  </td> 
                  <td class="right">  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '4570'}">
                              ${t.test}  
                          </c:if>
                      </c:forEach> 
                  </td>
                  <td class="right">  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '4570'}">
                              &nbsp; ${t.unit}   
                          </c:if>
                      </c:forEach> 
                  </td>
                  <td class="right">  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '4570'}">
                              ${t.lowNormal} 	 ||  ${t.hiNormal}
                          </c:if>
                      </c:forEach> 
                  </td>
              </tr>

              <tr>
                  <td colspan="4" class="right"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <b>DIFFERENTIAL LEUCOCYTE COUNT</b>
                  </td>
              </tr>

              <tr>
                  <td class="right"> 
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2237'}">
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              ${t.testName}  
                          </c:if>	 
                      </c:forEach>
                  </td> 
                  <td class="right">  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2237'}">
                              ${t.test}  
                          </c:if>
                      </c:forEach> 
                  </td>
                  <td class="right">  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2237'}">
                              &nbsp; ${t.unit}   
                          </c:if>
                      </c:forEach> 
                  </td>
                  <td class="right">  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2237'}">
                              ${t.lowNormal} 	 ||  ${t.hiNormal}
                          </c:if>
                      </c:forEach> 
                  </td>
              </tr>

              <tr>
                  <td class="right"> 
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2238'}">
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              ${t.testName}  
                          </c:if>	 
                      </c:forEach>
                  </td> 
                  <td class="right">  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2238'}">
                              ${t.test}  
                          </c:if>
                      </c:forEach> 
                  </td>
                  <td class="right">  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2238'}">
                              &nbsp; ${t.unit}  
                          </c:if>
                      </c:forEach> 
                  </td>
                  <td class="right">  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2238'}">
                              ${t.lowNormal} 	 ||  ${t.hiNormal}
                          </c:if>
                      </c:forEach> 
                  </td>
              </tr>

              <tr>
                  <td class="right"> 
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2239'}">
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              ${t.testName}  
                          </c:if>	 
                      </c:forEach>
                  </td> 
                  <td class="right">  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2239'}">
                              ${t.test}  
                          </c:if>
                      </c:forEach> 
                  </td>
                  <td class="right">  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2239'}">
                              &nbsp; ${t.unit}  
                          </c:if>
                      </c:forEach> 
                  </td>
                  <td class="right">  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2239'}">
                              ${t.lowNormal} 	 ||  ${t.hiNormal}
                          </c:if>
                      </c:forEach> 
                  </td>
              </tr>

              <tr>
                  <td class="right"> 
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2240'}">
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              ${t.testName}  
                          </c:if>	 
                      </c:forEach>
                  </td> 
                  <td class="right">  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2240'}">
                              ${t.test}  
                          </c:if>
                      </c:forEach> 
                  </td>
                  <td class="right">  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2240'}">
                              &nbsp; ${t.unit}   
                          </c:if>
                      </c:forEach> 
                  </td>
                  <td class="right">  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2240'}">
                              ${t.lowNormal} 	 ||  ${t.hiNormal}
                          </c:if>
                      </c:forEach> 
                  </td>
              </tr>

              <tr>
                  <td class="right"> 
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2241'}">
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              ${t.testName}  
                          </c:if>	 
                      </c:forEach>
                  </td> 
                  <td class="right">  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2241'}">
                              ${t.test}  
                          </c:if>
                      </c:forEach> 
                  </td>
                  <td class="right">  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2241'}">
                              &nbsp; ${t.unit}  
                          </c:if>
                      </c:forEach> 
                  </td>
                  <td class="right">  
                      <c:forEach items="${tmn}" var="t">
                          <c:if test="${t.investigation eq '2241'}">
                              ${t.lowNormal} 	 ||  ${t.hiNormal}
                          </c:if>
                      </c:forEach> 
                  </td>
              </tr>

              </tbody>
        </table>
    </c:if>
    <br><br>
    <div class="absolute">
        <div style="text-align: left; margin-top: 50px; margin-right: 150px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Checked by</div>
        <div style="text-align: left; margin-top: -35px; margin-right: 150px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;...........................</div>
        <div style="text-align: right; margin-top: 8px; margin-right: 150px;">Consultant &nbsp;&nbsp;&nbsp;&nbsp;</div>
        <div style="text-align: right; margin-top: -35px; margin-right: 150px;">...........................</div>
    </div>
</div>

<style>
    .absolute {
        position: absolute;
        top:1070px;
        right:0px;
        width: 800px;
        height: 0px;
    }
</style>