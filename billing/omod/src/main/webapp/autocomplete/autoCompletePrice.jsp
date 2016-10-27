<%-- 
    Document   : autoCompletePrice
    Created on : Nov 4, 2015, 7:28:24 PM
    Author     : khairul
--%>

<%@ include file="/WEB-INF/template/include.jsp" %>
<?xml version="1.0"?>
<items>
    <c:choose>
        <c:when test="${not empty billableServicePrice}">
            <c:forEach items="${billableServicePrice}" var="bill" varStatus="loop">
                <item>
                    <text>${bill.name}, ${bill.price}   </text>
                   <!-- <text1>${bill.price} </text1> -->
                    <value>${bill.conceptId}</value>
                </item>
            </c:forEach>  
        </c:when>
    </c:choose>
</items>