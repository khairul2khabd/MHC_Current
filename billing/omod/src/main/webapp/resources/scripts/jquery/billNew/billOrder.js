/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 * Author Md Khairul Islam
 */

function printDiv2() {
    var netamount = $('#netamount').val();
    var paidamount = $('#total').val();
    var cash = $('#paidamount').val();
    var due = $('#dueamount').val();
    var disAmount = $('#discountamount').val();

    if (due < 0 || cash == "" || cash == 0 || disAmount == "")
    {
        alert("Cash Amount Empty or Cash Amount has to Getherthen Net Amount Or Discount amount empty is not valid !!!");
        //$('.casPaid').val("0");
        //$('#payableamount').val("0");
        //$('#dueamount').val("0");
        $("#discountamount").focus();
        return false;
    }

    else {
        // var printer = window.open('left=0', 'top=0', 'width=300,height=300');
        // printer.document.open("text/html");
        // printer.document.write(document.getElementById('printDiv').innerHTML);
        // printer.print();
        // printer.document.close();
        //  printer.window.close();
        jQuery("#orderBillingForm").submit();
        //  alert("Printing ...");
    }
}



