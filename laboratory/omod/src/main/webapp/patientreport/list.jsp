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
<openmrs:require privilege="Manage Laboratory Patient Report" otherwise="/login.htm" redirect="/module/laboratory/patientReport.form" />
<openmrs:globalProperty key="hospitalcore.hospitalName" defaultValue="ddu" var="hospitalName"/>
<%@ include file="../localHeader.jsp" %>

<script type="text/javascript">
    jQuery(document).ready(function() {
        jQuery('#date').datepicker({yearRange: 'c-30:c+30', dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true});
        jQuery("#searchbox").showPatientSearchBox({
            searchBoxView: "${hospitalName}/default",
            resultView: "/module/laboratory/patientsearch/${hospitalName}/patientreport",
            target: "#patientResult",
            beforeNewSearch: function() {
                jQuery("#patientSearchResultSection").hide();
            },
            success: function(data) {
                jQuery("#patientSearchResultSection").show();
            }
        });
    });

    // Get patient test by patient identifier
    function getPatientReport(patientId) {
        var date = jQuery("#date").val();
        var investigation = jQuery("#investigation").val();
        var doc = jQuery("#doc").val();
        //validation = validate(investigation);
        //if(validation.status){	
        $('#abc').show();
        jQuery.ajax({
            type: "GET",
            url: getContextPath() + "/module/laboratory/searchPatientReport.form",
            data: ({
                date: date,
                patientId: patientId,
                investigation: investigation,
                doc:doc
            }),
            success: function(data) {
                jQuery("#tests").html(data);
                insertTestInfo(patientId);
                insertTestInfo(investigation);
                jQuery("#patientSearchResultSection").hide();
                jQuery('#showPatientResult').show();
                $('#abc').hide();
            },
            error: function(xhr, ajaxOptions, thrownError) {
                //alert(thrownError);
            }
        });
        //alert(investigation);
    }//}

    // Insert test information
    function insertTestInfo(patientId) {
        var date = jQuery("#date").val();

        jQuery.ajax({
            type: "GET",
            url: getContextPath() + "/module/laboratory/ajax/showTestInfo.htm",
            data: ({
                patientId: patientId,
                orderDate: date,
                //investigation   :investigation
            }),
            success: function(data) {
                jQuery("#patientReportTestInfo").html(data);
                jQuery("#printAreaTestInfo").html(data);
            },
            error: function(xhr, ajaxOptions, thrownError) {
                //alert(thrownError);//
            }
        });
    }

    // Show patient report form
    function showForm(radiologyTestId, type) {
        type = escape(type);
        url = getContextPath() + "/module/laboratory/showForm.form?mode=view&height=600&width=800&radiologyTestId=" + radiologyTestId + "&type=" + type;
        tb_show("Patient report", url);
    }

    function printPatientReport() {
        jQuery("#patientReportPrintArea table").each(function(index, item) {
            //jQuery(item).attr("class", "wltable");
        });
        jQuery("#patientReportPrintArea").printArea({
            mode: "popup",
            popClose: true
        });
    }
</script>

<style>
    .opdSelect {
        padding:2px;
        margin: 0;
        -webkit-border-radius:4px;
        -moz-border-radius:4px;
        border-radius:4px;
        -webkit-box-shadow: 0 3px 0 #000, 0 -1px #fff inset;
        -moz-box-shadow: 0 3px 5px #000, 0 -1px #fff inset;
        box-shadow: 2px 3px 6px 4px #000, 0 -5px #fff inset;
        background: #f8f8f8;
        color:#000;
        border:none;
        outline:none;
        display: inline-block;
        -webkit-appearance:none;
        -moz-appearance:none;
        appearance:none;
        cursor:pointer;
        width:280px;
    }
    .opdSelect option {
        -webkit-border-radius:4px;
        -moz-border-radius:4px;
        border-radius:2px;
        -webkit-box-shadow: 0 3px 0 #ccc, 0 -1px #fff inset;
        -moz-box-shadow: 0 3px 0 #ccc, 0 -1px #fff inset;
        box-shadow: 0 3px 0 #ccc, 0 -1px #fff inset;
        padding: 5px 5px;
        height:auto;
        width:100%;
    }
    .input { 
        appearance: none;
        outline: 0;
        border: 1px solid #04B431; 
        background-color: #f8f8f8;
        width: 150px;
        height:30px;
        border-radius: 3px;
        font-size: 16px;
        color: #000;
        font-weight: 200;
    }
    .opdSelect1 {
        padding:2px;
        margin: 0;
        -webkit-border-radius:4px;
        -moz-border-radius:4px;
        border-radius:4px;
        -webkit-box-shadow: 0 3px 0 #000, 0 -1px #fff inset;
        -moz-box-shadow: 0 3px 5px #000, 0 -1px #fff inset;
        box-shadow: 2px 3px 6px 4px #000, 0 -5px #fff inset;
        background: #f8f8f8;
        color:#000;
        border:none;
        outline:none;
        display: inline-block;
        -webkit-appearance:none;
        -moz-appearance:none;
        appearance:none;
        cursor:pointer;
        width:220px;
    }
    .opdSelect1 option {
        -webkit-border-radius:4px;
        -moz-border-radius:4px;
        border-radius:2px;
        -webkit-box-shadow: 0 3px 0 #ccc, 0 -1px #fff inset;
        -moz-box-shadow: 0 3px 0 #ccc, 0 -1px #fff inset;
        box-shadow: 0 3px 0 #ccc, 0 -1px #fff inset;
        padding: 5px 5px;
        height:auto;
        width:100%;
    }
</style>

<div class="boxHeader"> 
    <strong>See patient List by choosing lab</strong>
</div>
<div style="position:fixed;  left:40%; top:50%; display:none;" id="abc" >
    <img src="${pageContext.request.contextPath}/moduleResources/laboratory/04.gif" id="img" 
         style=" border:1px solid #eee;  height:100px; width:100px; "/ > </div>

<div class="box">
    <table>
        <tr>
            <td>
                Date:
                <input id="date" class="input" value="${currentDate}" style="text-align:right;"/>
            </td>
            <td>&nbsp;&nbsp;&nbsp; Investigation: &nbsp;
                <select name="investigation" id="investigation" class="opdSelect">
                    <option value="select"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- Select Department --</option>	
                    <c:forEach var="investigation" items="${investigations}">
                        <option value="${investigation.id}">${investigation.name.name}</option>
                    </c:forEach>
                    <option value="5158">HbA1C</option>
                    <option value="2543">S. ELECTROLYTES</option>
                    <option value="2577">PT (PROTHROMBIN TIME)</option>
                    <option value="2415">URINE ROUTINE EXAMINATION</option>
                    <option value="3117">STOOL ROUTINE EXAMINATION</option>
                    <option value="5718">MANTOUX TEST</option>
                    <option value="3937">CREATININE CLEARANCE RATE (CCR)</option>
                    <option value="4252">URINARY TOTAL PROTEIN</option>
                    <option value="5148">URINE FOR KETONE BODIES</option>
                    <option value="5216">ANTI-NUCLEAR AB (ANA) & All</option> 
                    <option value="3092">&#946;-hCG</option>
                    <option value="5225">C3 C4</option>
                    <option value="5692">BT CT</option>
                    <option value="5213">URINE MICROALBUMIN</option>
                    <option value="5254">ANTI CCP-AB</option>
                    <option value="2413">SEMEN ANALYSIS</option>
                    <option value="5255">HSV I & II-IgG</option>
                    <option value="5709">DENGUE IgG/IgM/ALL</option>
                    <option value="6010">OCCULT BLOOD TEST</option>
                </select>
            </td> 
            <td>
                <div id="searchbox"></div>	
            </td>
            <td>
                <input type="button" value="Print" class="bu-normal" onClick="printPatientReport();"/>
            </td>
            <td>
                <a href="#" id='showPatientResult' style='display:none;' onclick="jQuery('#patientSearchResultSection').show();
                        jQuery('#showPatientResult').hide();">Show patients</a>
            </td>
            <td > &nbsp;&nbsp;
                <select name="doc" id="doc" class="opdSelect1">
                    <option value="0"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- Select Doctor --</option>	
                    <c:forEach var="doc" items="${allDoc}">
                        <option value="${doc.id}">${doc.docName}</option>
                    </c:forEach>
                </select>

            </td>
        </tr>

    </table>
</div>
<br/>
<div id="patientSearchResultSection" style="display:none;">
    <div class="boxHeader">Found Patients</div>
    <div class="box" id="patientResult"></div>
</div>
<div id="tests">
</div>
<%@ include file="/WEB-INF/template/footer.jsp" %>  