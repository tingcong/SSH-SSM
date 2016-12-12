<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'lishi.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script src="js/jquery-1.9.1.js"></script>
  </head>
  
  <body>
    <table border="1" width="80%">
    	<c:forEach items="${list}" var="li">
    	<tr>
    		<td><c:out value="${li.id}"></c:out></td>
    		<td><c:out value="${li.sid}"></c:out></td>
    		<td><c:out value="${li.sname}"></c:out></td>
    	</tr>	
    	</c:forEach>
    </table>
    <button onclick="tongji()">统计</button>
    <table id="lis" border="1" width="80%"></table>
    <script type="text/javascript">
    function tongji(){
    	$.post("show/tongji",{
		},function(data){
			//alert(data);
			 var html = "";		
				html += "<tr height='50'>";
				html += "<td>ID</td>";
				html += "<td>学号</td>";
				html += "<td>姓名</td>";
				html += "<td>被点次数</td>";  
				html += "</tr>";
			var res = $.parseJSON(data); 
			//alert(res);
			$.each(res, function(i, n) {
				html += "<tr>";
				html += "<td>" + n[0] + "</td>";
				html += "<td>" + n[1] + "</td>";
				html += "<td>" + n[2] + "</td>";
				html += "<td>" + n[3] + "</td>"; 
				html += "</tr>";
			}); 
			$("#lis").html(html);
	});
    }
    </script>
  </body>
</html>
