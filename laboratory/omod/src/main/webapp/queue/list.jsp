<%--
*  Copyright 2009 Society for Health Information Systems Programmes, India (HISP India)
*
*  This file is part of Laboratory module.
*
*  Laboratory module is free software: you can redistribute it and/or modify
*  it under the terms of the GNU General Public License as published by
*  the Free Software Foundation, either version 3 of the License, or
*  (at your option) any later version.

 *  Laboratory module is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with Laboratory module.  If not, see <http://www.gnu.org/licenses/>.
 *
--%> 
<%@ include file="/WEB-INF/template/include.jsp" %>
<%@ include file="/WEB-INF/template/header.jsp" %>
<%@ include file="../includes/js_css.jsp" %>
<br/>
<openmrs:require privilege="Manage Laboratory Queue" otherwise="/login.htm" redirect="/module/laboratory/queue.form" />
<%@ include file="../localHeader.jsp" %>
<script type="text/javascript">

    testNo = 0;
    editingSampleId = false;
    // 19/06/2012 kesavulu: #76 After rescheduling a Patient , we should return to the same page instead we go back to page 1
    currentPage = 1;
    jQuery(document).ready(function() {
        jQuery('#date').datepicker({yearRange: 'c-30:c+30', dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true});

        jQuery("#phrase").keyup(function(event) {
            if (event.keyCode == 13) {
                getTests(1);
            }
        });

    });

    // get all tests
    function getTests(currentPage) {
        // 19/06/2012 kesavulu: #76 After rescheduling a Patient , we should return to the same page instead we go back to page 1
        this.currentPage = currentPage;
        var date = jQuery("#date").val();
        var phrase = jQuery("#phrase").val();
        var investigation = jQuery("#investigation").val();
        jQuery.ajax({
            type: "GET",
            url: getContextPath() + "/module/laboratory/searchTest.form",
            data: ({
                date: date,
                phrase: phrase,
                investigation: investigation,
                currentPage: currentPage
            }),
            success: function(data) {
                jQuery("#tests").html(data);
                if (testNo > 0) {
                    tb_init("a.thickbox"); // init to show thickbox
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError);
            }
        });
    }

    // accept a test
    function acceptTest(orderId) {
        sampleId = jQuery("#sampleId" + orderId).val();
        jQuery.ajax({
            type: "GET",
            url: getContextPath() + "/module/laboratory/ajax/acceptTest.htm",
            data: ({
                orderId: orderId,
                date: jQuery("#date").val(),
                sampleId: sampleId
            }),
            dataType: "json",
            success: function(data) {
                if (data.status == "success") {
                    jQuery("#acceptBox_" + orderId).html("<b>Accepted</b>");
                    jQuery("#rescheduleBox_" + orderId).html("Reschedule");
                    jQuery("#sampleIdBox_" + orderId).html(sampleId);
                    editingSampleId = false;
                } else {
                    alert(data.error);
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError);
            }
        });
    }

    // get default sample id
    function getDefaultSampleId(orderId) {
        if (!editingSampleId) {
            jQuery.ajax({
                type: "GET",
                url: getContextPath() + "/module/laboratory/ajax/getDefaultSampleId.htm",
                data: ({
                    orderId: orderId
                }),
                success: function(data) {
                    showSampleIdBox(orderId, data);
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    alert(thrownError);
                }
            });
        } else {
            alert("Please save the current test!");
        }
    }

    function showSampleIdBox(orderId, sampleId) {
        var content = "";
        content += "<input id='sampleId" + orderId + "' value='" + sampleId + "'/>";
        content += "<input type='button' value='Save' onclick='acceptTest(" + orderId + ")'/>";
        content += "<input type='button' value='Cancel' onclick='cancelSampleIdBox(" + orderId + ")'/>";
        jQuery("#sampleIdBox_" + orderId).html(content);
        editingSampleId = true;
    }

    function cancelSampleIdBox(orderId) {
        jQuery("#sampleIdBox_" + orderId).html("");
        editingSampleId = false;
    }

    // unaccept a test
    function unacceptTest(testId, orderId) {
        jQuery.ajax({
            type: "GET",
            url: getContextPath() + "/module/laboratory/ajax/unacceptTest.htm",
            data: ({
                testId: testId
            }),
            success: function(data) {
                if (data.indexOf('success') >= 0) {
                    jQuery("#acceptBox_" + orderId).html(
                            "<a href='#' onClick='acceptTest(" + orderId
                            + ");'>Accept</a>");
                } else {
                    alert(data);
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError);
            }
        });
    }

    // reschedule a test
    function rescheduleTest(orderId, rescheduledDate) {
        validateRescheduleDate(orderId, rescheduledDate);
    }

    // validate reschedule date
    function validateRescheduleDate(orderId, rescheduledDate) {
        validateRescheduleDateResult = false;
        jQuery.ajax({
            type: "GET",
            url: getContextPath() + "/module/laboratory/ajax/validateRescheduleDate.htm",
            data: ({
                rescheduleDate: rescheduledDate
            }),
            success: function(data) {

                if (data.indexOf('success') >= 0) {
                    jQuery.ajax({
                        type: "POST",
                        url: getContextPath() + "/module/laboratory/rescheduleTest.form",
                        data: ({
                            orderId: orderId,
                            rescheduledDate: rescheduledDate
                        }),
                        success: function(data) {
                            if (data.indexOf('success') >= 0) {
                                // 19/06/2012 kesavulu: #76 After rescheduling a Patient , we should return to the same page instead we go back to page 1
                                getTests(currentPage);
                            } else {
                                alert(data);
                            }
                        },
                        error: function(xhr, ajaxOptions, thrownError) {
                            alert(thrownError);
                        }
                    });
                    tb_remove();
                } else {
                    alert('Invalid reschedule date! It must be after the current date');
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError);
            }
        });
    }

    /**
     * RESET SEARCH FORM
     *    Set date text box to current date
     *    Empty the patient name/identifier textbox
     *    Set default investigation to Investigation dropdown
     */
    function reset() {
        jQuery("#date").val("${currentDate}");
        jQuery("#phrase").val("");
        jQuery("#investigation").val(0);
    }
</script> 

<div class="boxHeader">
    <strong>See patient List by choosing lab</strong>
</div>
<div class="box">
    Date:
    <input id="date" value="${currentDate}" style="text-align:right;"/>
    Patient ID/Name:  <input id="phrase"/>
    Investigation:
    <select name="investigation" id="investigation">
        <option value="0">Select Department</option>
        <c:forEach var="investigation" items="${investigations}">
            <option value="${investigation.id}">${investigation.name.name}</option>
        </c:forEach>	
    </select>
    <input type="button" class="bu-normal"  value="Get patients" onClick="getTests(1);"/> &nbsp;
    <input type="button" class="bu-normal" value="Reset" onClick="reset();"/>
</div>

<div id="tests">
</div>

<%@ include file="/WEB-INF/template/footer.jsp" %>  