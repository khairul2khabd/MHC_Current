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
        <input type="text" id="docName" name="docName" value="${docInfo.doctorName}"/>
        <input class="button" type="submit" value="Save" onclick="backValidate()"/>
    </form> 
</center>


