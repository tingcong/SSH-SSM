<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 5 Transitional//EN">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<title>安绚图书系统</title>
<%-- <link rel="stylesheet" type="text/css" href="<%=path%>/css/home.css"> --%>
<%-- <link rel="stylesheet" type="text/css"
	href="<%=path%>/ztree/css/demo.css"> --%>
<link rel="stylesheet" type="text/css" 
	href="<%=path%>/ztree/css/zTreeStyle/zTreeStyle.css">
<link rel="stylesheet" href="<%=path%>/bootstrap/css/bootstrap.min.css">

<script src="<%=path%>/js/jquery-2.1.1.js"></script>
<script src="<%=path%>/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=path%>/ztree/js/jquery.ztree.core.js"></script>
<script src="<%=path%>/ztree/js/jquery.ztree.excheck.js"></script>
<script src="<%=path%>/ztree/js/jquery.ztree.exedit.js"></script>


</head>


<body>
	<div class="container">
		<div class="row">
				一颗小树
			</div>
			
		</div>
		<div class="row">
			<div class="col-md-4">
				<ul id="treeDemo" class="ztree"></ul>
			</div>


			<div  class="col-md-8" >
				<iframe id="test" width="100%" height="600px" ></iframe>
			</div>
		</div>
	</div>
	<script type="text/javascript">
    //var zTreeObj;
   // var zNodes = [];
 
    $(function(){
    	//alert("aa");
    	
    	var setting = {
    			view: {
    				showLine: false,
    				
    				selectedMulti: false,
    				dblClickExpand: false,
    				addDiyDom: addDiyDom
    			},
    			callback: {
    				beforeClick: beforeClick,
    				onClick: zTreeOnClick
    			},
    			data: {
    				simpleData: {
    					enable: true
    				}
    			},

    	};
    	
    	 var ids = "1,2,3,4,5,6,7,8,9,10,11,12,21,22,23,24,13,31,32";
    	 $.post("<%=path%>/home/getMenuByPms", {
				ids :   ids
			}, function(data) {
				var zNodes = $.parseJSON(data);
				//alert(data);
				zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
			});

		});
    
    function getPmsId(){
    	$.post("<%=path%>/home/getPmsId",{
    		userName:"admin"
    	},function(data){
    		
    	});
    }

		function zTreeOnClick(event, treeId, treeNode) {
			$("#test").attr("src" ,"<%=path%>/"+treeNode.link);
			//alert(treeNode.id + ", " + treeNode.url);
		};

		function addDiyDom(treeId, treeNode) {
			var spaceWidth = 5;
			var switchObj = $("#" + treeNode.tId + "_switch"), icoObj = $("#"
					+ treeNode.tId + "_ico");
			switchObj.remove();
			icoObj.before(switchObj);

			if (treeNode.level > 1) {
				var spaceStr = "<span style='display: inline-block;width:"
						+ (spaceWidth * treeNode.level) + "px'></span>";
				switchObj.before(spaceStr);
			}
		}

		function beforeClick(treeId, treeNode) {
			if (treeNode.level == 0) {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				zTree.expandNode(treeNode);
				return false;
			}
			return true;
		}

		/* $(document).ready(function() {
			//var treeObj = $("#treeDemo");
			//$.fn.zTree.init(treeObj, setting, zNodes);
			zTree_Menu = $.fn.zTree.getZTreeObj("treeDemo");
			curMenu = zTree_Menu.getNodes()[0].children[0].children[0];
			zTree_Menu.selectNode(curMenu);

			treeObj.hover(function() {
				if (!treeObj.hasClass("showIcon")) {
					treeObj.addClass("showIcon");
				}
			}, function() {
				treeObj.removeClass("showIcon");
			});
		}); */
	</script>
</body>
</html>
