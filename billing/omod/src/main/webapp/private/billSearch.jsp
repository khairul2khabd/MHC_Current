<%-- 
    Document   : billSearch
    Created on : Dec 5, 2015, 4:56:38 PM
    Author     : Khairul
--%>

<%@ include file="/WEB-INF/template/include.jsp"%>
<%@ include file="/WEB-INF/template/headerMinimal.jsp"%>
<%@ include file="../includes/js_css.jsp"%>

<script type="text/javascript">
    $(document).ready(function() {
        $("#price1").val("");
         
        $("input").focus(function() {
            $(this).css("background-color", "#0101DF");
            $(this).css("font-size", "16px");
            $(this).css("color", "#fff");
        });
        $("input").blur(function() {
            $(this).css("background-color", "#F7F778");
            $(this).css("color", "#000");
        });
    })

    function updatePrice() {
        var sum = 0;
        var numbers = $("#selectedPrice").text().match(/\d+/g);
        if (numbers)
        {
            $.each(numbers, function() {
                sum += parseInt(this);
            });
        }
        $("#price1").val(sum + ".00");
    }
</script>
<br>
<input type="hidden" id="pageId" value="billSearchPage" />
<form class="kha-bs" method="get" action=" " id="billSearchForm">

    <h1>Search Bill</h1>
    <b>&nbsp;&nbsp;&nbsp;&nbsp; Service Name : </b>
    <input style="width:500px; height:40px; padding:0px 0px 0px 6px; border-radius:4px 3px; font-size:16px;" 
           type="text" id="serPrice" name="serPrice"  placeholder="Please type Id / Service Name"
           ondblclick="this.value = '';" />
    <table>
        <thead>
            <tr>
                <th width="200px;" rowspan="2" style="text-align:center;">Service Name and Price </th> 
                <!--  <th width="50px;" rowspan="2" style="text-align:center;">Unit Price </th> -->
            </tr>
        </thead>
        <tr>
            <td>
                <div style="overflow:hidden; display:inline-block; line-height: 250%; " >
                    <select id="selectedPrice"  name="selectedPrice" class="sel" style="width:900px;" size="10" multiple="multiple" 
                            onchange="updatePrice();"
                            ondblclick="moveSelectedById('selectedPrice', 'availableInvestigationList')"> 
                    </select>		
                </div>
            </td>
            <!--
<td>
<div style="overflow:hidden; display:inline-block; line-height: 200%; " >
            
<select id="selectedTestPrice" class="unitPri"   name="selectedTestPrice" class="sel"  style="width:150px; text-align:right;
        background-color: transparent; padding:10px; margin:-5px -30px -5px -5px; scrolling:no; font-size:18px; " 
        size="10" multiple="multiple"		
        ondblclick="moveSelectedById('selectedTestPrice', 'availableInvestigationList')"> 
                    </select>
                    </div>
</td> -->
        </tr>
        <tr>
            <td  align="right"><b>Total Price :</b>&nbsp;&nbsp;  
                <input type="text" id="price1" style="text-align:center; font-size:20px; width:150px;" /></td>
        </tr>
    </table>
    <div style="position: absolute; left:40%;">
        <input type="button" class="bu" value="Calculat" onclick="updatePrice();">
        <input type="button" class="bu" value="Close" onclick="self.close();">
    </div>
</form>

<style>
    .sel{
        width:700px;  
        height: 150%; 
        overflow:hidden; 
        background-color:transparent; 
        padding:10px; 
        margin:-5px -30px -5px -5px; 
        scrolling:no; font-size:18px;
        font-size:18px; 
        margin:-5px -30px -5px -5px; 
        scrolling:no; 

    }
</style>
