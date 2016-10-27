<%-- 
    Document   : refRange
    Created on : Feb 13, 2016, 3:27:12 PM
    Author     : Khairul
--%>

<%@ include file="/WEB-INF/template/include.jsp" %> 
<%@ include file="/WEB-INF/template/header.jsp" %>
<%@ include file="../includes/js_css.jsp" %>

<script>
    jQuery(document).ready(function() {
        $(function() {
            var scntDiv = $('#items');
            var i = $('#items p').size() + 1;
            $('#addScnt').live('click', function() {
                $('<p><label for="p_scnts"><input type="text" id="rr" size="20" name="rr" value="" placeholder="Male/Femal : low - high" /></label> <a href="#" id="remScnt">Remove</a></p>').appendTo(scntDiv);
                i++;
                return false;
            });
            $('#remScnt').live('click', function() {
                if (i > -1) {
                    $(this).parents('p').remove();
                    i--;
                }
                return false;
            });
        });
    });

</script>

<div class="boxHeader1">Reference Range </div>
<div class="box1">
    <span style="font-size:20px; font-weight:bold; padding-left:5px; "> Viewing Concept : ${concept} </span>  &nbsp;&nbsp;&nbsp;&nbsp; 
    <span style="font-size:16px; "> Concept Id : <%= request.getParameter("id") %> </span>
    <form class="form-rep-view" method="POST" action="referenceRangeSave.form" >
        <input type="hidden" value="${conceptId}" id="conceptId" name="conceptId" />
        <c:if test="${ empty diaRefList}">
            <div style="margin-top: 20px; color:#555; position:absolute; margin-left:60%;">
                <h1> Example : </h1> Male : low - high (Male : 10-15)
            </div>
        </c:if>
        <div style="margin-left:10%; margin-top:3%">
            <div id="items"> 
                <p> 
                    <label for="p_scnts"><input type="text" id="rr"  name="rr" value="" placeholder="Male/Femal : low - high" /></label>

                    <span style="font-size:18px;"><a href="#" id="addScnt"  >Add Another Reference</a></span>
                </p> 
            </div>
            <c:if test="${not empty diaRefList}"> 
                <table class="table_data">
                    <tr> <th>Reference Range</th> 	</tr>
                    <c:forEach items="${dd}" var="d">
                        <tr>
                            <td><p><label for="p_scnts"><input type="text" id="rr" size="20" name="rr" value="${d}" placeholder="Male/Femal : low - high" /></label> <a href="#" id="remScnt">Remove</a></p></td>

<!-- <td><p><input type="text" name="rr" id="rr" value="${d}" /> <a href="#" id="rem">Remove</a></p></td><br> -->
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
        </div> 
        <br><br>
        <div style="margin-left: 165px;">
            <input type="submit" class="bu-normal" value="Save" />
            <input type="button" class="bu-normal" value="Close" onclick="self.close();" />
        </div>
    </form>
</div>
