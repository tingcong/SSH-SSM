<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 5 Transitional//EN">
<html>
<head>
<title>安绚图书系统</title>
<script type="text/javascript" src="<%=path%>/js/jquery-1.9.1.js"></script>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/HomePage.css">

</head>

<body>
<body class="bg">
	<div class="f">
		<div class="logo1"></div>
		<div class="huanying">安绚图书系统</div>
		<div class="user">
			用户名<br> <input class="input" type="text" id="user"
				onblur="checkName();" placeholder="请输入用户名">
			<div id="name_exist">
				<a style="color:red;font-size: 15px;float:right;font-weight: 200;">用户名已存在!</a>
			</div>
			<div id="name_empty">
				<a style="color:red;font-size: 15px;float:right;font-weight: 200;">用户名不能为空!</a>
			</div>
		</div>

		<div class="pwd">
			密码<br> <input class="input" type="password" id="pwd"
				onblur="check_pwd();" placeholder="请输入密码">
			<div id="pwd_empty">
				<a style="color:red;font-size: 15px;float:right;font-weight: 200;">密码不能为空!</a>
			</div>

		</div>
		<div class="login" id="reg1">
			<input class="but" type="button" value="注册" onclick="reg();">
		</div>
		<div class="reg" id="log2">
			<a href="<%=path%>"
				style="cursor:pointer;color: #3CC3F5;font-weight: 300;">登录</a>
		</div>
		<div class="adl">
			<a style="cursor:pointer;color: #3CC3F5" onclick="visitor();">游客进入</a>
		</div>




	</div>

	<script>
		$("#name_exist").hide();
		$("#name_empty").hide();
		$("#pwd_empty").hide();
		var res;
		//检查用户名是否存在
		function checkName() {
			$.post("<%=path%>/home/check", {
				biz : "checkName",
				userName : $("#user").val(),
				pwd : $("#pwd").val()
			}, function(data) {
				res = data;
				if ($("#user").val() == "") {
					$("#name_empty").show();
				} else
					$("#name_empty").hide();
				if (data == "yes") {
					$("#name_exist").hide();
				}
				if (data == "no") {
					$("#name_exist").show();
				}
			});
		}
		function check_pwd() {

			
			if($("#pwd").val()==""){
			$("#pwd_empty").show();
			}
			else
				$("#pwd_empty").hide();		

		}
		//注册
		function reg() {
			if (res == "yes" && $("#user").val() != "") {
				reg1();
				alert("注册成功~");
			}
		}
		function reg1() {
			$.post("<%=path%>/home/userReg", {
				userName : $("#user").val(),
				pwd : $("#pwd").val()
			}, function() {
			});
		}

		function checkPwd() {

		}
		function userlogin() {
			$.post("<%=path%>/home/savaName", {
				biz : "savaName",
				userName : $("#user").val()
			}, function(data) {
				//alert(userName);
				window.location.href = "home/main";
				cache: false;
			});

			/* alert($("#user").val());
			$.cookie("name", $("#user").val());
			alert($.cookie("name"));
			window.location.href="home/main"; */
		}

		function change1() {
			$("#reg1").show();
			$("#log1").hide();
			$("#log2").show();
			$("#reg2").hide();
		}
		function change2() {
			$("#reg2").show();
			$("#log2").hide();
			$("#log1").show();
			$("#reg1").hide();
		}
		function visitor() {
			$.post("<%=path%>/home/showName", {
				userName : "游客"
			}, function(data) {
				//alert(userName);
				window.location.href = "<%=path %>/home/main";

			});
		}
	</script>
</body>
</html>
