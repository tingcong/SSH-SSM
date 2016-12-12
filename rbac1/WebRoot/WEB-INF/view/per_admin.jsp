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

	<div class="col-md-offset-0 col-md-13">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title text-center">角色管理</h3>
			</div>
			<div class="panel-body">
				<div id="toolbar">
					 <div class="btn-group">
						<button id="btn_delete" type="button" class="btn btn-danger"
							onclick="roleDel();">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
						</button>
						<button id="role_add" type="button" class="btn btn-primary"">
							<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>增加
						</button>
					</div>
				</div>				
				<table id="role_table">
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
						<label>角色名</label> <input type="text" class="form-control"
							id="roleName" placeholder="角色名">
					</div>
					<div class="form-group">
						<label>角色信息</label>
						<textarea class="form-control" id="roleInfo" placeholder="描述"></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
					</button>
					<button type="button" id="roleAdd" class="btn btn-primary"
						onclick="roleAdd();">
						<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存
					</button>
					
				</div>
			</div>
		</div>
	</div>

		
		
	<script>
	
	
	//教训：只有$.each前要将data转json，$.parsJSON(data)
	//显示增加用户模态框
	$("#role_add").click(function () {
        $("#myModalLabel").text("新增角色");
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
	//管理角色：增加
	function roleAdd(){
		var roleName = $("#roleName").val();
		var roleInfo = $("#roleInfo").val();
		if(roleName==""){
			alert("角色名不能为空 -.-!");
			return;
		}
		if(!isNaN(roleName)){
			alert("请输入中文名 -.-!");
			return;
		}
		$.post("<%=path%>/home/roleAdd",{		
			roleName:roleName,
			roleInfo:roleInfo,		
		},function(data){
			if(data=="ok"){
				$("#role_table").bootstrapTable("refresh");
				$('#myModal').modal('hide');
			}
			if(data=="no")
				alert("角色名已存在");
		});
		
	}
//role表
	$(function() {
		$('#role_table').bootstrapTable({
			method : "post",
			url : "<%=path%>/home/getRole",
			dataType : "json",
			toolbar : '#toolbar', //工具按钮用哪个容器
			pagination : true, //分页
			pageNumber : 1,
			pageSize : 5,//设置每页数据条数
			pageList: [5, 10, 15, 'All'],//可供选择的每页的行数（*）
			search : true,//启用搜索
			searchAlign : 'right',//搜索位置
			showRefresh : true,//刷新按钮启用
			showToggle : true,//切换视图按钮
			showColumns: true,//
			striped : true,//隔行变色
			cache : true,//true禁止ajax数据缓存
			detailView:true,//显示详细页面模式
			clickToSelect: true,//是否启用点击选中行
			columns : [  {
				checkbox : true,	
			},  {
				title : '角色名',
				field : 'roleName',
				align : 'center',
				valign : 'middle',

			},{
				title : '角色信息',
				field : 'roleInfo',
				align : 'center',
				valign : 'middle',

			},/* {
				title : '菜单管理',
				align : 'center',
				valign : 'middle',
				events:'evt',
				formatter:'f_edit'	
			} */
],
//格式化详细页面模式的视图

detailFormatter:
	 function(index, row) {
	
	var  r = "<p id='"+row.roleName+"'>拥有权限：</p>";
	var p = "<div class=\"btn-group\"><button type=\"button\" class=\"btn btn-success dropdown-toggle btn-xs\" data-toggle=\"dropdown\" style=\"font-size: 15px;\">增加权限 <span class=\"caret\"></span></button><ul class=\"dropdown-menu\" role=\"menu\" id='a"+row.roleName+"'></ul></div>";
	//var p = "<select id=\"pmsName\"></select>";
	$.ajax({
		url:"<%=path%>/home/getPmsName",
		type:'post',
		async : true,
		data:{
			roleId:row.roleId
		},
		success:function (data){
			var res = $.parseJSON(data);
			$.each(res,function(i,n){
				r += "<span class=\"label label-info\" style=\"font-size: 15px;\">"+n.pmsName+"</span><a class=\"remove ml10\"  style=\"cursor:pointer;\" onclick=\"pmsDel('"+n.pmsName+"',"+row.roleId+");\" title=\"删除\">";
				r += "<i span class='glyphicon glyphicon-remove' style='color: rgb(222, 83, 83); font-size: 15px;'></i></a>&nbsp&nbsp&nbsp";				
			});		
			r += p; 
			$("#"+row.roleName+"").html(r);
			//下拉菜单
			$.post("<%=path%>/home/getPms",{	
			},function(data){
				//alert(data);
				var res = $.parseJSON(data);
				$.each(res,function(i,n){
					$("#a"+row.roleName+"").append("<li><a style=\"cursor:pointer;\" onclick=\"pmsAdd("+row.roleId+","+n.pmsId+");\">"+n.pmsName+"</a></li>");
				});
				//$("#pmsAdd").html(html);
				
			});
			//下拉菜单
		},
		error:function(){
			alert("error");			
		}
	
	});
	return r;
		},	
		
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
			var rows = $('#role_table').bootstrapTable("getSelections");
			var row_ids = [];
			$.each(rows,function(i,n){
				row_ids.push(n.roleId);
			});
			return row_ids;
		}
		//删除用户
		function roleDel(){
			var row_ids = getIdArr();
			//alert(row_ids.length);
			if(row_ids.length<1){
				alert("请至少选择一行");
				return;
			}

			$.post('<%=path%>/home/roleDel',{
				ids:row_ids.toString()
			},function(data){
				//var res = $.parseJSON(data);
				if(data=="ok"){
					alert("删除成功");;
					$("#role_table").bootstrapTable("refresh");
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
		function pmsDel(pmsName,roleId){
			$.post("<%=path%>/home/pmsDel",{
				roleId:roleId,
				pmsName:pmsName
			},function(data){
				if(data=="ok")
				alert("删除成功");
				$("#role_table").bootstrapTable("refresh");
				//$('#user_table').bootstrapTable("refresh","resetView");
			});
		}
		function pmsAdd(roleId,pmsId){
			$.post("<%=path%>/home/pmsAdd",{
				roleId:roleId,
				pmsId:pmsId
			},function(data){
				if(data=="exist")
					alert("该角色权限已存在");
				if(data=="ok"){
					alert("增加成功");
					$("#role_table").bootstrapTable("refresh");
				}
					
			});
		}
	</script>
</body>
</html>
