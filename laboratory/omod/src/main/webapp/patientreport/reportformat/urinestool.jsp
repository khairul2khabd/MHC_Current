<%-- 
    Document   : urinestool
    Created on : Nov 15, 2016, 12:24:30 PM
    Author     : Khairul
--%>

<style type="text/css">
    tr.top td { border-top: thin solid black; border-right: thin solid black; }
    tr.bottom td { border-bottom: thin solid black; border-left: thin solid black; }

</style>

<!-- URINE ROUTINE EXAMINATION -->

<c:forEach items="${te}" var="te">   
    <c:if test="${investigation eq '2415' && te.concept.conceptId eq '2415' }">
        <tr class="top bottom"> <td colspan="4">&nbsp;&nbsp;<b>PHYSICAL EXAMINATION</b> </td> </tr>	
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1" style="width:50%"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4640' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4640' && t.groupName eq '2415'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4647' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        Colour  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4647' && t.groupName eq '2415'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>

        </tr>
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4649' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        Appearance  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4649' && t.groupName eq '2415'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>

        </tr>
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4650' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        Sediment  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4650' && t.groupName eq '2415'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>

        </tr>
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2654' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        Specific Gravity  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2654' && t.groupName eq '2415'}">
                        ${t.value}
                    </c:if>
                </c:forEach> 
            </td>

        </tr>
        <tr> <td colspan="4" style="line-height:2px;">&nbsp; </td> </tr>
        <!-- CHEMICAL EXAMINATION -->
        <tr style="font-size:12px; line-height:10px;" class="top bottom"> <td colspan="4">&nbsp;&nbsp;<b>CHEMICAL EXAMINATION</b> </td> </tr>	
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1">
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
                        ${t.value}
                    </c:if>
                </c:forEach> 
            </td>

        </tr>
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1">
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

        </tr>
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1">
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

        </tr>
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1">
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

        </tr>
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1">
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

        </tr>
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1"> 
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

        </tr>
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1">
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

        </tr>
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1">
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

        </tr>
        <tr> <td colspan="4" style="line-height:2px;">&nbsp; </td> </tr>
        <!-- MICROSCOPIC EXAMINATION -->
        <tr style="font-size:12px; line-height:10px;" class="top bottom"> <td colspan="4">&nbsp;&nbsp;<b>MICROSCOPIC EXAMINATION</b> </td> </tr>	
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5932' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5932' && t.groupName eq '2415'}">
                        ${t.value}
                    </c:if>
                </c:forEach> 
            </td>

        </tr>
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5931' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5931' && t.groupName eq '2415'}">
                        ${t.value}
                    </c:if>
                </c:forEach> 
            </td>

        </tr>
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5876' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5876' && t.groupName eq '2415'}">
                        ${t.value} 
                    </c:if>
                </c:forEach> 
            </td>

        </tr>
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2728' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  (Cellular/Granular/Hyaline)
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2728' && t.groupName eq '2415'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>

        </tr>
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2729' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        Crystals (Urate/Sulphonamied)
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2729' && t.groupName eq '2415'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>

        </tr>
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5991' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5991' && t.groupName eq '2415'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>

        </tr>
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '622' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '622' && t.groupName eq '2415'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>

        </tr>
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5992' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5992' && t.groupName eq '2415'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>

        </tr>
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5993' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5993' && t.groupName eq '2415'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>

        </tr>
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '1854' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '1854' && t.groupName eq '2415'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>

        </tr>
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4234' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4234' && t.groupName eq '2415'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '623' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '623' && t.groupName eq '2415'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5994' && t.groupName eq '2415'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5994' && t.groupName eq '2415'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach>

<!-- STOOL ROUTINE EXAMINATION -->

<c:forEach items="${te}" var="te">   
    <c:if test="${investigation eq '3117' && te.concept.conceptId eq '3117' }">
        <tr class="top bottom"> <td colspan="4">&nbsp;&nbsp;<b>PHYSICAL EXAMINATION</b> </td> </tr>	
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1" style="width:50%"> 
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

        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1"> 
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

        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1"> 
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

        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1"> 
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

        <tr> <td colspan="4" style="line-height:10px;">&nbsp; </td> </tr>
        <!-- CHEMICAL EXAMINATION -->
        <tr style="font-size:12px; line-height:10px;" class="top bottom"> <td colspan="4">&nbsp;&nbsp;<b>CHEMICAL EXAMINATION</b> </td> </tr> 		
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4230' && t.groupName eq '3117'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}   
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="2"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4230' && t.groupName eq '3117'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
        </tr>

        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6010' && t.groupName eq '3117'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}   
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="2"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6010' && t.groupName eq '3117'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
        </tr>

        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6011' && t.groupName eq '3117'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}   
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="2"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6011' && t.groupName eq '3117'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr> <td colspan="4" style="line-height:10px;">&nbsp; </td> </tr>
        <!-- MICROBIOLOGY EXAMINATION -->
        <tr style="font-size:12px; line-height:10px;" class="top bottom"> <td colspan="4">&nbsp;&nbsp;<b>MICROSCOPIC EXAMINATION</b> </td> </tr> 		
        <tr style="font-size:13px; line-height:10px;" class="top bottom">

            <td colspan="1"> 
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
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1"> 
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
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1"> 
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
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1"> 
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
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1"> 
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
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1"> 
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
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1"> 
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
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1"> 
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
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1"> 
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
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1"> 
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
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1"> 
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
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6063' && t.groupName eq '3117'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}   
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '6063' && t.groupName eq '3117'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '623' && t.groupName eq '3117'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}   
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;" colspan="3"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '623' && t.groupName eq '3117'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr style="font-size:13px; line-height:10px;" class="top bottom">
            <td colspan="1"> 
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