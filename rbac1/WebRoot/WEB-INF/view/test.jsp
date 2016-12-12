<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
	String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 5 Transitional//EN">
<html>
<head>

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script src="<%=path%>/js/jquery-1.9.1.js"></script>
<link rel="stylesheet" href="<%=path%>/bootstrap/css/bootstrap.min.css">
<script src="<%=path%>/bootstrap/js/jquery.min.js"></script>
<script src="<%=path%>/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="<%=path%>/bootstrap/table/bootstrap-table.css">
<script src="<%=path%>/bootstrap/table/bootstrap-table.js"></script>
<script src="<%=path%>/bootstrap/table/local/bootstrap-table-zh-CN.js"></script>
</head>

<body>

	<table id="cargosTable">
	</table>
	<script>
	   
    $(function(){
        
        $('#cargosTable').bootstrapTable({
            method: "post",
            url: "<%=path%>/home/test",
								dataType : "json",
								pagination : true, //分页
								pageNumber : 1,
								pageSize : 5,//设置每页数据条数
								search : true,//启用搜索
								searchAlign : 'right',//搜索位置
								showRefresh : true,//刷新按钮启用
								showToggle : true,//切换视图按钮
								paginationHAlign : 'right',//分页位置
								radio : true,
								//clickToSelect:true,
								striped : true,
								cache : true,//true禁止ajax数据缓存
								sortStable : true,//自动排序
								// sortOrder:'desc',//排序方式
								// iconsPrefix:'fa',//字体
								//    sidePagination: "server", //服务端处理分页
								formatLoadingMessage : function() {
									return "请稍等，正在加载中...";
								},
								formatNoMatches : function() { //没有匹配的结果
									return '无符合条件的记录';
								},
								columns : [
										{
											title : '用户ID',
											field : 'userId',
											align : 'center',
											valign : 'middle'
										},
										{
											title : '用户名',
											field : 'userName',
											align : 'center',
											valign : 'middle',
										},
										{
											title : '用户密码',
											field : 'userPwd',
											align : 'center'
										},

										{
											title : '用户信息',
											field : 'userInfo',
											align : 'center',
										},
										{
											title : '操作',

											align : 'center',
											formatter : function(value, row,
													index) {
												var e = '<a href="#" mce_href="#" onclick="edit(\''
														+ row.id
														+ '\')">编辑</a> ';
												var d = '<a href="#" mce_href="#" onclick="del(\''
														+ row.id
														+ '\')">删除</a> ';
												return e + d;
											}
										} ]

							});

		});

		function queryParams(params) {
			return {
				pageSize : params.pageSize,//键就是自己后台的参数
				page : params.pageNumber
			};
		}
	</script>
</body>
</html>
