<%-- 
    Document   : hae
    Created on : Feb 10, 2016, 1:35:51 PM
    Author     : Khairul
--%>

<!-- DEPARTMENT OF CLINICAL IMMUNOLOGY -->

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

<!-- Anti HBc -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '3945' && te.concept.conceptId eq '2614' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>Anti HBc</b> </td> </tr>	
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '2614'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '2614'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '2614'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '2614'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>

                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '2614'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '2614'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '2614'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '2614'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>

                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '2614'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '2614'}">
                        ${t.value}
                        <c:if test="${t.codedId eq '782'}"> ( &#60; Cut off rate ) </c:if>
                        <c:if test="${t.codedId eq '781'}"> ( &#62; Cut off rate ) </c:if>
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '2614'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '2614'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>

                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach>

<!-- Anti HBC-IgM -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '3945' && te.concept.conceptId eq '5714' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>Anti HBC-IgM</b> </td> </tr>	
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '5714'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '5714'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '5714'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '5714'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '5714'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '5714'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '5714'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '5714'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5714'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5714'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5714'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5714'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach>

<!-- Anti HEV -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '3945' && te.concept.conceptId eq '5155' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>Anti HEV</b> </td> </tr>	
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '5155'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '5155'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '5155'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '5155'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '5155'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '5155'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '5155'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '5155'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5155'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5155'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5155'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5155'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach>

<!-- Anti HEV-IgM -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '3945' && te.concept.conceptId eq '5715' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>Anti HEV-IgM</b> </td> </tr>	
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '5715'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '5715'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '5715'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '5715'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '5715'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '5715'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '5715'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '5715'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5715'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5715'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5715'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5715'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach>

<!-- Anti HAV - IgM -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '3945' && te.concept.conceptId eq '5728' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>Anti HAV - IgM</b> </td> </tr>	
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '5728'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '5728'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '5728'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5845' && t.groupName eq '5728'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '5728'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '5728'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '5728'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5846' && t.groupName eq '5728'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5728'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5728'}">
                        ${t.value}  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:20px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5728'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:10px; font-size: 11px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5847' && t.groupName eq '5728'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
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
            <td style="padding-left:20px;"> 
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
            <td style="padding-left:20px;"> 
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
            <td style="padding-left:20px;"> 
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

<!-- Anti Thyroid Ab -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '3945' && te.concept.conceptId eq '2925' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>Anti Thyroid Ab</b></td> </tr>	
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5273' && t.groupName eq '2925'}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
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
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:20px;"> 
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
</c:forEach>




