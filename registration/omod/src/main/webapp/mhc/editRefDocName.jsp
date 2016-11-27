<%-- 
    Document   : editRefDocName
    Created on : Oct 25, 2015, 8:23:38 PM
    Author     : khairul
--%>

<%@ include file="/WEB-INF/template/include.jsp"%>
<%@ include file="../includes/js_css.jsp" %>

<center>
    <br>
    <br>
    <script>
        function backValidate() {
            var answer = confirm("Are you Sure Edit!!");
            if (answer) {
                //window.location = ('backToOpdQueue.htm?queueId=');
            }
            else {
                return false;
            }
        }
    </script>
    <form class="kha-ref" method="post" action="editSaveRef.htm">
        <h1>Edit Doctor Name</h1>
        <br>
        <input type="hidden" name="id" value="${docInfo.id}" />
        <table style="width:100%">
            <tr>
                <td> Doctor Name </td>
                <td> <input type="text" id="docName" name="docName" value="${docInfo.doctorName}"/>  </td> 
            </tr>
            <tr>
                <td> Degree </td>
                <td> <input type="text" id="docDeg" name="docDeg" value="${docInfo.degree}"/>  </td> 
            </tr>
            <tr>
                <td> Designation </td>
                <td> <input type="text" id="designation" name="designation" value="${docInfo.designation}"/>  </td> 
            </tr>
            <tr>
                <td> Phone </td>
                <td> <input type="text" id="phone" name="phone" value="${docInfo.phone}"/>  </td> 
            </tr>
            <tr>
                <td> Address </td>
                <td> <input type="text" id="address" name="address" value="${docInfo.address}"/>  </td> 
            </tr>
            <tr>
                <td> Marketed by </td>
                <td> <input type="text" id="marketed" name="marketed" value="${docInfo.marketed_by}"/>  </td> 
            </tr>
        </table>	
        <br>
        <input class="button" type="submit" value="Save" onclick="backValidate()"/>
    </form> 
</center>


