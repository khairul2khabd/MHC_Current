<%-- 
    Document   : printBill
    Created on : Nov 11, 2015, 2:17:26 PM
    Author     : khairul
--%>
<%@ include file="/WEB-INF/template/include.jsp"%>
<%@ include file="/WEB-INF/template/header.jsp"%>
<%@ include file="../includes/js_css.jsp"%>
<br> dddd
<form method="get" action="directbillingqueue.form" id="billPrint">
    <input type="hidden" id="patientId" name="patientId" value="${patient.id}" />
    <input type="hidden" id="billId" name="billId" value="${billId}" />
    <div style="width: 1280px; font-size: 0.8em">
        <style>
            table.kha {
                font-family:arial;
                background-color: #CDCDCD;
                margin:10px 0pt 15px 150px;
                font-size: 8pt;
                width: 70%;
                text-align: left;
            }
            table.kha tbody td {
                color: #3D3D3D;
                padding: 4px;
                background-color: #FFF;
                vertical-align: top;
            }
            table.kha tbody tr.odd td {
                background-color:#F0F0F6;
            }
            .printfont {
                font-family: "Dot Matrix Normal", Arial, Helvetica, sans-serif;
                font-style: normal;
                font-size: 16px;
            }
        </style>
        <table width="60%" class="kha" style="margin-left: 60px;">
            <tr>
                <td><strong>Patient ID :</strong> &nbsp;<span style="font-size:14px; font-weight:bold;">
                        ${patient.patientIdentifier} </span></td>
                <td><strong>Date :</strong> &nbsp;<input type="text" style="border:none; font-size:13px;" value="${dpsb.createdDate}"  /></td>
            </tr>
            <tr>
                <td><strong>Patient Name :</strong> &nbsp;
                    <span style="font-size:15px; font-weight:bold;"> ${patient.givenName}&nbsp;&nbsp;${patient.middleName}&nbsp;&nbsp;
                        ${patient.familyName} </span></td>
                <td><strong> Age :</strong> &nbsp;&nbsp;&nbsp;&nbsp;${age}</td>
            </tr>
            <tr>
                <td colspan="1">Phone Number : <b>${phone}</b> </td>   
                <td>Gender : <b> ${patient.gender} </b> </td>
            </tr>
            <c:if test="${not empty add.address1}">
                <tr>
                    <td colspan="2">Patient Address : <b> ${add.address1},  ${add.cityVillage}, ${add.countyDistrict} </b> </td>
                </tr> 
            </c:if>	
            <tr> 
                <td><span style="font-size:14px; font-weight:bold;"> Referred Dr :   ${docInfo.doctorName}  </span> </td>
                <td>Bill Id: <span style="font-weight:bold; font-size:18px; color:red;"> ${billId} </span> </td>
            </tr>
        </table>
        <table width="60%"  class="kha" style="margin-left: 60px;">
            <tr >
                <td style="text-align: center; background:#cdc;"><span class="span">S.No</span></td>
                <td style="text-align: center; background:#cdc;"><span class="span">Service Name</span> </td>
                <!-- <th style="text-align: center;">Unit</th> -->
                <td style="text-align: center; background:#cdc;"><span class="span">Rate</span></td>
            </tr>
            <c:forEach var="sol" items="${diaBillItemList}" varStatus="index">
                <c:choose>
                    <c:when test="${index.count mod 2 == 0}">
                        <c:set var="klass" value="odd" />
                    </c:when>
                    <c:otherwise>
                        <c:set var="klass" value="even" />
                    </c:otherwise>
                </c:choose>
                <tr class="${klass}" id="">
                    <td align="center">${index.count}</td>
                    <td align="left">
                        <input type="text" style="width:600px; border:none; font-size:14px;" id="service" name="service"
                               value="${sol.name}" readOnly="true">
                    </td>


                    <td align="right">
                        <input type="text" id="unitprice" name="unitprice" class="normaltext" style="width:150px; "
                               size="10" value="${sol.unitPrice}" class="unitPri" readOnly="true">
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="2" align="right" ><span style="font-size:16px; font-weight:bold; ">Total Bill :</span> </td>
                <td align="right" > <span style="font-size:16px; font-weight:bold;">TK</span>
                    <input type="text" id="totalBill" name="totalBill" value="${dpsb.amount}"  readOnly="true" onclick="alert('This Field Read Only!!!!');"
                           style="width:100px; text-align:right;  color:blue;  font-size:18px; font-weight:bold; "/>
                </td>
            </tr>
        </table>
        <br>
        <style>
            table.k {
                font-family:arial;
                background-color: #CDCDCD;
                margin:10px 0pt 15px 150px;
                font-size: 10pt;
                width: 70%;
                text-align: left;
            }
            table.k tbody td {
                color: #3D3D3D;
                padding: 4px;
                background-color: #FFF;
                vertical-align: top;
            }
            table.k tbody tr.odd td {
                background-color:#F0F0F6;
            }
            .bu{
                padding: 6px 15px 6px 18px;
                background: #3EB1DD;
                border: none;
                color: #08088A;
                border-radius:4px;
                box-shadow: 1px 1px 1px #4C6E91;
                -webkit-box-shadow: 1px 1px 1px #4C6E91;
                -moz-box-shadow: 1px 1px 1px #4C6E91;
                text-shadow: 3px 1px 5px #ffffff;
                font-size:14px;
                font-weight:bold;
                cursor:pointer;
            }
            .bu:hover{
                background: white;
                color:green;
                text-shadow: 3px 1px 5px 4px #F7FE2E;
                box-shadow: 0px 5px 5px 5px #4C6;
                font-weight:bold;}

        </style>
        <label style="float:left; width:450px;">
            <table  class="k" style="margin-left: 60px; background-color: #CDCDCD;">
                <tr>
                    <td style=" background-color: #FFF;"   align="right"><b> Total Bill : &nbsp;</b></td>
                    <td   style="width:60px;"> <input type="text" id="BillAmount" name="BillAmount" style="width:160px; border:none; text-align:right;" value="${dpsb.amount}" readOnly="true"  /></td>
                </tr>
                <tr>
                    <td  align="right"><b> Discount : &nbsp;</b></td>
                    <td    style="width:60px;"> <input type="text" id=" " name=" " style="width:160px; border:none; text-align:right;" value="0.00" readOnly="true"  /></td>
                </tr>
                <tr>
                    <td align="right"><b> Payable : &nbsp;</b></td>
                    <td  style="width:60px;"> <input type="text" id=" " name=" " style="width:160px; border:none; text-align:right;" value="${dpsb.dueAmount}" readOnly="true"  /></td>
                </tr>
                <tr>
                    <td align="right"><b> Cash paid : &nbsp;</b></td>
                    <td  style="width:60px;"> <input type="text" id=" " name=" " style="width:160px; border:none; text-align:right;" value="${paid}.00" readOnly="true"  /></td>
                </tr>
                <tr>
                    <td align="right"><b> Due : &nbsp;</b></td>
                    <td  style="width:60px;"> <input type="text" id=" " name=" " style="width:160px; border:none; text-align:right;" value="${dpsb.dueAmount}" readOnly="true"  /></td>
                </tr>
                <!--
<tr>
    <td align="right"><b> Due Paid : &nbsp;</b></td>
    <td  style="width:60px;"> <input type="text" id=" " name=" " style="width:160px; border:none; text-align:right;" value=" " readOnly="true"  /></td>
</tr> -->
            </table>
            <br><br>
            <span class="printfont" style="margin-left:60px;" > Bill Officer : ${billOfficer.givenName}   ${billOfficer.familyName} </span>  
        </label>
        <input type="hidden" id="total" />
        <label style="float:left; margin-left:-25px;  width:560px;">
            <table style="width:65%" class="k"> 
                <tr>
                    <th><b>Sl.No</b></th>
                    <th><b> Bill Collect Id </b></th>
                    <th><b>Date</b> </th>
                    <th><b> Paid </b> </th>
                </tr>
                <c:forEach var="bList" items="${diaBillICollectList}" varStatus="index">
                    <tr>
                        <td>${index.count}</td>
                        <td style=" background-color: #FFF;" > ${bList.billCollectId} </td>
                        <td><openmrs:formatDate date="${bList.createdDate}" /></td>
                        <td align="right">${bList.paidAmount} </td>
                    </tr>
                </c:forEach>

            </table>
            <br>

            <input type="text" value="${dpsb.billingStatus}"
                   style="border:1px solid; height:40px; font-size:20px; width:100px; border-radius:20px; text-align:center;" /> <br><br>

            <span class="printfont" >Received with thanks : &nbsp;</span><span id="totalValue1" class="printfont1"> </span> <span class="printfont1"> Taka only </span> <br><br>

            <input type="submit" class="bu" value="Print" onClick="printDiv2();"  /> <br>

        </label>

    </div>
</form>

<!-- Print Div -->
<div id="printDiv" class="hidden"
     style="width: 1280px; font-size: 0.8em">
    <style>
        .hidden{
            display: none;
        }
        .span{
            color:blue;	
            font-size:16px;
            font-weight:bold;	
        }
        table.kha {
            font-family:arial;
            background-color: #CDCDCD;
            margin:10px 0pt 15px 150px;
            font-size: 8pt;
            width: 70%;
            text-align: left;
        }
        table.kha tbody td {
            color: #3D3D3D;
            padding: 4px;
            background-color: #FFF;
            vertical-align: top;
        }
        table.kha tbody tr.odd td {
            background-color:#F0F0F6;
        }
    </style>
    <table width="60%" class="kha" style="margin-left: 60px;">
        <tr>
            <td><span style="font-size:13px;">Patient ID :</span> &nbsp;<span style="font-size:14px; font-weight:bold;">
                    ${patient.patientIdentifier} </span></td>
            <td><strong>Date :</strong> &nbsp;<input type="text" style="border:none; font-size:13px;" value="${dpsb.createdDate}"  /></td>
        </tr>
        <tr>
            <td><span style="font-size:13px;">Patient Name :</span> &nbsp;
                <span style="font-size:15px; font-weight:bold;"> ${patient.givenName}&nbsp;&nbsp;${patient.middleName}&nbsp;&nbsp;
                    ${patient.familyName} </span></td>
            <td><span style="font-size:13px;"> Age : &nbsp;&nbsp;&nbsp;&nbsp;${age} </span></td>
        </tr>
        <tr>
            <td colspan="1"><span style="font-size:13px;">Phone Number : </span> <b>${phone}</b> </td>   
            <td>Gender : <b> ${patient.gender} </b> </td>
        </tr>
        <c:if test="${not empty add.address1}">
            <tr>
                <td colspan="2">Patient Address : <b> ${add.address1},  ${add.cityVillage}, ${add.countyDistrict} </b> </td>
            </tr> 
        </c:if>	
        <tr> 
            <td><span style="font-size:14px; font-weight:bold;"> Referred Dr :   ${docInfo.doctorName}  </span> </td>
            <td><span style="font-size:13px;"> Bill Id: </span><span style="font-weight:bold; font-size:18px; color:red;"> ${billId} </span> </td>
        </tr>

    </table>
    <table width="60%"  class="kha" style="margin-left: 60px;">
        <tr >
            <td style="text-align: center; background:#cdc;"><span class="span">S.No</span></td>
            <td style="text-align: center; background:#cdc;"><span class="span">Service Name</span> </td>
            <!-- <th style="text-align: center;">Unit</th> -->
            <td style="text-align: center; background:#cdc;"><span class="span">Rate</span></td>
        </tr>
        <c:forEach var="sol" items="${diaBillItemList}" varStatus="index">
            <c:choose>
                <c:when test="${index.count mod 2 == 0}">
                    <c:set var="klass" value="odd" />
                </c:when>
                <c:otherwise>
                    <c:set var="klass" value="even" />
                </c:otherwise>
            </c:choose>
            <tr class="${klass}" id="">
                <td align="center">${index.count}</td>
                <td align="left">
                    <input type="text" style="width:600px; border:none; font-size:14px;" id="service" name="service"
                           value="${sol.name}" readOnly="true">
                </td>


                <td align="right">
                    <input type="text" id="unitprice" name="unitprice" class="normaltext" style="width:150px;"
                           size="10" value="${sol.unitPrice}" class="unitPri" readOnly="true">
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="2" align="right" ><span style="font-size:16px; font-weight:bold; ">Total Bill :</span> </td>
            <td align="right"><span style="font-size:16px; font-weight:bold;">TK &nbsp;</span><input type="text" id="totalBill" name="totalBill" value="${dpsb.amount}"  readOnly="true" onclick="alert('This Field Read Only!!!!');"
                                                                                                     style="width:100px; text-align:center;  color:blue;  font-size:18px; font-weight:bold; "/>
            </td>
        </tr>
    </table>
    <br>
    <style>
        table.k {
            font-family:arial;
            background-color: #CDCDCD;
            margin:10px 0pt 15px 150px;
            font-size: 10pt;
            width: 70%;
            text-align: left;
        }
        table.k tbody td {
            color: #3D3D3D;
            padding: 4px;
            background-color: #FFF;
            vertical-align: top;
        }
        table.k tbody tr.odd td {
            background-color:#F0F0F6;
        }
        .printfont1 {
            font-family: "Dot Matrix Normal", Arial, Helvetica, sans-serif;
            font-style: normal;
            font-size: 16px;
            text-transform: uppercase;
        }

    </style>
    <label style="float:left; width:450px;">
        <table  class="k" style="margin-left: 60px; background-color: #CDCDCD;">
            <tr>
                <td style=" background-color: #FFF;"   align="right"><b> Total Bill : &nbsp;</b></td>
                <td   style="width:60px;"> <input type="text" id="BillAmount" name="BillAmount" style="width:160px; border:none; text-align:right;" value="${dpsb.amount}" readOnly="true"  /></td>
            </tr>
            <tr>
                <td  align="right"><b> Discount : &nbsp;</b></td>
                <td    style="width:60px;"> <input type="text" id=" " name=" " style="width:160px; border:none; text-align:right;" value="0.00" readOnly="true"  /></td>
            </tr>
            <tr>
                <td align="right"><b> Payable : &nbsp;</b></td>
                <td  style="width:60px;"> <input type="text" id=" " name=" " style="width:160px; border:none; text-align:right;" value="${dpsb.actualAmount}" readOnly="true"  /></td>
            </tr>
            <tr>
                <td align="right"><b> Cash paid : &nbsp;</b></td>
                <td  style="width:60px;"> <input type="text" id="paid" name="paid" style="width:160px; border:none; text-align:right;" value="${paid}.00" readOnly="true"  /></td>
            </tr>
            <tr>
                <td align="right"><b> Due : &nbsp;</b></td>
                <td  style="width:60px;"> <input type="text" id=" " name=" " style="width:160px; border:none; text-align:right;" value="${dpsb.dueAmount}" readOnly="true"  /></td>
            </tr>
            <!--
<tr>
    <td align="right"><b> Due Paid : &nbsp;</b></td>
    <td  style="width:60px;"> <input type="text" id=" " name=" " style="width:160px; border:none; text-align:right;" value=" " readOnly="true"  /></td>
</tr> -->
        </table>
        <br><br>
        <span class="printfont" style="margin-left:60px;" > Bill Officer : ${billOfficer.givenName}   ${billOfficer.familyName} </span>
    </label>
    <input type="hidden" id="total" />
    <label style="float:left; margin-left:-20px;  width:560px;">
        <table style="width:65%" class="k">
            <tr>
                <th><b>Sl.No</b></th>
                <th><b> Bill Collect Id </b></th>
                <th><b>Date</b> </th>
                <th><b> Paid </b> </th>
            </tr>
            <c:forEach var="bList" items="${diaBillICollectList}" varStatus="index">
                <tr>
                    <td>${index.count}</td>
                    <td style=" background-color: #FFF;" > ${bList.billCollectId} </td>
                    <td><openmrs:formatDate date="${bList.createdDate}" /></td>
                    <td align="right">${bList.paidAmount} </td>
                </tr>
            </c:forEach>
        </table>
        <br>
        <input type="text" value="${dpsb.billingStatus}"
               style="border:1px solid; height:40px; font-size:20px; width:100px; border-radius:20px; text-align:center;" /> <br><br>
        <span class="printfont" >Received with thanks : &nbsp;</span><span id="totalValue2" class="printfont1"> </span><span class="printfont1"> Taka only </span> <br><br>


    </label>
    <script>
        function printDiv2() {

            var printer = window.open('left=0', 'top=0', 'width=300,height=300');
            printer.document.open("text/html");
            printer.document.write(document.getElementById('printDiv').innerHTML);
            printer.print();
            printer.document.close();
            printer.window.close();
            //jQuery("#billPrint").submit();
            window.location = "directbillingqueue.form";
        }
        jQuery(document).ready(function() {
            var paid = $('#paid').val();
            $('#total').val(paid);
            jQuery("#totalValue1").html(toWords(jQuery("#total").val()));
            jQuery("#totalValue2").html(toWords(jQuery("#total").val()));
        });

        function back() {
            window.location = "directbillingqueue.form";
        }
    </script>

</div>


