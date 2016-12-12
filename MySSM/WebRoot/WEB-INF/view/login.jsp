<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<title>My JSP 'login.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<!-- styles.css -->
<link rel="stylesheet" href="css/styles.css">
</head>

<body>
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-3 col-md-offset-4 page-header">
				<h3>学员信息采集管理系统</h3>
			</div>
		</div>
		<!-- 登陆表单 -->
		<div class="row">
			<div class="col-md-3 col-md-offset-4 page-header">
				用户名 <input id="username" type="text" class="form-control"
					placeholder="请输入用户名" />密码 <input id="password" type="password"
					class="form-control" placeholder="请输入密码" />
				<button class="btn btn-link">用户注册</button>
				<button class="btn btn-primary btn-block" onclick="confirm();">登录</button>
			</div>
		</div>
	</div>
	<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	<script src="js/jquery-1.9.1.min.js"></script>
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="js/bootstrap.min.js"></script>
	<!-- cookie操作 -->
	<script src="js/jquery.cookies.2.2.0.min.js"></script>
	<script>
		//确认登陆
		function confirm() {
			var username = $.trim($("#username").val());
			var password = $.trim($("#password").val());
			if (username == "" || password == "") {
				alert("用户名/密码不能为空");
				return;
			}

			$.post("login/confirm", {
				username : username,
				password : password
			}, function(data) {
				if ($.trim(data) == "") {
					alert("用户信息错误");
					return;
				}
				//username存入cookie
				$.cookies.set("username", username);
				location.href = "/MySSM/login/mng_stu";
			});
		}
	</script>
</body>
</html>
