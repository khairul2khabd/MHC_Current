<%-- 
    Document   : serviceBill
    Created on : Nov 16, 2015, 11:18:41 PM
    Author     : khairul
--%>

<%@ include file="/WEB-INF/template/include.jsp"%>
<%@ include file="/WEB-INF/template/header.jsp"%>
<%@ include file="../includes/js_css.jsp"%>

<script type="text/javascript"
src="${pageContext.request.contextPath}/moduleResources/billing/scripts/jquery/jquery.PrintArea.js"></script>

<script>
    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;
        return true;
    }
</script>

<script type="text/javascript">
    jQuery(document).ready(function() {

        //jQuery('#BillAmount').val("23445"); 
        jQuery('#dDate').datepicker({yearRange: 'c-30:c+30', dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true});


    });
</script>

<script type="text/javascript">
    function updatePrice(incon) {
        var con = incon.toString();
        var serqunid = con.concat("servicequantity");
        var serpriid = con.concat("serviceprice");
        var unipriid = con.concat("unitprice");
        serqun = jQuery("#" + serqunid).val();
        unpri = jQuery("#" + unipriid).val();
        jQuery("#" + serpriid).val(serqun * unpri);
    }
    function discountamountcal(incon)
    {
        var discount = incon.value;
        var billAmount = $('#BillAmount').val();
        var discountamount = (discount * billAmount / 100);
        $('#discountamount').val(discountamount);
        $('#netamount').val(billAmount - discountamount);
//$('#payableamount').val(billAmount-discountamount);	
    }
    function dueamountcal(incon)
    {
        var netamount = $('#netamount').val();
        var paidamount = incon.value;
        var payableamount = $('#payableamount').val();
        $('#payableamount').val(netamount - paidamount);
        $('#dueamount').val(netamount - paidamount);
        $('#total').val(paidamount);
        jQuery("#totalValue2").html(toWords(jQuery("#total").val()));
    }
    function showMe(it, box) {
        var vis = (box.checked) ? "block" : "none";
        document.getElementById(it).style.display = vis;
    }
</script>

<script type="text/javascript">
    function validate(serviceOrderSize) {
        for (var i = 1; i <= serviceOrderSize; i++)
        {
            var netamount = $('#netamount').val();
            var paidamount = $('#paidamount').val();
            var payableamount = $('#payableamount').val();
            var dueamount = $('dueamount').val();
            var con = i.toString();
            // if (paidamount > netamount || paidamount!="" || paidamount!= null || paidamount<0)
            if (paidamount > netamount)
            {
                alert("Cash Amount has to Getherthen Net Amount!!!");
                $('.casPaid').val("0");
                $('#payableamount').val("0");
                $('#dueamount').val("0");
                return false;
            }
            if (paidamount == 0)
            {
                alert("Cash Amount Not Valid!!!");
                $('.casPaid').val("0");
                $('#payableamount').val("0");
                $('#dueamount').val("0");
                return false;
            }
            if (jQuery("#" + con + "selectservice").attr('checked')) {
                var serqunid = con.concat("servicequantity");
                serqun = jQuery("#" + serqunid).val();
                if (serqun == null || serqun == "")
                {
                    alert("Please enter quantity");
                    return false;
                }
                if (serqun != null || quantity != "") {
                    if (isNaN(serqun)) {
                        alert("Please enter quantity in correct format");
                        return false;
                    }
                }
            }

        }
        document.getElementById('savebill').disabled = true;
    }
</script>

<input type="hidden" id="pageId" value="billOrderDetailsPage" />

<form id="billDetailsForm" action="dueCollect.htm"  class="kha-new" method="POST"  onsubmit="javascript:return validate(${serviceOrderSize});">
    <h1>Due Bill Details</h1>
    <input type="hidden" id="patientId" name="patientId" value="<%= request.getParameter("patientId")%>" />
    <input type="hidden" id="billId" name="billId"  value="${dpsb.billId}" />
    <input type="hidden" id="refDocId" name="refDocId"  value="${dpsb.refDocId}" />
    <input type="hidden" id="rmpId" name="rmpId"  value="${dpsb.refRmpId}" />
    <input type="hidden" id="indCount" name="indCount" value="${diaBillItemListSize}" />

    <table style="width:80%; margin:10px 0pt 15px 150px;">
        <tr> 
            <td>Patient Name :   <span style="font-weight:bold; font-size:16px; color:blue;">
                    ${patient.givenName} ${patient.middleName} ${patient.familyName}</span> </td>
            <td>Patient ID : <span style="font-weight:bold; font-size:16px; color:blue;">
                    ${patientSearch.identifier} </span> </td>
            <td>Patient Age :<b> ${age} </b> </td>
        </tr>
        <tr> 
            <td colspan="1">Phone Number : <b>${phone}</b> </td>
            <td>Gender : <c:if test="${patient.gender eq 'M'}"> <b> Male </b> </c:if> 
                <c:if test="${patient.gender eq 'F'}"> <b> Female </b> </c:if>
                </td>
            <c:if test="${not empty add.address1}">
                <td colspan="2">Patient Address : <b> ${add.address1},  ${add.cityVillage}, ${add.countyDistrict} </b> </td>
            </c:if>	
        </tr> 
        <tr> 
            <td>Referred Dr : <b> ${docInfo.doctorName} </b> </td>
            <td colspan="1">Bill Status: 
                <c:if test="${dpsb.billingStatus == 'PAID'}">
                    <span style="font-weight:bold; font-size:20px; color:green;"> PAID </span> 
                </c:if>

                <c:if test="${dpsb.billingStatus == 'DUE'}">
                    <span style="font-weight:bold; font-size:20px; color:red;"> DUE </span> 
                </c:if>
            </td>
            <td><b>Bill Id:</b> <span style="font-weight:bold; font-size:20px; color:blue;"> ${dpsb.billId} </span> </td>

        </tr>  
    </table>
    <br>
    <table id="myTable" class="kha"   width="70%">
        <thead>
            <tr>
                <th style="text-align: center;">S.No</th>
                <th style="text-align: center;">Service Name</th>
                <th style="text-align: center;">Unit</th>
                <th style="text-align: center;">Rate</th>
            </tr>
        </thead>
        <tbody>
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
                        <input type="text" style="width:780px; border:none; font-size:14px;" id="${index.count}service" name="${index.count}service"
                               value="${sol.name}" readOnly="true">
                    </td>
                    <td>
                        <input type="text" class="normaltext"  id=" servicequantity"  name=" servicequantity" 
                               size="10" style="width:80px;"   onkeyup="updatePrice(${index.count});" value="${sol.quantity}" class="serquncalc" readOnly="true" />
                    </td>

                    <td align="right">
                        <input type="text" id="${index.count}unitprice" name="${index.count}unitprice" class="normaltext" style="width:150px;"
                               size="7" value="${sol.amount}" class="unitPri" readOnly="true">
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="3" align="right" 	style="border-right: solid 4px #ccc;"><span style="font-size:20px; font-weight:bold; ">Total Bill</span> </td>
                <td><input type="text" id="totalBill" name="totalBill" value="${dpsb.actualAmount}"  readOnly="true" onclick="alert('This Field Read Only!!!!');"
                           class="csinput" />
                    <span style="font-size:20px; font-weight:bold;">TK</span></td>
            </tr>
        </tbody>
    </table>

    <br></br>
    <div>
        <div align="left" class="rcorners2" >

            <table border="1" width="90%;"   >
                <tr>
                    <td colspan="10" align="right"><b> Bill Amount : &nbsp;</b></td>
                    <td align="center">  <input type="text" id="BillAmount" name="BillAmount" size="7" value="${dpsb.actualAmount}" readOnly="true" 
                                                style="width:100px; background:#D1E0E0; text-align:center; font-size:18px; font-weight:bold; " /></td>
                </tr>
                <tr>
                    <td colspan="10" align="right"><b> Discount Amount : &nbsp;</b></td>
                    <td align="center">  <input type="text" id="disAmounut" name="disAmounut" size="7" value="${dpsb.discountAmount}" readOnly="true" 
                                                style="width:100px; background:#D1E0E0; text-align:center; font-size:18px; font-weight:bold; " /></td>
                </tr>
                <tr>
                    <td colspan="10" align="right"><span style="font-size:18px; font-weight:bold; color:green;"> Due Amount (Tk) :</span> &nbsp;</td>
                    <td align="center"><input type="text" id="netamount" name="netamount"  value="${dpsb.dueAmount}"
                                              style="width:100px; font-size:18px; background:#D1E0E0; font-weight:bold; color:green; text-align:center;" 
                                              size="7"  readOnly="true" ></td>
                </tr>
                <tr>
                    <td colspan="10" align="right"><span style="font-size:18px; font-weight:bold; color:blue;">Due Paid (Tk) :</span> &nbsp;</td>
                    <td align="center">
                        <input type="text" id="paidamount" name="paidamount"  placeholder="Cash Paid" onkeypress="return isNumberKey(event)" 
                               style="width:150px; height:40px; color:blue; font-weight:bold; font-size:18px; text-align:center;"   
                               size="7"  onkeyup="dueamountcal(this)" class="casPaid" ></td>
                </tr>

                <tr>
                    <td colspan="10" align="right"><span style="font-size:16px; font-weight:bold; color:#7D0000;"> Payable Amount (Tk) : </span> &nbsp;</td>
                    <td align="center"><input type="text" id="payableamount" name="payableamount" 
                                              style="width:100px; color:#7D0000; background:#D1E0E0; font-size:16px; font-weight:bold; text-align:center;" class="pay"
                                              size="7" value="0" readOnly="true" ></td>
                </tr>
                <tr>
                    <td colspan="10" align="right"><span style="font-size:18px; font-weight:bold; color:red;"> Due Amount (Tk) :</span> &nbsp;  </td>
                    <td colspan="10" align="center"><input type="text" id="dueamount" name="dueamount" 
                                                           style="color:red; font-size:18px; font-weight:bold; text-align:center; background:#D1E0E0;"
                                                          size="7" value="0.00" readOnly="true">                        
                    </td>
                </tr>
            </table>
            <br>
            <table width="90%">
                <tr>
                    <td align="center">
                        <c:if test="${dpsb.billingStatus == 'DUE'}">
                            <input type="button" class="bu" value="Adjust Bill"  onClick="subPrint();" /> &nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="button" class="bu" value="Back" onClick="back();"/> 

                        </c:if>
                        <c:if test="${dpsb.billingStatus == 'PAID'}">
                            <input type="button" class="bu" value="Back"  onClick="back();" /> &nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="button" class="bu" value="Print"  onClick="printDivDup();" /> &nbsp;&nbsp;&nbsp;&nbsp;
                        </c:if>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <div class="div4">
        <div align="center">
            <table  class="k">
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
        </div>
    </div>
    <script>
        function subPrint() {
            var netamount = $('#netamount').val();
            var paidamount = $('.casPaid').val();
            var due = $('#dueamount').val();
            if (due < 0 || paidamount == "" || paidamount < 1)
            {
                alert("Cash Amount Empty or Cash Amount has to Getherthen Net Amount!!!");
                //$('.casPaid').val("0");
                //$('#payableamount').val("0");
                //$('#dueamount').val("0");
                return false;
            }
            else {
                jQuery("#billDetailsForm").submit();
                //  alert("Printing ...");
            }
        }
        function back() {
            window.location = "directbillingqueue.form";
        }
        function printDivDup() {

            var printer = window.open('left=0', 'top=0', 'width=300,height=300');
            printer.document.open("text/html");
            printer.document.write(document.getElementById('printDiv').innerHTML);
            printer.print();
            printer.document.close();
            printer.window.close();
            window.location = "directbillingqueue.form";
            //jQuery("#billPrint").submit();
            //  window.location = "directbillingqueue.form";
        }
    </script> 
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
        .span1{
            color:black;	
            font-size:15px;
            font-weight:bold;	
        }
    </style>
    <!--Patient Info -->

    <div style="position:absolute; left:280px;"> <input type="text" value="Duplicate Copy" 
                                                        style="border: 2px solid #ccc; font-size:18px; text-align:center;" /></div><br><br>
    <table class="kha1" style="margin-left: 0px;">
        <tr>
            <td><span style="font-size:13px;">Patient ID :</span> &nbsp;<span style="font-size:14px; font-weight:bold;">
                    ${patientSearch.identifier} </span>
                <img src="${pageContext.request.contextPath}/barcode/${patient.patientId}.png" /> 
            </td>
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
            <td><span style="font-size:13px;"> Bill Id: </span><span style="font-weight:bold; font-size:18px; color:red;"> ${dpsb.billId} </span>
                <img src="${pageContext.request.contextPath}/barcode/${dpsb.billId}.png" />  
            </td>
        </tr>
    </table>
    <!--Service Name -->
    <table class="kha1" style="margin-left: 0px;">
        <tr >
            <td style="text-align: center; background:#fff;"><span class="span1">S.No</span></td>
            <td style="text-align: center; background:#fff;"><span class="span1">Service Name </span></td>
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
                <td align="left"> ${sol.name}   </td>
                <td align="right">
                    <input type="text" id="unitprice" name="unitprice" class="normaltext" style="width:150px; font-size:14px; text-align: right;  border: none;"
                           size="10" value="${sol.amount}" class="unitPri" readOnly="true">
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="2" align="right" ><span style="font-size:16px; font-weight:bold; ">Total Bill : </span> </td>
            <td align="right"><span style="font-size:16px; font-weight:bold;">TK &nbsp;</span>
                <input type="text" id="totalBill" name="totalBill" value="${dpsb.actualAmount}"  readOnly="true" onclick="alert('This Field Read Only!!!!');"
                       style="width:100px; border:none; text-align:right; font-size:18px; font-weight:bold; "/>
            </td>
        </tr>
    </table>
    <br>
    <style>
        table.k1 {
            font-family:arial;
            background-color: #CDCDCD;
            margin:10px 0pt 15px 10px;
            font-size: 14px;
            width: 60%;
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
    <label style="float:left; width:350px;">
        <table  class="k1" style="margin-left: 0px; background-color: #CDCDCD;">
            <tr>
                <td style=" background-color: #FFF;"   align="right">  Payable : &nbsp; </td>
                <td   style="width:60px;"> <input type="text" id="BillAmount" name="BillAmount" 
                                           style="width:100px; border:none; text-align:right;" value="${dpsb.dueAmount}" readOnly="true"  /></td>
            </tr>
            <tr>
                <td style=" background-color: #FFF;"   align="right">  Discount : &nbsp; </td>
                <td    style="width:60px;"> <input type="text" id=" " name=" " style="width:100px; border:none; text-align:right;" value="${dpsb.discountAmount}" readOnly="true"  /></td>
            </tr>
            <tr>
                <td style=" background-color: #FFF;"   align="right"> Total Paid : &nbsp; </td>
                <td  style="width:60px;" align="right"> <input type="text" id="paid" name="paid" style="width:1px; border:none; text-align:right;" readOnly="true"  /> 
                    <span id="toPaid" ></span> </td>
            </tr>
            <tr>
                <td style=" background-color: #FFF;"   align="right"> Due : &nbsp; </td>
                <td  style="width:60px;"> <input type="text" id=" " name=" " style="width:100px; border:none; text-align:right;" value="${dpsb.dueAmount}" readOnly="true"  /></td>
            </tr>
        </table>
        <br><br>
        <span class="printfont" style="margin-left:0px;" > Bill Officer : ${billOfficer.givenName}   ${billOfficer.familyName} </span>
    </label>
    <input type="hidden" id="total" />

    <label style="float:left; margin-left:-20px;  width:560px;">
        <table style="width:65%" class="k1">
            <tr>
                <td><b>Sl.No</b></td>
                <td><b> Bill Collect Id </b></td>
                <td><b>Date</b> </td>
                <td><b> Paid </b> </td>
            </tr>
            <c:forEach var="bList" items="${diaBillICollectList}" varStatus="index">
                <tr>
                    <td>${index.count}</td>
                    <td style=" background-color: #FFF;" > ${bList.billCollectId} </td>
                    <td><openmrs:formatDate date="${bList.createdDate}" /></td>
                    <td align="right">${bList.paidAmount} 
                        <input type="value" value="${bList.paidAmount}" class="unitPri" style="display:none;" />
                    </td>
                </tr>
            </c:forEach>
        </table>
        <br>
        <input type="text" value="${dpsb.billingStatus}"
               style="border:1px solid; height:40px; font-size:20px; width:100px; border-radius:20px; text-align:center;" /> &nbsp;&nbsp;&nbsp;&nbsp;
        <span class="printfont" ><b style="font-size:16px;">Paid Amount :  &nbsp;</span> <span id="aaa" class="printfont1"></b></span>  <br>
        <br><br>
        <span class="printfont" >Total Paid Amount : &nbsp;</span><span id="totalValue2" class="printfont1"> </span><span class="printfont1"> Taka only </span> <br><br>

    </label>
    <script>
        jQuery(document).ready(function() {
            var tot = 0;
            $('#paid').attr('value', function() {
                $('.unitPri').each(function() {
                    if ($(this).val() !== '') {
                        tot += parseInt($(this).val());
                    }
                });
                return tot;
            });
            var paid = $('#paid').val();
            $('#total').val(tot);
            jQuery("#aaa").html((jQuery("#total").val()));
            jQuery("#toPaid").html((jQuery("#total").val()));
            jQuery("#totalValue1").html(toWords(jQuery("#total").val()));
            jQuery("#totalValue2").html(toWords(jQuery("#total").val()));
        });
        function back() {
            window.location = "directbillingqueue.form";
        }
    </script>
</div>

<%@ include file="/WEB-INF/template/footer.jsp"%>