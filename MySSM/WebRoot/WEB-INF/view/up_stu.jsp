<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>My JSP 'up_stu.jsp' starting page</title>

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
			<div class="col-md-4 col-md-offset-4 page-header">
				<h3>潜在学员更新</h3>
				<h5>登录用户:${cookie.username.value }</h5>
			</div>
		</div>
		<!-- 工具条 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-4 btn-group">
				<button type="button" class="btn btn-default" onclick="toMngStu();">
					<span class="glyphicon glyphicon-chevron-left"></span>返回
				</button>
				<button type="button" class="btn btn-default" onclick="clearAll();">
					<span class="glyphicon glyphicon-off"></span>重置
				</button>
				<button type="button" class="btn btn-default" onclick="commit();">
					<span class="glyphicon glyphicon-ok"></span>提交更新
				</button>
			</div>
		</div>
		<!-- 录入信息 -->
		<div class="row">
			<div class="col-md-3 col-md-offset-4">
				<h4>必填信息</h4>
				<input id="name" class="form-control" type="text"
					placeholder="采集学员姓名" value="${stu.name}" /> <input id="mobile"
					class="form-control" type="text" placeholder="采集学员手机"
					value="${stu.mobile}" /> <select class="form-control" id="channel"></select>
				<select class="form-control" id="intent"></select>
				<h4>其他信息</h4>
				<input id="email" class="form-control" type="text"
					placeholder="email" value="${stu.email}" /> <input id="qq"
					class="form-control" type="text" placeholder="QQ" value="${stu.qq}" />
				<select class="form-control" id="msgsrc"></select> <input
					id="school" class="form-control" type="text" placeholder="院校"
					value="${stu.school}" /> <input id="major" class="form-control"
					type="text" placeholder="专业" value="${stu.major}" /> <select
					class="form-control" id="grade"></select> <input
					class="form-control" id="clazz" type="text" placeholder="班级"
					value="${stu.clazz}" />
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
		//提交更新
		function commit() {
			//有效性验证
			if (!isValid())
				return;
			//提交数据
			$.post("mng_stu/cmtup", {
				id : "${stu.id}",
				name : $.trim($("#name").val()),
				mobile : $.trim($("#mobile").val()),
				email : $.trim($("#email").val()),
				qq : $.trim($("#qq").val()),
				channel : $.trim($("#channel").val()),
				msgsrc : $.trim($("#msgsrc").val()),
				school : $.trim($("#school").val()),
				major : $.trim($("#major").val()),
				grade : $.trim($("#grade").val()),
				clazz : $.trim($("#clazz").val()),
				intention : $.trim($("#intent").val())
			}, function(data) {
				var res = $.parseJSON(data);
				if (res == "ok") {
					alert("更新成功");
				}
			});
		}

		//有效性验证
		function isValid() {
			var name = $.trim($("#name").val());
			var mobile = $.trim($("#mobile").val());
			if (name == "") {
				alert("姓名必填");
				return false;
			}
			if (mobile == "") {
				alert("手机号必填");
				return false;
			}
			return true;
		}

		//清空/重置
		function clearAll() {
			location.href = "/MySSM/mng_stu/add";
		}

		//返回潜在学员管理
		function toMngStu() {
			location.href = "/MySSM/login/mng_stu";
		}

		//绑定招生渠道下拉
		var data_channel = [ "校招", "社招" ];
		$.each(data_channel, function(i, n) {
			$("#channel").append("<option>" + n + "</option>");
		});
		$("#channel").val("${stu.channel}");

		//绑定意向等级下拉
		var data_intent = [ "#A", "#B", "#C", "#D" ];
		$.each(data_intent, function(i, n) {
			$("#intent").append("<option>" + n + "</option>");
		});
		$("#intent").val("${stu.intention}");

		//绑定信息来源下拉
		var data_msgsrc = [ "baidu", "报刊", "宣讲", "其他" ];
		$.each(data_msgsrc, function(i, n) {
			$("#msgsrc").append("<option>" + n + "</option>");
		});
		$("#msgsrc").val("${stu.msgsrc}");

		//绑定年级下拉
		var data_grade = [ "本五", "本四", "本三", "本二", "本一", "专四", "专三", "专二",
				"专一", "研三", "研二", "研一", "高中", "中专", "已工作" ];
		$.each(data_grade, function(i, n) {
			$("#grade").append("<option>" + n + "</option>");
		});
		$("#grade").val("${stu.grade}");
	</script>
</body>
</html>
