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
<!-- HSV I & II-IgG-->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '5255' && te.concept.conceptId eq '5255' }">
        <tr> <td colspan="4"> &nbsp; </td> </tr>
        <tr> <td colspan="4"> <b> HSV I & II-IgG </b> </td> </tr>
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845'   }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845'  }">
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845'  }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 

        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846'   }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846'   }">
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846'  }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 

        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847'   }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847'   }">
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847'  }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr> <td colspan="4"> &nbsp; </td> </tr>
        <tr style="text-wrap:none;">
            <td colspan="4"> Reference Range: <br> Positive : A result of Positive (ratio of &#x2265; 1.1) indicates that the patient's sample
                is reactive. <br> Indetermine : A result indeterminte (ratio between 0.9 and <1.1) should be retested within a week. 
                <br> Negative : A result of Negative (ratio of <0.9) indicates that the patient's sample is nonreactive. </td>
        </tr>
    </c:if>
</c:forEach>

<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '6010' && te.concept.conceptId eq '6010' }">
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6010' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6010'  }">
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
             
        </tr> 
    </c:if>
</c:forEach>