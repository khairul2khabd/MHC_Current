<%-- 
    Document   : doctorOrRmpCommission
    Created on : Dec 5, 2016, 3:57:42 PM
    Author     : Khairul
--%>

<%@ include file="/WEB-INF/template/include.jsp" %>
<%@ include file="/WEB-INF/template/header.jsp" %>
<%@ include file="../includes/js_css.jsp" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/moduleResources/billing/scripts/jquery/jquery.1.12.4.js"></script><!--for doctor autocomplete -->
<script type="text/javascript" src="${pageContext.request.contextPath}/moduleResources/billing/scripts/jquery/1.12.1-jquery-ui.js"></script> 

<script type="text/javascript">
    var doctorsArray;
    var rmpArray;

    jQuery(document).ready(function() {
        doctorsArray = new Array();
        rmpArray = new Array();
        jQuery('#eDate, #sDate').datepicker({yearRange: 'c-30:c+30', dateFormat: 'yy-mm-dd', changeMonth: true, changeYear: true});
        $("#usersField").val("");
        jQuery('#sDate').val("");
        jQuery('#eDate').val("");

        document.getElementById('selectedUserList').ondblclick = function() {
            this.options[this.selectedIndex].remove();
        };
        document.getElementById("rmpCb").checked = false;
        document.getElementById("doctorCb").checked = true;
        setAutoCompleteSource();
    });

    function getPatientReport() {
        var doctoCbValue = $("#doctorCb:checked").val();
        var rmpCbValue = $("#rmpCb:checked").val();

        var autoCompleteValue;
        if (doctoCbValue == null && rmpCbValue == null) {
            alert("Please select doctor or rmp first");
            return;
        }
        if (doctoCbValue == null) {
            autoCompleteValue = rmpCbValue;
        } else {
            autoCompleteValue = doctoCbValue;
        }

        var arrayValues = $("#selectedUserList > option").map(function() {
            return this.value;
        }).get();

        var sDate = jQuery('#sDate').val();
        var eDate = jQuery('#eDate').val();

        if (sDate == "" || eDate == "") {
            alert("Please enter user name and date first");
            return;
        }

        var userValues = arrayValues.join();// return string from array

        //   alert(userValues);
        $.ajax({
            type: "GET",
            url: "getDoctorOrRmpCommission.htm",
            data: ({
                autoCompleteValue: autoCompleteValue,
                doctorId: userValues,
                sDate: sDate,
                eDate: eDate
            }),
            success: function(data) {
                jQuery("#doctorCommissionReport").html(data);
                jQuery('#sDate').val("");
                jQuery('#eDate').val("");

                $('#selectedUserList option[value!="jQuery Reference"]').remove();// remove all but not jQuery Referendce
            },
            error: function(requestObject, error, errorThrown) {
                alert(errorThrown);
            }
        });
    }

    function setAutoCompleteSource() {
        var statusForDoctorId;
        var statusForRmp;

        $('#selectedUserList option[value!="jQuery Reference"]').remove();
        var dataSource;

        if ($("#doctorCb").prop('checked') == true) {
            if (doctorsArray == "") {
    <c:forEach var="userName" items="${userList}" varStatus="status">
                var nameAndId = "${userName.id}" + "," + "${userName.doctorName}";
                doctorsArray [${status.index}] = {value: "${userName.id}", label: nameAndId};
                statusForDoctorId =${status.count};
    </c:forEach>

                dataSource = doctorsArray;
            } else {
                dataSource = doctorsArray;
            }

        } else {

            if (rmpArray == "") {


    <c:forEach var="rmp" items="${rmpList}" varStatus="status">
                var nameAndId = "${rmp.id}" + "," + "${rmp.name}";
                rmpArray [${status.index}] = {value: "${rmp.id}", label: nameAndId};
                statusForRmp =${status.count};
    </c:forEach>

                dataSource = rmpArray;
            } else {
                dataSource = rmpArray;
            }
        }

//alert(source);
        $("#usersField").autocomplete({
            source: dataSource,
            select: function(event, ui) {

                value = ui.item.value;
                label = ui.item.label;

                $("#usersField").val("");

                if (isDuplicate(label)) {
                    //alert("true");
                    $("#selectedUserList").append('<option value="' + value + '">' + label + '</option>'); // sending data to the select box
                } else {
                    alert("Item already exists !");
                }
                return false;
            }
        });
    }

    function isDuplicate(currentValue) {
        var arrayValues = $("#selectedUserList > option").map(function() {
            return this.text;
        }).get();
        var text = "";
        var i;
        for (i = 0; i < arrayValues.length; i++) {
            text = arrayValues[i];
            //  alert(text);
            if (text == currentValue) {
                return false;
            }
        }
        return true;
    }

    function doAlertDoctor(checkboxElem) {
        if (checkboxElem.checked) {
            document.getElementById("rmpCb").checked = false;
        }
        setAutoCompleteSource();
    }
    function doAlertRmp(checkboxElem) {
        if (checkboxElem.checked) {
            document.getElementById("doctorCb").checked = false;
        }
        setAutoCompleteSource();
    }

</script> 

<script type="text/javascript">
    function PrintDiv() {
        var contents = document.getElementById("doctorCommissionReport").innerHTML;
        var frame1 = document.createElement('iframe');
        frame1.name = "frame1";
        frame1.style.position = "absolute";
        frame1.style.top = "-1000000px";
        document.body.appendChild(frame1);
        var frameDoc = frame1.contentWindow ? frame1.contentWindow : frame1.contentDocument.document ? frame1.contentDocument.document : frame1.contentDocument;
        frameDoc.document.open();
        frameDoc.document.write('<html><head><title>DIV Contents</title>');
        frameDoc.document.write('</head><body>');
        frameDoc.document.write(contents);
        frameDoc.document.write('</body></html>');
        frameDoc.document.close();
        setTimeout(function() {
            window.frames["frame1"].focus();
            window.frames["frame1"].print();
            document.body.removeChild(frame1);
        }, 500);
        return false;
    }
</script>

<center><div class="boxHeader1">  <h3>Doctor Or RMP Commission</h3></div></center>
<div class="box1">
    <div class ="mainContent">
        <div class="leftDiv">
            <input type="checkbox" id="doctorCb" name="doctor" value="doctor" onchange="doAlertDoctor(this)"> Doctor
            <input type="checkbox" id="rmpCb" name="rmp" value="rmp" onchange="doAlertRmp(this)"> RMP 
            &nbsp;<input class="inputField" id="usersField" style="width: 300px"  placeholder="Please Enter User Name "/><br>

            <select
                class="userList"
                id="selectedUserList"  
                name="selectedUserList" multiple="multiple"
                placeholder="Selected User Name "
                style="min-width:300px;margin-left: 142px"
                >
            </select>
        </div>
        <div class="rightDiv">
            &nbsp;&nbsp;&nbsp;<span style="font-size:14px; font-weight: bold;"> Start Date  &nbsp;:</span> 
            <input class="inputField" type="text" placeholder="Please Enter Start Date " id="sDate" name="sDate" style="width:250px;"/>

            &nbsp;&nbsp;&nbsp; <span style="font-size:14px; font-weight: bold;"> End Date &nbsp;&nbsp; : </span>  
            <input class="inputField" type="text" placeholder="Please Enter End Date " id="eDate" name="eDate" style="width:250px;"/>
            <input  type="button" value="Get View" onclick="getPatientReport()" class="button"  />
            <input type="button" class="button"  value="Print" onclick="PrintDiv()"/><br><br><br><br><br>
        </div>
    </div>
</div>
<div id="doctorCommissionReport"></div>

<style>
    #doctorCommissionReport{
        margin-top: 30px; 
        padding-bottom: 18px;
    } 
    .mainContent{
        margin: auto;
        width: 90%;
    } 
    .box1{
        width:100%;
    }
    .leftDiv{
        float:left;
    }
    .rightDiv{
        margin-left: 70px;
    }
    .inputField  { 
        appearance: none;
        outline: 0;
        border: 1px solid #04B431;
        background-color: #A4A4A4;
        //width: 200px;
        height:30px;
        border-radius: 3px;
        padding-left: 5px;
        margin: 10px auto 10px auto;
        text-align: left;
        font-size: 16px;
        color: #fff;
        -webkit-transition-duration: 0.25s;
        transition-duration: 0.25s;
        font-weight: 200;
    }
    .inputField:hover {
        background-color: rgba(255, 255, 255, 0.4);
        color:#04B431;
    }
    .userList{
        background-color: #A4A4A4;
        color:white;
    }
    .userList:hover{
        background-color: rgba(255, 255, 255, 0.4);
        color:#04B431;
    }
    .boxHeader1{
        height:70px;
        width:100%;
        background-color: #eee;
    }
    .button {
        display: inline-block;
        padding: 5px 10px;
        font-size: 16px;
        cursor: pointer;
        text-align: center;
        text-decoration: none;
        font-weight: bold;
        outline: none;
        color: #000080;
        background-color:#D3D3D3;
        border: none;
        border-radius: 5px;
    }
    .button:hover {background-color: white;
                   color:#3e8e41;
                   box-shadow: 1px 1px 2px 1px #4CAF50;
    }
    .button:active {
        background-color: #3e8e41;
        box-shadow: 0 5px #666;
        transform: translateY(4px);
    }
</style>
<%@ include file="/WEB-INF/template/footer.jsp" %>