<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 5 Transitional//EN">
<html>
<head>
<script type="text/javascript" src="<%=path%>/js/jquery-1.9.1.js"></script>

</head>

<body>

<a>oooooooooo</a>
<button id="but" onclick="jso();">rrrrrrr</button>
	<script type="text/javascript">
	var v = [];
	function a() {
		alert("ppp");
	}
function jso(){
	var i=[] ;
	var v=[];
	alert("lll");
	$.post("<%=path%>/home/testur",
			{},
			function(data){
				var res = $.parseJSON(data);
				alert(res);
				
				$each(res,function(i,n){
					v.push({value:n,text:n});
				});
				alert(v);
				});
		}
	</script>
</body>
</html>
