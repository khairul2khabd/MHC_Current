<%-- 
    Document   : oth
    Created on : Feb 10, 2016, 3:45:06 PM
    Author     : Khairul
--%>
<!-- Per Page Print -->

<!-- URINE ROUTINE EXAMINATION -->

<c:forEach items="${te}" var="te">   
    <c:if test="${investigation eq '2415' && te.concept.conceptId eq '2415' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>PHYSICAL EXAMINATION</b> </td> </tr>	
        <tr style="font-size:13px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4640' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4640' && t.groupName eq '2415'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4640' && t.groupName eq '2415'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4640' && t.groupName eq '2415'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr style="font-size:13px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4647' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        Colour  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4647' && t.groupName eq '2415'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4647' && t.groupName eq '2415'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4647' && t.groupName eq '2415'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr style="font-size:13px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4649' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        Appearance  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4649' && t.groupName eq '2415'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4649' && t.groupName eq '2415'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4649' && t.groupName eq '2415'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr style="font-size:13px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4650' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        Sediment  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4650' && t.groupName eq '2415'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4650' && t.groupName eq '2415'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4650' && t.groupName eq '2415'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr style="font-size:13px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2654' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        Specific Gravity  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="2"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2654' && t.groupName eq '2415'}">
                        ${t.value}  (Shown in urine auto analyzer)
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2654' && t.groupName eq '2415'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <!-- CHEMICAL EXAMINATION -->
        <tr style="font-size:12px; line-height:10px;"> <td colspan="4">&nbsp;&nbsp;<b>CHEMICAL EXAMINATION</b> </td> </tr>	
        <tr style="font-size:13px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5983' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="2"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5983' && t.groupName eq '2415'}">
                        ${t.value}  (Shown in urine auto analyzer)
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5983' && t.groupName eq '2415'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr style="font-size:13px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5984' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        Protein 
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5984' && t.groupName eq '2415'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5984' && t.groupName eq '2415'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5984' && t.groupName eq '2415'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr style="font-size:13px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5987' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5987' && t.groupName eq '2415'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5987' && t.groupName eq '2415'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5987' && t.groupName eq '2415'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr style="font-size:13px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4232' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4232' && t.groupName eq '2415'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4232' && t.groupName eq '2415'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4232' && t.groupName eq '2415'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr style="font-size:13px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2550' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2550' && t.groupName eq '2415'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2550' && t.groupName eq '2415'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2550' && t.groupName eq '2415'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr style="font-size:13px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5988' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5988' && t.groupName eq '2415'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5988' && t.groupName eq '2415'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5988' && t.groupName eq '2415'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr style="font-size:13px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5989' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5989' && t.groupName eq '2415'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5989' && t.groupName eq '2415'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5989' && t.groupName eq '2415'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr style="font-size:13px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2659' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2659' && t.groupName eq '2415'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2659' && t.groupName eq '2415'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2659' && t.groupName eq '2415'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <!-- MICROSCOPIC EXAMINATION -->
        <tr style="font-size:12px; line-height:10px;"> <td colspan="4">&nbsp;&nbsp;<b>MICROSCOPIC EXAMINATION</b> </td> </tr>	
        <tr style="font-size:13px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5932' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5932' && t.groupName eq '2415'}">
                        ${t.value} /HPF 
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5932' && t.groupName eq '2415'}">
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5932' && t.groupName eq '2415'}">
                        <c:if test="${not empty t.refRange}">  </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr style="font-size:13px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5931' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5931' && t.groupName eq '2415'}">
                        ${t.value} /HPF 
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5931' && t.groupName eq '2415'}">
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5931' && t.groupName eq '2415'}">
                        <c:if test="${not empty t.refRange}">   </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr style="font-size:13px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5876' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5876' && t.groupName eq '2415'}">
                        ${t.value} 
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5876' && t.groupName eq '2415'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5876' && t.groupName eq '2415'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr style="font-size:13px; line-height:10px;">
            <td>
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2728' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  (Cellular/Granular/Hyaline)
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2728' && t.groupName eq '2415'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2728' && t.groupName eq '2415'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2728' && t.groupName eq '2415'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr style="font-size:13px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2729' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        Crystals (Urate/Sulphonamied)
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2729' && t.groupName eq '2415'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2729' && t.groupName eq '2415'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2729' && t.groupName eq '2415'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr style="font-size:13px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5991' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5991' && t.groupName eq '2415'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5991' && t.groupName eq '2415'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5991' && t.groupName eq '2415'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr style="font-size:13px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '622' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '622' && t.groupName eq '2415'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '622' && t.groupName eq '2415'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '622' && t.groupName eq '2415'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr style="font-size:13px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5992' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5992' && t.groupName eq '2415'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5992' && t.groupName eq '2415'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5992' && t.groupName eq '2415'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr style="font-size:13px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5993' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5993' && t.groupName eq '2415'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5993' && t.groupName eq '2415'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5993' && t.groupName eq '2415'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr style="font-size:13px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '1854' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '1854' && t.groupName eq '2415'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '1854' && t.groupName eq '2415'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '1854' && t.groupName eq '2415'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>

                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr style="font-size:13px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5994' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5994' && t.groupName eq '2415'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5994' && t.groupName eq '2415'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5994' && t.groupName eq '2415'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach>

<!-- STOOL ROUTINE EXAMINATION -->

<c:forEach items="${te}" var="te">   
    <c:if test="${investigation eq '3117' && te.concept.conceptId eq '3117' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>PHYSICAL EXAMINATION</b> </td> </tr>	
        <tr style="font-size:14px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6009' && t.groupName eq '3117'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        Consistency  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6009' && t.groupName eq '3117'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
        </tr>

        <tr style="font-size:14px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6007' && t.groupName eq '3117'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        Colour  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6007' && t.groupName eq '3117'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
        </tr>

        <tr style="font-size:14px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4233' && t.groupName eq '3117'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}   
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4233' && t.groupName eq '3117'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
        </tr>

        <tr style="font-size:14px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6008' && t.groupName eq '3117'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}   
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6008' && t.groupName eq '3117'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
        </tr>

        <!-- CHEMICAL EXAMINATION -->
        <tr style="font-size:12px; line-height:10px;"> <td colspan="4">&nbsp;&nbsp;<b>CHEMICAL EXAMINATION</b> </td> </tr>	
        <tr style="font-size:14px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4230' && t.groupName eq '3117'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}   
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4230' && t.groupName eq '3117'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
        </tr>

        <tr style="font-size:14px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6010' && t.groupName eq '3117'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}   
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6010' && t.groupName eq '3117'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
        </tr>

        <tr style="font-size:14px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6011' && t.groupName eq '3117'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}   
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6011' && t.groupName eq '3117'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
        </tr>

        <!-- MICROBIOLOGY EXAMINATION -->
        <tr style="font-size:12px; line-height:10px;"> <td colspan="4">&nbsp;&nbsp;<b>MICROSCOPIC EXAMINATION</b> </td> </tr>	
        <tr style="font-size:14px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3908' && t.groupName eq '3117'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}   
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3908' && t.groupName eq '3117'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr style="font-size:14px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '620' && t.groupName eq '3117'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}   
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '620' && t.groupName eq '3117'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr style="font-size:14px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5932' && t.groupName eq '3117'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}   
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5932' && t.groupName eq '3117'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr style="font-size:14px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5931' && t.groupName eq '3117'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}   
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5931' && t.groupName eq '3117'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr style="font-size:14px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5876' && t.groupName eq '3117'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}   
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5876' && t.groupName eq '3117'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr style="font-size:14px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6012' && t.groupName eq '3117'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}   
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6012' && t.groupName eq '3117'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr style="font-size:14px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3906' && t.groupName eq '3117'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}   
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3906' && t.groupName eq '3117'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr style="font-size:14px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3903' && t.groupName eq '3117'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}   
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3903' && t.groupName eq '3117'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr style="font-size:14px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3905' && t.groupName eq '3117'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}   
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3905' && t.groupName eq '3117'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr style="font-size:14px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3904' && t.groupName eq '3117'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}   
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3904' && t.groupName eq '3117'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr style="font-size:14px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '613' && t.groupName eq '3117'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}   
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '613' && t.groupName eq '3117'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr style="font-size:14px; line-height:10px;">
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3907' && t.groupName eq '3117'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}   
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3907' && t.groupName eq '3117'}">
                        ${t.value}  
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

<!-- ANTI-NUCLEAR AB (ANA) -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '5216' && te.concept.conceptId eq '5216' }">
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5216' }">
                        &nbsp;&nbsp;&nbsp;   ${t.testName}
                    </c:if>	 
                </c:forEach>
            </td> 
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5216'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5216'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5216'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
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
