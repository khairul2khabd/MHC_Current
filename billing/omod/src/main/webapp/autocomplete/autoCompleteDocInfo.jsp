<%-- 
    Document   : autoCompleteDocInfo
    Created on : Feb 1, 2016, 12:56:24 PM
    Author     : Khairul
--%>

 <%@ include file="/WEB-INF/template/include.jsp" %>
<?xml version="1.0"?>
<items>
<c:choose>
<c:when test="${not empty docById}">
<c:forEach items="${docById}" var="doc" varStatus="loop">
  <item>
    <text>${doc.id}, ${doc.doctorName}</text>
    <value>${doc.id}</value>
  </item>
</c:forEach>  
</c:when>
</c:choose>
</items>

