<%-- 
    Document   : autoCompleteDoctorName
    Created on : Oct 25, 2015, 10:37:29 PM
    Author     : khairul
--%>

 <%@ include file="/WEB-INF/template/include.jsp" %>
<?xml version="1.0"?>
<items>
<c:choose>
<c:when test="${not empty marByIdName}">
<c:forEach items="${marByIdName}" var="mar" varStatus="loop">
  <item>
    <text>${mar.name}</text>
    <value>${mar.id}</value>
  </item>
</c:forEach>  
</c:when>
</c:choose>

</items>