<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en" class="no-js">

<head>

<meta charset="utf-8">
<title>html5响应式后台登录界面模板</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- CSS -->

<link rel="stylesheet" href="css/supersized.css">
<link rel="stylesheet" href="css/login.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="style/alogin.css" rel="stylesheet" type="text/css" />
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
	<script src="js/html5.js"></script>
<![endif]-->
<script src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/jquery.form.js"></script>
<script type="text/javascript" src="js/tooltips.js"></script>
<!-- <script type="text/javascript" src="js/login.js"></script> -->
<script type="text/javascript">
	function loadimage(){
		document.getElementById("randImage").src="images/image.jsp?"+Math.random();
	}
</script>
</head>

<body>

<div class="page-container">
	<div class="main_box">
		<div class="login_box">
			<div class="login_logo">
				<img src="images/logo.png" >
			</div>
		
			<div class="login_form">
				<form id="form1" name="form1" action="user?action=login" method="post">
					<div class="form-group">
						<label for="j_username" class="t">用户名：</label> 
						<input id="userName" name="userName" type="text"  value="${userName }" class="form-control x319 in" autocomplete="off">
					</div>
					<div class="form-group">
						<label for="j_password" class="t">密　码：</label> 
						<input id="password" name="password" type="password" value="${password }" 
						class="password form-control x319 in">
					</div>
					<div class="form-group">
						<label for="j_captcha" class="t">验证码：</label>
						 <input type="text" value="${imageCode }" name="imageCode" id="imageCode" size="10" onkeydown= "if(event.keyCode==13)form1.submit()"/>&nbsp;<img onclick="javascript:loadimage();"  title="换一张试试" name="randImage" id="randImage" src="images/image.jsp" width="60" height="20" border="1" align="absmiddle" class="form-control x164 in">
						<!-- <img id="captcha_img" alt="点击更换" title="点击更换" src="images/captcha.jpeg" class="m"> -->
					</div>
					<div class="form-group">
						<label class="t"></label>
						<label for="j_remember" class="m">
						<input id="j_remember" type="checkbox" value="true">&nbsp;记住登陆账号!</label>
					</div>
					<div class="form-group space">
						<label class="t"></label>　　　
						<button type="button"  id="submit_btn" 
						class="btn btn-primary btn-lg" onclick="javascript:document.getElementById('form1').submit()">&nbsp;登&nbsp;录&nbsp </button></span>&nbsp;&nbsp;<span ><font color="red">${error }</font></span>
						<input type="reset" value="&nbsp;重&nbsp;置&nbsp;" class="btn btn-default btn-lg">
					</div>
				</form>
			</div>
		</div>
		
	</div>
</div>

<!-- Javascript -->

<script src="js/supersized.3.2.7.min.js"></script>
<script src="js/supersized-init.js"></script>
<script src="js/scripts.js"></script>
<div style="text-align:center;">
<p>来源:<a href="http://www.mycodes.net/" target="_blank">源码之家</a></p>
</div>
</body>
</html>
