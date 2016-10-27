<%-- 
    Document   : addedit
    Created on : Nov 12, 2015, 1:46:46 PM
    Author     : khairul
--%>

<%@ include file="/WEB-INF/template/include.jsp"%> 
<%@ include file="/WEB-INF/template/headerMinimal.jsp"%>
<%@ include file="../includes/js_css.jsp"%> 

<script type="text/javascript">
    $(document).ready(function() {
        $("input").focus(function() {
            $(this).css("background-color", "#0101DF");
            $(this).css("font-size", "16px");
            $(this).css("color", "#fff");
        });
        $("input").blur(function() {
            $(this).css("background-color", "#F7F778");
            $(this).css("color", "#000");
        });
    })

</script>

<input type="hidden" id="pageId" value="billEditPage" />
<form class="kha-aero2" method="post" action="serviceUpdate.htm" id="billEditForm">

    <input type="hidden" id="patientId" name="patientId" value="${patientId}"/>
    <input type="hidden" id="refDocId" name="refDocId" value="${refDocId}"/>
    <input type="hidden" id="refMarId" name="refMarId" value="${refMarId}"/>
    <input type="hidden" id="orderId" name="orderId" value="${orderId}"/>
    <input type="hidden" id="encounterId" name="encounterId" value="${encounterId}"/>

    <h1>Bill Details</h1> 
    <b>&nbsp;&nbsp;&nbsp;&nbsp; Service Name : </b>
    <input style="width:500px; height:40px; padding:0px 0px 0px 6px; border-radius:4px 3px; font-size:16px;" 
           type="text" id="addName" name="addName" placeholder="Please type Id / Service Name" ondblclick="this.value = '';" />

    <table>
        <thead>
            <tr>
                <th width="400px;" rowspan="2" style="text-align:center;">Service Name </th> 
                <th width="400px;"  style="text-align:center;">Action </th> 
            </tr>
        </thead>

        <c:forEach items="${dbo}" var="d"> 
            <tr>
                <td>   ${d.serviceName}   </td> 
                <td> <a href="removeSer.htm?&id=${d.id}&patientId=${patientId}&orderId=${orderId}"><input type="button" class="bu" value="Remove" /> </a>					 
                </td>
            </tr> 
        </c:forEach>

        <tr>	 
            <td>
                <div style="overflow:hidden; display:inline-block; line-height: 200%; " >
                    <select id="selectedTestDetails"    name="selectedTestDetails"  style="width:600px;  
                            height: 150%; overflow:hidden; background-color: transparent; padding:10px; 
                            margin:-5px -30px -5px -5px; scrolling:no; font-size:18px; " size="10" multiple="multiple"   
                            ondblclick="moveSelectedById('selectedTestDetails', 'availableInvestigationList')"> 

                    </select>
                </div>
            </td> 			 
        </tr>
    </table>
    <div style="position: absolute; left:40%;">
        <input type="submit" class="bu" value="Submit" onclick="BILLING.submitBillEditForm();">
    </div>
</form>