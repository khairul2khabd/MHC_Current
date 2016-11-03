<%--
 *  Copyright 2009 Society for Health Information Systems Programmes, India (HISP India)
 *
 *  This file is part of Billing module.
 *
 *  Billing module is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.

 *  Billing module is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with Billing module.  If not, see <http://www.gnu.org/licenses/>.
 *
--%>
<script type="text/javascript">
    $ = jQuery.noConflict();

    // Get context path
    function getContextPath() {
        return "${pageContext.request.contextPath}";
    }
</script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/moduleResources/hospitalcore/styles/paging.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/moduleResources/registration/styles/common.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/moduleResources/hospitalcore/styles/jquery.loadmask.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/moduleResources/hospitalcore/scripts/jquery/css/thickbox.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/moduleResources/hospitalcore/scripts/jquery/css/jquery.autocomplete.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/moduleResources/hospitalcore/styles/tablesorter/blue/style.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/moduleResources/hospitalcore/scripts/jquery/jquery.metadata.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/moduleResources/hospitalcore/scripts/jquery/jquery.validate.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/moduleResources/hospitalcore/scripts/jquery/jquery.autocomplete.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/moduleResources/hospitalcore/scripts/jquery/jquery.PrintArea.js"></script>
<!-- <script type="text/javascript" src="${pageContext.request.contextPath}/moduleResources/hospitalcore/scripts/jquery/jquery.thickbox.js"></script> -->
<script type="text/javascript" src="${pageContext.request.contextPath}/moduleResources/registration/scripts/jquery/jquery.form.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/moduleResources/hospitalcore/scripts/jquery/jquery.search.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/moduleResources/hospitalcore/scripts/jquery/jquery.patientSearch.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/moduleResources/hospitalcore/scripts/jquery/jquery.loadmask.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/moduleResources/hospitalcore/scripts/jquery/jquery.tablesorter.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/moduleResources/hospitalcore/scripts/jquery/jquery.formfilling.js"></script>
<script type="text/javascript"  src="${pageContext.request.contextPath}/moduleResources/hospitalcore/scripts/string-utils.js" ></script>
<script type="text/javascript"  src="${pageContext.request.contextPath}/moduleResources/hospitalcore/scripts/paging.js" ></script> 
<script type="text/javascript"
src="${pageContext.request.contextPath}/moduleResources/billing/scripts/common.js"></script>

<link type="text/css" rel="stylesheet"
      href="${pageContext.request.contextPath}/moduleResources/billing/styles/form.css"/>
<link type="text/css" rel="stylesheet"
      href="${pageContext.request.contextPath}/moduleResources/billing/styles/billForm.css"/>
<link type="text/css" rel="stylesheet"	
      href="${pageContext.request.contextPath}/moduleResources/billing/scripts/jquery/css/jquery.autocomplete.css"/>
<link type="text/css" rel="stylesheet"	
      href="${pageContext.request.contextPath}/moduleResources/billing/scripts/jquery/css/jquery.multiselect.css"/>
<link type="text/css" rel="stylesheet"	
      href="${pageContext.request.contextPath}/moduleResources/billing/scripts/jquery/css/thickbox.css"/>
<script type="text/javascript"
src="${pageContext.request.contextPath}/moduleResources/billing/scripts/jquery/jquery.autocomplete.js"></script>

<script type="text/javascript"
src="${pageContext.request.contextPath}/moduleResources/billing/scripts/page-actions.js"></script>
<script type="text/javascript"
src="${pageContext.request.contextPath}/moduleResources/billing/scripts/page-utils.js"></script>
<script type="text/javascript"
src="${pageContext.request.contextPath}/moduleResources/billing/scripts/jquery/jquery.multiselect.js"></script>
<script type="text/javascript"
src="${pageContext.request.contextPath}/moduleResources/billing/scripts/lists.js"></script> 
<script type="text/javascript"
src="${pageContext.request.contextPath}/moduleResources/billing/scripts/jquery/billNew/billOrder.js"></script>
<script type="text/javascript"
src="${pageContext.request.contextPath}/moduleResources/billing/scripts/jquery/jquery.thickbox.js"></script>
<script type="text/javascript"
src="${pageContext.request.contextPath}/moduleResources/billing/scripts/common-utils.js"></script>

<!-- Table Pagination -->
<script type="text/javascript"
src="${pageContext.request.contextPath}/moduleResources/billing/scripts/pagination/jquery.simplePagination.js"></script>

<link type="text/css" rel="stylesheet"	
      href="${pageContext.request.contextPath}/moduleResources/billing/scripts/pagination/bootstrap.min.css"/>

<link type="text/css" rel="stylesheet"	
      href="${pageContext.request.contextPath}/moduleResources/billing/scripts/pagination/jquerysctipttop.css"/>

<link type="text/css" rel="stylesheet"
      href="${pageContext.request.contextPath}/moduleResources/billing/styles/reports-style.css"/>

<link type="text/css" rel="stylesheet"
      href="${pageContext.request.contextPath}/moduleResources/billing/styles/uni/uni-style.css"/>

<script type="text/javascript"
src="${pageContext.request.contextPath}/moduleResources/billing/scripts/page-actions_1.js"></script>

<script type="text/javascript"
src="${pageContext.request.contextPath}/moduleResources/billing/scripts/barcode/JsBarcode.all.js"></script>