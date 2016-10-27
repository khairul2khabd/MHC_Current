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
<div style="border-bottom: 1px solid black; padding-bottom:5px; margin-bottom:10px;">
    <ul id="menu">
        <li class="first">
            <span style="font-weight:bold; font-size:large;">Laboratory system</span>
        </li>
        <openmrs:hasPrivilege privilege="Manage Laboratory Queue">
            <li id="QueueId">
				<a href="queue.form">Queue</a>
            </li>
        </openmrs:hasPrivilege>        
		<openmrs:hasPrivilege privilege="Manage Laboratory Worklist">
            <li id="WorkListId">
				<a href="worklist.form">Work List</a>
            </li>
        </openmrs:hasPrivilege>
		<openmrs:hasPrivilege privilege="Edit Laboratory Result">
            <li id="EditResultId">
				<a href="editResult.form">Edit Result</a>
            </li>
        </openmrs:hasPrivilege>
		<openmrs:hasPrivilege privilege="Print Laboratory Worklist">
            <li id="PrintWorkList">
				<a href="printWorklist.form">Print Work List</a>
            </li>
        </openmrs:hasPrivilege>
		<openmrs:hasPrivilege privilege="Manage Laboratory Patient Report">
            <li id="PatientReportId">
				<a href="patientReport.form">Patient Report</a>
            </li>
        </openmrs:hasPrivilege>
        <openmrs:hasPrivilege privilege="Manage Laboratory Functional Status">
            <li id="FunctionalStatusId">
				<a href="functionalStatus.form">Functional Status</a>
            </li>
        </openmrs:hasPrivilege>
        <openmrs:hasPrivilege privilege="Manage Laboratory Confidential Test">
            <li id="ConfidentialTestId">
				<a href="confidentialTest.form">Add Confidential Test Orders</a>
            </li>
        </openmrs:hasPrivilege>
    </ul>
</div>

<script type="text/javascript">
	
	// activate the <li> with @id by adding the css class named "active"
	function activate(id){
		$("#" + id).addClass("active");		
	}
	
	// return true whether the @str contains @searchText, otherwise return false
	function contain(str, searchText){
		return str.indexOf(searchText)>-1;
	}
	
	// choose which <li> will be activated using @url
	var url = location.href;
	if(contain(url, "queue.form")){
		activate("QueueId");
	} else if(contain(url, "worklist.form")){
		activate("WorkListId");
	} else if(contain(url, "editResult.form")){
		activate("EditResultId");
	} else if(contain(url, "printWorklist.form")){
		activate("PrintWorkList");
	} else if(contain(url, "patientReport.form")){
		activate("PatientReportId");
	} else if(contain(url, "functionalStatus.form")){
		activate("FunctionalStatusId");
	} else if(contain(url, "confidentialTest.form")){
		activate("ConfidentialTestId");
	} 
	
	// get the context path
	function getContextPath() {
		pn = location.pathname;
		len = pn.indexOf("/", 1);
		cp = pn.substring(0, len);
		return cp;
	}
</script>