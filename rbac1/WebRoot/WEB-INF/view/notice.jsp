<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 5 Transitional//EN">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<title>图书阅览</title>
<link href="<%=path%>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="<%=path%>/js/jquery-1.9.1.min.js"></script>
<script src="<%=path%>/js/jquery-2.1.1.js"></script>
<script src="<%=path%>/bootstrap/js/bootstrap.min.js"></script>
<!-- UE配置文件 -->
<script  src="<%=path%>/ueditor/ueditor.config.js"></script>
<!-- UE源码文件 -->
<script src="<%=path%>/ueditor/ueditor.all.js"></script>

</head>

<body style="font-family: Microsoft YaHei;width:100%; height:900px; background-image:url('../img/e.jpg');overflow: auto;background-size:100% 100%;background-repeat: no-repeat;">
<div id="di"></div>
<!-- 框 -->
<div id="kuang" style="margin: auto auto auto auto;">
   <form class="form-horizontal" role="form">
  <div class="form-group" >
    <label for="firstname" class="col-sm-2 control-label">标题:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="tt" placeholder="请输入标题" style="width:80%;">
    </div>
  </div>
  <div class="form-group">
    <label for="lastname" class="col-sm-2 control-label">内容:</label>
    <div class="col-sm-10" id="ctt" style="width:80%;height:300px ">
       <!-- <textarea type="text/plain" class="form-control"  placeholder="请输入姓"></textarea>  -->
    </div>
  </div>
  <div class="form-group" id="modf">
    <div class="col-sm-offset-5 col-sm-5">
      <button type="submit" class="btn btn-default" onclick="change();">修改</button>
      <button type="submit" class="btn btn-default" onclick="quxiao();">取消</button>
    </div>
  </div>
  <div class="form-group" id="fabu">
    <div class="col-sm-offset-5 col-sm-5">
      <button type="submit" class="btn btn-default" onclick="sava();">发布</button>
      <button type="submit" class="btn btn-default" onclick="quxiao();">取消</button>
    </div>
  </div>
  
</form>
</div>
<!--  -->
    <div class="panel panel-primary" >
    
     <div class="panel-heading">
     
        <h3 class="panel-title text-center">公告管理</h3>
        <span class="panel-title " style='color: rgb(255,255,0);cursor:pointer;font-weight: 500;' onclick="fabu();">发布新公告</span>
     </div>
    

    <!-- 公告 -->
	<div class="panel-group" id="notice"></div>
</div>
	
<script type="text/javascript">
$("#kuang").hide();


$(function(){
	 $.post('<%=path%>/home/getNotice',{
		 
	 },function(data){
		//alert(data);
		var html = "";
		var idx = 1;
		var  res = $.parseJSON(data);
		$.each(res,function(i,n){
			html += "<div class='panel '>";
			html += "<div class='panel-heading'>";
		    html += "<h4 class='panel-title'>";
		  //修改
		    html += "<span class='glyphicon glyphicon-pencil' onclick=\"modify("+n.id+")\" style=\"color: rgb(255, 140, 60);cursor:pointer;\">&nbsp</span>";
		    html += ""+idx+"、";//公告序号
		    html += "<a data-toggle='collapse' data-parent='#accordion' href=\"#collapse"+n.id+"\">";
		    html += " "+n.title+" ";//标题
		    html += "</a></h4></div>";
		    html += "<div id=\"collapse"+n.id+"\" class='panel-collapse collapse'>";
		    html += "<div class='panel-body'>";
		    html += "<div><span style='color: rgb(128,128,128);'>发布者："+n.publisher+"，发布时间："+n.pubdate+"</span></div><br>";
		    html += " "+n.content+" ";//内容
			html += "</div></div></div>";
			idx++;
		});

		$("#notice").html(html);
		
	});
});
 var vid = null;
var vname = "${userName}";
function modify(id){
	$("#modf").show();
	$("#fabu").hide();
	$("#kuang").show(500);
	$.post("<%=path%>/home/oneNt",{
		id:id
	},function(data){
		var res = $.parseJSON(data);
		//alert(res[0].title);
		$("#tt").val(res[0].title);
		ue.setContent(res[0].content); 
	});
	 vid = id;	
}
function change(){
	$.post("<%=path%>/home/modifyNt",{
		id:vid,
		tt:$("#tt").val(),
		ctt:ue.getContent()
		//pub:"${userName}"
	},function(data){
		alert("修改成功");		
	});
}
function fabu(){
	$("#fabu").show();
	$("#modf").hide();
	$("#kuang").show(500);
	$("#tt").val("");
	ue.setContent("");
}

function sava(){
	alert(vname);
	if($("#tt").val()==""||ue.getContent()==""){
		alert("标题或内容不能为空");
		return;
	}
	$.post("<%=path%>/home/ntAdd",{
		tt:$("#tt").val(),
		ctt:ue.getContent(),
		publisher:vname
	},function(data){
		if(data=="ok")
			alert("发布成功");
		else
			alert("发布失败");
	});
}

function quxiao(){
	$("#tt").val("");
	ue.setContent("");
	$("#kuang").hide();
}

var bar = {
		toolbars : [ [ 'attachment',
		               'link',
		               'simpleupload', 
		               'emotion',
		               'inserttitle',
		               'cleardoc',
		               'justifycenter',
		               'justifyleft',
		               'imagecenter',
		               'background',
		               'lineheight',
		               'template',
		               'pagebreak',
		               
		               
		               ] ]
	};
	var ue = UE.getEditor('ctt', bar);
	

</script>

</body>
</html>
