<%-- 
    Document   : urinestool
    Created on : Nov 15, 2016, 12:24:30 PM
    Author     : Khairul
--%>

<style type="text/css">
    tr.top td { border-top: thin solid black; border-right: thin solid black; }
    tr.bottom td { border-bottom: thin solid black; border-left: thin solid black; }

</style>

<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '5709' && te.concept.conceptId eq '5709' }">
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6043' && t.groupName eq '5709' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6043' && t.groupName eq '5709' }">
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6043' && t.groupName eq '5709' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6043' && t.groupName eq '5709' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 

        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6044' && t.groupName eq '5709' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6044' && t.groupName eq '5709' }">
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6044' && t.groupName eq '5709' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6044' && t.groupName eq '5709' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>

<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '5709' && te.concept.conceptId eq '6043' }">
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6043' && t.groupName eq '6043' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6043' && t.groupName eq '6043' }">
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6043' && t.groupName eq '6043' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6043' && t.groupName eq '6043' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '5709' && te.concept.conceptId eq '6044' }">
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6044' && t.groupName eq '6044' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6044' && t.groupName eq '6044' }">
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6044' && t.groupName eq '6044' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6044' && t.groupName eq '6044' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>