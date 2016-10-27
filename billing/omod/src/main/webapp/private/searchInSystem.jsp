<%-- 
    Document   : searchInSystem
    Created on : Dec 21, 2015, 1:09:06 PM
    Author     : Khairul
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
        visit: function(patientId, date) {
            var dat = date.toString();
            //ghanshyam 25-02-2013 New Requirement #966[Billing]Add Paid Bill/Add Free Bill for Bangladesh module	
            window.location.href = openmrsContextPath + "/module/billing/billorder.form?patientId=" + patientId + "&date=" + dat;
        }
    };

    jQuery(document).ready(function() {
        var now = new Date();
        jQuery("#cDate").val(now);

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
        $("#example").simplePagination({
            previousButtonClass: "btn btn-danger",
            nextButtonClass: "btn btn-danger"
        });
    });
</script>
<style>
    table.queue{
        padding:0 0 0 50px;	
    }
    table.queue th{
        text-align:center;
    }
    table.queue td{
        text-align:center;
    }
</style>

<c:choose>
    <c:when test="${not empty patientList}">
        <div class="container" >
            <table id="example" class="table_data table-striped"> 
                <thead>
                    <tr>
                        <th><b>S.No</b></th>
                        <th><b>Identifier</b></th>
                        <th><b>Name</b></th>
                        <th><b>Age</b></th>
                        <th><b>Gender</b></th>
                        <th><b>Phone No</b></th>
                    </tr>
                </thead> 
                <tbody>
                    <c:forEach items="${patientList}" var="patient" varStatus="varStatus">

                        <tr  class='${varStatus.index % 2 == 0 ? "oddRow" : "evenRow" } patientSearchRow' 
                             onclick="PATIENTSEARCHRESULT.visit(${patient.patientId}, '${currentDate}');">
                            <td> ${varStatus.count} </td>
                            <td>${patient.identifier}</td>
                            <td>${patient.givenName} ${patient.middleName}  ${patient.familyName}                         </td>
                            <td>${patient.age}</td>
                            <td><c:choose>
                                    <c:when test="${patient.gender eq 'M'}">
                                        <img src="${pageContext.request.contextPath}/images/male.gif" />
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${pageContext.request.contextPath}/images/female.gif" />
                                    </c:otherwise>
                                </c:choose></td>
                            <td>   </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <span style="color:red">No Patient Found.</span>
        </c:otherwise>
    </c:choose>
    <!-- <td><openmrs:formatDate date="${patient.birthdate}" /></td> -->
</div>