<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 5 Transitional//EN">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<!--解决了ie兼容问题  -->
<title>图书管理</title>
<link href="<%=path%>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="<%=path%>/bootstrap/table/bootstrap-table.css">
	
<script src="<%=path%>/js/jquery-2.1.1.js"></script>

<script src="<%=path%>/bootstrap/js/bootstrap.min.js"></script>

<script src="<%=path%>/bootstrap/table/bootstrap-table.js"></script>
<script src="<%=path%>/bootstrap/jquery-tabledit/jquery.tabledit.js"></script>

<script src="<%=path%>/bootstrap/table/locale/bootstrap-table-zh-CN.js"></script>

</head>

<body style="width:100%; height:900px; background-image:url('../img/e.jpg');overflow: auto;background-size:100% 100%;background-repeat: no-repeat;">
<div class="col-md-offset-0  col-md-13" >
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title text-center">图书信息</h3>
			</div>
			<div class="panel-body">
				<div id="toolbar">
					<div class="btn-group">
						<button id="btn_delete" type="button" class="btn btn-danger"
							onclick="bbk();">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>借书
						</button>
						<button id="btn_add" type="button" class="btn btn-primary" onclick="xiangqing();">
							<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>图书详情
						</button>
						
					</div>
				</div>		
				<table id="book_table">
				<thead></thead>
				</table>
			</div>
			</div>
			<font size='10' color='red'>图书详情</font><br>
			<table id="xiang" border="1" width="800" heigth="400" table-layout:fixed></table>
			</div>
		</div>
	</div>


<script type="text/javascript">
$(function() {
	$('#book_table').bootstrapTable({
		method : "post",
		url : "<%=path%>/home/blist",
		dataType : "json",
		toolbar : '#toolbar', //工具按钮用哪个容器
		pagination : true, //分页
		pageNumber : 1,
		pageSize : 10,//设置每页数据条数
		pageList: [5, 10, 15, 'All'],//可供选择的每页的行数（*）
		search : true,//启用搜索
		showRefresh : true,//刷新按钮启用
		showToggle : true,//切换视图按钮
		showColumns : true,//
		striped : true,//隔行变色
		cache : true,//true禁止ajax数据缓存
		columns : [ {
			radio : true,	
		}, {
			title : '图书ID',
			field : 'id',
			align : 'center',
			valign : 'middle',
			sortable:true,				
		}, {
			title : '书名',
			field : 'name',
			align : 'center',
			valign : 'middle',

		}, {
			title : '编号',
			field : 'number',
			align : 'center',
		},

		{
			title : '总数',
			field : 'total',			
			align : 'center',
		},
		{
			title : '余量',
			field : 'amount',
			align : 'center',
		},

		{
			title : '定价',
			field:'price',
			align : 'center',
		} ,
		{
			title : '类别',
			field:'genre',
			align : 'center',
		} ,
		{
			title:'出版日期',
			field:'pdate',
			align:'center'
		}
		],
	});
}); 

function getIdArr(){
	var row = $('#book_table').bootstrapTable("getSelections");
	return row;
}
	//借书
	

	function bbk(){
		var row = new getIdArr();
		
		$.post('<%=path%>/home/js',{
			id:row[0].id,
			name:row[0].name
		},function(data){
			if(row[0].amount<=0){
				alert("该书已被借完，其他书籍更精彩哦！");
			}
			else if(data=="ok"){
				alert("借书成功");
				$("#book_table").bootstrapTable("refresh");
			}
			else if(data=="error"){
				alert("借书失败");
				$("#book_table").bootstrapTable("refresh");
			}
		});
}
	function xiangqing(){
		var row = new getIdArr();
		$.post('<%=path%>/home/xiangqing',{
			id:row[0].id,
		},function(data){
			//alert(data);
			var html = "";		
				
				html += "<tr height='50'>";
				html += "<td bgcolor='gray' width='80'>编号</td>";
				html += "<td bgcolor='gray' width='80'>图书id</td>";
				html += "<td bgcolor='gray' width='80'>图书名称</td>";
				html += "<td bgcolor='gray' width='80'>图书作者</td>";
				html += "<td bgcolor='gray' width='80'>图书简介</td>";
				html += "</tr>";
			var res = $.parseJSON(data);
			$.each(res, function(i, n) {
				html += "<tr>";
				html += "<td bgcolor='white'>" + n.id + "</td>";
				html += "<td bgcolor='white'>" + n.bid + "</td>";
				html += "<td bgcolor='white'>" + n.name + "</td>";
				html += "<td bgcolor='white'>" + n.auther + "</td>";
				html += "<td bgcolor='white'>" + n.introduce + "</td>";
				html += "</tr>";
			});
			$("#xiang").html(html);
	});
}
	function bk(){
		var row = new getIdArr();
		
		$.post('<%=path%>/home/hs',{
			id:row[0].id,
			amount:row[0].amount
		},function(data){	
			 if(data=="okok"){			 
				alert("还书成功");
				$("#book_table").bootstrapTable("refresh");
			}
		});
}
</script>

</body>
</html>
