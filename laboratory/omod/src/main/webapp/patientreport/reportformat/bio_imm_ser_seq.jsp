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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2291' && t.groupName eq '5942'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2291' && t.groupName eq '5942'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5942'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5167' && t.groupName eq '5944'}">
                        &nbsp;&nbsp;
                        ${t.testName}
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5944'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5943' && t.groupName eq '4392'}">
                        &nbsp;&nbsp; 
                        ${t.testName}
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '4392'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2291' && t.groupName eq '5730'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5730'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5939' && t.groupName eq '5171'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5171'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5941' && t.groupName eq '5173'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5173'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
                    <c:if test="${t.investigation eq '2291' && t.groupName eq '2404'}">
                        &nbsp;&nbsp; &emsp; 
                        ${t.testName}
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:5px;   font-size:12px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2291' && t.groupName eq '2404'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2291' && t.groupName eq '2404'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2291' && t.groupName eq '2404'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>

        <tr>
            <td style="width:40%; font-size:12px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '2404'}">
                        &nbsp;&nbsp; &emsp;  
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:5px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '2404'}">
                        ${t.value}  
                    </c:if>
                </c:forEach>   
            </td>
            <td style="padding-left:20px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '2404'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '2404'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>

                    </c:if>
                </c:forEach> 
            </td>
        </tr>

        <tr>
            <td style="width:40%; font-size:12px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5939' && t.groupName eq '2404'}">
                        &nbsp;&nbsp; &emsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:5px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5939' && t.groupName eq '2404'}">
                        ${t.value}  
                    </c:if>
                </c:forEach>   
            </td>
            <td style="padding-left:20px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5939' && t.groupName eq '2404'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5939' && t.groupName eq '2404'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td style="width:40%; font-size:12px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5839' && t.groupName eq '2404'}">
                        &nbsp;&nbsp; &emsp;  
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:5px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5839' && t.groupName eq '2404'}">
                        ${t.value}  
                    </c:if>
                </c:forEach>   
            </td>
            <td style="padding-left:20px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5839' && t.groupName eq '2404'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5839' && t.groupName eq '2404'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>

                    </c:if>
                </c:forEach> 
            </td>
        </tr>

        <tr>
            <td style="width:40%; font-size:12px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5941' && t.groupName eq '2404'}">
                        &nbsp;&nbsp; &emsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:5px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5941' && t.groupName eq '2404' }">
                        ${t.test}  
                    </c:if>
                </c:forEach>   
            </td>
            <td style="padding-left:20px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5941' && t.groupName eq '2404'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5941' && t.groupName eq '2404'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td style="width:40%; font-size:12px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5840' && t.groupName eq '2404'}">
                        &nbsp;&nbsp; &emsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:5px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5840' && t.groupName eq '2404'}">
                        ${t.value}  
                    </c:if>
                </c:forEach>   
            </td>
            <td style="padding-left:20px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5840' && t.groupName eq '2404'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5840' && t.groupName eq '2404'}">
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
            <td style="width:40%;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2291' && t.groupName eq '5769'}"> 
                        &nbsp;&nbsp; &emsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:5px;"> 
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
                        &nbsp;&nbsp; &emsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:5px;"> 
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
                        <c:if test="${empty t.refRange}"> ${t.lowNormal}  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>

        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5941' && t.groupName eq '5769'}"> 
                        &nbsp;&nbsp; &emsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:5px;"> 
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
                        &nbsp;&nbsp; &emsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:5px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5840' && t.groupName eq '5769'}"> 
                        ${t.value}  
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
                        <c:if test="${empty t.refRange}"> ${t.lowNormal}  ${t.hiNormal} </c:if>
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
            <td style="width:40%;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5934' && t.groupName eq '5165'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5165'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5935' && t.groupName eq '5166'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5166'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5936' && t.groupName eq '5168'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5168'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5168'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:5px;">  
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5937' && t.groupName eq '5169'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5169'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5938' && t.groupName eq '5170'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5170'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5940' && t.groupName eq '5172'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5172'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5945' && t.groupName eq '5174'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5174'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5946' && t.groupName eq '5175'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5175'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5947' && t.groupName eq '5176'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5176'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5948' && t.groupName eq '5177'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5177'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5949' && t.groupName eq '5178'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5178'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5950' && t.groupName eq '5179'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5179'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5951' && t.groupName eq '5180'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5180'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5952' && t.groupName eq '5181'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5181'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5953' && t.groupName eq '5182'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5182'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5954' && t.groupName eq '5183'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5183'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5955' && t.groupName eq '5184'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5832' && t.groupName eq '5184'}">
                        &nbsp;&nbsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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

<!-- BUN-->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5186' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5186' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td align="left" style="padding-left:5px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5186' }">
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
            <td align="left" style="padding-left:10px; font-size: 11px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5185' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5185' }">
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
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5185' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>

<!--  S. Creatinine -->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '2215' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2215' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2215' }">
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
            <td align="left" style="padding-left:10px; font-size: 11px;">
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2294' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2294' }">
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
            <td align="left" style="padding-left:10px; font-size: 11px;">
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2739' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2739' }">
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
            <td align="left" style="padding-left:10px; font-size: 11px;">
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2232' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2232' }">
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
            <td align="left" style="padding-left:10px; font-size: 11px;">  
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2738' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
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
            <td align="left" style="padding-left:10px; font-size: 11px;">
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2739' && t.groupName eq '5196'}">
                        &nbsp;&nbsp; &emsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2232' && t.groupName eq '5196'}">
                        &nbsp;&nbsp; &emsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2232' && t.groupName eq '5196'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:20px;">
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2738' && t.groupName eq '5196'}">
                        &nbsp;&nbsp; &emsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2209' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2209' }">
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
            <td align="left" style="padding-left:10px; font-size: 11px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2208' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2208' }">
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
            <td align="left" style="padding-left:10px; font-size: 11px;">  
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2214' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2214' }">
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
            <td align="left" style="padding-left:10px; font-size: 11px;">
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5687' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5687' }">
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
            <td align="left" style="padding-left:10px; font-size: 11px;">
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
            <td style="width:40%; vertical-align: top;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2500' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td align="left" style="padding-left:5px; vertical-align: top;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2500' }">

                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px; vertical-align: top;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2500' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2739' && t.groupName eq '2407'}">
                        &nbsp;&nbsp; &emsp; 
                        ${t.testName}
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2209' && t.groupName eq '2407'}">
                        &nbsp;&nbsp; &emsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
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
                        &nbsp;&nbsp; &emsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2212' && t.groupName eq '5197'}">
                        &nbsp;&nbsp; &emsp; 
                        ${t.testName}
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
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
                        &nbsp;&nbsp; &emsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
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
                        &nbsp;&nbsp; &emsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
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
                        &nbsp;&nbsp; &emsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2212' && t.groupName eq '5702'}">
                        &nbsp;&nbsp; &emsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
                        &nbsp;&nbsp; &emsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
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
                        &nbsp;&nbsp; &emsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
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
                        &nbsp;&nbsp; &emsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2230' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2230' }">
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
            <td align="left" style="padding-left:10px; font-size: 11px;"> 
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2234' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2234' }">
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
            <td align="left" style="padding-left:10px; font-size: 11px;">
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5198' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5198' }">
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
            <td align="left" style="padding-left:10px; font-size: 11px;">
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2228' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2228' }">
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
            <td align="left" style="padding-left:10px; font-size: 11px;">
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2461' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2461' }">
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
            <td align="left" style="padding-left:10px; font-size: 11px;">
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5199' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5199' }">
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
            <td align="left" style="padding-left:10px; font-size: 11px;">  
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3993' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3993' }">
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
            <td align="left" style="padding-left:10px; font-size: 11px;">
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2559' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2559' }">
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
            <td align="left" style="padding-left:10px; font-size: 11px;">
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3002' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3002' }">
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
            <td align="left" style="padding-left:10px; font-size: 11px;">
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5291' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5291' }">
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
            <td align="left" style="padding-left:10px; font-size: 11px;">
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5301' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5301' }">
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
            <td align="left" style="padding-left:10px; font-size: 11px;">
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5163' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5163' }">
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
            <td align="left" style="padding-left:10px; font-size: 11px;">
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2229' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2229' }">
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
            <td align="left" style="padding-left:10px; font-size: 11px;">
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2554' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2554' }">
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
            <td align="left" style="padding-left:10px; font-size: 11px;">
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2502' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2502' }">
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
            <td align="left" style="padding-left:10px; font-size: 11px;">
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5271' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5271' }">
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
            <td align="left" style="padding-left:10px; font-size: 11px;">
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3074' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3074' }"> 
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
            <td align="left" style="padding-left:10px; font-size: 11px;">
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5266' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5266' }">
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
            <td align="left" style="padding-left:10px; font-size: 11px;">
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4248' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4248' }">
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
            <td align="left" style="padding-left:10px; font-size: 11px;">
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4249' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4249' }">
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
            <td align="left" style="padding-left:10px; font-size: 11px;">
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4250' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4250' }">
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
            <td align="left" style="padding-left:10px; font-size: 11px;">
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2227' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2227' }">
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
            <td align="left" style="padding-left:10px; font-size: 11px;">
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4248' && t.groupName eq '2408'}">
                        &nbsp;&nbsp; &emsp; 
                        ${t.testName}
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
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
                        &nbsp;&nbsp; &emsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
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
                        &nbsp;&nbsp; &emsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
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
                        &nbsp;&nbsp; &emsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
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


<!--Fasting LIPID PROFILE -->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '6036' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>Fasting Lipid Profile</b> </td> </tr>	
        <tr>
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4248' && t.groupName eq '6036'}">
                        &nbsp;&nbsp; &emsp; 
                        ${t.testName}
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4248' && t.groupName eq '6036'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4248' && t.groupName eq '6036'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4248' && t.groupName eq '6036'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4249' && t.groupName eq '6036'}">
                        &nbsp;&nbsp; &emsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4249' && t.groupName eq '6036'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4249' && t.groupName eq '6036'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4249' && t.groupName eq '6036'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4250' && t.groupName eq '6036'}">
                        &nbsp;&nbsp; &emsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4250' && t.groupName eq '6036'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4250' && t.groupName eq '6036'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4250' && t.groupName eq '6036'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2227' && t.groupName eq '6036'}">
                        &nbsp;&nbsp; &emsp; 
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2227' && t.groupName eq '6036'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2227' && t.groupName eq '6036'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2227' && t.groupName eq '6036'}">
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5860' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5860' }">
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
            <td align="left" style="padding-left:10px; font-size: 11px;">
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5861' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5861' }">
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
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5861' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>

<!-- Urinary Amylase -->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5206' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5206' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5206' }">
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5206' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5206' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>
<!-- Immunology Sequence -->

<!--T3-->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '3945' && te.concept.conceptId eq '5245' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5245' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5245' }">
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5245' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5245' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>
<!--T4-->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '3945' && te.concept.conceptId eq '5246' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5246' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5246' }">
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5246' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5246' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>
<!-- T3,T4,TSH -->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '3945' && te.concept.conceptId eq '5247' }">
        <!-- <tr> <td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>T3,T4,TSH</b></td> </tr> -->
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5245' && t.groupName eq '5247'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5245' && t.groupName eq '5247'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5245' && t.groupName eq '5247'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">   
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5245' && t.groupName eq '5247'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5246' && t.groupName eq '5247'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5246' && t.groupName eq '5247'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5246' && t.groupName eq '5247'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">   
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5246' && t.groupName eq '5247'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4278' && t.groupName eq '5247'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4278' && t.groupName eq '5247'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4278' && t.groupName eq '5247'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4278' && t.groupName eq '5247'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>

    </c:if>
</c:forEach>
<!--FREE T3-->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '3945' && te.concept.conceptId eq '2509' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:40%;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2509' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2509' }">
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2509' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2509' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>
<!--FREE T4-->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '3945' && te.concept.conceptId eq '2510' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:40%;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2510' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2510' }">
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2510' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2510' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>
<!--TSH-->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '3945' && te.concept.conceptId eq '4278' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:40%;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4278' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4278' }">
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4278' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4278' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>
<!--FSH-->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '3945' && te.concept.conceptId eq '2568' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:40%;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2568' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2568' }">
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2568' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2568' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>
<!--LH-->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '3945' && te.concept.conceptId eq '2569' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2569' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2569' }">
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2569' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2569' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>
<!--TESTOSTERONE-->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '3945' && te.concept.conceptId eq '5151' }">
        <tr>
            <td style="width:40%; vertical-align: top; "> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5151' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if> 
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px; vertical-align: top;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5151' }">
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px; vertical-align: top;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5151' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5151' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>
<!--PROLACTINE-->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '3945' && te.concept.conceptId eq '2571' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:40%; vertical-align: top;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2571' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px; vertical-align: top;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2571' }">
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px; vertical-align: top;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2571' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2571' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>
<!--TOTAL IGE-->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '3945' && te.concept.conceptId eq '5257' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5257' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5257' }">
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5257' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5257' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>
<!-- HBs Ag-->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '3945' && te.concept.conceptId eq '5152' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>HBs Ag</b> </td> </tr>	
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5851' && t.groupName eq '5152'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5851' && t.groupName eq '5152'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5851' && t.groupName eq '5152'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5851' && t.groupName eq '5152'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>

                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5852' && t.groupName eq '5152'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5852' && t.groupName eq '5152'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5852' && t.groupName eq '5152'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5852' && t.groupName eq '5152'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>

                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5152'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5152'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5152'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5152'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>

                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach>
<!--CA -125-->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '3945' && te.concept.conceptId eq '2938' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:40%;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2938' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2938' }">
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2938' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2938' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>
<!--CA -19.9-->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '3945' && te.concept.conceptId eq '3135' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:40%;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3135' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3135' }">
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3135' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3135' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>
<!--CA -15.3-->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '3945' && te.concept.conceptId eq '2939' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:40%;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2939' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2939' }">
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2939' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2939' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>
<!--CEA-->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '3945' && te.concept.conceptId eq '2944' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2944' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2944' }">
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2944' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2944' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>
<!--Alpha feto protein(AfP)-->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '3945' && te.concept.conceptId eq '764' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '764' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '764' }">
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '764' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '764' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>
<!--PSA-->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '3945' && te.concept.conceptId eq '5157' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5157' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5157' }">
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5157' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5157' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>

<!--ANTI HCV-->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '3945' && te.concept.conceptId eq '2617' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2617' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2617' }">
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2617' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2617' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>
        
<!-- Serology Sequence -->

<!-- ABO BLOOD GROUP & RH FACTOR -->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '2400' && te.concept.conceptId eq '3962' }">
        <!-- <tr> <td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>ABO BLOOD GROUP & RH FACTOR</b> </td> </tr>	-->
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2203' && t.groupName eq '3962'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2203' && t.groupName eq '3962'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2203' && t.groupName eq '3962'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2203' && t.groupName eq '3962'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} <c:if test="${not empty t.lowNormal and not empty t.hiNormal}"> - </c:if>
                            ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach>  
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3059' && t.groupName eq '3962'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3059' && t.groupName eq '3962'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3059' && t.groupName eq '3962'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3059' && t.groupName eq '3962'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} <c:if test="${not empty t.lowNormal and not empty t.hiNormal}"> - </c:if>
                            ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach>  
            </td>
        </tr>

    </c:if>
</c:forEach>
<!--VDRL-->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '2400' && te.concept.conceptId eq '3967' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3967' }">
                        &nbsp;&nbsp;   
                        <b>  ${t.testName}</b>
                    </c:if>  
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3967' }">
                        <b>${t.value}</b>
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3967' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3967' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>

<!--ASO TITRE-->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '2400' && te.concept.conceptId eq '4256' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:40%;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4256' }">
                        &nbsp;&nbsp;   
                        <b>  ${t.testName}</b>
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4256' }">
                        <b> ${t.value} </b>
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4256' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4256' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>
        
<!--SERUM VITAMIN-D-->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '5290' && te.concept.conceptId eq '5290' }">
        <tr>
            <td style="width:40%;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5290' }">
                        &nbsp;&nbsp;   
                        <b>  ${t.testName}</b>
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5290' }">
                        <b> ${t.value} </b>
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5290' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5290' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>

<!-- Widal Test -->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '2400' && te.concept.conceptId eq '2406' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>WIDAL TEST</b> </td> </tr>	
        <tr>
            <td style="width:40%;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5967' && t.groupName eq '2406'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5967' && t.groupName eq '2406'}">
                        ${t.value}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5967' && t.groupName eq '2406'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5967' && t.groupName eq '2406'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} <c:if test="${not empty t.lowNormal and not empty t.hiNormal}"> - </c:if>
                            ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach>  
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5966' && t.groupName eq '2406'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5966' && t.groupName eq '2406'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5966' && t.groupName eq '2406'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5966' && t.groupName eq '2406'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} <c:if test="${not empty t.lowNormal and not empty t.hiNormal}"> - </c:if>
                            ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach>  
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5969' && t.groupName eq '2406'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5969' && t.groupName eq '2406'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5969' && t.groupName eq '2406'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5969' && t.groupName eq '2406'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} <c:if test="${not empty t.lowNormal and not empty t.hiNormal}"> - </c:if>
                            ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach>  
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5970' && t.groupName eq '2406'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5970' && t.groupName eq '2406'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5970' && t.groupName eq '2406'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5970' && t.groupName eq '2406'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} <c:if test="${not empty t.lowNormal and not empty t.hiNormal}"> - </c:if>
                            ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach>  
            </td>
        </tr>
    </c:if>
</c:forEach>
<!--CRP-->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '2400' && te.concept.conceptId eq '5688' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5688' }">
                        &nbsp;&nbsp;   
                        <b> ${t.testName}</b>
                    </c:if>  
                </c:forEach>
            </td> 

            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5688' }">
                        <b> ${t.value}</b>
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5688' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5688' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>
<!--R/A TEST-->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '2400' && te.concept.conceptId eq '5218' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5218' }">
                        &nbsp;&nbsp;   
                        <b> ${t.testName} </b>
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5218' }">
                        <b> ${t.value} </b>
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5218' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5218' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>

<!--H-pylori AntiBody -->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '2400' && te.concept.conceptId eq '5267' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5267' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5267' }">
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5267' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5267' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>
<!--ICT for Filaria -->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '2400' && te.concept.conceptId eq '5308' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5308' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5308' }"> 
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5308' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5308' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>
<!--ICT for Dengue -->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '2400' && te.concept.conceptId eq '5814' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5814' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5814' }">
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5814' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5814' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>
<!--ICT for KALAZAR -->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '2400' && te.concept.conceptId eq '5366' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5366' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5366' }">
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5366' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5366' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>
<!-- VDRL Q+Q -->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '2400' && te.concept.conceptId eq '6024' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b><u>VDRL(Q+Q)</u></b> </td> </tr>	
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2202' && t.groupName eq '6024'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2202' && t.groupName eq '6024'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2202' && t.groupName eq '6024'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2202' && t.groupName eq '6024'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} <c:if test="${not empty t.lowNormal and not empty t.hiNormal}"> - </c:if>
                            ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach>  
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2623' && t.groupName eq '6024'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2623' && t.groupName eq '6024'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2623' && t.groupName eq '6024'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2623' && t.groupName eq '6024'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} <c:if test="${not empty t.lowNormal and not empty t.hiNormal}"> - </c:if>
                            ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach>  
            </td>
        </tr>
    </c:if>
</c:forEach>

<!-- TPHA Q+Q -->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '2400' && te.concept.conceptId eq '6074' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b><u>TPHA(Q+Q)</u></b> </td> </tr>	
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6075' && t.groupName eq '6074'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6075' && t.groupName eq '6074'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6075' && t.groupName eq '6074'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6075' && t.groupName eq '6074'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} <c:if test="${not empty t.lowNormal and not empty t.hiNormal}"> - </c:if>
                            ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach>  
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6076' && t.groupName eq '6074'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6076' && t.groupName eq '6074'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6076' && t.groupName eq '6074'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6076' && t.groupName eq '6074'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} <c:if test="${not empty t.lowNormal and not empty t.hiNormal}"> - </c:if>
                            ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach>  
            </td>
        </tr>
    </c:if>
</c:forEach>        
<!--TPHA TEST -->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '2400' && te.concept.conceptId eq '5221' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5221' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5221' }">
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5221' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5221' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>
<!--TPHA (ICT) -->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '2400' && te.concept.conceptId eq '2561' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:40%;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2561' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2561' }">
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2561' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2561' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>
<!-- ICT For Malaria (p.f/p.v) -->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '2400' && te.concept.conceptId eq '5215' }">
<!--        <tr> <td colspan="4">&nbsp;&nbsp;<b>ICT For Malaria (p.f/p.v)</b> </td> </tr>	-->
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6077' && t.groupName eq '5215'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6077' && t.groupName eq '5215'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6077' && t.groupName eq '5215'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6077' && t.groupName eq '5215'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} <c:if test="${not empty t.lowNormal and not empty t.hiNormal}"> - </c:if>
                            ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach>  
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6078' && t.groupName eq '5215'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6078' && t.groupName eq '5215'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6078' && t.groupName eq '5215'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6078' && t.groupName eq '5215'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} <c:if test="${not empty t.lowNormal and not empty t.hiNormal}"> - </c:if>
                            ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach>  
            </td>
        </tr>
    </c:if>
</c:forEach> 
        
<!--COMBS TEST(DIRECT)-->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '2400' && te.concept.conceptId eq '2261' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2261' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2261' }">
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2261' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2261' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>
<!--COMBS TEST(INDIRECT)-->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '2400' && te.concept.conceptId eq '2262' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2262' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2262' }"> 
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2262' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2262' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>

<!-- Coombs Test (D/I) -->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '2400' && te.concept.conceptId eq '5315' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>Coombs Test (D/I)</b> </td> </tr>	
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2261' && t.groupName eq '5315'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2261' && t.groupName eq '5315'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2261' && t.groupName eq '5315'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2261' && t.groupName eq '5315'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} <c:if test="${not empty t.lowNormal and not empty t.hiNormal}"> - </c:if>
                            ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach>  
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2262' && t.groupName eq '5315'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2262' && t.groupName eq '5315'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2262' && t.groupName eq '5315'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2262' && t.groupName eq '5315'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} <c:if test="${not empty t.lowNormal and not empty t.hiNormal}"> - </c:if>
                            ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach>  
            </td>
        </tr>
    </c:if>
</c:forEach>

<!-- NS1 For Dengue -->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '2734' && te.concept.conceptId eq '5889' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5889' && t.groupName eq '5889' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5889' && t.groupName eq '5889' }"> 
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5889' && t.groupName eq '5889' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5889' && t.groupName eq '5889' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 

        <tr> <td colspan="3"> <br> &nbsp;&nbsp;&emsp; Note :  
                NS1 is an antigen of dengue virus which is rapid <br> &nbsp;&nbsp;&nbsp;&emsp;&emsp;&emsp;&emsp;  Immuno Chromatographic Test for early 
                <br> &nbsp;&nbsp;&emsp;&emsp;&emsp; &emsp; detection of dengue virus. </td>
            <td colspan="1">&nbsp; </td>
        </tr>

    </c:if>
</c:forEach>


<!-- Complement C3 -->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '5225' && te.concept.conceptId eq '5225' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5225' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5225' }">
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5225' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5225' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>

<!-- Complement C4 -->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '5225' && te.concept.conceptId eq '5226' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5226' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5226' }">
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5226' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5226' }">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
    </c:if>
</c:forEach>
        
<!-- Bence-Jones Protein -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '5293' && te.concept.conceptId eq '5293' }">
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5293'}">
                        &nbsp;&nbsp;&nbsp;   ${t.testName}
                    </c:if>	 
                </c:forEach>
            </td> 
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5293'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5293'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5293'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                    </c:if>
                </c:forEach> 
            </td>	
        </tr>
    </c:if>
</c:forEach>
          
<!-- H. Pylori - IgG -->
<c:forEach items="${te}" var="te"> 
    <c:if test="${investigation eq '5258' && te.concept.conceptId eq '5258'}">
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5258'}">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5258'}">
                        ${t.test}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5258'}">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5258'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr> 
        <tr> <td colspan="4"> &nbsp; </td> </tr>
        <tr style="text-wrap:none;">
            <td colspan="4"> Reference Range: <br> 
                Positive : A result greater than or equal to 1.1U/mL is considered to be "Positive".<br> 
                Indetermine : A result greater than or equal to 0.9U/mL and less than 1.1U/mL is considered to be "Indeterminate".<br> 
                Negative : A result less than 0.9U/mL is considered to be "Negative". 
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
