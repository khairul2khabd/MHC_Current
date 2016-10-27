<%-- 
    Document   : hae
    Created on : May 20, 2016, 1:35:51 PM
    Author     : Rakib
--%>

<!--T3-->

<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '3945' && te.concept.conceptId eq '5245' }">
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5245' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5245' }">
                        &nbsp;&nbsp; 
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
            <td style="padding-left:20px;">  
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
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5246' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5246' }">
                        &nbsp;&nbsp; 
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
            <td style="padding-left:20px;">  
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
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5245' && t.groupName eq '5247'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
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
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
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
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
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
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2509' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2509' }">
                        &nbsp;&nbsp; 
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
            <td style="padding-left:20px;">  
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
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2510' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2510' }">
                        &nbsp;&nbsp; 
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
            <td style="padding-left:20px;">  
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
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4278' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '4278' }">
                        &nbsp;&nbsp; 
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
            <td style="padding-left:20px;">  
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
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2568' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2568' }">
                        &nbsp;&nbsp; 
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
            <td style="padding-left:20px;">  
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
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2569' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2569' }">
                        &nbsp;&nbsp; 
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
            <td style="padding-left:20px;">  
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
        <!--  <tr> <td colspan="4">&nbsp;&nbsp;<b> Urine for Ketone Bodies </b> </td> </tr> -->
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5151' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5151' }">
                        &nbsp;&nbsp; 
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5151' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
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
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2571' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2571' }">
                        &nbsp;&nbsp; 
                        ${t.value}
                    </c:if> 
                </c:forEach>
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2571' }">
                        ${t.unit}
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
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
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5257' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5257' }">
                        &nbsp;&nbsp; 
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
            <td style="padding-left:20px;">  
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
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5851' && t.groupName eq '5152'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
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
            <td align="left">  
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
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
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
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
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
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2938' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2938' }">
                        &nbsp;&nbsp; 
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
            <td style="padding-left:20px;">  
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
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3135' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '3135' }">
                        &nbsp;&nbsp; 
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
            <td style="padding-left:20px;">  
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
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2939' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2939' }">
                        &nbsp;&nbsp; 
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
            <td style="padding-left:20px;">  
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
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2944' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2944' }">
                        &nbsp;&nbsp; 
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
            <td style="padding-left:20px;">  
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
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '764' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '764' }">
                        &nbsp;&nbsp; 
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
            <td style="padding-left:20px;">  
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
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5157' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5157' }">
                        &nbsp;&nbsp; 
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
            <td style="padding-left:20px;">  
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
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2617' }">
                        &nbsp;&nbsp;   
                        ${t.testName}
                    </c:if>  
                </c:forEach>
            </td> 

            <td style="width:50%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2617' }">
                        &nbsp;&nbsp; 
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
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2617' }">
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
