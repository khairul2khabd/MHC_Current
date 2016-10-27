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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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


<!-- Glucose Tolerance Test  GTT -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '2404' }">
        <tr> <td colspan="4">&nbsp;&nbsp; <b>Glucose Tolerance Test (GTT)</b> </td> </tr>	
        <tr>
            <td style="width:40%; font-size:12px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2291'}">
                        &nbsp;&nbsp; &nbsp;  
                        ${t.testName}
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px; width:20%; font-size:12px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2291'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2291'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2291'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>

        <tr>
            <td style="width:40%; font-size:12px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832'}">
                        &nbsp;&nbsp; &nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832'}">
                        ${t.value}  
                    </c:if>
                </c:forEach>   
            </td>
            <td style="padding-left:20px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>

                    </c:if>
                </c:forEach> 
            </td>
        </tr>

        <tr>
            <td style="width:40%; font-size:12px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5939'}">
                        &nbsp;&nbsp; &nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5939'}">
                        ${t.value}  
                    </c:if>
                </c:forEach>   
            </td>
            <td style="padding-left:20px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5939'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5939'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td style="width:40%; font-size:12px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5839'}">
                        &nbsp;&nbsp; &nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5839'}">
                        ${t.value}  
                    </c:if>
                </c:forEach>   
            </td>
            <td style="padding-left:20px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5839'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5839'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>

                    </c:if>
                </c:forEach> 
            </td>
        </tr>

        <tr>
            <td style="width:40%; font-size:12px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5941'}">
                        &nbsp;&nbsp; &nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5941'}">
                        ${t.test}  
                    </c:if>
                </c:forEach>   
            </td>
            <td style="padding-left:20px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5941'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5941'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td style="width:40%; font-size:12px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5840'}">
                        &nbsp;&nbsp; &nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5840'}">
                        ${t.value}  
                    </c:if>
                </c:forEach>   
            </td>
            <td style="padding-left:20px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5840'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5840'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>

                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach>




<!-- GTT (2 Sample) -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5769' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>GTT (2 Sample)</b> </td> </tr>	
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2291' && t.groupName eq '5769'}"> 
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2291' && t.groupName eq '5769'}"> 
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2291' && t.groupName eq '5769'}"> 
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2291' && t.groupName eq '5769'}"> 
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>

        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5769'}"> 
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5769'}"> 
                        ${t.value}  
                    </c:if>
                </c:forEach>   
            </td>
            <td style="padding-left:20px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5769'}"> 
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5769'}"> 
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>

        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5941' && t.groupName eq '5769'}"> 
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5941' && t.groupName eq '5769'}"> 
                        ${t.test}  
                    </c:if>
                </c:forEach>   
            </td>
            <td style="padding-left:20px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5941' && t.groupName eq '5769'}"> 
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5941' && t.groupName eq '5769'}"> 
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5840' && t.groupName eq '5769'}"> 
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5840' && t.groupName eq '5769'}"> 
                        ${t.test}  
                    </c:if>
                </c:forEach>   
            </td>
            <td style="padding-left:20px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5840' && t.groupName eq '5769'}"> 
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5840' && t.groupName eq '5769'}"> 
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5165'}">
                        ${t.value}  
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5168'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:10px; width:5%;">  
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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
            <td style="padding-left:10px; width:5%;"> 
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

<!-- BUNN-->

<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5186' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5186' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="padding-left:10px; width:5%;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5186' }">
                        &nbsp;&nbsp; 
                        ${t.value}
                    </c:if>  
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5186' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5186' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>

<!-- Blood urea-->

<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5185' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:50%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5185' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="padding-left:10px; width:5%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5185' }">
                        &nbsp;&nbsp; 
                        ${t.value}
                    </c:if>  
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5185' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5185' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>

<!--SERUM CREAtinine -->

<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '2215' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2215' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="padding-left:10px; width:5%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2215' }">
                        &nbsp;&nbsp; 
                        ${t.value}
                    </c:if>  
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2215' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2215' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>


<!--S.URIC ACID -->

<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '2294' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:50%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2294' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="padding-left:10px; width:5%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2294' }">
                        &nbsp;&nbsp; 
                        ${t.value}
                    </c:if>  
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2294' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2294' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>


<!--S>BILIRUBIN totall-->

<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '2739' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2739' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="padding-left:10px; width:5%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2739' }">
                        &nbsp;&nbsp; 
                        ${t.value}
                    </c:if>  
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2739' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2739' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>


<!--S. bilibrubin direct-->

<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '2232' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2232' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="padding-left:10px; width:5%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2232' }">
                        &nbsp;&nbsp; 
                        ${t.value}
                    </c:if>  
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2232' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2232' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>


<!--S. bilibrubin Indirect-->

<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '2738' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:50%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2738' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="padding-left:10px; width:5%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2738' }">
                        &nbsp;&nbsp; 
                        ${t.value}
                    </c:if>  
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2738' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2738' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>


<!-- Bilirubin (D/I)-->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5196' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>Bilirubin (D/I)</b> </td> </tr>	
        <tr>
            <td style="width:50%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2739' && t.groupName eq '5196'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2739' && t.groupName eq '5196'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2739' && t.groupName eq '5196'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2739' && t.groupName eq '5196'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td style="width:50%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2232' && t.groupName eq '5196'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2232' && t.groupName eq '5196'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2232' && t.groupName eq '5196'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2232' && t.groupName eq '5196'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td style="width:50%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2738' && t.groupName eq '5196'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2738' && t.groupName eq '5196'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2738' && t.groupName eq '5196'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2738' && t.groupName eq '5196'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach>




<!--ALT SGPT-->

<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '2209' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:50%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2209' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="padding-left:10px; width:5%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2209' }">
                        &nbsp;&nbsp; 
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2209' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2209' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>

<!--AST SGPT-->

<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '2208' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:50%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2208' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="padding-left:10px; width:5%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2208' }">
                        &nbsp;&nbsp; 
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2208' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2208' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>


<!--S ALKALINE PHOSHPHATE-->

<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '2214' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:50%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2214' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="padding-left:10px; width:5%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2214' }">
                        &nbsp;&nbsp; 
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2214' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2214' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>


<!--S PHOSphate-->

<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5687' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:50%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5687' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="padding-left:10px; width:5%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5687' }">
                        &nbsp;&nbsp; 
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5687' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5687' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>


<!--S Calcium-->

<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '2500' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:50%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2500' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="padding-left:10px; width:5%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2500' }">
                        &nbsp;&nbsp; 
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2500' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2500' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>
<!-- Livr Function Test (LFT)-->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '2407' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>Liver Function Test (LFT)</b> </td> </tr>	
        <tr>
            <td style="width:50%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2739' && t.groupName eq '2407'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2739' && t.groupName eq '2407'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2739' && t.groupName eq '2407'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2739' && t.groupName eq '2407'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td style="width:50%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2209' && t.groupName eq '2407'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2209' && t.groupName eq '2407'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2209' && t.groupName eq '2407'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2209' && t.groupName eq '2407'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2214' && t.groupName eq '2407'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2214' && t.groupName eq '2407'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2214' && t.groupName eq '2407'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2214' && t.groupName eq '2407'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach>

<!-- STP AG Ratio-->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5197' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>STP AG Ratio</b> </td> </tr>	
        <tr>
            <td style="width:50%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2212' && t.groupName eq '5197'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2212' && t.groupName eq '5197'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2212' && t.groupName eq '5197'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2212' && t.groupName eq '5197'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2217' && t.groupName eq '5197'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2217' && t.groupName eq '5197'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2217' && t.groupName eq '5197'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2217' && t.groupName eq '5197'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2679' && t.groupName eq '5197'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2679' && t.groupName eq '5197'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2679' && t.groupName eq '5197'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2679' && t.groupName eq '5197'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5841' && t.groupName eq '5197'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5841' && t.groupName eq '5197'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5841' && t.groupName eq '5197'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5841' && t.groupName eq '5197'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach>

<!--S. Total Protein & AG Ratio-->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5702' }">
        <tr> <td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>S. Total Protein & AG Ratio</b> </td> </tr>	
        <tr>
            <td style="width:50%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2212' && t.groupName eq '5702'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2212' && t.groupName eq '5702'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2212' && t.groupName eq '5702'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2212' && t.groupName eq '5702'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2217' && t.groupName eq '5702'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2217' && t.groupName eq '5702'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2217' && t.groupName eq '5702'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2217' && t.groupName eq '5702'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2679' && t.groupName eq '5702'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2679' && t.groupName eq '5702'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2679' && t.groupName eq '5702'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2679' && t.groupName eq '5702'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5841' && t.groupName eq '5702'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5841' && t.groupName eq '5702'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5841' && t.groupName eq '5702'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5841' && t.groupName eq '5702'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>

    </c:if>
</c:forEach>    




<!--S LIPASE-->

<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '2230' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:50%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2230' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td style="padding-left:10px; width:5%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2230' }">
                        &nbsp;&nbsp; 
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2230' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2230' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>       

<!--S AMYLASE-->

<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '2234' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:50%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2234' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="padding-left:10px; width:5%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2234' }">
                        &nbsp;&nbsp; 
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2234' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2234' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>       


<!--S CPK-->

<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5198' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:50%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5198' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="padding-left:10px; width:5%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5198' }">
                        &nbsp;&nbsp; 
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5198' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5198' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>

<!--CK MB-->

<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '2228' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:50%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2228' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="padding-left:10px; width:5%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2228' }">
                        &nbsp;&nbsp; 
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2228' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2228' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>


<!--Gama Glutamile Transference (GGT)-->

<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '2461' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2461' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="padding-left:10px; width:5%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2461' }">
                        &nbsp;&nbsp; 
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2461' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2461' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>
<!--LDH-->

<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5199' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:50%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5199' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="padding-left:10px; width:5%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5199' }">
                        &nbsp;&nbsp; 
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5199' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5199' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>


<!--IRON-->

<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '3993' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:50%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3993' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="padding-left:10px; width:5%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3993' }">
                        &nbsp;&nbsp; 
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3993' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3993' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>

<!--TIBC-->

<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '2559' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:50%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2559' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="padding-left:10px; width:5%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2559' }">
                        &nbsp;&nbsp; 
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2559' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2559' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>


<!--FDP-->

<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '3002' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:50%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3002' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="padding-left:10px; width:5%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3002' }">
                        &nbsp;&nbsp; 
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3002' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3002' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>


<!--ESTIMATED GFR-->

<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5291' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:50%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5291' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="padding-left:10px; width:5%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5291' }">
                        &nbsp;&nbsp; 
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5291' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5291' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>

<!--AMMONIA-->

<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5301' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:50%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5301' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="padding-left:10px; width:5%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5301' }">
                        &nbsp;&nbsp; 
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5301' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5301' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>

<!--ALDOLASE-->

<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5163' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:50%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5163' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="padding-left:10px; width:5%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5163' }">
                        &nbsp;&nbsp; 
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5163' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5163' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>
<!--LACTATE-->

<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '2229' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:50%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2229' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="padding-left:10px; width:5%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2229' }">
                        &nbsp;&nbsp; 
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2229' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2229' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>

<!--LITHIUM-->

<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '2554' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:50%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2554' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="padding-left:10px; width:5%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2554' }">
                        &nbsp;&nbsp; 
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2554' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2554' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>

<!--MAGNESIUM-->

<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '2502' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2502' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="padding-left:10px; width:5%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2502' }">
                        &nbsp;&nbsp; 
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2502' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2502' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>


<!--CERULOPLASMIN-->

<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5271' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:50%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5271' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="padding-left:10px; width:5%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5271' }">
                        &nbsp;&nbsp; 
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5271' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5271' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>

<!--FIBRINOGEN-->

<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '3074' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3074' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="padding-left:10px; width:5%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3074' }">
                        &nbsp;&nbsp; 
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3074' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3074' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>
<!--VITAMIN B-12-->

<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5266' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:50%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5266' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="padding-left:10px; width:5%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5266' }">
                        &nbsp;&nbsp; 
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5266' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5266' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>


<!--S. Cholestrol (Total) -->

<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '4248' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4248' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="padding-left:10px; width:5%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4248' }">
                        &nbsp;&nbsp; 
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4248' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4248' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>



<!--SERUM HDL-CHOLESTROL -->

<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '4249' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:50%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4249' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="padding-left:10px; width:5%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4249' }">
                        &nbsp;&nbsp; 
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4249' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4249' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>

<!--SERUM LDL - CHOLESTROL -->

<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '4250' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:50%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4250' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="padding-left:10px; width:5%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4250' }">
                        &nbsp;&nbsp; 
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4250' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4250' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>

<!--SERUM TRIGLYCERIDE-->

<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '2227' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:50%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2227' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="padding-left:10px; width:5%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2227' }">
                        &nbsp;&nbsp; 
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2227' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2227' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>
<!-- LIPID PROFILE -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '2408' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>Lipid Profile</b> </td> </tr>	
        <tr>
            <td style="width:50%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4248' && t.groupName eq '2408'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4248' && t.groupName eq '2408'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4248' && t.groupName eq '2408'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4248' && t.groupName eq '2408'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4249' && t.groupName eq '2408'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4249' && t.groupName eq '2408'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4249' && t.groupName eq '2408'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4249' && t.groupName eq '2408'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4250' && t.groupName eq '2408'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4250' && t.groupName eq '2408'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4250' && t.groupName eq '2408'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4250' && t.groupName eq '2408'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2227' && t.groupName eq '2408'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2227' && t.groupName eq '2408'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2227' && t.groupName eq '2408'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2227' && t.groupName eq '2408'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>

    </c:if>
</c:forEach>

<!--Sugar-->

<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5860' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:50%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5860' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="padding-left:10px; width:5%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5860' }">
                        &nbsp;&nbsp; 
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5860' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5860' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>

<!--Protein-->

<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5861' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5861' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="padding-left:10px; width:5%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5861' }">
                        &nbsp;&nbsp; 
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5861' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5861' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach> 


<!-- Ascitic Fluid for Biochemical test -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5353' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>Ascitic Fluid for Biochemical test</b> </td> </tr>	
        <tr>
            <td style="width:50%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5860' && t.groupName eq '5353'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5860' && t.groupName eq '5353'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5860' && t.groupName eq '5353'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5860' && t.groupName eq '5353'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5861' && t.groupName eq '5353'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5861' && t.groupName eq '5353'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5861' && t.groupName eq '5353'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5861' && t.groupName eq '5353'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
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
