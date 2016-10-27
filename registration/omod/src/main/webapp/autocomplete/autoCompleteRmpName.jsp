<%-- 
    Document   : autoCompleteDoctorNameById
    Created on : Oct 26, 2015, 4:24:56 PM
    Author     : khairul
--%>
<%@ include file="/WEB-INF/template/include.jsp" %>
<?xml version="1.0"?>
<items>
<c:choose>
<c:when test="${not empty rmpId}">
<c:forEach items="${rmpId}" var="doc" varStatus="loop">
  <item>
    <text>${doc.name}</text>
    <value>${doc.id}</value>
  </item>
</c:forEach>  
</c:when>
</c:choose>
</items>

