<%-- 
    Document   : biochemistry
    Created on : Feb 9, 2016, 11:25:59 AM
    Author     : Farzana
--%>
<!-- BIOCHEMISTRY -->

<!-- APTT with PT embedded code starts -->
<c:forEach items="${te}" var="te"> 

    <!-- embedded aptt -->
    <c:if test="${investigation eq '2577' && te.concept.conceptId eq '2920' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>APTT</b> </td> </tr>	
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4734'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4734'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4734'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4734'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>

        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4735'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4735'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4735'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4735'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach>

<!-- embedded pt-->
<c:forEach items="${te}" var="te"> 

    <c:if test="${investigation eq '2577' && te.concept.conceptId eq '2577'}">

        <tr> <td colspan="4">&nbsp;&nbsp;<b>PROTHROMBIN TIME</b> </td> </tr>	
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5903'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        Control  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5903'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5903'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5903'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5850'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        Patient 
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5850'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5850'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5850'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5848'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5848'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5848'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5848'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5849'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5849'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5849'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5849'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>

                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td > 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2805'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2805'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2805'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2805'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>

                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach>

<!--Albumin Creatinine Ration-->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '5239' && te.concept.conceptId eq '5239' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>Albumin Creatinine Ratio(ACR)</b> </td> </tr>	
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5873' && t.groupName eq '5239'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5873' && t.groupName eq '5239'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5873' && t.groupName eq '5239'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5873' && t.groupName eq '5239'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>

        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2782' && t.groupName eq '5239'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2782' && t.groupName eq '5239'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2782' && t.groupName eq '5239'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2782' && t.groupName eq '5239'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5874' && t.groupName eq '5239'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5874' && t.groupName eq '5239'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5874' && t.groupName eq '5239'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5874' && t.groupName eq '5239'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach>

<!--Micro Albumin Creatinine Ration-->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5240' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>Micro Albumin Creatinine Ratio</b> </td> </tr>	
        <tr>
            <td style="width:40%;">   
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5873' && t.groupName eq '5240'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5873' && t.groupName eq '5240'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5873' && t.groupName eq '5240'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5873' && t.groupName eq '5240'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>

        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2782' && t.groupName eq '5240'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2782' && t.groupName eq '5240'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2782' && t.groupName eq '5240'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2782' && t.groupName eq '5240'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5874' && t.groupName eq '5240'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5874' && t.groupName eq '5240'}">
                        ${t.test}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5874' && t.groupName eq '5240'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5874' && t.groupName eq '5240'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach>

<!-- Urine Electrolytes -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5294' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>Urine Electrolytes</b> </td> </tr>	
        <tr>
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5296' && t.groupName eq '5294'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5296' && t.groupName eq '5294'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5296' && t.groupName eq '5294'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5296' && t.groupName eq '5294'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5297' && t.groupName eq '5294'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5297' && t.groupName eq '5294'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5297' && t.groupName eq '5294'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5297' && t.groupName eq '5294'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5298' && t.groupName eq '5294'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5298' && t.groupName eq '5294'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5298' && t.groupName eq '5294'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5298' && t.groupName eq '5294'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3936' && t.groupName eq '5294'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3936' && t.groupName eq '5294'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3936' && t.groupName eq '5294'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3936' && t.groupName eq '5294'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach>

<!-- 24 hours. Urine Electrolytes -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5295' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>24 hours. Urine Electrolytes</b> </td> </tr>	
        <tr>
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5826' && t.groupName eq '5295'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5826' && t.groupName eq '5295'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5826' && t.groupName eq '5295'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5826' && t.groupName eq '5295'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5827' && t.groupName eq '5295'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5827' && t.groupName eq '5295'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5827' && t.groupName eq '5295'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5827' && t.groupName eq '5295'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5828' && t.groupName eq '5295'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5828' && t.groupName eq '5295'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5828' && t.groupName eq '5295'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5828' && t.groupName eq '5295'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
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
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5860' && t.groupName eq '5353'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;"> 
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

<!-- Spot Urine Electrolytes -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5515' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>Spot Urine Electrolytes</b> </td> </tr>	
        <tr>
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5296' && t.groupName eq '5515'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5296' && t.groupName eq '5515'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5296' && t.groupName eq '5515'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5296' && t.groupName eq '5515'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5297' && t.groupName eq '5515'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5297' && t.groupName eq '5515'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5297' && t.groupName eq '5515'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5297' && t.groupName eq '5515'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5298' && t.groupName eq '5515'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5298' && t.groupName eq '5515'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5298' && t.groupName eq '5515'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5298' && t.groupName eq '5515'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3936' && t.groupName eq '5515'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3936' && t.groupName eq '5515'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3936' && t.groupName eq '5515'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3936' && t.groupName eq '5515'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>		    
    </c:if>
</c:forEach>

<!-- Urinary Electrolytes -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5735' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>Urinary Electrolytes</b> </td> </tr>	
        <tr>
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5296' && t.groupName eq '5735'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5296' && t.groupName eq '5735'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5296' && t.groupName eq '5735'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5296' && t.groupName eq '5735'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5297' && t.groupName eq '5735'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5297' && t.groupName eq '5735'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5297' && t.groupName eq '5735'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5297' && t.groupName eq '5735'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5298' && t.groupName eq '5735'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5298' && t.groupName eq '5735'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5298' && t.groupName eq '5735'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5298' && t.groupName eq '5735'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3936' && t.groupName eq '5735'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3936' && t.groupName eq '5735'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3936' && t.groupName eq '5735'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3936' && t.groupName eq '5735'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>

    </c:if>
</c:forEach>

<!-- S. Electrolytes -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2543' && te.concept.conceptId eq '2543' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>S. Electrolytes</b> </td> </tr>	
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5187'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5187'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5187'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5187'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5188'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5188'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5188'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5188'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5189'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5189'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5189'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5189'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5190'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5190'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5190'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5190'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
                <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5303'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5303'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5303'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5303'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach>

<!-- End -->

<!-- DEPARTMENT OF HAEMATOLOGY -->
<!-- BT.CT. -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '5692' && te.concept.conceptId eq '5692' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>BT.CT.</b> </td> </tr>	-->
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2084' && t.groupName eq '5692'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2084' && t.groupName eq '5692'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2084' && t.groupName eq '5692'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2084' && t.groupName eq '5692'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2086' && t.groupName eq '5692'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	  
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2086' && t.groupName eq '5692'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2086' && t.groupName eq '5692'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2086' && t.groupName eq '5692'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>  
    </c:if>
</c:forEach>

<!--  DEPARTMENT OF CLINICAL PATHOLOGY -->
<!-- Mantrux Test (MT) -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '5718' && te.concept.conceptId eq '5718' }">
        <tr> <td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <b>MANTOUX TEST: (PPD 10 TU/.1 ml)</b> </td> </tr>	
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5885' && t.groupName eq '5718'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5885' && t.groupName eq '5718'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5885' && t.groupName eq '5718'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">

                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5886' && t.groupName eq '5718'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5886' && t.groupName eq '5718'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5886' && t.groupName eq '5718'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">

                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5887' && t.groupName eq '5718'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5887' && t.groupName eq '5718'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5887' && t.groupName eq '5718'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">

                </c:forEach> 
            </td>
        </tr>

    </c:if>
</c:forEach>



<!-- MICROBIOLOGY -->

<!-- Sputum for AFB -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2734' && te.concept.conceptId eq '5444' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>Sputum for AFB</b> </td> </tr>	
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5875' && t.groupName eq '5444'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5875' && t.groupName eq '5444'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5875' && t.groupName eq '5444'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5875' && t.groupName eq '5444'}">
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
                    <c:if test="${t.investigation eq '5853' && t.groupName eq '5444'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5853' && t.groupName eq '5444'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5853' && t.groupName eq '5444'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5853' && t.groupName eq '5444'}">
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
                    <c:if test="${t.investigation eq '5862' && t.groupName eq '5444'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5862' && t.groupName eq '5444'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5862' && t.groupName eq '5444'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5862' && t.groupName eq '5444'}">
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
                    <c:if test="${t.investigation eq '5863' && t.groupName eq '5444'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5863' && t.groupName eq '5444'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5863' && t.groupName eq '5444'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5863' && t.groupName eq '5444'}">
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
                    <c:if test="${t.investigation eq '5864' && t.groupName eq '5444'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5864' && t.groupName eq '5444'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5864' && t.groupName eq '5444'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5864' && t.groupName eq '5444'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} <c:if test="${not empty t.lowNormal and not empty t.hiNormal}"> - </c:if>
                            ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach>  
            </td>
        </tr>
    </c:if>
</c:forEach> 


<!-- Sputum C/S for AFB -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2734' && te.concept.conceptId eq '5644' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>Sputum C/S for AFB</b> </td> </tr>	
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5875' && t.groupName eq '5644'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5875' && t.groupName eq '5644'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5875' && t.groupName eq '5644'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5875' && t.groupName eq '5644'}">
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
                    <c:if test="${t.investigation eq '5853' && t.groupName eq '5644'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5853' && t.groupName eq '5644'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5853' && t.groupName eq '5644'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5853' && t.groupName eq '5644'}">
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
                    <c:if test="${t.investigation eq '5862' && t.groupName eq '5644'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5862' && t.groupName eq '5644'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5862' && t.groupName eq '5644'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5862' && t.groupName eq '5644'}">
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
                    <c:if test="${t.investigation eq '5863' && t.groupName eq '5644'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5863' && t.groupName eq '5644'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5863' && t.groupName eq '5644'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5863' && t.groupName eq '5644'}">
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
                    <c:if test="${t.investigation eq '5864' && t.groupName eq '5644'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5864' && t.groupName eq '5644'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5864' && t.groupName eq '5644'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5864' && t.groupName eq '5644'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} <c:if test="${not empty t.lowNormal and not empty t.hiNormal}"> - </c:if>
                            ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach>  
            </td>
        </tr>
    </c:if>
</c:forEach> 


<!-- Creatinine Clearance Rate (CCR) -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '3937' && te.concept.conceptId eq '3937' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b>Creatinine Clearance Rate (CCR)</b> </td> </tr>	-->
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5882' && t.groupName eq '3937'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        Creatinine Clearance Rate (CCR)
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5882' && t.groupName eq '3937'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5882' && t.groupName eq '3937'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5882' && t.groupName eq '3937'}">
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
                    <c:if test="${t.investigation eq '5880' && t.groupName eq '3937'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5880' && t.groupName eq '3937'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5880' && t.groupName eq '3937'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5880' && t.groupName eq '3937'}">
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
                    <c:if test="${t.investigation eq '5881' && t.groupName eq '3937'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5881' && t.groupName eq '3937'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5881' && t.groupName eq '3937'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5881' && t.groupName eq '3937'}">
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
                    <c:if test="${t.investigation eq '3936' && t.groupName eq '3937'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3936' && t.groupName eq '3937'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3936' && t.groupName eq '3937'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3936' && t.groupName eq '3937'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} <c:if test="${not empty t.lowNormal and not empty t.hiNormal}"> - </c:if>
                            ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach>  
            </td>
        </tr>
    </c:if>
</c:forEach> 

<!-- Urinary Total Protein -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '4252' && te.concept.conceptId eq '4252' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b>Urinary Total Protein</b> </td> </tr>	-->
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5842' && t.groupName eq '4252'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5842' && t.groupName eq '4252'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5842' && t.groupName eq '4252'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5842' && t.groupName eq '4252'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3936' && t.groupName eq '4252'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3936' && t.groupName eq '4252'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3936' && t.groupName eq '4252'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3936' && t.groupName eq '4252'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal}  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>

    </c:if>
</c:forEach>

<!-- Urine for Ketone Bodies  -->

<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '5148' && te.concept.conceptId eq '5148' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr>	-->
        <tr>
            <td colspan="4"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5148' }">
                <u style="font-size:16px; font-weight:bold;"> Urine for Ketone Bodies :</u> <b> ${t.value} </b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                ( done by strip method and urine auto analyzer).
            </c:if>	 
        </c:forEach>
    </td> 
</tr>	
</c:if>
</c:forEach>

<!-- ANTI-NUCLEAR AB (ANA), Anti HAV-IgM, Anti HEV-IgM, Anti HBc, HBe Ag, Anti-HEV-IgG, Anti HAV, Anti HEV, Anti HBc-IgM -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '5216' && te.concept.conceptId eq '5216' }">
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6068' }">
                        &nbsp;&nbsp;
                        Anti-Nuclear Ab (ANA)
                    </c:if>	 
                </c:forEach>
            </td> 
            <td style="padding-left:5px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6068'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6068'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <0.9 : Negative <br/>
                0.9-1.1 : Borderline positive <br/>
                >1.1 : Positive 
            </td>	
        </tr>
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6069' }">
                        &nbsp;&nbsp;
                        ${t.testName}
                    </c:if>	 
                </c:forEach>
            </td> 
            <td style="padding-left:5px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6069'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6069'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6069'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                    </c:if>
                </c:forEach> 
            </td>	
        </tr>
    </c:if>

    <!-- Anti HAV-IgM -->

    <c:if test="${investigation eq '5216' && te.concept.conceptId eq '5728' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>Anti HAV - IgM</b> </td> </tr>	
        <tr>
            <td style="width:40%;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '5728'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '5728'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>

        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '5728'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '5728'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>

        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5728'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5728'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>

        </tr>
    </c:if>

    <!-- Anti HEV-IgM -->
    <c:if test="${investigation eq '5216' && te.concept.conceptId eq '5715' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>Anti HEV-IgM</b> </td> </tr>	
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '5715'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '5715'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>

        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '5715'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '5715'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>

        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5715'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5715'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>

        </tr>
    </c:if>

    <!-- Anti HBc -->

    <c:if test="${investigation eq '5216' && te.concept.conceptId eq '2614' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>Anti HBc</b> </td> </tr>	
        <tr>
            <td style="width:40%;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '2614'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '2614'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>

        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '2614'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '2614'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>

        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '2614'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '2614'}">
                        ${t.value}
                        <c:if test="${t.codedId eq '782'}"> ( &#60; Cut off rate ) </c:if>
                        <c:if test="${t.codedId eq '781'}"> ( &#62; Cut off rate ) </c:if>
                    </c:if>
                </c:forEach> 
            </td>

        </tr>
    </c:if>

    <!-- HBe Ag -->
    <c:if test="${investigation eq '5216' && te.concept.conceptId eq '5153' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>HBe Ag</b> </td> </tr>	
        <tr>
            <td style="width:40%;">   
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '5153'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '5153'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>

        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '5153'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '5153'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>

        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5153'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5153'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>

        </tr>
    </c:if>

    <!-- Anti HEV-IgG -->
    <c:if test="${investigation eq '5216' && te.concept.conceptId eq '6021' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>Anti HEV-IgG</b> </td> </tr>	
        <tr>
            <td style="width:40%;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '6021'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '6021'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>

        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '6021'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '6021'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>

        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '6021'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '6021'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>

        </tr>
    </c:if>

    <!-- Anti HAV -->

    <c:if test="${investigation eq '5216' && te.concept.conceptId eq '6020' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>Anti HAV </b> </td> </tr>	
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '6020'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '6020'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>

        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '6020'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '6020'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>

        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '6020'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '6020'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>

        </tr>
    </c:if>

    <!-- Anti HEV -->

    <c:if test="${investigation eq '5216' && te.concept.conceptId eq '5155' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>Anti HEV</b> </td> </tr>	
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '5155'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '5155'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>

        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '5155'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '5155'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>

        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5155'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5155'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>

        </tr>
    </c:if>

    <!-- Anti HBC-IgM -->

    <c:if test="${investigation eq '5216' && te.concept.conceptId eq '5714' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>Anti HBC-IgM</b> </td> </tr>	
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '5714'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '5714'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>

        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '5714'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '5714'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>

        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5714'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5714'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach>

<!-- beta - hCG -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '3092' && te.concept.conceptId eq '3092' }">
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3092' }">
                        &nbsp;&nbsp;&nbsp;   ${t.testName}
                    </c:if>	 
                </c:forEach>
            </td> 
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3092'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3092'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 10px;">
                Concentrations of &#946; - hCG Measured in the sera of healthy, non-pregant individuals were determined to be <5.00 mIU/ml.
            </td>	
        </tr>
        <br>
        <tr> 
            <td colspan="4" style="padding-left:50px;">   &#946; - hCG ranges during normal pregnancy are summarized as follows: </td>
        </tr>
        <tr> 
            <td colspan="2" style="padding-left:50px; line-height:20px;"><u> Weeks Post LMP </u> <br>
        3 - 4 weeks <br> 4 - 5 weeks <br> 5 - 6 weeks <br> 6 - 7 weeks <br> 7 - 12 weeks <br> 12 - 16 weeks <br> 
        16 - 29 weeks <br> (2nd Trimester) <br> 29 - 41 weeks <br> 3rd Trimester
    </td>	
    <td colspan="2" style="padding-left:5px; line-height:20px;"> <u> Approximate &#946; - hCG Range ( mIU/ml)  </u> <br>
    9 - 130 <br> 75 - 2,600 <br> 850 - 20,800  <br> 4,000 - 100,200 <br> 11,500 - 289,000 <br> 18,300 - 137,000 <br> 
    1,400 - 53,000 <br>  &nbsp; <br>  940 - 60,000  <br> &nbsp;
</td>
</tr>
</c:if>
</c:forEach>


<!-- HbA1c -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '5158' && te.concept.conceptId eq '5158' }">
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5158' }">
                        &nbsp;&nbsp;&nbsp;   ${t.testName}
                    </c:if>	 
                </c:forEach>
            </td> 
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5158'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5158'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5158'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                    </c:if>
                </c:forEach> 
            </td>	
        </tr>
    </c:if>
</c:forEach>


<!-- SEMEN ANALYSIS -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2413' && te.concept.conceptId eq '2413' }">

        <tr> <td colspan="4">&nbsp;&nbsp;<b>Physical Examination: </b> </td> </tr>	
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5921' && t.groupName eq '2413'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5921' && t.groupName eq '2413'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5921' && t.groupName eq '2413'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5921' && t.groupName eq '2413'}">
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
                    <c:if test="${t.investigation eq '5922' && t.groupName eq '2413'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td> 
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5922' && t.groupName eq '2413'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5922' && t.groupName eq '2413'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5922' && t.groupName eq '2413'}">
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
                    <c:if test="${t.investigation eq '5923' && t.groupName eq '2413'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5923' && t.groupName eq '2413'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5923' && t.groupName eq '2413'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5923' && t.groupName eq '2413'}">
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
                    <c:if test="${t.investigation eq '5924' && t.groupName eq '2413'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5924' && t.groupName eq '2413'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5924' && t.groupName eq '2413'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5924' && t.groupName eq '2413'}">
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
                    <c:if test="${t.investigation eq '4227' && t.groupName eq '2413'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4227' && t.groupName eq '2413'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4227' && t.groupName eq '2413'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4227' && t.groupName eq '2413'}">
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
                    <c:if test="${t.investigation eq '5925' && t.groupName eq '2413'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5925' && t.groupName eq '2413'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5925' && t.groupName eq '2413'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5925' && t.groupName eq '2413'}">
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
                    <c:if test="${t.investigation eq '5926' && t.groupName eq '2413'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5926' && t.groupName eq '2413'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5926' && t.groupName eq '2413'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5926' && t.groupName eq '2413'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} <c:if test="${not empty t.lowNormal and not empty t.hiNormal}"> - </c:if>
                            ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach>  
            </td>
        </tr>

        <tr> <td colspan="4">&nbsp;&nbsp;<b>Microscopic Examination: </b> </td> </tr>	
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5928' && t.groupName eq '2413'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5928' && t.groupName eq '2413'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5928' && t.groupName eq '2413'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5928' && t.groupName eq '2413'}">
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
                    <c:if test="${t.investigation eq '5929' && t.groupName eq '2413'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5929' && t.groupName eq '2413'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5929' && t.groupName eq '2413'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5929' && t.groupName eq '2413'}">
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
                    <c:if test="${t.investigation eq '2268' && t.groupName eq '2413'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2268' && t.groupName eq '2413'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2268' && t.groupName eq '2413'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2268' && t.groupName eq '2413'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} <c:if test="${not empty t.lowNormal and not empty t.hiNormal}"> - </c:if>
                            ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach>  
            </td>
        </tr>

        <tr> <td colspan="4">&nbsp;&nbsp;<b>Other's cells: </b> </td> </tr>	
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5931' && t.groupName eq '2413'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5931' && t.groupName eq '2413'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5931' && t.groupName eq '2413'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5931' && t.groupName eq '2413'}">
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
                    <c:if test="${t.investigation eq '5932' && t.groupName eq '2413'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5932' && t.groupName eq '2413'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5932' && t.groupName eq '2413'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5932' && t.groupName eq '2413'}">
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
                    <c:if test="${t.investigation eq '5879' && t.groupName eq '2413'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5879' && t.groupName eq '2413'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5879' && t.groupName eq '2413'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5879' && t.groupName eq '2413'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} <c:if test="${not empty t.lowNormal and not empty t.hiNormal}"> - </c:if>
                            ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach>  
            </td>
        </tr>
    </c:if>
</c:forEach> 

<!-- Febrile Antigens -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2400' && te.concept.conceptId eq '5219' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>Febrile Antigens</b> </td> </tr>	
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5967' && t.groupName eq '5219'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5967' && t.groupName eq '5219'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5967' && t.groupName eq '5219'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5967' && t.groupName eq '5219'}">
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
                    <c:if test="${t.investigation eq '4259' && t.groupName eq '5219'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4259' && t.groupName eq '5219'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4259' && t.groupName eq '5219'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4259' && t.groupName eq '5219'}">
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
                    <c:if test="${t.investigation eq '4260' && t.groupName eq '5219'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4260' && t.groupName eq '5219'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4260' && t.groupName eq '5219'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4260' && t.groupName eq '5219'}">
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
                    <c:if test="${t.investigation eq '5966' && t.groupName eq '5219'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5966' && t.groupName eq '5219'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5966' && t.groupName eq '5219'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5966' && t.groupName eq '5219'}">
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
                    <c:if test="${t.investigation eq '5969' && t.groupName eq '5219'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5969' && t.groupName eq '5219'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5969' && t.groupName eq '5219'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5969' && t.groupName eq '5219'}">
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
                    <c:if test="${t.investigation eq '5970' && t.groupName eq '5219'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5970' && t.groupName eq '5219'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5970' && t.groupName eq '5219'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5970' && t.groupName eq '5219'}">
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
                    <c:if test="${t.investigation eq '2385' && t.groupName eq '5219'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2385' && t.groupName eq '5219'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2385' && t.groupName eq '5219'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2385' && t.groupName eq '5219'}">
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
                    <c:if test="${t.investigation eq '2386' && t.groupName eq '5219'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2386' && t.groupName eq '5219'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2386' && t.groupName eq '5219'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2386' && t.groupName eq '5219'}">
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
                    <c:if test="${t.investigation eq '2387' && t.groupName eq '5219'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2387' && t.groupName eq '5219'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2387' && t.groupName eq '5219'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2387' && t.groupName eq '5219'}">
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
                    <c:if test="${t.investigation eq '5918' && t.groupName eq '5219'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5918' && t.groupName eq '5219'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5918' && t.groupName eq '5219'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5918' && t.groupName eq '5219'}">
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
                    <c:if test="${t.investigation eq '5919' && t.groupName eq '5219'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5919' && t.groupName eq '5219'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5919' && t.groupName eq '5219'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5919' && t.groupName eq '5219'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} <c:if test="${not empty t.lowNormal and not empty t.hiNormal}"> - </c:if>
                            ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach>  
            </td>
        </tr>
    </c:if>
</c:forEach> 



<!-- Triple Antigen -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '5708' && te.concept.conceptId eq '5708' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b style="font-size:16px;"><u>Triple Antigen:</u></b></td></tr>	
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5967' && t.groupName eq '5708'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        Widal Reaction:&nbsp; ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5967' && t.groupName eq '5708'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5967' && t.groupName eq '5708'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5967' && t.groupName eq '5708'}">
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
                    <c:if test="${t.investigation eq '4259' && t.groupName eq '5708'}">
                        &ensp;&ensp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4259' && t.groupName eq '5708'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4259' && t.groupName eq '5708'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4259' && t.groupName eq '5708'}">
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
                    <c:if test="${t.investigation eq '4260' && t.groupName eq '5708'}">
                        &ensp;&ensp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4260' && t.groupName eq '5708'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4260' && t.groupName eq '5708'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4260' && t.groupName eq '5708'}">
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
                    <c:if test="${t.investigation eq '5966' && t.groupName eq '5708'}">
                        &ensp;&ensp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5966' && t.groupName eq '5708'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5966' && t.groupName eq '5708'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5966' && t.groupName eq '5708'}">
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
                    <c:if test="${t.investigation eq '5969' && t.groupName eq '5708'}">
                        &ensp;&ensp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5969' && t.groupName eq '5708'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5969' && t.groupName eq '5708'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5969' && t.groupName eq '5708'}">
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
                    <c:if test="${t.investigation eq '5970' && t.groupName eq '5708'}">
                        &ensp;&ensp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5970' && t.groupName eq '5708'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5970' && t.groupName eq '5708'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5970' && t.groupName eq '5708'}">
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
                    <c:if test="${t.investigation eq '2385' && t.groupName eq '5708'}">
                        &ensp;&ensp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2385' && t.groupName eq '5708'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2385' && t.groupName eq '5708'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2385' && t.groupName eq '5708'}">
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
                    <c:if test="${t.investigation eq '2386' && t.groupName eq '5708'}">
                        &ensp;&ensp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2386' && t.groupName eq '5708'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2386' && t.groupName eq '5708'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2386' && t.groupName eq '5708'}">
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
                    <c:if test="${t.investigation eq '2387' && t.groupName eq '5708'}">
                        &ensp;&ensp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2387' && t.groupName eq '5708'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2387' && t.groupName eq '5708'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2387' && t.groupName eq '5708'}">
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
                    <c:if test="${t.investigation eq '5918' && t.groupName eq '5708'}">
                        &ensp;&ensp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                        <i> ${t.testName} </i>
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5918' && t.groupName eq '5708'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5918' && t.groupName eq '5708'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5918' && t.groupName eq '5708'}">
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
                    <c:if test="${t.investigation eq '5919' && t.groupName eq '5708'}">
                        &ensp;&ensp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                        <span style="font-style: italic;"> ${t.testName}  </span>
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5919' && t.groupName eq '5708'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5919' && t.groupName eq '5708'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5919' && t.groupName eq '5708'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} <c:if test="${not empty t.lowNormal and not empty t.hiNormal}"> - </c:if>
                            ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach>  
            </td>
        </tr>
    </c:if>
</c:forEach> 


<!-- IgG -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2400' && te.concept.conceptId eq '5310' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>IgG</b> </td> </tr>	 
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '5310'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '5310'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '5310'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '5310'}">
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
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '5310'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '5310'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '5310'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '5310'}">
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
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5310'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5310'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5310'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5310'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} <c:if test="${not empty t.lowNormal and not empty t.hiNormal}"> - </c:if>
                            ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach>  
            </td>
        </tr>

    </c:if>
</c:forEach>

<!-- IgM -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2400' && te.concept.conceptId eq '5311' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>IgM</b> </td> </tr>	 
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '5311'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '5311'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '5311'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '5311'}">
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
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '5311'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '5311'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '5311'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '5311'}">
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
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5311'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5311'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5311'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5311'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} <c:if test="${not empty t.lowNormal and not empty t.hiNormal}"> - </c:if>
                            ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach>  
            </td>
        </tr>
    </c:if>
</c:forEach>




<!-- HIV - 1&2 -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '3945' && te.concept.conceptId eq '5162' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>HIV - 1&2 </b> </td> </tr>	
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '5162'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '5162'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '5162'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '5162'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '5162'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '5162'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '5162'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '5162'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5162'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5162'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5162'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5162'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach>

<!-- Anti TG Ab -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2925' && te.concept.conceptId eq '5273' }">	
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5273' && t.groupName eq '5273'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5273' && t.groupName eq '5273'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5273' && t.groupName eq '5273'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5273' && t.groupName eq '5273'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>     
</c:forEach>

<!-- Anti TPO Ab -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2925' && te.concept.conceptId eq '5274' }">
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5274' && t.groupName eq '5274'}">
                        &nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5274' && t.groupName eq '5274'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5274' && t.groupName eq '5274'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5274' && t.groupName eq '5274'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>     
</c:forEach>
        
<!-- Anti Thyroid Ab -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2925' && te.concept.conceptId eq '2925' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>Anti Thyroid Ab</b></td> </tr>	
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5273' && t.groupName eq '2925'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5273' && t.groupName eq '2925'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5273' && t.groupName eq '2925'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5273' && t.groupName eq '2925'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5274' && t.groupName eq '2925'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5274' && t.groupName eq '2925'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5274' && t.groupName eq '2925'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5274' && t.groupName eq '2925'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>

    </c:if>
    <!-- Urine Microalbumin -->
    <c:if test="${investigation eq '5213' && te.concept.conceptId eq '5213' }">
        <tr> <td colspan="4">&nbsp;&nbsp; </td> </tr>	
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5213' && t.groupName eq '5213'}">
                        &nbsp;&nbsp; ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5213' && t.groupName eq '5213'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5213' && t.groupName eq '5213'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5213' && t.groupName eq '5213'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>

    <!-- Anti CCP-Ab -->
    <c:if test="${investigation eq '5254' && te.concept.conceptId eq '5254' }">
        <tr> <td colspan="4">&nbsp;&nbsp; </td> </tr>	
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5254' && t.groupName eq '5254'}">
                        &nbsp;&nbsp; ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5254' && t.groupName eq '5254'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5254' && t.groupName eq '5254'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5254' && t.groupName eq '5254'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>     
</c:forEach>

<c:forEach items="${te}" var="te">
    <!-- Spot Urine Protein Creatinine Ratio -->

    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '6022' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>Spot Urine Protein Creatinine Ratio</b> </td> </tr>	
        <tr>
            <td style="width:40%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5963' && t.groupName eq '6022'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5963' && t.groupName eq '6022'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5963' && t.groupName eq '6022'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5963' && t.groupName eq '6022'}">
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
                    <c:if test="${t.investigation eq '5881' && t.groupName eq '6022'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5881' && t.groupName eq '6022'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5881' && t.groupName eq '6022'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5881' && t.groupName eq '6022'}">
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
                    <c:if test="${t.investigation eq '5849' && t.groupName eq '6022'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5849' && t.groupName eq '6022'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5849' && t.groupName eq '6022'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5849' && t.groupName eq '6022'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} <c:if test="${not empty t.lowNormal and not empty t.hiNormal}"> - </c:if>
                            ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach>  
            </td>
        </tr>
    </c:if>

    <!-- Spot Urine Calcium Creatinine Ratio -->
    <c:if test="${investigation eq '2311' && te.concept.conceptId eq '5207' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>Spot Urine Calcium Creatinine Ratio</b> </td> </tr>	
        <tr>
            <td style="width:40%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6023' && t.groupName eq '5207'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6023' && t.groupName eq '5207'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6023' && t.groupName eq '5207'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6023' && t.groupName eq '5207'}">
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
                    <c:if test="${t.investigation eq '5881' && t.groupName eq '5207'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5881' && t.groupName eq '5207'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5881' && t.groupName eq '5207'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5881' && t.groupName eq '5207'}">
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
                    <c:if test="${t.investigation eq '5849' && t.groupName eq '5207'}">
                        &nbsp;&nbsp; &emsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="left" style="padding-left:5px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5849' && t.groupName eq '5207'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5849' && t.groupName eq '5207'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5849' && t.groupName eq '5207'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} <c:if test="${not empty t.lowNormal and not empty t.hiNormal}"> - </c:if>
                            ${t.hiNormal} </c:if>
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