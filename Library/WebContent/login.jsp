<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="style/alogin.css" rel="stylesheet" type="text/css" />
<title>用户登录</title>
<script type="text/javascript">
	function loadimage(){
		document.getElementById("randImage").src="images/image.jsp?"+Math.random();
	}
	function youke(){
		alert("游客登录：用户名：test；密码：1");
	}
</script>
</head>
<body>
<form id="form1" name="form1" action="user?action=login" method="post">
	<div class="ulogin">
			
		<ul>
			<li>
			<span style="height:180px ;width:270px; text-align:center; line-height:180px"><font size="8" color="blue">安绚图书馆</font></span>
			</li>
			
			<li >
			<ul class="login">
				<li><span >用户名：</span> <span style=""> <input id="userName" name="userName" type="text" class="txt" value="${userName }" /> </span></li>
				<li><span >密&nbsp;&nbsp;&nbsp;码：</span> <span style=""> <input id="password" name="password" type="password" class="txt" value="${password }" onkeydown= "if(event.keyCode==13)form1.submit()"/> </span></li>
				<li><span >验证码：</span> <span style=""> <input type="text" value="${imageCode }" name="imageCode"  class="txtCode" id="imageCode" size="10" onkeydown= "if(event.keyCode==13)form1.submit()"/>&nbsp;<img onclick="javascript:loadimage();"  title="换一张试试" name="randImage" id="randImage" src="images/image.jsp" width="60" height="20" border="1" align="absmiddle"> </span></li>
			</ul>
			</li>
			<li ></li>
			<li ></li>
			<li ></li>
			<br>
			<br>
			<br>
			
			<li ><span class="btn"> <img alt="" src="images/login/btnlogin.gif" 
onclick="javascript:document.getElementById('form1').submit()"/> </span>&nbsp;&nbsp;<span ><font color="red">${error }</font></span>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:youke();">获取游客登录信息</a></li>	
	
		</ul>

	</div>
</form>
</body>
</html>