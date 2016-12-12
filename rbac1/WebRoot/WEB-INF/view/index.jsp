<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	session.invalidate();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 5 Transitional//EN">
<html>
<head>
<title>安绚图书系统</title>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script src="js/jquery.cookie.js"></script>
<link rel="stylesheet" type="text/css" href="css/HomePage.css">

</head>


<body class="bg">
	<div class="f">
		<div class="logo1"></div>
		<div class="huanying">安绚图书系统</div>
		<div class="user">
			用户名<br> <input class="input" type="text" id="user" placeholder="请输入用户名">
		</div>
		<div class="pwd">
			密码<br> <input class="input" type="password" id="pwd" placeholder="请输入密码">
		</div>
		<div class="login">
			<input class="but" type="button" value="登录" onclick="login();">
		</div>
		<div class="reg">
			<a href="<%=path%>/home/reg"
				style="cursor:pointer;color: #3CC3F5;font-weight: 300;">注册</a>
		</div>
		<div class="adl">
			<a style="cursor:pointer;color: #3CC3F5" onclick="visitor();">游客进入</a>
		</div>
	</div>

	<script>
		var res;

		function login() {
			$.post("home/login", {
				userName : $("#user").val(),
				pwd : $("#pwd").val()
			}, function(data) {
				if (data == "error") {
					alert("用户名/密码错误...");
				} else {
					showName();
					
					window.location.href = "home/main";
				}
			});

			/* alert($("#user").val());
			$.cookie("name", $("#user").val());
			alert($.cookie("name"));
			window.location.href="home/main"; */
		}

		function showName() {
			$.post("home/showName", {
				userName : $("#user").val()
			}, function(data) {
				//alert(userName);
				window.location.href = "home/main";

			});
		}
		
		
		
		function visitor(){
			$.post("home/showName", {
				userName : "游客"
			}, function(data) {
				//alert(userName);
				window.location.href = "home/main";

			});
		}
	</script>
</body>
</html>
