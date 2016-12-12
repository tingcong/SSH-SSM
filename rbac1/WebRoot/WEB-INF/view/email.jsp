<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>My JSP 'email.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="<%=path%>/js/jquery-1.9.1.js"></script>
    <script id="container" name="content" type="text/plain"></script>
    <!-- 配置文件 -->
    <script type="text/javascript" src="<%=path%>/ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="<%=path%>/ueditor/ueditor.all.js"></script>
    <!-- 实例化编辑器 -->

 <script type="text/javascript">
   function email(){
	   
	$.post("<%=path%>/home/email",
		{
		youxiang: $("#youxiang").val(),
		biaoti: $("#biaoti").val(),
		neirong: $("#biaoti").val()
	},function(data){
		if(data=="3"){
			alert("邮箱格式不正确");
		}
		if(data=="1")
		alert("发送成功！");
		else
		alert("发送失败！")
	}); 
	
	 
	 
   }
    
    </script>
  </head>
  
  <body style="width:100%; height:900px; background-image:url('../img/email.jpg');overflow: auto;background-size:100% 100%;background-repeat: no-repeat;">
    
    <br>
    <br>
 	<font color="black" size="5">输入邮箱:</font><input type="text" id="youxiang"/>
    <br>
    <br>
    <font color="black" size="5">输入标题:</font><input type="text" id="biaoti"/>
    <br>
    <br>
    <font color="black" size="5">输入内容:</font>
    <div id="neirong" style="width:500px;height:200px;"></div>
    <!-- <textarea id="neirong" rows="5" cols="50"></textarea> -->
    <br>
    <br>
    	<input type="button" value="发送" onclick="email();"/>
   
   <div id="ss"></div>
 
    <script type="text/javascript">
        var ue = UE.getEditor('neirong',{toolbars: [[
       'fullscreen', 'source', 'forecolor', 'inserttable', 'fontfamily','simpleupload','emotion'
       ]]});
        </script>
  </body>
</html>
