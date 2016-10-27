<%-- 
    Document   : biochemistry
    Created on : Feb 9, 2016, 11:25:59 AM
    Author     : Khairul
--%>

<!-- BIOCHEMISTRY -->

<!-- Fasting Blood Glucose -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5942' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b>Fasting Blood Glucose</b> </td> </tr>	-->
        <tr>
            <td style="width:45%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2291' && t.groupName eq '5942'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2291' && t.groupName eq '5942'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:10px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2291' && t.groupName eq '5942'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2291' && t.groupName eq '5942'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td style="width:45%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5942'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5942'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5942'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5942'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>

                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach>
<!-- FBS -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5730' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b>FBS</b> </td> </tr>	-->
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2291' && t.groupName eq '5730'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2291' && t.groupName eq '5730'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2291' && t.groupName eq '5730'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2291' && t.groupName eq '5730'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5730'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5730'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5730'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5730'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>

                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach>
<!--Blood Glucose 1 Hour ABF-->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5165' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b>Blood Glucose 1 Hour ABF</b> </td> </tr> -->
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5934' && t.groupName eq '5165'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5934' && t.groupName eq '5165'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5934' && t.groupName eq '5165'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5934' && t.groupName eq '5165'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5165'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5165'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5165'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5165'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} <c:if test="${not empty t.lowNormal and not empty t.hiNormal}"> - </c:if>
                            ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach>

<!-- Blood Glucose 1.5 Hour ABF -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5166' }">
        <!--     <tr> <td colspan="4">&nbsp;&nbsp;<b>Blood Glucose 1.5 Hour ABF</b> </td> </tr> -->
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5935' && t.groupName eq '5166'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5935' && t.groupName eq '5166'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5935' && t.groupName eq '5166'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5935' && t.groupName eq '5166'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5166'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5166'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5166'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5166'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} <c:if test="${not empty t.lowNormal and not empty t.hiNormal}"> - </c:if>
                            ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach> 

<!-- Blood Glucose 2 Hour ABF. -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5944' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b>Blood Glucose 2 Hour ABF</b> </td> </tr> -->
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5167' && t.groupName eq '5944'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5167' && t.groupName eq '5944'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5167' && t.groupName eq '5944'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5167' && t.groupName eq '5944'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5944'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5944'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5944'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5944'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} <c:if test="${not empty t.lowNormal and not empty t.hiNormal}"> - </c:if>
                            ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach> 
<!-- Blood glucose 1 hour after 50gm glu -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5168' }">
        <!--     <tr> <td colspan="4">&nbsp;&nbsp;<b>Blood glucose 1 hour after 50gm glu</b> </td> </tr>	-->
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5936' && t.groupName eq '5168'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5936' && t.groupName eq '5168'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5936' && t.groupName eq '5168'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5936' && t.groupName eq '5168'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5168'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5168'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:10px; width:15%;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5168'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5168'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} <c:if test="${not empty t.lowNormal and not empty t.hiNormal}"> - </c:if>
                            ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach> 
<!-- Blood glucose 1.5 hour after 50gm glu -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5169' }">
        <!--   <tr> <td colspan="4">&nbsp;&nbsp;<b>Blood glucose 1.5 hour after 50gm glu</b> </td> </tr>	-->
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5937' && t.groupName eq '5169'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5937' && t.groupName eq '5169'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5937' && t.groupName eq '5169'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5937' && t.groupName eq '5169'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5169'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5169'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5169'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5169'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} <c:if test="${not empty t.lowNormal and not empty t.hiNormal}"> - </c:if>
                            ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td> 
        </tr>
    </c:if>
</c:forEach> 
<!-- Blood glucose 2 hour after 50gm glu -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5170' }">
        <!--     <tr> <td colspan="4">&nbsp;&nbsp;<b>Blood glucose 2 hour after 50gm glu</b> </td> </tr>	-->
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5938' && t.groupName eq '5170'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5938' && t.groupName eq '5170'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5938' && t.groupName eq '5170'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5938' && t.groupName eq '5170'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} <c:if test="${not empty t.lowNormal and not empty t.hiNormal}"> - </c:if>
                            ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5170'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5170'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5170'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5170'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} <c:if test="${not empty t.lowNormal and not empty t.hiNormal}"> - </c:if>
                            ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach> 
<!-- Blood glucose 1 hour after 75gm glu -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5171' }">
        <!--     <tr> <td colspan="4">&nbsp;&nbsp;<b>Blood glucose 1 hour after 75gm glu</b> </td> </tr>	-->
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5939' && t.groupName eq '5171'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5939' && t.groupName eq '5171'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5939' && t.groupName eq '5171'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5939' && t.groupName eq '5171'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5171'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5171'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5171'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5171'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>

                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach> 
<!-- Blood glucose 1.5 hour after 75gm glu -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5172' }">
        <!--     <tr> <td colspan="4">&nbsp;&nbsp;<b>Blood glucose 1.5 hour after 75gm glu</b> </td> </tr>	-->
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5940' && t.groupName eq '5172'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5940' && t.groupName eq '5172'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5940' && t.groupName eq '5172'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5940' && t.groupName eq '5172'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5172'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5172'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5172'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5172'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>

                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach> 
<!-- Blood glucose 1.5 hour after 75gm glu -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5173' }">
        <!--      <tr> <td colspan="4">&nbsp;&nbsp;<b>Blood glucose 1.5 hour after 75gm glu</b> </td> </tr>	-->
        <tr>
            <td style="font-size: "> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5941' && t.groupName eq '5173'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5941' && t.groupName eq '5173'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5941' && t.groupName eq '5173'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5941' && t.groupName eq '5173'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5173'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5173'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5173'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5173'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>

                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach> 
<!-- Blood glucose 2 hour after lunch -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5174' }">
        <!--     <tr> <td colspan="4">&nbsp;&nbsp;<b>Blood glucose 2 hour after lunch</b> </td> </tr> -->
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5945' && t.groupName eq '5174'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5945' && t.groupName eq '5174'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5945' && t.groupName eq '5174'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5945' && t.groupName eq '5174'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5174'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5174'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5174'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5174'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>

                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach>
<!-- Blood glucose before lunch -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5175' }">
        <!--     <tr> <td colspan="4">&nbsp;&nbsp;<b>Blood glucose before lunch</b> </td> </tr>	-->
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5946' && t.groupName eq '5175'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5946' && t.groupName eq '5175'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5946' && t.groupName eq '5175'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5946' && t.groupName eq '5175'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5175'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5175'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5175'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5175'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>

                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach>
<!-- Blood glucose 1 hour after meal -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5176' }">
        <!--     <tr> <td colspan="4">&nbsp;&nbsp;<b>Blood glucose before lunch</b> </td> </tr>	-->
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5947' && t.groupName eq '5176'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5947' && t.groupName eq '5176'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5947' && t.groupName eq '5176'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5947' && t.groupName eq '5176'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5176'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5176'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5176'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5176'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>

                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach>
<!-- Blood glucose 1.5 hour after meal -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5177' }">
        <!--     <tr> <td colspan="4">&nbsp;&nbsp;<b>Blood glucose 1.5 hour after meal</b> </td> </tr>	-->
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5948' && t.groupName eq '5177'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5948' && t.groupName eq '5177'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5948' && t.groupName eq '5177'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5948' && t.groupName eq '5177'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5177'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5177'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5177'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5177'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>

                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach>
<!-- Blood glucose 2 hour after meal -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5178' }">
        <!--     <tr> <td colspan="4">&nbsp;&nbsp;<b>Blood glucose 2 hour after meal</b> </td> </tr>	-->
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5949' && t.groupName eq '5178'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5949' && t.groupName eq '5178'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5949' && t.groupName eq '5178'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5949' && t.groupName eq '5178'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5178'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5178'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5178'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5178'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>

                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach>

<!-- Postprandial blood glucose -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5179' }">
        <!--       <tr> <td colspan="4">&nbsp;&nbsp;<b>Postprandial blood glucose</b> </td> </tr>	-->
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5950' && t.groupName eq '5179'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5950' && t.groupName eq '5179'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5950' && t.groupName eq '5179'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5950' && t.groupName eq '5179'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5179'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5179'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5179'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5179'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>

                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach>

<!-- 1 hour Postprandial blood glucose -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5180' }">
        <!--      <tr> <td colspan="4">&nbsp;&nbsp;<b>1 hour Postprandial blood glucose</b> </td> </tr>	-->
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5951' && t.groupName eq '5180'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5951' && t.groupName eq '5180'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5951' && t.groupName eq '5180'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5951' && t.groupName eq '5180'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5180'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5180'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5180'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5180'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>

                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach>

<!-- 1.5 hour Postprandial blood glucose -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5181' }">
        <!--    <tr> <td colspan="4">&nbsp;&nbsp;<b>1.5 hour Postprandial blood glucose</b> </td> </tr>	-->
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5952' && t.groupName eq '5181'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5952' && t.groupName eq '5181'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5952' && t.groupName eq '5181'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5952' && t.groupName eq '5181'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5181'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5181'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5181'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5181'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>

                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach>

<!-- 2 hour Postprandial blood glucose -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5182' }">
        <!--     <tr> <td colspan="4">&nbsp;&nbsp;<b>2 hour Postprandial blood glucose</b> </td> </tr>	-->
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5953' && t.groupName eq '5182'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5953' && t.groupName eq '5182'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5953' && t.groupName eq '5182'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5953' && t.groupName eq '5182'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5182'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5182'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5182'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5182'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>

                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach>

<!-- Blood glucose before dinner -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5183' }">
        <!--    <tr> <td colspan="4">&nbsp;&nbsp;<b>Blood glucose before dinner</b> </td> </tr>	-->
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5954' && t.groupName eq '5183'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5954' && t.groupName eq '5183'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5954' && t.groupName eq '5183'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5954' && t.groupName eq '5183'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5183'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5183'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5183'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5183'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>

                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach>

<!-- Blood glucose 2 hour after dinner -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5184' }">
        <!--      <tr> <td colspan="4">&nbsp;&nbsp;<b>Blood glucose 2 hour after dinner</b> </td> </tr>	-->
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5955' && t.groupName eq '5184'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5955' && t.groupName eq '5184'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5955' && t.groupName eq '5184'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5955' && t.groupName eq '5184'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5184'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5184'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5184'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5184'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>

                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach>

<!-- Random Blood Glucose (RBS) -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '4392' }">
        <!--   <tr> <td colspan="4">&nbsp;&nbsp;<b>Random Blood Glucose (RBS)</b> </td> </tr>	-->
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5943' && t.groupName eq '4392'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5943' && t.groupName eq '4392'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5943' && t.groupName eq '4392'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5943' && t.groupName eq '4392'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '4392'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:10px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '4392'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '4392'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '4392'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>

                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach> 



<style> 
    table.report {
        font-family:arial;
        background-color: #CDCDCD;
        margin:10px 0pt 15px;
        font-size: 8pt;
        width: 100%;
        text-align: center;
    }
    table.report thead tr th, table.report tfoot tr th {
        background-color: #e6EEEE;
        border: 1px solid #FFF;
        font-size: 8pt;
        padding: 4px;
    }
    table.report thead tr .header {
        background-image: url(bg.gif);
        background-repeat: no-repeat;
        background-position: center right;
        cursor: pointer;
    }
    table.report tbody td {
        color: #3D3D3D;
        padding: 4px;
        background-color: #FFF;
        vertical-align: top;
    }
    table.report tbody tr.odd td {
        background-color:#F0F0F6;
    }
    table.report thead tr .headerSortUp {
        background-image: url(asc.gif);
    }
    table.report thead tr .headerSortDown {
        background-image: url(desc.gif);
    }
    table.report thead tr .headerSortDown, table.report thead tr .headerSortUp {
        background-color: #8dbdd8;
    }
</style>