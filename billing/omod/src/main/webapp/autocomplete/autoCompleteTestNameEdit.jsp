<%-- 
    Document   : autoCompleteDoctorName
    Created on : Oct 25, 2015, 10:37:29 PM
    Author     : khairul
--%>

 <%@ include file="/WEB-INF/template/include.jsp" %>
<?xml version="1.0"?>
<items>
<c:choose>
<c:when test="${not empty billableServiceListEdit}">
<c:forEach items="${billableServiceList}" var="bill" varStatus="loop">
  <item>
    <text>${bill.name}, ${bill.price}</text>
    <value>${bill.conceptId}</value>
  </item>
</c:forEach>  
</c:when>
</c:choose>

</items>