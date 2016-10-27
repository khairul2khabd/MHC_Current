<%-- 
    Document   : billOrder
    Created on : Oct 20, 2015, 12:30:21 PM
    Author     : khairul
    Page       : Bill Order
--%>
<%@ include file="/WEB-INF/template/include.jsp"%>
<%@ include file="/WEB-INF/template/header.jsp"%>
<%@ include file="../includes/js_css.jsp"%>


<form class="kha-aero">
    <h1>Bill Order</h1>

    <div style="float:left; width:800px; padding:0px 0px 0px 10px;">
        <fieldset class="fieldset1">
            <legend  style="padding: 0.1em 0.5em;  border:1px solid green;  color:green;  font-size:18px; text-align:right;"> Patient Information</legend> 
            <table style="width:100%;">
                <tr> 
                    <td>Patient Name :   <span style="font-weight:bold; font-size:16px; color:blue;">
                            ${patient.givenName} ${patient.middleName} ${patient.familyName}</span> <td>

                    <td>Patient ID : <span style="font-weight:bold; font-size:16px; color:blue;">
                            ${patientSearch.identifier} </span> <td>
                </tr>
                <tr> <td>Patient Age :<b> ${age} </b> <td>
                    <td colspan="3">Phone Number : <b>${phone}</b> <td> </tr> 
                <tr>
                    <td>Gender : <c:if test="${patient.gender eq 'M'}"> <b> Male </b> </c:if> 
                        <c:if test="${patient.gender eq 'F'}"> <b> Female </b> </c:if>
                        </td>
                        <td>
                        <c:if test="${not empty add.address1}">
                        <td colspan="2">Patient Address : <b> ${add.address1},  ${add.cityVillage}, ${add.countyDistrict} </b> <td>
                        </c:if>
                </tr>
            </table>
        </fieldset>
    </div>
    <div style="float:left;  padding:0px 0px 0px 10px;">
        <fieldset class="fieldset2">
            <legend  style="padding: 0.0em 0.5em;  border:1px solid green;  color:green;  font-size:18px; text-align:right;"> Others Information</legend> 
            <table style="width:95%;">
                <tr> 
                    <td>Referred Dr : <span style="font-weight:bold; font-size:14px;"> ${docInfo.doctorName} </span> 

                        <c:if test="${docInfo.doctorName eq null}"> <input placeholder="Please Select Doctor Id"   id="docId" name="docId" class="bof"/> </c:if>
                        </td>

                    </tr>  
                    <tr> 
                        <td>Market By : <b> ${marInfo.name}</b> 
                        <c:if test="${docInfo.doctorName eq null}"> <input placeholder="Please Select Market Id"  id="docId" name="docId" class="bof"/> </c:if>
                        </td>
                    </tr>
                    <tr> 
                    <c:if test="${docInfo.doctorName ne null}">
                        <td>Order Id: <span style="font-weight:bold; font-size:20px; color:red;"> ${orderId} </span> </td> </c:if>
                    </tr> 
                </table>
            </fieldset>
        </div>
    </form>

    <script type="text/javascript">
        $(document).ready(function() {
            $("#price1").val("");

            /*
             var refDocId = $("#refDocId").val();
             var refMarId = $("#refMarId").val();
             var orderId = $("#orderId").val();
             if (refDocId == "") {
             $("#refDocId").val("0");
             }
             if (refMarId == "") {
             $("#refMarId").val("0");
             }
             if (orderId == "") {
             $("#orderId").val("0");
             }
             */

            $("input").focus(function() {
                $(this).css("background-color", "#0101DF");
                $(this).css("font-size", "16px");
                $(this).css("color", "#fff");
                $(this).css("border-radius", "3px");
            });
            $("input").blur(function() {
                $(this).css("background-color", "#F7F778");
                $(this).css("color", "#000");
            });
        })

        function updatePrice() {
            var sum = 0;
            var numbers = $("#selectedTestId").text().match(/\d+/g);
            if (numbers)
            {
                $.each(numbers, function() {
                    sum += parseInt(this);
                });
            }
            $("#price1").val(sum + ".00");
        }

    </script>


    <input type="hidden" id="pageId" value="billOrderPage" />
    <form class="kha-aero1" method="post" action="billService.form" id="billOrderForm">
        <input type="hidden" id="patientId" name="patientId" value="${patient.id}"/>
    <input type="hidden" id="refDocId" name="refDocId" value="${refDocId}"/>
    <input type="hidden" id="refMarId" name="refMarId" value="${refMarId}"/>
    <input type="hidden" id="orderId" name="orderId" value="${orderId}"/>
    <input type="hidden" id="refRmpId" name="refRmpId" value="${refRmpId}"/>

    <h1>Bill Details</h1>
    <b>&nbsp;&nbsp;&nbsp;&nbsp; Service Name : </b>
    <input style="width:500px; height:40px; padding:0px 0px 0px 6px; border-radius:4px 3px; font-size:16px;" 
           type="text" id="serName" name="serName" placeholder="Please type Id / Service Name" ondblclick="this.value = '';" />
    <table>
        <thead>
            <tr>
                <th width="400px;" rowspan="2" style="text-align:center;">Service Name </th> 
            </tr>
        </thead>
        <tr>
            <td>
                <div style="overflow:hidden; display:inline-block; line-height: 200%; " >
                    <select id="selectedTestId"    name="selectedTestId"  style="width:1100px;  
                            height: 150%; overflow:hidden; background-color: transparent; padding:10px; 
                            margin:-5px -30px -5px -5px; scrolling:no; font-size:18px; " size="10" multiple="multiple" 
                            onchange="updatePrice();"
                            ondblclick="moveSelectedById('selectedTestId', 'availableInvestigationList')"> </select>
                </div>
            </td> 		 
        </tr>
        <tr>
            <td  align="left"><b>Total Price :</b>&nbsp;&nbsp;  
                <input type="text" id="price1" style="text-align:center; font-size:16px; width:150px;"  onclick="updatePrice();"/></td>
        </tr>
    </table>
    <div style="position: absolute; left:40%;">
        <input type="submit" class="bu" value="Submit" onclick="BILLING.submitBillOrder();">
    </div>
</form>