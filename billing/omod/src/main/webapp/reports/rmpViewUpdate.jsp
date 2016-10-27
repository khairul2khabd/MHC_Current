<%-- 
    Document   : rmpViewUpdate
    Created on : Jul 12, 2016, 1:28:16 PM
    Author     : Khairul
--%> 

<%@ include file="/WEB-INF/template/include.jsp"%>
<%@ include file="../includes/js_css.jsp"%>

<form class="form-rep-view"  method="post" action="rmpPayUpdate.htm" style="width:90%; margin-left:40px;" >
    <input type="hidden" id="id" name="id" value="${comPaid.id}" />
    <div class="boxHeader1">   <strong>RMP Commission Payment Update</strong></div>
    <div class="box1">
        <br>
        <table style="font-size:17px;  font-family: 'Times New Roman';" class="table_data table-striped" >
            <tr height="40px;">
                <td colspan="2" align="center"> Date : ${comPaid.createdDate} </td>
            </tr>
            <tr>
                <td width="50%" height="30px;"> Service/Test Amount  : </td> 	 
                <td> ${comPaid.serviceAmount}  </td>
            </tr>
            <tr>
                <td width="50%" height="30px;"> Net / Commission Amount  : </td> 	
                <td> ${comPaid.netAmount}  </td>
            </tr>
            <tr>
                <td width="50%" height="30px;"> Less / Discount Amount : </td> 
                <td> ${comPaid.lessAmount}  </td>
            </tr>
            <tr>
                <td width="50%" height="30px;"> RMP Payable / Commission Amount : </td> 
                <td> ${comPaid.rmpCommission}    </td>
            </tr>
            <tr>
                <td width="50%" height="30px;"> Paid Amount : </td> 
                <td> ${comPaid.paidAmount} <input type="hidden" id="paAmnt" name="paAmnt" value="${comPaid.paidAmount}" /> </td>
            </tr>
            <tr>
                <td width="50%" height="30px;"> Due Amount : </td> 	 
                <td> ${comPaid.dueAmount} <input type="text" id="da" style="display:none;" value="${comPaid.dueAmount}" /> </td>
            </tr>
            <tr>
                <td width="50%" align="right" style="padding-right:40px; font-size:20px;"  > Adjustment : <br><br>  Due : </td>
                <td> <input type="text" id="adj" name="adj" onkeyup="adjust(this)" onkeypress="return isNumberKey(event)" />  &emsp; <input type="text" id="due" name="due" />  </td>
            </tr>
        </table>
    </div> <br>
    &emsp; <input type="submit" class="bs" value="Save" />
</form> 

<script>

    function adjust(incon) {
        var da = document.getElementById('da').value;
        var adj = document.getElementById('adj').value;
        var result = parseInt(da) - parseInt(adj);

        if (!isNaN(result)) {
            document.getElementById('due').value = result;
        }

        var due = document.getElementById("due").value;
        if (due < 0)
        {
            alert("Paid Amount Grether than Doctor Commission Amount !!!");
            document.getElementById('due').value = "";
            document.getElementById('adj').value = "";
            return false;
        }
    }

    function dueamountcal(incon)
    {
        var paidamount = incon.value;
        var netamount = $('#da').val();
        $('#due').val(netamount - paidamount);
    }
    function isNumberKeyDot(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode
        //if (charCode > 31 && (charCode < 48 || charCode > 57))
        if (charCode > 31 && (charCode < 45 || charCode > 57))
            return false;
        return true;
    }
    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;
        return true;
    }
</script>