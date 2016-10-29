<%-- 
    Document   : billingqueue
    Created on : Oct 19, 2015, 9:06:39 PM
    Author     : khairul
--%>
<%@ include file="/WEB-INF/template/include.jsp"%>
<%@ include file="/WEB-INF/template/header.jsp"%>
<%@ include file="../includes/js_css.jsp"%>
<br>

<script type="text/javascript">
// get context path in order to build controller url
    function getContextPath() {
        pn = location.pathname;
        len = pn.indexOf("/", 1);
        cp = pn.substring(0, len);
        return cp;
    }
</script>

<script type="text/javascript">
    currentPage = 1;
    jQuery(document).ready(function() {
        jQuery('#date').datepicker({yearRange: 'c-30:c+30', dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true});

        jQuery("#searchKey").keyup(function(event) {
            if (event.keyCode == 13) {
                getBillingQueue(1);
            }
        });

        jQuery("#searchInSystem").keyup(function(event) {
            if (event.keyCode == 13) {
                getPatientInSystem(1);
            }
        });

        jQuery("#billId", "#billSearch").keyup(function(event) {
            if (event.keyCode == 13) {
                jQuery("#billSearch").ajaxSubmit();
            }
        });
        function find() {
            jQuery("#billSearch").ajaxSubmit();
        }
    });

    function getBillingQueue(currentPage) {
        jQuery("#billingqueue").show();
        this.currentPage = currentPage;
        var date = jQuery("#date").val();
        var searchKey = jQuery("#searchKey").val();
        jQuery.ajax({
            type: "GET",
            url: getContextPath() + "/module/billing/getbillqueue.form",
            data: ({
                date: date,
                searchKey: searchKey,
                currentPage: currentPage
            }),
            success: function(data) {
                jQuery("#billingqueue").html(data);
                jQuery("#patientqueue").hide();
            },
        });
    }

    function getPatientInSystem(currentPage) {
        $('#abc').show();
        jQuery("#patientqueue").show();
        this.currentPage = currentPage;
        var searchKey = jQuery("#searchInSystem").val();
        jQuery.ajax({
            type: "GET",
            url: getContextPath() + "/module/billing/getPatientInSystem.form",
            data: ({
                searchKey: searchKey,
                currentPage: currentPage
            }),
            success: function(data) {
                jQuery("#patientqueue").html(data);
                jQuery("#billingqueue").hide();
                $('#abc').hide();
            },
        });
    }

    function reset() {
        jQuery("#date").val("${currentDate}");
        jQuery("#searchKey").val("");
    }

    function billSearch() {
        var url = "billSearch.form?&KeepThis=true&TB_iframe=true&width=900&height=600";
        tb_show("Search Bill", url);
        ///url = "showAllDiagnosis.htm?patientId="+patientId+"&opdId="+opdId+"&queueId="+queueId+"&referralId="+referralId+"&keepThis=false&TB_iframe=true&height=600&width=1000";
    }
    function validate() {
        var billId = $("#billId").val();
        var patientId = $("#patientId").val();

        if (billId.length > 0 && patientId.length > 0) {
            alert("Please Enter any One, Bill Id or Patient Id !!!!");
            return false;
        }
        else if (billId.length < 1 && patientId.length < 1) {
            alert("You Did not fillup any one!!!!");
            return false;
        }
        else {
            return true;
        }
    }
</script> 


<form class="kha-due" id="billSearch" action="searchBill.htm" method="GET" onsubmit="javascript:return validate();">
    <h1>Billing Queue </h1>
    <div class="boxHeader">   <strong>Due Collect / Reprint Invoice</strong></div>
    <div class="box">
        <span style="font-size:16px; font-weight: bold;"> Bill ID : </span> 
        <input type="text" placeholder="Bill Id" id="billId" name="billId" style="width:150px;"/> &emsp;

        <span style="font-size:16px; font-weight: bold;"> Patient ID : </span> 
        <input type="text" placeholder="Patient Id" id="patientId" name="patientId" style="width:150px;"/>

        <input type="submit" class="bu" id="find" value="Find" onClick="find();" /> 

        <span style="position:fixed; left:1300px;">
            <input type="button" class="bs" id="find" value="&#9906;  Search Test Price" onclick="window.open('billSearch.form', '_blank');")/>
        </span>
    </div>
</form>

<div style="position:fixed;  left:50%; top:60%; display:none;" id="abc" >
    <img src="${pageContext.request.contextPath}/moduleResources/billing/ajax-loader.gif" id="img" style=" border:1px solid #eee;  height:50px; width:50px; "/ > </div>

<form class="kha-aero" style="margin-top:-15px;">
    <div class="boxHeader">   <strong>Patient Queue for Billing</strong></div>
    <div class="box">
        <b>Date : </b>  <input type="text" id="date" value="${currentDate}"/>
        <b> Patient ID/Name : </b> <input type="text" placeholder="search by name/id" id="searchKey" style="width:200px;"/>
        <input type="button" class="bu" value="Get patients" onClick="getBillingQueue(1);"/> &nbsp;
        <input type="button" class="bu" value="Reset" onClick="reset();"/> ||
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="text" placeholder="search patient in system" id="searchInSystem" style="width:200px;"/>
        <input type="button" class="bu" value="Get patients" onClick="getPatientInSystem(1);"/>
        <br>


        <div id="billingqueue" style="padding:4px;"></div>
        <div id="patientqueue" style="padding:4px;"></div>
    </div>
    <b><a href="main.form">Back</a></b>
</form>


