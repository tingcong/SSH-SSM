<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'tree.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="ztree/css/demo.css" type="text/css">
    <link rel="stylesheet" href="ztree/zTreeStyle/zTreeStyle.css" type="text/css">
    <script type="text/javascript" src="js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="ztree/js/jquery.ztree.core-3.5.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <script type="text/javascript">
    var zTree;
    var setting={
    		view: {
    			dblClickExpand: false,
    			showLine: true,
    			selectedMulti: false
    		},
    		data: {
    			simpleData: {
    				enable:true,
    				idKey: "id",
    				pIdKey: "pId",
    				rootPId: ""
    			}
    		},
    };

    var zNodes=[
    {id:1, pId:0, name:"test1"},   
    {id:11, pId:1, name:"test11"},   
    {id:12, pId:1, name:"test12"},   
    {id:111, pId:11, name:"test111"}, 
                ];
    $(document).ready(function(){
        zTree = $.fn.zTree.init($("#tree"), setting, zNodes);
     });
    </script>
<div>
    <ul id="tree" class="ztree" style="width:260px; height:300px;overflow:auto;"></ul>aaaaa
</div>
  </body>
</html>
