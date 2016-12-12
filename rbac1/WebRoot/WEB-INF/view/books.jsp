1<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<script src="<%=path%>/bootstrap/editable/js/bootstrap-editable.min.js"></script>
<script src="<%=path%>/bootstrap/editable/js/bootstrap-table-editable.min.js"></script>
<script src="<%=path%>/bootstrap/editable/js/bootstrap-table-export.js"></script>
<script src="<%=path%>/bootstrap/table/locale/bootstrap-table-zh-CN.js"></script>
<script src="<%=path%>/js/tableExport.js"></script>

</head>

<body style="width:100%; height:900px; background-image:url('../img/e.jpg');overflow: auto;background-size:100% 100%;background-repeat: no-repeat;">
<div class="col-md-offset-0  col-md-13">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title text-center">图书管理</h3>
			</div>
			<div class="panel-body">
				<div id="toolbar">
					<div class="btn-group">
						<button id="btn_delete" type="button" class="btn btn-danger"
							onclick="delbooks();">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
						</button>
						<button id="btn_add" type="button" class="btn btn-primary"">
							<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>增加
						</button>
					</div>
				</div>		
				<table id="book_table">
				<thead></thead>
				</table>
			</div>
		</div>
	</div>

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
						<label>图书ID</label> <input type="text" class="form-control"
							id="id" placeholder="ID">
					</div>

					<div class="form-group">
						<label>图书名</label> <input type="text" class="form-control"
							id="name" placeholder="图书名">
					</div>
					<div class="form-group">
						<label>编号</label> <input type="text" class="form-control"
							id="number" placeholder="编号">
					</div>
					<div class="form-group">
						<label>总量</label> <input type="text" class="form-control"
							id="total" placeholder="总量">
					</div><div class="form-group">
						<label>余量</label> <input type="text" class="form-control"
							id="amount" placeholder="余量">
					</div><div class="form-group">
						<label>定价</label> <input type="text" class="form-control"
							id="price" placeholder="定价">
					</div>
					</div><div class="form-group">
						<label>日期</label> <input type="text" class="form-control"
							id="price" placeholder="日期">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
					</button>
					<button type="button" id="book_save" class="btn btn-primary"
						onclick="bookSave();">
						<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存
					</button>
				</div>
			</div>
		</div>
	</div>


<script type="text/javascript">
$(function() {
	$('#book_table').bootstrapTable({
		method : "post",
		url : "<%=path%>/home/bblist",
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
		showExport: true,                     //是否显示导出
        exportDataType: "basic",              //basic', 'all', 'selected'.
		columns : [ {
			checkbox : true,	
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
			title : '总量',
			field : 'total',			
			align : 'center',
			valign : 'middle',
			editable : {
				type:"text",
				title:"修改数量",
			},
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
			valign : 'middle',
			editable : {
				type:"text",
				title:"修改数量",
			},
		} ,
		{
			title:'出版日期',
			field:'pdate',
			align:'center'
		}
		],
		
	onEditableSave: function (field, row, oldValue, $el) {
			//alert(row.roleId);
			//field, row, oldValue, $el分别对应着当前列的名称、当前行数据对象、更新前的值、编辑的当前单元格的jQuery对象
            $.ajax({
            	url:'<%=path%>/home/testSelect1',
            	type:'post',
            	
            	data:{
            		id:row.id,	 
            		name:row.name,
            		number:row.number,
                	total:row.total,
                	amount:row.amount,
                	price:row.price,
                	pdate:row.pdate,
            		field:field+"",//* 
            	},
            	
            	success:function(data,status){
            		if(status=="success"){
            			alert("修改成功");
            			$("#book_table").bootstrapTable("refresh");
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
	var rows = $('#book_table').bootstrapTable("getSelections");
	var row_ids = [];
	$.each(rows,function(i,n){
		row_ids.push(n.id);
	});
	return row_ids;
}
function delbooks(){
	var row_ids = getIdArr();
	//alert(row_ids.length);
	if(row_ids.length<1){
		alert("请至少选择一行");
		return;
	}
	alert("111");
	$.post('<%=path%>/home/delbooks',{
		ids:row_ids.toString()
	},function(data){
		//var res = $.parseJSON(data);
		if(data=="ok"){
			alert("删除成功");;
			$("#book_table").bootstrapTable("refresh");
		}
	});
}
$("#btn_add").click(function () {
    $("#myModalLabel").text("新增图书");
    $('#myModal').modal();
});
//管理图书：增加
function bookSave(){
	//alert("booksave");
	var id = $("#id").val();
	var name = $("#name").val();
	var number = $("#number").val();
	var total = $("#total").val();
	var amount = $("#amount").val();
	var price = $("#price").val();
	//var pdate = $("#pdate").val();
	var id = parseInt(id);
	if(id==""){
		alert("ID不能为空 = =!");
		return;
	}
	if(isNaN(id)){
		alert("用户ID请输入数字 = =!");
		return;
	}	
	if(name==""){
		alert("图书名不能为空 -.-!");
		return;
	}
	if(total==""){
		alert("总数不能为空 -.-!");
		return;
	}
	$.post("<%=path%>/home/bookAdd",{
		id:id,
		name:name,
		number:number,
    	total:total,
    	amount:amount,
    	price:price,
    	//pdate:pdate,
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
			$('#book_table').bootstrapTable("refresh");
			$('#book_table').bootstrapTable("resetView");
			$('#myModal').modal('hide');
			
		}

	});
	
}

</script>

</body>
</html>