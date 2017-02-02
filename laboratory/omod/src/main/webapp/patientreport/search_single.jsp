<%-- 
    Document   : patientInfo
    Created on : Nov 21, 2015, 11:13:48 AM
    Author     : Khairul
--%>
<%@ include file="/WEB-INF/template/include.jsp" %>
<hr/> 

<style>
    .div1 {
        width:300px;
        background-color: white;
        border:1px solid #000;
        box-shadow: 5px 5px;
    }
</style>

<center>
    <c:forEach var="test" items="${investigation}">
        <c:choose>
            <c:when test="${investigation eq '5351' || investigation eq '3002'}">
                <div class="div1">   <h2>Biochemical Report</h2></div><br>
            </c:when>
            <c:when test="${investigation eq '5709'}">
                <div class="div1">   <h2>SEROLOGY REPORT</h2></div><br>
            </c:when>
            <c:when test="${investigation eq '5255'}">
                <div class="div1"> <h2>IMMUNOLOGY REPORT </h2></div><br>
            </c:when>
            <c:when test="${investigation eq '6010'}">
                <div class="div1"> <h2>STOOL EXAMINATION REPORT</h2></div><br>
            </c:when>
            <c:otherwise>
                <!--  <h2>ALL TESTS BY GROUP</h2> -->
            </c:otherwise>                
        </c:choose>
    </c:forEach>
</center>

<center>
    <!-- <div style="width:90%" id="patientReportTestInfo"></div> <br> -->
    <div style="width:90%" ><%@ include file="../patientreport/reportformat/patientInfo.jsp"%> </div> <br>
    <table class="tablesorter" style="width:90%">

        <c:forEach var="test" items="${investigation}">
            <c:choose>
                <c:when test="${investigation eq '2415' || investigation eq '3117'}">     
                </c:when>
                <c:otherwise>
                    <thead>
                        <tr>		
                            <th> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Test </th>
                            <th style="padding-left:20px;"> Result </th>
                            <th style="padding-left:20px;"> Unit </th>
                            <th style="padding-left:20px; width:30%"> Reference Range </th> 
                        </tr>
                    </thead> 
                </c:otherwise>                
            </c:choose>
        </c:forEach>

        <tbody>
            <c:forEach var="test" items="${investigation}">
                <c:choose>

                    <c:when test="${investigation eq '5255'}">
                        <!--  <h2>DEPARTMENT OF HAEMATOLOGY</h2> -->
                        <span style="margin-top:100px;font-size:17px;"><i>(Estimations are carried out by Maglumi-800 Random Access Multibatch Chemiluminescence immunoassay (CLIA) Analyzer)</i></span>
                    </c:when>
                    <c:when test="${investigation eq '3002'}">
                        <!--  <h2>DEPARTMENT OF HAEMATOLOGY</h2> -->
                        <span style="margin-top:100px;font-size:17px;">
                            <i> 
                                <h3>
                                    Estimations are carried out by Genius-PA54 Random Access Automated Specific Protein Analyzer
                                </h3>
                            </i>
                        </span>
                    </c:when> 
                <c:otherwise>
                    <!--  <h2>ALL TESTS BY GROUP</h2> -->
                </c:otherwise>                
            </c:choose>
            <tr> <td colspan="4">&nbsp;</td></tr>

            <%@ include file="../patientreport/reportformat/single.jsp"%>

            <c:forEach var="test" items="${tests}">
                <c:if test="${(test.investigation eq 'DEPARTMENT OF BIOCHEMISTRY' && investigation eq '2311') ||
                              (test.investigation eq 'DEPARTMENT OF CLINICAL PATHOLOGY' && investigation eq '5142') ||
                              (test.investigation eq 'DEPARTMENT OF MICROBIOLOGY' && investigation eq '2734') ||
                              (test.investigation eq 'DEPARTMENT OF CLINICAL IMMUNOLOGY' && investigation eq '3945') ||
                              (test.investigation eq 'DEPARTMENT OF SEROLOGY' && investigation eq '2400') ||
                              (test.investigation eq 'DEPARTMENT OF HAEMATOLOGY' && investigation eq '4679') ||
                              (test.investigation eq 'DEPARTMENT OF CYTOLOGY' && investigation eq '2399')}">
                      <tr>	
                          <td>
                             <!-- <c:if test="${test.level eq 'LEVEL_INVESTIGATION'}"><b>${test.investigation}</b></c:if> -->
                              <c:if test="${test.level eq 'LEVEL_SET'}">
                                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  ${test.set}
                              </c:if>
                              <c:if test="${test.level eq 'LEVEL_TEST'}"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  ${test.test}</c:if>  
                              </td>
                              <td align="left" style="padding-left:5px;"> ${test.value}</td>
                          <td align="left" style="padding-left:20px;"> ${test.unit}</td>
                          <td align="left" style="padding-left:10px;"> 
                              <c:if test="${not empty test.refRange}"> ${test.refRange} </c:if>
                              <c:if test="${empty test.refRange}">
                                  ${test.lowNormal} 
                                  <c:if test="${not empty test.lowNormal and not empty test.hiNormal}">-</c:if>
                                  ${test.hiNormal}
                              </c:if>
                          </td>
                      </tr>	
                </c:if>

            </c:forEach>
        </c:forEach>
        </tbody>

        <div>
            <table style="width:95%">
                <thead>
                    <tr> 	
                        <th>&nbsp;&nbsp; <br><br> <b style="text-decoration: overline dotted black; "> Checked By  </b> </th>
                        <th style="padding-left:0px; width:30%"><b><u> </u></b></th> 
                    </tr>
                </thead>  
                <tr>	
                    <td>  </td>
                    <td>
                        <c:if test="${not empty docInfo}">
                            &nbsp;&nbsp;<br>
                            <b>${docInfo.docName}</b><br>
                            ${docInfo.degree}<br>
                            ${docInfo.designation}<br>
                            ${docInfo.workPlace}<br>
                        </c:if>
                    </td>
                </tr>
            </table>
        </div>

    </table>

</center>

<div id="patientReportPrintArea" style="display:none;">
    <style>
        table.wltable {

            font-family: 'Times New Roman'; /// 'Lucida Grande', 'Trebuchet MS', Arial, Sans-Serif;			
            font-style: normal;
            font-size: 14px;
        }
        table.wltable th {
            border: 1px solid;
            background-color: #fff;
        }
        table.wltable td {
            padding: 5px 5px 5px 5px;
        }
        table.wltable .right {
        }
        .div1 {
            width:400px;
            background-color: white;
            border:1px solid #000;
            box-shadow: 5px 5px;
        }
    </style>
    <center>
        <c:forEach var="test" items="${investigation}">
            <c:choose>
                <c:when test="${investigation eq '5351' || investigation eq '3002'}">
                    <div class="div1">   <h2>Biochemical Report</h2></div><br>
                </c:when>
                <c:when test="${investigation eq '5709'}">
                    <div class="div1">   <h2>SEROLOGY REPORT</h2></div><br>
                </c:when>
                <c:when test="${investigation eq '5255'}">
                    <div class="div1"> <h2>IMMUNOLOGY REPORT </h2></div><br>
                </c:when>
                <c:when test="${investigation eq '6010'}">
                    <div class="div1"> <h2>STOOL EXAMINATION REPORT</h2></div><br>
                </c:when>
                <c:otherwise>
                    <!--  <h2>ALL TESTS BY GROUP</h2> -->
                </c:otherwise>                
            </c:choose>
        </c:forEach>
    </center>
    <!-- <div id="printAreaTestInfo"></div><br/><br/> -->

    <table class="wltable" cellspacing="0" style="width:100%; border: 0px solid; margin-left: auto; margin-right: auto;">
        <c:forEach var="test" items="${investigation}">
            <c:choose>
                <c:when test="${investigation eq '2105' }">   
                    <tr>
                        <td colspan="4"><%@ include file="../patientreport/reportformat/patientInfo.jsp"%> </td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <thead>
                        <tr>
                            <td colspan="4"><%@ include file="../patientreport/reportformat/patientInfo.jsp"%> <br></td>
                        </tr>
                        <c:if test="${investigation eq '5255' }">
                            <tr>
                                <td colspan="4" align="center">
                                    <span style="margin-top:100px; font-size:17px; font-weight: bold; text-align:center;"><i> 
                                            Estimations are carried out by Maglumi-800 Random Access Multibatch Chemiluminescence immunoassay (CLIA) Analyzer </i></span>
                                </td>
                            </tr>
                        </c:if>
                        <c:if test="${investigation eq '3002' }">
                            <tr>
                                <td colspan="4" align="center">
                                    <span style="margin-top:100px; font-size:17px; font-weight: bold; text-align:center;">
                                        <i> 
                                           Estimations are carried out by Genius-PA54 Random Access Automated Specific Protein Analyzer
                                        </i>
                                    </span>
                                </td>
                            </tr>
                        </c:if>
                        <tr>
                            <th class="right" style="padding:5px 5px 5px 5px; border-right:1px solid #fff; width:40%; ">   &nbsp;   Test </th>
                            <th class="right" style="border-left:1px solid #fff; border-right:1px solid #fff; padding-left:5px;"> Result </th>
                            <th class="right" style="border-left:1px solid #fff; border-right:1px solid #fff; padding-left:20px;"> Unit </th>
                            <th class="right" style="padding-left:10px; width:30%; font-size: 13px; border-left:1px solid #fff;"> Reference Range </th>
                        </tr>
                    </thead>

                </c:otherwise>                
            </c:choose>
        </c:forEach>

        <tbody>
            <c:forEach var="test" items="${investigation}">

                <%@ include file="../patientreport/reportformat/single.jsp"%>

                <c:forEach var="test" items="${tests}">
                    <c:if test="${(test.investigation eq 'DEPARTMENT OF BIOCHEMISTRY' && investigation eq '2311') ||
                                  (test.investigation eq 'DEPARTMENT OF CLINICAL PATHOLOGY' && investigation eq '5142') ||
                                  (test.investigation eq 'DEPARTMENT OF MICROBIOLOGY' && investigation eq '2734') ||
                                  (test.investigation eq 'DEPARTMENT OF CLINICAL IMMUNOLOGY' && investigation eq '3945') ||
                                  (test.investigation eq 'DEPARTMENT OF SEROLOGY' && investigation eq '2400') ||
                                  (test.investigation eq 'DEPARTMENT OF HAEMATOLOGY' && investigation eq '4679') ||
                                  (test.investigation eq 'DEPARTMENT OF CYTOLOGY' && investigation eq '2399')}">
                          <tr>		
                              <td class="right">
                                  <!-- <c:if test="${test.level eq 'LEVEL_INVESTIGATION'}"><b>${test.investigation}</b></c:if> -->
                                  <c:if test="${test.level eq 'LEVEL_SET'}">
                                      &nbsp;&nbsp; 
                                      ${test.set}
                                  </c:if>
                                  <c:if test="${test.level eq 'LEVEL_TEST'}">  
                                      ${test.test}</c:if>  
                                  </td>
                                  <td align="left" style="padding-left:05px;"> ${test.value}</td>
                              <td align="left" style="padding-left:20px;"> ${test.unit}</td>
                              <td align="left" style="padding-left:10px; font-size:12px;"> 
                                  <c:if test="${not empty test.refRange}"> ${test.refRange} </c:if>
                                  <c:if test="${empty test.refRange}">
                                      ${test.lowNormal} 
                                      <c:if test="${not empty test.lowNormal and not empty test.hiNormal}">&nbsp; - &nbsp;</c:if>
                                      ${test.hiNormal}
                                  </c:if>
                              </td>
                          </tr>	
                    </c:if>

                </c:forEach> 
            </c:forEach>


    </table>
    <label style="position:fixed; bottom:5px; font-size: 12px; width:100%" >
        <label style="position:fixed; bottom:75px;">  <b style="text-decoration: overline dotted black; font-weight: normal">  <!-- Checked By --> </b> </label>
        <table style="width:95%"> 
            <thead>
                <tr> 	
                    <th>&nbsp;&nbsp; <br><br> <b style="text-decoration: overline dotted black; font-weight: normal"> <!-- Checked By -->  </b> </th>
                    <th style="padding-left:0px; width:30%"><b><u> </u></b></th> 
                </tr>
            </thead>  
            <tr>	
                <td>  </td>
                <td style="font-size: 13px;">
                    <c:if test="${not empty docInfo}">
                        <b>${docInfo.docName}</b><br>
                        ${docInfo.degree}<br>
                        ${docInfo.designation}<br>
                        ${docInfo.workPlace}<br>
                    </c:if>
                </td>
            </tr>
        </table>
    </label>
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