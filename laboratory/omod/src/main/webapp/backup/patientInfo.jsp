<%-- 
    Document   : patientInfo
    Created on : Feb 21, 2016, 11:13:48 AM
    Author     : Khairul
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
ac {
    border-collapse: collapse;
    border-radius: 10px;
    border-style: hidden;  
    box-shadow: 0 0 0 1px #666; 
}

ac td {
    border: 1px solid #ccc;
}

</style>

<center>
    <table  style="border-collapse: collapse;  border-radius: 10px; box-shadow: 0 0 0 1px #666;" width="99%"> 
        <!-- <table border='1' style="border-collapse: collapse;" width="100%">  -->
        <tr>
            <td height="25" style="text-align:left; font-size:14px; padding-left:10px; width:18%; " >ID No <span style="float:right;">:</span>  </td>
            <td style="padding-left:10px; font-size:14px;"> <b>${patient_identifier}</b></td>
            <td style="text-align:left; font-size:13px; padding-left:10px;"><span style="float:right;">Received date  &nbsp;&nbsp;:</span> </td>
            <td style="padding-left:10px; font-size:13px;"><b> <fmt:formatDate value="${test_orderDate}" pattern="dd-MM-yyyy" /> </b></td>
            <td style="text-align:left; font-size:13px; padding-left:10px;"><span style="float:right;"> Delivery date  &nbsp;&nbsp;:</span>  </td>
            <td style="padding-left:10px; font-size:13px;"> <fmt:formatDate value="${dDate}" pattern="dd-MM-yyyy" /> </td>
        </tr>
        <tr>		
            <td height="25" style="text-align:left; font-size:13px; padding-left:10px; width:18%;">Patient's Name <span style="float:right;">:</span>  </td> 
            <td style="padding-left:10px; font-size:13px; min-width:30%"> ${patient_name} </td>
            <td style="text-align:left; font-size:13px; padding-left:10px;"><span style="float:right;"> Age &nbsp;&nbsp;:</span> </td>
            <td style="padding-left:10px; font-size:13px;"> ${age} Year(s) </td>
            <td style="text-align:left; font-size:13px; padding-left:10px;"><span style="float:right;"> Gender &nbsp;&nbsp;:</span> </td>
            <td style="padding-left:10px; font-size:13px;">		
                <c:choose> 
                    <c:when test="${patient_gender eq 'M'}">Male</c:when> 
                    <c:otherwise>Female</c:otherwise> 
                </c:choose> 
            </td>	  
        </tr> 
        <tr>		
            <td height="25" style="padding-left:10px; width:18%; font-size:13px;">Refd. by <span style="float:right;">:</span>  </td>
            <td colspan="5" style="padding-left:10px; font-size:13px;">${refBy.doctorName} </td>	
        </tr>
        <tr>		
            <td height="25" style="padding-left:10px; width:18%; font-size:13px;">Specimen <span style="float:right;">:</span> </td>
            <td colspan="5" style="padding-left:10px; font-size:13px;">

                <c:forEach var="test" items="${investigation}">
                    <c:choose>

                        <c:when test="${investigation eq '2311'}">
                            <!--  <h2>DEPARTMENT OF BIOCHEMISTRY</h2> <br> -->
                            <c:if test="${not empty bioBlood}"> Blood</c:if>
                            <c:if test="${not empty bioUrine}"> Urine</c:if>
                        </c:when>
                        <c:when test="${investigation eq '3945'}"> 
                            <!-- <h2>DEPARTMENT OF IMMUNOLOGY</h2> -->
                            <c:if test="${not empty immBlood}"> Blood  </c:if> 
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

                        <c:when test="${investigation eq '2400'}">
                            <!--  <h2>DEPARTMENT OF Serology </h2> -->
                            <c:if test="${not empty seroBlood}"> Blood </c:if>
                            <c:forEach items="${te}" var="t">
                                <c:if test="${t.concept.conceptId eq '5222' || 
                                              t.concept.conceptId eq '5223'}"> Urine </c:if>
                                <c:if test="${t.concept.conceptId eq '5316'}"> Pleural Fluid </c:if>
                                <c:if test="${t.concept.conceptId eq '5317'}"> CSF </c:if>
                                <c:if test="${t.concept.conceptId eq '2413'}"> Semen </c:if>
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
