<%-- 
    Document   : printBill
    Created on : Nov 11, 2015, 2:17:26 PM
    Author     : khairul
--%>
<%@ include file="/WEB-INF/template/include.jsp"%>
<%@ include file="/WEB-INF/template/header.jsp"%>
<%@ include file="../includes/js_css.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<br>
<form method="POST" action="billprint.htm" id="billPrint">
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
        <!-- View Bill -->
        <table width="60%" class="kha" style="margin-left: 60px;">
            <tr>
                <td><strong>Patient ID :</strong> &nbsp;<span style="font-size:18px; font-weight:bold;">
                        ${patientSearch.identifier} </span>

                    <img src="${pageContext.request.contextPath}/barcode/${patient.patientId}.png" /> 

                </td>
                <td><strong>Date :</strong> &nbsp; <fmt:formatDate value="${dpsb.createdDate}" pattern="dd-MM-yyyy HH:mm:ss" />
                    <!-- <input type="text" style="border:none; font-size:13px;" value="${dpsb.createdDate}"  /> --> 
                </td> 
            </tr>
            <tr> 
                <td><strong>Patient Name :</strong> &nbsp;
                    <span style="font-size:15px; font-weight:bold;"> ${patient.givenName}&nbsp;&nbsp;${patient.middleName}&nbsp;&nbsp;
                        ${patient.familyName} </span></td>
                <td><strong> Age :</strong> &nbsp;&nbsp;&nbsp;&nbsp;${age}</td>
            </tr>
            <tr>
                <td colspan="1">Phone Number : <b>${phone}</b> </td>   
                <td>Gender : <c:if test="${patient.gender eq 'M'}"> <b> Male </b> </c:if> 
                    <c:if test="${patient.gender eq 'F'}"> <b> Female </b> </c:if>
                    </td>
                </tr>
            <c:if test="${not empty add.address1}">
                <tr>
                    <td colspan="2">Patient Address : <b> ${add.address1},  ${add.cityVillage}, ${add.countyDistrict} </b> </td>
                </tr> 
            </c:if>	
            <tr> 
                <td><span style="font-size:14px; font-weight:bold;"> Referred Dr :   ${docInfo.doctorName}, ${docInfo.degree}  </span> </td>
                <td>Bill Id: <span style="font-weight:bold; font-size:18px; color:red;"> ${billId} </span> 
                    <img src="${pageContext.request.contextPath}/barcode/${billId}.png" /> 
                </td>
            </tr>
<!--            <tr> 
                <td><span style="font-size:14px; font-weight:bold;"> Referred Dr :   ${docInfo.doctorName}  </span> </td>
                <td>Bill Id: <span style="font-weight:bold; font-size:18px; color:red;"> ${billId} </span> 
                    <img src="${pageContext.request.contextPath}/barcode/${billId}.png" /> 
                </td>
            </tr>-->
        </table>
        <table width="60%"  class="kha" style="margin-left: 60px;">
            <tr >
                <td style="text-align: center; background:#cdc;"><span class="span">S.No</span></td>
                <td style="text-align: center; background:#cdc;"><span class="span">Service Name</span> </td>
                <td style="text-align: center; background:#cdc;"><span class="span">Quantity</span> </td>
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
                    <td align="left">${sol.name}</td>
                    <td align="left">${sol.quantity} </td>
                    <td align="right"><input type="text" style="width:150px; font-size:14px; text-align: right;  border: 0px solid #ccc; background:none;"
                                             id="${index.count}unitprice" name="${index.count}unitprice"
                                             size="7" value="${sol.amount}" class="unitPri" readOnly="true"></td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="3" align="right" ><span style="font-size:16px; font-weight:bold; ">Total Bill :</span> </td>
                <td align="right"> <span style="font-size:16px; font-weight:bold;"> ${dpsb.actualAmount}</span> 
                </td>
            </tr>
        </table>
        <style>
            table.k {
                font-family:arial;
                background-color: #CDCDCD;
                margin:0 0pt 15px 150px;
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
        <input type="hidden" id="total" />
        <!-- Bill status -->
        <label style="float:left; margin-left:60px;  width:560px;">
            <br>
            <span class="printfont" >Total Paid :  &nbsp; ${paid}.00</span>  <br>
            <br>
            <input type="text" value="${dpsb.billingStatus}"
                   style="border:1px solid; height:40px; font-size:20px; width:100px; border-radius:20px; text-align:center;" /> <br><br>
            <span class="printfont" >Received with thanks : &nbsp;</span><span id="totalValue1" class="printfont1"> </span><span class="printfont1"> Taka only </span><br><br>
            <span class="printfont" >Delivery : &nbsp; <%= request.getParameter("dDate")%></span> 
            <span class="printfont" > &nbsp; <%= request.getParameter("dTime")%></span>
            <br><br>
        </label>
        <!-- Bill summary -->
        <label style="float:left; width:500px; margin-top:-15px;">
            <table  class="k" style="margin-left: -15px; background-color: #CDCDCD;">

                <c:if test="${dpsb.discountAmount > '0' }">
                    <tr>
                        <td  align="right"><b> Discount : &nbsp;</b></td>
                        <td    style="width:60px;"> <input type="text" id=" " name=" " style="width:160px; border:none; text-align:right; font-size:16px;" 
                                                           value="${dpsb.discountAmount}" readOnly="true"  /></td>
                    </tr>
                    <tr>
                        <td align="right"><b> Payable : &nbsp;</b></td>
                        <td  style="width:60px;"> <input type="text" id=" " name=" " style="width:160px; border:none; text-align:right; font-size:16px;" 
                                                         value="${dpsb.amount}" readOnly="true"  /></td>
                    </tr>
                </c:if>
                <tr>
                    <td align="right"><b> Advanced paid : &nbsp;</b></td>
                    <td  style="width:60px;"> <input type="text" id=" " name=" " style="width:160px; border:none; text-align:right; font-size:16px;" 
                                                     value="${paid}.00" readOnly="true"  /></td>
                </tr>
                <tr>
                    <td align="right"><b> Due : &nbsp;</b></td>
                    <td  style="width:60px;"> <input type="text" id=" " name=" " style="width:160px; border:none; text-align:right; font-size:16px;" 
                                                     value="${dpsb.dueAmount}" readOnly="true"  /></td>
                </tr>
            </table>
            <br>
            <span class="printfont" style="margin-left:60px;" > Bill Officer : ${billOfficer.givenName}   ${billOfficer.familyName} </span> <br><br>
            <input type="submit" class="bu" value="Print" onClick="printDiv3();"  /> &nbsp;&nbsp;&nbsp; 
            <input type="button" class="bu" value="Barcode Print" onClick="barDivPrint();"  />	<br> <br>
        </label>
    </div>
    

    <div id="barDiv"  style="width: 200px; height:80px; display:none; margin-top:10px;  ">  

        <c:forEach var="sol" items="${tmt}" varStatus="index">    
            <c:if test="${not empty sol.name}">
      <!--  <img src="${pageContext.request.contextPath}/barcode/${patient.patientId}.png" /> --><b> ${patientSearch.identifier} </b> <br> 
                <b style="font-size:11px;"><label id="bartestname"> ${sol.name} </label> </b> <br><br> 
            </c:if>

            <c:if test="${not empty sol.name1}">
   <!--  <img src="${pageContext.request.contextPath}/barcode/${patient.patientId}.png" /> --><b> ${patientSearch.identifier} </b> <br> 
                <b style="font-size:11px;"><label id="bartestname"> ${sol.name1} </label> </b> <br><br> 
            </c:if>

            <c:if test="${not empty sol.name2}">
    <!--  <img src="${pageContext.request.contextPath}/barcode/${patient.patientId}.png" /> --><b> ${patientSearch.identifier} </b> <br> 
                <b style="font-size:11px;"><label id="bartestname"> ${sol.name2} </label> </b> <br><br> 
            </c:if>

            <c:if test="${not empty sol.name3}">
    <!--  <img src="${pageContext.request.contextPath}/barcode/${patient.patientId}.png" /> --><b> ${patientSearch.identifier} </b> <br> 
                <b style="font-size:11px;"><label id="bartestname"> ${sol.name3} </label> </b> <br><br> 
            </c:if>
        </c:forEach>



    </div>
</form> 

<script>
    function barDivPrint() {
        var printer = window.open('left=50', 'top=50', 'width=200,height=100');
        printer.document.open("text/html");
        printer.document.write(document.getElementById('barDiv').innerHTML);
        printer.print();
        printer.document.close();
        printer.window.close();
    }

</script> 

<!-- Print Bill -->
<!-- Print Div -->

<div id="printDiv" class="hidden"
     style="width: 1280px; font-size: 0.8em; padding-top:500px; ">
    <style>
        .hidden{
            display: none;
            padding:500px 0 0 0;

        }
        .span{
            color:blue;	
            font-size:16px;
            font-weight:bold;	
        }
        .span1{
            color:black;	
            font-size:16px;
            font-weight:bold;	
        }
        table.kha1 {
            font-family:arial;
            background-color: #CDCDCD;
            margin:10px 0pt 15px 150px;
            font-size: 14px;
            width: 73%;
            text-align: left;
        }
        table.kha1 tbody td {
            color: #3D3D3D;
            padding: 4px;
            background-color: #FFF;
            vertical-align: top;
        }  
        table.kha1 tbody tr.odd td {
            background-color:#F0F0F6;
        }
    </style>
    <br>
    <br><br><br>
    <br><br>
    <br>
    <div style="position:absolute; left:280px;"> <input type="text" value="RECEIPT" 
                                                        style="border: 2px solid #ccc; font-size:18px; text-align:center;" /></div><br>
    <table class="kha1" style="margin-left: 0px;">
        <tr>
            <td><span style="font-size:13px;">Patient ID :</span> &nbsp;<span style="font-size:18px; font-weight:bold;">
                    ${patientSearch.identifier} </span>  

                <img src="${pageContext.request.contextPath}/barcode/${patient.patientId}.png" /> 
            </td>
            <td><strong>Date :</strong> &nbsp; <fmt:formatDate value="${dpsb.createdDate}" pattern="dd-MM-yyyy HH:mm:ss" />
                    <!-- <input type="text" style="border:none; font-size:13px;" value="${dpsb.createdDate}"  /> --> 
            </td>
        </tr>
        <tr> 
            <td><span style="font-size:14px;">Patient Name :</span> &nbsp;
                <span style="font-size:15px; font-weight:bold;"> ${patient.givenName}&nbsp;&nbsp;${patient.middleName}&nbsp;&nbsp;
                    ${patient.familyName} </span></td>
            <td><span style="font-size:14px;"> Age : &nbsp;&nbsp;&nbsp;&nbsp;${age} </span></td>
        </tr>
        <tr>
            <td colspan="1"><span style="font-size:14px;">Phone Number : </span> <b>${phone}</b> </td>   
            <td>Gender : <c:if test="${patient.gender eq 'M'}"> <b> Male </b> </c:if> 
                <c:if test="${patient.gender eq 'F'}"> <b> Female </b> </c:if>
                </td>
            </tr>
        <c:if test="${not empty add.address1}">
            <tr>
                <td colspan="2">Patient Address : <b> ${add.address1},  ${add.cityVillage}, ${add.countyDistrict} </b> </td>
            </tr> 
        </c:if>	
        <tr> 
            <td><span style="font-size:14px; font-weight:bold;"> Referred Dr :   ${docInfo.doctorName}  </span> </td>
            <td><span style="font-size:14px;"> Bill Id: </span><span style="font-weight:bold; font-size:18px; color:red;"> ${billId} </span>
                <img src="${pageContext.request.contextPath}/barcode/${billId}.png" /> 
            </td>
        </tr>
    </table>
    <!--Service Info -->

    <table class="kha1" style="margin-left: 0px;">
        <tr >
            <td style="text-align: center; background:#fff;"><span class="span1">S.No</span></td>
            <td style="text-align: center; background:#fff;"><span class="span1">Service Name</span> </td>
            <!-- <th style="text-align: center;">Unit</th> -->
            <td style="text-align: center; background:#fff;"><span class="span1">Rate</span></td>
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
            <tr class="${klass_}" id="">
                <td align="center">${index.count}</td>
                <td align="left"> ${sol.name}
                    <!-- <input type="text" style="width:380px; border:none; font-size:14px;"
                            id="${index.count}service" name="${index.count}service"
                            value="${sol.name}" readOnly="true"> -->
                </td>
                <td align="right"><input type="text" style="width:150px; font-size:14px; text-align: right;  border: none;"
                                         id="${index.count}unitprice" name="${index.count}unitprice"
                                         size="7" value="${sol.amount}" class="unitPri" readOnly="true"></td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="2" align="right" ><span style="font-size:16px; font-weight:bold; ">Total Bill :</span> </td>
            <td align="right"> <span style="font-size:16px; font-weight:bold;">${dpsb.actualAmount} </span>   </td>
        </tr>
    </table>
    <br>
    <style>
        table.k1 {
            font-family:arial;
            background-color: #CDCDCD;
            margin:0px 0pt 15px 10px;
            font-size: 14px;
            width: 65%;
            text-align: left;
        }
        table.k1 tbody td {
            color: #3D3D3D;
            padding: 4px;
            background-color: #FFF;
            vertical-align: top;
        }
        table.k1 tbody tr.odd td {
            background-color:#F0F0F6;
        }
        .printfont1 {
            font-family: "Dot Matrix Normal", Arial, Helvetica, sans-serif;
            font-style: normal;
            font-size: 16px;
            text-transform: uppercase;
        }

    </style>

    <input type="hidden" id="total" />
    <label style="float:left; margin-left:10px;  width:300px;">
        <span class="printfont" ><b style="font-size:16px;">Total Paid :  &nbsp; ${paid}.00</b></span><br> <br><br>
        <input type="text" value="${dpsb.billingStatus}"
               style="border:1px solid; height:40px; font-size:20px; width:100px; border-radius:20px; text-align:center;" /> <br><br>
        <span class="printfont" >Received with thanks : &nbsp;</span><span id="totalValue2" class="printfont1"> </span> <span class="printfont1">Taka only</span>  <br><br>
        <span class="printfont" >Delivery  : &nbsp; <%= request.getParameter("dDate")%></span>
        <span class="printfont" > &nbsp; <%= request.getParameter("dTime")%></span> <br><br><br><br>
        <span class="printfont" style="margin-left:-10px;" >&nbsp; Bill Officer : ${billOfficer.givenName}   ${billOfficer.familyName} </span>
    </label>

    <label style="float:left; width:460px;">
        <table  class="k1" style="margin-top: -35px; margin-left:45px; background-color: #CDCDCD;">

            <c:if test="${dpsb.discountAmount > '0' }">
                <tr>
                    <td  align="right"><b> Less Amount : &nbsp;</b></td>
                    <td  align="right"  > <input type="text" id=" " name=" " style="width:150px; border:none; text-align:right;font-size: 16px;" value="${dpsb.discountAmount}" readOnly="true"  /></td>
                </tr>
                <tr>
                    <td align="right"><b> Payable : &nbsp;</b></td>
                    <td align="right" style="width:60px;"> <input type="text" id=" " name=" " style="width:100px; border:none; text-align:right; font-size: 16px;" value="${dpsb.amount}" readOnly="true"  /></td>
                </tr>
            </c:if>
            <tr>
                <td align="right"><b> Advanced paid : &nbsp;</b></td>
                <td align="right" style="width:60px;"> <input type="text" id="paid" name="paid" style="width:100px; border:none; text-align:right;font-size: 16px;" value="${paid}.00" readOnly="true"  /></td>
            </tr>
            <tr>
                <td align="right"><b> Due : &nbsp;</b></td>
                <td align="right" style="width:60px;"> <input type="text" id=" " name=" " style="width:100px; border:none; text-align:right;font-size: 16px;" value="${dpsb.dueAmount}" readOnly="true"  /></td>
            </tr>
        </table>
        <br>
    </label>
    <script>
        function printDiv3() {
            var printer = window.open('left=0', 'top=0', 'width=300,height=300');
            printer.document.open("text/html");
            printer.document.write(document.getElementById('printDiv').innerHTML);
            printer.print();
            printer.document.close();
            printer.window.close();
            jQuery("#billPrint").submit();
            // window.location = "directbillingqueue.form";
        }
        jQuery(document).ready(function() {
            jQuery('#dDate').datepicker({yearRange: 'c-30:c+30', dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true});
            var paid = $('#paid').val();
            $('#total').val(paid);
            jQuery("#totalValue1").html(toWords(jQuery("#total").val()));
            jQuery("#totalValue2").html(toWords(jQuery("#total").val()));

            bartestname


        });

        function back() {
            window.location = "directbillingqueue.form";
        }
    </script>
</div>


