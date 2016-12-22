<%-- 
    Document   : editMarName
    Created on : Oct 27, 2015, 11:00:47 AM
    Author     : khairul
--%>

<%@ include file="/WEB-INF/template/include.jsp"%>
<%@ include file="../includes/js_css.jsp" %>

<center>
    <br>
    <br>
    <script>
        function backValidate() {
            var answer = confirm("Are you sure to update?");
            if (answer) {
                //window.location = ('backToOpdQueue.htm?queueId=');
            }
            else {
                return false;
            }
        }
    </script>
    <form class="kha-ref" method="post" action="editSaveRmp.htm">
        <h1>Edit RMP Name</h1>
        <br>
        <input type="hidden" name="id" value="${rmp.id}" />
        <table style="width:100%">
            <tr>
                <td> RMP Name </td>
                <td> <input type="text" id="rmpName" name="rmpName" value="${rmp.name}"/>  </td> 
            </tr>
            <tr>
                <td> Degree </td>
                <td> <input type="text" id="rmpDegree" name="rmpDegree" value="${rmp.degree}"/>  </td> 
            </tr>
            <tr>
                <td> Designation </td>
                <td> <input type="text" id="designation" name="designation" value="${rmp.designation}"/>  </td> 
            </tr>
            <tr>
                <td> Phone </td>
                <td> <input type="text" id="phone" name="phone" value="${rmp.phone}"/>  </td> 
            </tr>
            <tr>
                <td> Address </td>
                <td> <input type="text" id="address" name="address" value="${rmp.address}"/>  </td> 
            </tr>
            <tr>
                <td> Marketed by </td>
                <td> <input type="text" id="marketedBy" name="marketedBy" value="${rmp.marketed_by}"/>  </td> 
            </tr>
        </table>	
        <br>
        <input class="button" type="submit" value="Save" onclick="backValidate()"/>
    </form> 
</center>