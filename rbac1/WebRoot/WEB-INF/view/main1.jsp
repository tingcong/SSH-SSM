<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 5 Transitional//EN">

<html>
<head>
<title>安绚图书系统</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<!--解决了ie兼容问题  -->
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="0">

<link type="text/css" rel="stylesheet" href="<%=path%>/css/style.css" />
<link type="text/css" rel="stylesheet" href="<%=path%>/css/HomePage.css" />
<script src="<%=path%>/js/jquery-1.9.1.js"></script>
<script src="<%=path%>/echars/echarts.min.js"></script>
<script src="<%=path%>/js/menu.js"></script>

<link href="<%=path%>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="<%=path%>/bootstrap/table/bootstrap-table.css">
	
<script src="<%=path%>/js/jquery-2.1.1.js"></script>

<script src="<%=path%>/bootstrap/js/bootstrap.min.js"></script>

<script src="<%=path%>/bootstrap/table/bootstrap-table.js"></script>
<script src="<%=path%>/bootstrap/jquery-tabledit/jquery.tabledit.js"></script>

<script src="<%=path%>/bootstrap/table/locale/bootstrap-table-zh-CN.js"></script>


</head>

<body>
	<div class="top"></div>
	<div id="header">
		<div class="logo">安绚图书系统</div>
		<div class="navigation">
			<ul >
				<li><a>欢迎您：${userName}&nbsp;，所在组： </a></li>
				<li><a href="">修改密码</a></li>
				<li><a href="">设置</a></li>
				<li><a style="cursor:pointer" onclick="quit();">退出</a></li>
			</ul>
		</div>
	</div>
	<div id="content">
		<div class="left_menu">
			<ul id="nav_dot">
				<li>
					<h4 class="M1">
						<span></span>系统公告
					</h4>
					<div class="list-item none">
						<a style="cursor:pointer" onclick="showInfo();">简介</a> <a
							style="cursor:pointer" onclick="showUser();">公告</a> 
					</div>
				</li>

				<li>
					<h4 class="M2">
						<span></span>我的图书
					</h4>
					<div class="list-item none">
						<a style="cursor:pointer" onclick="showBook();">已借阅</a> 
						<a style="cursor:pointer" onclick="showInfo();">借书</a>
						<a style="cursor:pointer" onclick="showInfo();">还书</a>
					</div>
				</li>
				<li id="aaa">
					<h4 class="M3">
						<span></span>系统管理
					</h4>
					<div class="list-item none">
						<a style="cursor:pointer" onclick="showUser();">用户管理</a> <a
							style="cursor:pointer" onclick="showPms();">权限管理</a> <a
							style="cursor:pointer" onclick="showInfo();">图书管理</a>
							<a style="cursor:pointer" onclick="notice();">发布公告</a>
					</div>
				</li>
				<li>
					<h4 class="M10">
						<span></span>个人信息
					</h4>
					<div class="list-item none">
						<a style="cursor:pointer" onclick="alert('${userName}');">信息修改</a>
						<a href=''>密码修改</a>
					</div>

				</li>

				<li>
					<h4 class="M9">
						<span></span>常见问题
					</h4>
					<div class="list-item none">
						<a style="cursor:pointer" onclick="showInfo();">类型一</a>
						<a style="cursor:pointer" onclick="showInfo();">类型二</a>
						<a style="cursor:pointer" onclick="showInfo();">类型三</a>
					</div>
				</li>
			</ul>
		</div>
		
<div></div>
			<div class="main"  >
			<div id="main" style="width: 600px;height:400px;"></div>
			
				<div id="show" style="margin: auto 150px auto auto; "></div>
		</div>
		</div>

	<div class="bottom"></div>
	<div id="footer">
		<p>by han</p>
	</div>

	<script>
		navList(12);
		start();
		//$("#show").load("<%=path%>/home/user"); 
		function showUser() {
			$("#main").hide();
			$("#show").load("<%=path%>/home/user"); 
			
		}
		function showBook() {
			$("#main").hide();
			$("#show").load("<%=path%>/home/book");
		}
		function notice() {
			$("#main").hide();
			$("#show").load("<%=path%>/home/notice");
		}

		function showInfo() {
			$("#main").hide();
			//$("#show").ready(function(){
				//window.navigate("index.jsp");
				/* alert("返回");
				window.history.back(-1); */
				$("#show").load("<%=path%>/home/info");
			//});

		}
		function showPms() {
			$("#main").hide();
				$("#show").load("<%=path%>/home/pms");

		}
		var dialog1;
		function quit() {
			var data = '<html><body><div class="user">用户名<br> <input class="input" type="text" id="user"></div><div class="pwd">密码<br> <input class="input" type="password" id="pwd"></div><div class="login"><input class="but" type="button" value="登录" onclick="login();"></div></body></html>';
			dialog1 = art.dialog({
				content : data,
				id : 'N3690',
				title : '请重新登录！',
				lock : true,
				background : '#333',
				opacity : 0.40
			});

			$.ajax({
				url : url,
				success : function(data) {
					login();//这里使用服务端返回的数据填充这个窗口，这里服务端返回了一个页面
				},
				cache : false
			});

		}

		function login() {
			alert($("#user").val() + "..." + $("#pwd").val()),
					art.dialog.list['N3690'].close(), //关闭弹窗
					location.reload([ "<%=path%>/home/main" ]);
		}

		function start() {
			if ('${userName}' == "游客") {
				$("#aaa").hide();
			}
		}
		
		var myChart = echarts.init(document.getElementById('main'));

        // 指定图表的配置项和数据
        var option = {
            title: {
                text: 'ECharts 入门示例'
            },
            tooltip: {},
            legend: {
                data:['销量']
            },
            xAxis: {
                data: ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
            },
            yAxis: {},
            series: [{
                name: '销量',
                type: 'bar',
                data: [5, 20, 36, 10, 10, 20]
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
	</script>
</body>
</html>
