<%-- 
    Document   : editLabDoctorInfo
   
    Author     : Tanvir
--%>

<%@ include file="/WEB-INF/template/include.jsp"%>
<%@ include file="../includes/js_css.jsp" %>

<center>
    <br>
    <br>
    <script>
        function backValidate() {
            var answer = confirm("Are you sure to edit the doctor information?");
            if (answer) {
                //window.location = ('backToOpdQueue.htm?queueId=');
                self.parent.location.reload()
            }
            else {
                return false;
            }
        }
    </script>
	<div class="div1">
    <form class="abc" method="post" action="updateLabDoc.htm">
        
        
        <h1>Edit  Doctor Details(Pathology)</h1>
        <br>
        <table width="90%" >
            <input type="hidden" name="id" value="${docInfo.id}" />
            <tr style="background:#CCCCCC;">
                <td ><b>&nbsp; Doctor Name :</b></td>
                <td ><input type="text" id="doctorName" name="docName" value="${docInfo.docName}"/></td>

            </tr>
            <tr style="background:#CCCCCC;">
                <td ><b>&nbsp; Degree :</b></td>
                <td ><input type="text" id="doctorDegree" name="degree" value="${docInfo.degree}"/></td>

            </tr>
            <tr style="background:#CCCCCC;">
                <td ><b>&nbsp; Designation :</b></td>
                <td ><input type="text" id="doctorDesignation" name="designation" value="${docInfo.designation}"/></td>

            </tr>
            <tr style="background:#CCCCCC;">
                <td ><b>&nbsp; Workplace :</b></td>
                <td><input type="text" id="doctorWorkplace" name="workplace" value="${docInfo.workPlace}"/></td>

            </tr>
            <tr style="background:#CCCCCC;">
                <td></td>
                <td><input class="button" type="submit" value="Save" onclick="backValidate()" style="align:right;width:180px;margin-left:250px;padding:10px;" /></td>
            </tr>
        </table>
    </form> 
</center>
</div>

<style>
    .div1{
        width: 90%;
        min-height: 360px;
        position:absolute;
        left:50px;
		right:50px;
        top:40px;
		bottom:40px;
    }
    .abc { 
        max-width: 80%;
        min-height: 360px;

        padding: 20px 20px 20px 20px;
        font: 16px Arial, Tahoma, Helvetica, sans-serif;
        color: #000000;
        line-height: 180%;

        -moz-box-shadow: 0px 0px 0px 2px #9fb4f2;
        -webkit-box-shadow: 0px 0px 0px 2px #9fb4f2;
        background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #D2E9FF), color-stop(1, #FFFFFF));
        background:-moz-linear-gradient(top, #D2E9FF 5%, #FFFFFF 100%);
        background:-webkit-linear-gradient(top, #D2E9FF 5%, #FFFFFF 100%);
        background:-o-linear-gradient(top, #D2E9FF 5%, #FFFFFF 100%);
        background:-ms-linear-gradient(top, #D2E9FF 5%, #FFFFFF 100%);
        background:linear-gradient(to bottom, #D2E9FF 5%, #FFFFFF 100%);
        filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#476e9e',GradientType=0);
        background-color:#ffffff;
        -moz-border-radius:10px;
        -webkit-border-radius:10px;
        border-radius:10px;
        border:1px solid #4e6096;
        box-shadow: 10px 10px 5px #888888;
        cursor:pointer;
        color:#000000;
        font-family:arial;
        font-size:16px;
        padding:10px 30px;
        text-decoration:none;
    }
    .button{
        padding: 10px 20px 10px 20px;
        background: #47D147;
        border: none;
        color: #fff;
        box-shadow: 1px 1px 1px #4C6E91;
        -webkit-box-shadow: 1px 1px 1px #4C6E91;
        -moz-box-shadow: 1px 1px 1px #4C6E91;
        text-shadow: 3px 1px 5px #ffffff;
        font-size:18px;
        font-weight:bold;
        text-decoration:none;


    } 
    .button:hover{
        background: #fff;
		color:#47D147;
        text-shadow: 3px 1px 5px 4px #F7FE2E;
		box-shadow: 5px 3px 5px 3px #888;
        font-weight:bold;
    }
    .abc input[type="text"], .kha-uds input[type="email"] {
        border-radius:10px 2px 10px 2px;
        border: 1px solid #AAA;
        color: #black;
        font-size: inherit;
        margin: 10px;
        overflow: hidden;
        padding: 5px 10px;
        text-overflow: ellipsis;
        white-space: nowrap;
        width: 80%;
    }
</style>


