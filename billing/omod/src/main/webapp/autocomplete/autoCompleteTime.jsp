<%-- 
    Document   : autoCompleteTime
    Created on : Nov 8, 2015, 6:04:24 PM
    Author     : khairul
--%>

<%@ include file="/WEB-INF/template/include.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<?xml version="1.0"?> 

<%
request.setAttribute( "autoTime", new String[]{
"1:00 PM","1:30 PM","1:40 PM","1:50 PM","2:00 PM",
"2:20 PM","2:30 PM","2:40 PM","2:50 PM","3:00 PM",
"3:20 PM","3:30 PM","3:40 PM","3:50 PM","4:00 PM",
"4:30 PM","4:50 PM","5:00 PM","5:20 PM","5:30 PM",
"5:40 PM","5:50 PM","6:00 PM","6:20 PM","6:30 PM","6:50 PM",
"7:00 PM","7:20 PM","7:30 PM","7:40 PM","7:50 PM","8:00 PM",
"8:10 PM","8:20 PM","8:30 PM","8:40 PM","8:50 PM","9:00 PM",
"9:10 PM","9:20 PM","9:30 PM","9:40 PM","9:50 PM","10:00 PM",
"10:10 PM","10:20 PM","10:30 PM","10:40 PM","10:50 PM","11:00 PM",
"11:10 PM","11:20 PM","11:30 PM","11:40 PM","11:50 PM","12:00 PM",

"1:00 AM","1:30 AM","1:40 AM","1:50 AM","2:00 AM","2:20 AM",
"2:30 AM","2:40 AM","2:50 AM","3:00 AM","3:20 AM","3:30 AM","3:40 AM",
"3:50 AM","4:00 AM","4:30 AM","4:50 AM","5:00 AM","5:20 AM","5:30 AM",
"5:40 AM","5:50 AM","6:00 AM","6:20 AM","6:30 AM","6:50 AM",
"7:00 AM","7:20 AM","7:30 AM","7:40 AM","7:50 AM","8:00 AM",
"8:10 AM","8:20 AM","8:30 AM","8:40 AM","8:50 AM","9:00 AM",
"9:10 AM","9:20 AM","9:30 AM","9:40 AM","9:50 AM","10:00 AM",
"10:10 AM","10:20 AM","10:30 AM","10:40 AM","10:50 AM","11:00 AM",
"11:10 AM","11:20 AM","11:30 AM","11:40 AM","11:50 AM","12:00 AM"

          
        } );
%>

<items>
    <c:choose>
        <c:when test="${not empty autoTime}">
            <c:forEach items="${autoTime}" var="autoTime" varStatus="loop">
                <item>
                    <text>${autoTime}</text>
                    <value>${autoTime}</value>
                </item>
            </c:forEach>  
        </c:when>
    </c:choose>

</items>
