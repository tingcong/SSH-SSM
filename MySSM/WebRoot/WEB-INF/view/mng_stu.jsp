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
<title>My JSP 'mng_stu.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<!-- table控件 -->
<link href="css/bootstrap/bootstrap-table.css" rel="stylesheet">
<!-- styles.css -->
<link rel="stylesheet" href="css/styles.css">
</head>

<body>
	<div class="container">
		<!-- 标题 -->
		<div class="page-header">
			<h3>潜在学员管理</h3>
			<h5>登录用户:${cookie.username.value }</h5>
		</div>
		<!-- 工具条 -->
		<div class="btn-group">
			<button type="button" class="btn btn-default" onclick="toLogin();">
				<span class="glyphicon glyphicon-chevron-left"></span>重新登录
			</button>
		</div>
		<div class="btn-group">
			<button type="button" class="btn btn-default" onclick="toAddStu();">
				<span class="glyphicon glyphicon-plus"></span> 新增
			</button>
			<button type="button" class="btn btn-default" onclick="toUpStu();">
				<span class="glyphicon glyphicon-edit"></span>修改
			</button>
			<button type="button" class="btn btn-default"
				onclick="if(confirm('确定删除吗?')){delStu();}">
				<span class="glyphicon glyphicon-minus"></span>删除
			</button>
		</div>
		<div class="btn-group">
			<button type="button" class="btn btn-default" onclick="toPlan( );">
				<span class="glyphicon glyphicon-indent-left"></span>咨询计划
			</button>
			<button type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-indent-right"></span>咨询日志
			</button>
			<button type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-pencil"></span>转为学员
			</button>
		</div>
		<!-- 学员表 -->
		<table id="tbstu" class="table table-striped">
		</table>
	</div>
	<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	<script src="js/jquery-1.9.1.min.js"></script>
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="js/bootstrap.min.js"></script>
	<!-- cookie操作 -->
	<script src="js/jquery.cookies.2.2.0.min.js"></script>
	<!-- table控件 -->
	<script src="js/bootstrap-table.min.js"></script>
	<script src="js/bootstrap-table-zh-CN.min.js"></script>
	<script>
		//获取选中行id数组
		function getIdArr() {
			var rows = $("#tbstu").bootstrapTable("getSelections");
			var row_ids = [];
			$.each(rows, function(i, n) {
				row_ids.push(n.id);
			});
			return row_ids;
		}

		//修改学生
		function toUpStu() {
			var row_ids = getIdArr();
			if (row_ids.length != 1) {
				alert("请选中单行修改");
				return;
			}
			location.href = "/MySSM/mng_stu/up?id=" + row_ids[0];
		}

		//删除学生
		function delStu() {
			var row_ids = getIdArr();
			if (row_ids.length < 1) {
				alert("请至少选择一行");
				return;
			}
			//请求删除
			$.post("mng_stu/cmtdel", {
				ids : row_ids.toString()
			}, function(data) {
				var res = $.parseJSON(data);
				if (res == "ok") {
					alert("删除成功");
					$("#tbstu").bootstrapTable("refresh");
				}
			});

		}

		//转到新增学生
		function toAddStu() {
			location.href = "/MySSM/mng_stu/add";
		}

		//显示学生表
		$('#tbstu').bootstrapTable({
			url : "mng_stu/view",
			cache : false,
			pagination : true,
			search : true,
			showColumns : true,
			columns : [ {
				field : "opr",
				checkbox : true
			}, {
				field : "id",
				title : "序号"
			}, {
				field : "name",
				title : "姓名"
			}, {
				field : "mobile",
				title : "手机号"
			}, {
				field : "email",
				title : "邮箱"
			}, {
				field : "qq",
				title : "QQ"
			}, {
				field : "channel",
				title : "渠道"
			}, {
				field : "msgsrc",
				title : "信息来源"
			}, {
				field : "school",
				title : "学校"
			}, {
				field : "major",
				title : "专业"
			}, {
				field : "grade",
				title : "年级"
			}, {
				field : "clazz",
				title : "班级"
			}, {
				field : "intention",
				title : "培训意向"
			}, {
				field : "createtime",
				title : "录入时间"
			}, {
				field : "creator",
				title : "录入人员"
			} ]
		});

		//重新登录
		function toLogin() {
			location.href = "/MySSM/login/form";
		}
		function toPlan(){
			
		}
	</script>
</body>
</html>
