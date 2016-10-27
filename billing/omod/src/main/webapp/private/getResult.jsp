<%-- 
    Document   : getResult
    Created on : Oct 20, 2015, 12:34:35 AM
    Author     : khairul
--%>

<%@ include file="/WEB-INF/template/include.jsp"%>
<%@ include file="../includes/js_css.jsp"%>

<openmrs:require privilege="Test order queue" otherwise="/login.htm" redirect="/module/billing/main.form" />

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

    PATIENTSEARCHRESULT = {
        oldBackgroundColor: "",
        /** Click to view patient info */
        visit: function(patientId, refDocId, refMarId, orderId, date, refRmpId) {
            var dat = date.toString();
            //ghanshyam 25-02-2013 New Requirement #966[Billing]Add Paid Bill/Add Free Bill for Bangladesh module	
            window.location.href = openmrsContextPath + "/module/billing/billorder.form?patientId=" + patientId + "&refDocId=" + refDocId
                    + "&refMarId=" + refMarId + "&orderId=" + orderId + "&date=" + dat + "&refRmpId=" + refRmpId;
        }
    };

    jQuery(document).ready(function() {

        // hover rows
        jQuery(".patientSearchRow").hover(
                function(event) {
                    obj = event.target;
                    while (obj.tagName != "TR") {
                        obj = obj.parentNode;
                    }
                    PATIENTSEARCHRESULT.oldBackgroundColor = jQuery(obj).css("background-color");
                    jQuery(obj).css("background-color", "#00FF99");
                    jQuery(obj).css("cursor", "pointer");
                    jQuery(obj).css("color", "#08088A");
                },
                function(event) {
                    obj = event.target;
                    while (obj.tagName != "TR") {
                        obj = obj.parentNode;
                    }
                    jQuery(obj).css("background-color", PATIENTSEARCHRESULT.oldBackgroundColor);
                    jQuery(obj).css("color", "black");
                }
        );
    });
</script>

<script>
    $(function() {
        $("#patientInfo").simplePagination({
            previousButtonClass: "btn btn-danger",
            nextButtonClass: "btn btn-danger"
        });
    });
</script>
<div class="container" >
    <c:choose>
        <c:when test="${not empty diaBillList}">

            <table id="patientInfo" class="table_data table-striped text-center">     						
                <thead>
                    <tr>
                        <th><b>S.No</b></th>
                        <th><b>Identifier</b></th>
                        <th><b>Name</b></th>
                        <th><b>Age</b></th>
                        <th><b>Gender</b></th>
                        <th><b>Ref By Doctor Id</b></th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${diaBillList}" var="patient" varStatus="varStatus">
                        <tr
                            class='${varStatus.index % 2 == 0 ? "oddRow" : "evenRow" } patientSearchRow'
                            onclick="PATIENTSEARCHRESULT.visit(${patient.patientId},${patient.refDocId}, ${patient.refMarId},${patient.id}, '${date}', ${patient.refRmpId});">

                            <td>  ${varStatus.count} </td>
                            <td>${patient.identifier}</td>
                            <td>${patient.patientName}  </td>
                            <td>${patient.age} </td>
                            <td><c:choose>
                                    <c:when test="${patient.gender eq 'M'}">
                                        <img src="${pageContext.request.contextPath}/images/male.gif" />
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${pageContext.request.contextPath}/images/female.gif" />
                                    </c:otherwise>
                                </c:choose></td>
                            <td><c:if test="${patient.refDocId ne '0'}">  ${patient.refDocId} </c:if><td>
                            </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:when>

        <c:otherwise>
            <span style="color:red">No Patient Found.</span>
        </c:otherwise>
    </c:choose>
</div>

<!-- <td><openmrs:formatDate date="${patient.birthdate}" /></td> -->
