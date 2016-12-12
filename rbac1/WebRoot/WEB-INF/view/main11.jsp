<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 5 Transitional//EN">
<html>
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<title>安绚图书系统</title>
<%-- <%if(session.getAttribute("currentUser")==null){
	   response.sendRedirect("/rbac1");
		return ;
	} %> --%>
<link rel="stylesheet" href="<%=path%>/css/home.css">
<link rel="stylesheet" href="<%=path%>/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=path%>/bootstrap/css/bootstrap-addtabs.css">
	<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script src="<%=path%>/js/jquery-2.1.1.js"></script>

<script src="<%=path%>/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=path%>/bootstrap/js/bootstrap-addtabs.js"></script>
<script src="<%=path%>/bootstrap/js/bootstrap-treeview.min.js"></script>

</head>


<body onload="showtime()">
	<div class="dtop">

		<div id="carousel-example-generic" class="carousel slide"
			data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			</ol>
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="../img/a.jpg" alt="..."
						style="width: 100%;height: 160px;">
					
				</div>
				<div class="item">
					<img src="../img/b.jpg" alt="..."
						style="width: 100%;height: 160px;">
					
				</div>
				<div class="item">
					<img src="../img/c.jpg" alt="..."
						style="width: 100%;height: 160px;">
					
				</div>
			</div>
			<div class="carousel-caption">
						<span style="font-size: 60px;">安绚图书系统</span>
					</div>
		</div>
		
	</div>

	<div class="dbody">
		<div class="dmenu">
			<header class="topbar admin-header">
			<ul class="nav nav-pills nav-stacked ">
				<li class="active"><a style="cursor:pointer" id="home"><span
						class="glyphicon glyphicon-home one"></span> Home</a></li>
				<li id="xtxx"><a data-toggle="collapse" href="#nt"><span
						class="glyphicon glyphicon-comment one"></span>系统信息<span
						class="glyphicon glyphicon-chevron-down one"></span></a></li>
				<div class="nav text-center" id="nt">
					<li><a  id="hhh" style="cursor:pointer" data-addtab="mail1"
						url="http://www.ax180.com/customer.html">网站简介</a></li>
					<li><a style="cursor:pointer" data-addtab="mail2" url="<%=path%>/home/nt">系统公告</a></li>
					<li><a style="cursor:pointer" data-addtab="mail3" url="<%=path%>/home/msg">我的消息</a></li>
				</div>

				<li data-toggle="collapse" href="#mbk" style="cursor:pointer" class="success"><a><span
						class="glyphicon glyphicon-book one"></span>我的图书<span
						class="glyphicon glyphicon-chevron-down one"></span></a></li>
				<div class="nav nav-pills nav-stacked text-center" id="mbk">
					<li><a data-addtab="bk" style="cursor:pointer"
						url="<%=path%>/home/book">图书借阅</a></li>
						<li><a data-addtab="hb" style="cursor:pointer"
						url="<%=path%>/home/book1">图书归还</a></li>
				</div>
				
              
				<li><a data-toggle="collapse" href="#mod" id="hidegl"><span
						class="glyphicon glyphicon-cog one"></span>系统管理<span
						class="glyphicon glyphicon-chevron-down one"></span></a></li>
				<div class="nav nav-pills nav-stacked text-center" id="mod">
					<li id="hideyh"><a style="cursor:pointer" data-addtab="user"
						url="<%=path%>/home/user">用户管理</a></li>
					<li id="hidejs"><a style="cursor:pointer" data-addtab="pms"
						url="<%=path%>/home/pms">角色管理</a></li>
					<li id="hidets"><a style="cursor:pointer" data-addtab="books"
						url="<%=path%>/home/books">图书管理</a></li>
					<li id="hidegg"><a style="cursor:pointer" data-addtab="notice"
						url="<%=path%>/home/notice">发布公告</a></li>
				</div>
            
				<li id="cjwt"><a data-toggle="collapse" href="#qus"><span
						class="glyphicon glyphicon-question-sign one"></span>常见问题<span
						class="glyphicon glyphicon-chevron-down one"></span></a></li>
				<div class="nav nav-pills nav-stacked text-center" id="qus">
					<li><a style="cursor:pointer" data-addtab="user" url="<%=path%>/home/quest">类型一</a></li>
					<li><a style="cursor:pointer" data-addtab="user" url="<%=path%>/home/quest">类型二</a></li>
				</div>
				
			</ul>
			<div id="tree"></div>
			</header>
			<div class="info">
				<div class="dhead">
					<img alt="" src="../img/head.jpg" style="width: 100%"
						;height="100%;">
				</div>
				<div style="margin: -70px auto auto 90px;font-size: 17px;">欢  迎:  ${userName }</div>
				<div style="margin: 0px auto auto 90px;font-size: 17px;">身 份: <span id="rn"></span>
				</div>
				<div style="margin: 0px auto auto 90px;font-size: 17px;">
					时 间: <span id="clock"></span>
				</div>
				<div>
					<button type="button" class="btn btn-success"
						style="margin-left: 0" id="xiugai">修改密码</button>
					<button type="button" class="btn btn-success"
						style="margin-left: 105px;" id="quit">退出</button>
				</div>

				<div></div>
			</div>

		</div>


		<div class="dright" id="show">
			<div id="tabs">

				<!-- Nav tabs -->
				<ul class="nav nav-tabs " role="tablist"
					style="background-color: black;font-weight: 900;">
					
				</ul>
				
				<!-- Tab panes -->
				<div class="tab-content tab">
				
				</div>
			</div>


		</div>

	</div>





	<div class="modal fade" id="mymod" tabindex="-1" role="dialog"
		aria-labelledby="myModal">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModal"></h4>
				</div>
				<div class="modal-body">



					<div class="form-group">
						<label>用户名</label> <a placeholder="用户名" class="form-control"
							id="user_Name">${userName}</a>
					</div>
					<div class="form-group">
						<label>新密码</label> <input type="text" class="form-control"
							id="user_pwd" placeholder="密码">
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
						</button>
						<button type="button" id="user_save" class="btn btn-primary"
							onclick="save();">
							<span class="glyphicon glyphicon-floppy-disk" aria-hiddewwzzzn="true"></span>保存
						</button>
					</div>
				</div>
			</div>
		</div>
	

	<script type="text/javascript">
var uname = "${userName}";
	$("#quit").click(function(){		
		
		window.location.href = "<%=path%>";
	});
$("#home").click(function(){		
		
		window.location.href = "<%=path%>/home/main";
	});

	//查询roleName
	$(function(){
		$.post("<%=path%>/home/getRoleName",{
			userName:"${userName}"
		},function(data){	
			
			var res = $.parseJSON(data);
		if(res==""){
				 $("#rn").append("游客");
					//$("#mbk").hide();
					//$("#hidegl").hide();
					//$("#mod").hide(); 
			} 
			var rn = res[0].roleName;				
			$("#rn").append(res[0].roleName);
			if(rn=="管理员")
				$("#hidegg").show();

	/* 		if(rn=="普通用户"||rn=="高级用户"){
				$("#hidegl").hide();
				$("#mod").hide();
			}
			if(rn=="经理"){
				$("#hideqx").hide();
				$("#hidegg").hide();
			} */
			/* if(res==undefine){
				 $("#rn").append("游客");
				//$("#mbk").hide();
				$("#hidegl").hide();
				$("#mod").hide(); 
			}  */
		});	
	});
	$(function(){
		$("#hideyh").hide();
		
			$("#hidejs").hide();
		
			$("#hidets").hide();
		
			$("#mbk").hide();
		
			$("#xtxx").hide();
			$("#cjwt").hide();
			$("#hidegg").hide();
			$("#hidegl").hide();
		$.post("<%=path%>/home/getPmsId",{
			userName:"${userName}"
		},function(data){
			var res = $.parseJSON(data);
			$.each(res,function(i,n){
				if(n==1){
					$("#hidegl").show();
					$("#hideyh").show();
				//$("#hidegg").show();
				}
				if(n==2){
					$("#hidegl").show();
					$("#hidejs").show();
				//$("#hidegg").show();
				}
					
				if(n==3){
					$("#hidegl").show();
					$("#hidets").show();
				//$("#hidegg").show();
				}
					
				if(n==4)
					$("#mbk").show();
				if(n==5){
					$("#xtxx").show();
					$("#cjwt").show();
				}
					
					
				//alert(n);
			});
		});
	});
	
	$(function () {
		
		$('#myTab a:last').tab('show');
		
	})
		$("#xiugai").click(function() {
			$("#myModal").text("密码修改");
			$('#mymod').modal();
		});
       function save(){	
			$.post('<%=path%>/home/xiu',{		
				userName : '${userName}',
				userPwd :  $("#user_pwd").val()
			},function(data){				
				alert("保存成功");
				$('#user_table').bootstrapTable("refresh");
				$('#user_table').bootstrapTable("resetView");
				$('#mymod').modal('hide');
			});
		}
       
       
		$(function() {
			$('#tabs').addtabs({
				monitor : '.topbar'
			});
			
			Addtabs.add({
				id : $("hhh").attr('addtabs'),
				title : "数据分析",
				content : $(this).attr('content'),
				url:"ana",
				ajax : $(this).attr('ajax') ? true : false
			});
			
			/* Addtabs.add({
				id : $("hhh").attr('addtabs'),
				title : $(this).attr('title'),
				content : $(this).attr('content'),
				url:"http//www.baidu.com",
				ajax : $(this).attr('ajax') ? true : false
			}) */
			

		});

		function realSysTime(clock) {
			var now = new Date(); //创建Date对象 
			//var year=now.getFullYear(); //获取年份 
			//var month=now.getMonth(); //获取月份 
			//var date=now.getDate(); //获取日期 
			//var day=now.getDay(); //获取星期 
			var hour = now.getHours(); //获取小时 
			var minu = now.getMinutes(); //获取分钟 
			var sec = now.getSeconds(); //获取秒钟 
			//month=month+1; 
			//var arr_week=new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六"); 
			//var week=arr_week[day]; //获取中文的星期 
			//var time=year+"年"+month+"月"+date+"日 "+week+" "+hour+":"+minu+":"+sec; //组合系统时间 
			time = hour + ":" + minu + ":" + sec; //组合系统时间

			clock.innerHTML = time; //显示系统时间

		}
		window.onload = function() {
			window.setInterval("realSysTime(clock)", 1000); //实时获取并显示系统时间 
		};

	</script>
</body>
</html>
