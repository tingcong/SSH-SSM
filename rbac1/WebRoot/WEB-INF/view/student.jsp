<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'student.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<!-- 	//<script src="js/jquery-2.1.1.js"></script> -->
	<script src="js/jquery-1.9.1.js"></script>

  </head>
  
  <body>
    <table border="1" width="80%">
    	<c:forEach items="${list}" var="stu">
    	<tr>
    		<td><c:out value="${stu.id}"></c:out></td>
    		<td><c:out value="${stu.name}"></c:out></td>
    	</tr>	
    	</c:forEach>
    </table>
    <button onclick="dianming1()">点名</button>
    <button onclick="lishi()">历史记录</button>
    <table id="ran" border="1" ></div>
    
    <script type="text/javascript">
    function dianming1(){
    	//alert("aaa");
    	$.post("show/random",{
		},function(data){
			//alert(data);
			var html = "";		
				html += "<tr height='50'>";
				html += "<td>Id</td>";
				html += "<td>Name</td>";
				html += "</tr>";
			var res = $.parseJSON(data);
			//alert(res);
			
				html += "<tr>";
				html += "<td>" + res.id + "</td>";
				html += "<td>" + res.name + "</td>";
				html += "</tr>";
			
			$("#ran").html(html);
	});
    }
   /*  function dianming(){
    	$.post("show/rondom",{},function(data){
    		alert("111111");
    	});
    }; */
    function lishi(){
    	window.location.href("show/lishi");
    }
    </script>
  </body>
</html>
