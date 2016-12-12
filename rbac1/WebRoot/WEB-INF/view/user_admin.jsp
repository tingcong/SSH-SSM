<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<!--解决了ie兼容问题  -->

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="<%=path%>/bootstrap/css/bootstrap.min.css">

<link rel="stylesheet"
	href="<%=path%>/bootstrap/table/bootstrap-table.css">
<link rel="stylesheet"
	href="<%=path%>/bootstrap/editable/css/bootstrap-editable.css">

<script src="<%=path%>/js/jquery-2.1.1.js"></script>

<script src="<%=path%>/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=path%>/bootstrap/table/bootstrap-table.js"></script>
<script src="<%=path%>/bootstrap/editable/js/bootstrap-editable.min.js"></script>
<script src="<%=path%>/bootstrap/editable/js/bootstrap-table-editable.min.js"></script>

<script src="<%=path%>/bootstrap/table/locale/bootstrap-table-zh-CN.js"></script>

</head>
<body style="width:100%; height:900px; background-image:url('../img/e.jpg');overflow: auto;background-size:100% 100%;background-repeat: no-repeat;">

	<div class="col-md-offset-0  col-md-13">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title text-center">用户管理</h3>
			</div>
			<div class="panel-body">
				<div id="toolbar">
					<div class="btn-group">
						<button id="btn_delete" type="button" class="btn btn-danger"
							onclick="delUser();">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
						</button>
						<button id="btn_add" type="button" class="btn btn-primary"">
							<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>增加
						</button>
					</div>
				</div>				
				<table id="user_table">
				</table>
			</div>
		</div>
	</div>

	<!-- 新增用户模态框 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel"></h4>
				</div>
				<div class="modal-body">

					<div class="form-group">
						<label>用户ID</label> <input type="text" class="form-control"
							id="user_id" placeholder="ID">
					</div>

					<div class="form-group">
						<label>用户名</label> <input type="text" class="form-control"
							id="user_name" placeholder="用户名">
					</div>
					<div class="form-group">
						<label>用户密码</label> <input type="text" class="form-control"
							id="user_pwd" placeholder="密码">
					</div>
					<div class="form-group">
						<label>用户角色</label> <select id="roleSelect" class="form-control"></select>
					</div>
					<div class="form-group">
						<label>用户信息</label>
						<textarea class="form-control" id="user_info" placeholder="描述"></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
					</button>
					<button type="button" id="user_save" class="btn btn-primary"
						onclick="userSave();">
						<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存
					</button>
				</div>
			</div>
		</div>
	</div>

		
		
	<script>
	
	
	//教训：只有$.each前要将data转json，$.parsJSON(data)
	//显示增加用户模态框
	$("#btn_add").click(function () {
        $("#myModalLabel").text("新增用户");
        $('#myModal').modal();
    });
	//选择角色下拉框内容
	$(function(){
		$.ajax({
			type:'post',
			url:'<%=path%>/home/getRole',
			data:{},
			success:function(data){
				var res = $.parseJSON(data);
				$.each(res,function(i,n){
					$("#roleSelect").append("<option value="+n.roleId+">"+n.roleName+"</option>");
				});	   
			},
			error:function(){
				alert("error!");
			}
		});
	});
	//管理用户：增加
	function userSave(){
		var userId = $("#user_id").val();
		var userName = $("#user_name").val();
		var userPwd = $("#user_pwd").val();
		var userInfo = $("#user_info").val();
		var roleId = $("#roleSelect option:selected").val();
		var id = parseInt(userId);
		if(userId==""){
			alert("ID不能为空 = =!");
			return;
		}
		if(isNaN(id)){
			alert("用户ID请输入数字 = =!");
			return;
		}	
		if(userName==""){
			alert("用户名不能为空 -.-!");
			return;
		}
		if(userPwd==""){
			alert("密码不能为空 -.-!");
			return;
		}
		$.post("<%=path%>/home/userAdd",{
			userId:userId,
			userName:userName,
			userPwd:userPwd,
			userInfo:userInfo,
			roleId:roleId
		},function(data){
			
			if(data=="IdExist"){
				alert("ID存在 = =!");
				return;
			}
			if(data=="no"){
				alert("用户名已存在  = =!");
				return;
			}
			if(data=="ok"){
				alert("新增用户成功");
				$("#user_table").bootstrapTable("refresh");
				$('#user_table').bootstrapTable("resetView");
				$('#myModal').modal('hide');
				
			}
	
		});
		
	}

	
		$(function() {
			$('#user_table').bootstrapTable({
				method : "post",
				url : "<%=path%>/home/getur",
				dataType : "json",
				toolbar : '#toolbar', //工具按钮用哪个容器
				pagination : true, //分页
				pageNumber : 1,
				pageSize : 10,//设置每页数据条数
				pageList: [5, 10, 15, 'All'],//可供选择的每页的行数（*）
				search : true,//启用搜索
				searchAlign : 'right',//搜索位置
				showRefresh : true,//刷新按钮启用
				showToggle : true,//切换视图按钮
				showColumns : true,//
				striped : true,//隔行变色
				cache : true,//true禁止ajax数据缓存
				columns : [ {
					checkbox : true,	
				}, {
					name:'hh',
					title : '用户ID',
					field : 'userId',
					align : 'center',
					valign : 'middle',
					sortable:true,				
				}, {
					title : '用户名',
					field : 'userName',
					align : 'center',
					valign : 'middle',

				}, /* {
					title : '用户密码',
					field : 'userPwd',
					align : 'center',
					valign : 'middle',
				}, */

				{
					field : 'roleId',
					title : '用户角色',
					align : 'center',
					valign : 'middle',
					editable : {
					    //url:'<%=path%>/home/testSelect',   
						type : 'select',
						title : '选择角色',
						source : function(value) {
							var result = [];	
							$.ajax({
								url : '<%=path%>/home/getRole',
								async : false,
								type : 'post',
								data : {
									//roleName:value
								},
								success : function(data, status) {					
									var res = $.parseJSON(data);//*									
									$.each(res, function(i, n) {
										result.push({
											value : n.roleId,
											text : n.roleName
										});	
									});
								}
							});
							return result;
						}
					} 
				
				},
				{
					title : '用户信息',
					field : 'userInfo',
					align : 'center',
					valign : 'middle',
					editable : {
						 emptytext: "暂无描述",
					
						type:"textarea",
						title:"修改信息",
						
						
					},
				},

				{
					title : '操作',
					align : 'center',
					valign : 'middle',
					events:'evt',
					formatter:'f_edit'			
				} ],
				
				onEditableSave: function (field, row, oldValue, $el) {
					//alert(row.roleId);
					//field, row, oldValue, $el分别对应着当前列的名称、当前行数据对象、更新前的值、编辑的当前单元格的jQuery对象
	                $.ajax({
	                	url:'<%=path%>/home/testSelect',
	                	type:'post',
	                	
	                	data:{
	                		userId:row.userId,	 
	                		userName:row.userName,
	                		userPwd:row.userPwd,
	                    	userInfo:row.userInfo,
	                    	roleId:row.roleId,
	                    	roleName:row.roleName,
	                		field:field+"",//*
	                	},
	                	
	                	success:function(data,status){
	                		if(status=="success"){
	                			alert("修改成功");
	                			$("#user_table").bootstrapTable("refresh");
	                		}
	                	},  
	                	error: function () {
	                        alert('编辑失败');
	                    },
	                    complete: function () {

	                    }
	                
	                });
	            
	            },  
			
			});

		});
		//获得选中行id数组
		function getIdArr(){
			var rows = $('#user_table').bootstrapTable("getSelections");
			var row_ids = [];
			$.each(rows,function(i,n){
				row_ids.push(n.userId);
			});
			return row_ids;
		}
		//删除用户
		function delUser(){
			var row_ids = getIdArr();
			//alert(row_ids.length);
			if(row_ids.length<1){
				alert("请至少选择一行");
				return;
			}
			$.post('<%=path%>/home/delUser',{
				ids:row_ids.toString()
			},function(data){
				//var res = $.parseJSON(data);
				if(data=="ok"){
					alert("删除成功");
					$("#user_table").bootstrapTable("refresh");
				}
			});
		}

		//formatter:f_edit
		function f_edit(field, row, oldValue, $el) {
	    return [           
	        '<a class="remove ml10" href="javascript:void(0)" title="删除">',
            '<i span class="glyphicon glyphicon-remove" style="color: rgb(222, 83, 83); font-size: 20px;"></i>',
            '</a>',
	    ].join(' ');
	}
		

		

	var $table = $('#user_table');
window.evt = {
			    'click .remove': function (e, value, row, index) {			
			    	$.post('<%=path%>/home/urDel', {
					userId : row.userId
				}, function(data) {
					if(data=="ok"){
						alert("删除成功");
						$("#user_table").bootstrapTable("refresh");
					}
				});

			}
		}; 
	</script>
</body>
</html>
