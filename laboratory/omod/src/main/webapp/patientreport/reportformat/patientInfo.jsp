<%-- 
    Document   : patientInfo
    Created on : Feb 21, 2016, 11:13:48 AM
    Author     : Khairul
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<center>
    <table  style="border-collapse: collapse;  border-radius: 10px; box-shadow: 0 0 0 1px #666;" width="99%"> 
        <!-- <table border='1' style="border-collapse: collapse;" width="100%">  -->
        <tr>
            <td height="25" style="text-align:left; font-size:13px; padding-left:10px; width:18%; font-style: italic; " >ID No <span style="float:right; font-style:normal;">:</span>  </td>
            <td colspan="2"> <b> &nbsp; ${patient_identifier}</b>

                <div style="float:right; font-size:11px;">
                    <span  >Received date   : <b> <fmt:formatDate value="${test_orderDate}" pattern="dd-MM-yyyy" /> </b></span> 
                    <span  > &nbsp;&nbsp; Delivery date   : <b> <fmt:formatDate value="${dDate}" pattern="dd-MM-yyyy" /> </b></span>  &nbsp;&nbsp;
            </td> </div>
        </tr>
        <tr> 
            <td height="25" style="text-align:left; font-size:13px; padding-left:10px; width:16%; font-style: italic; " >Patient's Name <span style="float:right; font-style:normal;">:</span>  </td>
            <td style="width:45%; font-size:14px;" > <b> &nbsp; ${patient_name}</b></td>

            <td style="font-style: italic; font-size:13px; text-align:right; ">
                <span> Age   : <b>
                        <c:if test="${age <= '6'}" >${ageD}  </c:if> 
                        <c:if test="${age > '6'}" >${age} Year(s) </c:if> 				

                        </b></span> 
                    <span  > &nbsp;&nbsp; Gender  : <b> <c:choose> 
                            <c:when test="${patient_gender eq 'M'}">Male</c:when> 
                            <c:otherwise>Female</c:otherwise> 
                        </c:choose> </b></span>  &nbsp;&nbsp;
            </td> 
        </tr>
        <tr>
            <td height="25" style="text-align:left; font-size:13px; padding-left:10px; width:18%; font-style: italic; " >Refd. By <span style="float:right; font-style:normal;">:</span>  </td>
            <td colspan="2" style="font-size:14px;"> <b>&nbsp; ${refBy.doctorName} </b></td>
        </tr>
        <tr>		
            <td height="25" style="padding-left:10px; width:18%; font-size:13px;">Specimen <span style="float:right;">:</span> </td>
            <td colspan="2" style="padding-left:10px; font-size:14px; font-weight:bold;">
                <c:forEach var="test" items="${investigation}">
                    <c:choose>
                        <c:when test="${investigation eq '2311'}">
                            <!--  <h2>DEPARTMENT OF BIOCHEMISTRY</h2> <br> -->
                            <c:if test="${not empty bioBlood}"> Blood  </c:if> 
                            <c:if test="${not empty bioBlood && not empty bioUrine}"> &#38;</c:if>
                            <c:if test="${not empty bioUrine}"> Urine</c:if>  
                        </c:when>
                        <c:when test="${investigation eq '2543' || investigation eq '2577' || investigation eq '5158'
                                     || investigation eq '5225' || investigation eq '5692' || investigation eq '2734'
                                     || investigation eq '5255' || investigation eq '5708' || investigation eq '5258'
                                     || investigation eq '2925'}">
                                Blood  
                        </c:when>
                        <c:when test="${investigation eq '4252' }">
                            24 Hours Urine
                        </c:when>
                        <c:when test="${investigation eq '5213' || investigation eq '5239' }">
                            Spot Urine
                        </c:when>
                        <c:when test="${investigation eq '3945' || investigation eq '5216' || investigation eq '3092'}"> 
                            <!-- <h2>DEPARTMENT OF IMMUNOLOGY</h2> -->
                            <c:if test="${not empty immBlood}"> Blood  </c:if> 
                            <c:if test="${not empty immBlood && not empty immUrine}"> &#38;</c:if>
                            <c:if test="${not empty immUrine}"> Urine</c:if>  
                        </c:when>
                        <c:when test="${investigation eq '4679'}">
                            <!--  <h2>DEPARTMENT OF HAEMATOLOGY</h2> -->
                            <c:if test="${not empty haeBlood}"> Blood </c:if>
                        </c:when> 
                        <c:when test="${investigation eq '5142'}">
                            <!-- <h2>DEPARTMENT OF CLINICAL PATHOLOGY</h2> -->
                            <c:if test="${not empty pathStool}"> Stool </c:if>
                            <c:if test="${not empty pathSoptUrine}"> Spot Urine </c:if>
                            <c:if test="${not empty pathUrine}"> Urine  </c:if>
                            <c:forEach items="${te}" var="t">
                                <c:if test="${t.concept.conceptId eq '5150'}"> Pleural Fluid </c:if>
                            </c:forEach>
                        </c:when>
                        <c:when test="${investigation eq '2399'}">
                            <!--  <h2>DEPARTMENT OF Cytology</h2> -->
                            <c:if test="${not empty cs}"> Cervical Smear</c:if>
                        </c:when>
                        <c:when test="${investigation eq '3937'}">
                            <!--  <h2>DEPARTMENT OF Cytology</h2> -->
                            Blood & 24 Hours Urine
                        </c:when>
                        <c:when test="${investigation eq '2413'}">   
                            Semen
                        </c:when>
                        <c:when test="${investigation eq '5290'}">   
                            Blood Anerobic
                        </c:when>
                        <c:when test="${investigation eq '2400'}">
                            <!--  <h2>DEPARTMENT OF Serology </h2> -->
                            <c:if test="${not empty seroBlood}"> Blood </c:if>
                            <c:forEach items="${te}" var="t">
                                <c:if test="${t.concept.conceptId eq '5222' || 
                                              t.concept.conceptId eq '5223'}"> Urine </c:if>
                                <c:if test="${t.concept.conceptId eq '5316'}"> Pleural Fluid </c:if>
                                <c:if test="${t.concept.conceptId eq '5317'}"> CSF </c:if>
                            </c:forEach>
                        </c:when>

                        <c:otherwise>
                        </c:otherwise>   

                    </c:choose>
                </c:forEach>
            </td>	 
        </tr>
    </table>
</center>
