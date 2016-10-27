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
            var answer = confirm("Are you Sure Edit!!");
            if (answer) {
                //window.location = ('backToOpdQueue.htm?queueId=');
            }
            else {
                return false;
            }
        }
    </script>
    <form class="kha-ref" method="post" action="editSaveMar.htm">
        <h1>Edit Person Name</h1>
        <br>
        <input type="hidden" name="id" value="${marInfo.id}" />
        <input type="text" id="marName" name="marName" value="${marInfo.name}"/>
        <input class="button" type="submit" value="Save" onclick="backValidate()"/>
    </form> 
</center>