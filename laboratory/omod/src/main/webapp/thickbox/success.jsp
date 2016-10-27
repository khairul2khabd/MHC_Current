  
<%@ include file="/WEB-INF/template/include.jsp" %>
<%@ include file="../includes/js_css.jsp" %>
<script type="text/javascript">

	function runout(urlS,value){
		setTimeout(function(){
			self.parent.tb_remove();
			 self.parent.ACT.go(urlS);
			},value);
		 setTimeout("self.parent.location.href=self.parent.location.href;self.parent.tb_remove()",10);
	}
</script>
<body onload="runout('${urlS}',10);">
<center>
		<div style="height:40px; float: center; vertical-align:middle"><img src="${pageContext.request.contextPath}/moduleResources/hospitalcore/ajax-loader.gif"/></div>
		<span class="text center" style="color:#000000">
         ${message}
		<a href="#"  onclick="runout('${urlS}',0);">click here</a>
		</span>
</center>
</body>
</html>
