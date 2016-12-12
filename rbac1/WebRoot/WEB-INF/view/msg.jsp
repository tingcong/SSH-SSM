<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
	String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 5 Transitional//EN">
<html>
<head>

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="<%=path%>/bootstrap/css/bootstrap.min.css">
<script src="<%=path%>/js/jquery-2.1.1.js"></script>
<script src="<%=path%>/bootstrap/js/bootstrap.min.js"></script>
<!-- UE配置文件 -->
<script  src="<%=path%>/ueditor/ueditor.config.js"></script>
<!-- UE源码文件 -->
<script src="<%=path%>/ueditor/ueditor.all.js"></script>

</head>

<body style="width:100%; height:900px; background-color:#FAFAD2;overflow: auto;background-size:100% 100%;background-repeat: no-repeat;">
<div style="margin-left: 20%" align="center">
<ul class="nav nav-pills">
    <li class="active">
        <a>我的消息 </a>
    </li>
    <li>
        <a href="#">新消息 <span class="badge">3</span></a>
    </li>
    <li>
        <a href="#">已读消息</a>
    </li>
    <li>
        <a href="#">所有消息</a>
    </li>
    <li>
        <a href="#">新建消息</a>
    </li>
</ul>
<br>
</div>
<div style="width:300px;height:500px ;float: left;border:1px solid; ">
</div>

<!-- 发送框 -->
<div id="kuang" style="margin: auto auto auto 200px;">
   <form class="form-horizontal" role="form">
    <div class="form-group" >
    <label for="firstname" class="col-sm-2 control-label">发送至:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="user" placeholder="用户名" style="width:300px;" onblur="checkName();">
            <button class="btn btn-default" id="select1">选择用户</button>
    </div>
  </div>
  <div class="form-group" >
    <label for="firstname" class="col-sm-2 control-label">标题:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="tt" placeholder="请输入标题" style="width:77%;">
    </div>
  </div>
  
  <div class="form-group">
    <label for="lastname" class="col-sm-2 control-label">内容:</label>
    <div class="col-sm-10" id="ctt" style="width:80%;height:350px ">
    </div>
  </div>
  <div class="form-group" id="send">
    <div class="col-sm-offset-5 col-sm-5">
      <button type="submit" class="btn btn-default" onclick="send();">发送</button>
      <button type="submit" class="btn btn-default" onclick="quxiao();">取消</button>
    </div>
  </div>
  
</form>
</div>

	<script type="text/javascript">
	
	function send(){
		$.post("<%=path%>/home/send",{
			userName:$("#user").val(),
			tt:$("#tt").val(),
			ctt:ue.getContent(),
			sender:"${userName}",
		},function(data){
			alert(data);
		});
	}
	$("#select1").click(function () {
        $("#myModalLabel").text("选择用户");
        $('#myModal').modal();
    });
	var bar = {
			toolbars : [ [ 'attachment',
			               'link',
			               'simpleupload', 
			               'emotion',
			               'inserttitle',
			               'cleardoc',
			               'justifycenter',
			               'justifyleft',
			               'imagecenter',
			               'background',
			               'lineheight',
			               'template',
			               'pagebreak',
			               
			               
			               ] ]
		};
		var ue = UE.getEditor('ctt', bar);
	</script>
</body>

</html>
