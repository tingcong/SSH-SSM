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
<script src="<%=path%>/js/jquery-2.1.1.js"></script>
<script src="<%=path%>/echars/echarts.min.js"></script>



</head>

<body style="width:100%;height: 600px;background-color: #ffffff;">
<div id="user" style="width: 600px;height:600px;float: left;position:absolute; margin: auto auto auto 100px;"></div>
<div id="book" style="width: 600px;height:600px;margin: 100px auto auto 800px;"></div>

<script type="text/javascript">
var myChart_user = echarts.init(document.getElementById('user'));


var option_user = {
		
	    title: {
	        text: '1.用户统计'
	    },
	    tooltip: {},
	    legend: {
	        data:['人数']
	    },
	    xAxis: {
	    	
	        data:[]
	             
	           
	    },
	    yAxis: {
	    	type:'value'
	    },
	    series: [{
	        name: '人数',
	        type: 'bar',
	        data: []
	    }]
	};
myChart_user.setOption(option_user);

$(function() {
	var nu = [];
	var na = [];
	$.ajax({
		url:'<%=path%>/home/IdCount',
		type:'post',
		data:{},
		success:function(data){
			//alert(data);
			var res = $.parseJSON(data);
			$.each(res,function(i,n){		
				nu.push(n);
				//alert(nu);
			});
			
			$.post("<%=path%>/home/getRole",{	
			},function(data){
				//alert(data);
				var res1 = $.parseJSON(data);
				$.each(res1,function(i,n){		
					na.push(n.roleName);
					
				});
				myChart_user.setOption({
					xAxis: {
			            data: na
			        },
					
			        series: [{
			            
			            data: nu
			        }]
			    });
				});
			
			
		}
	});
	});
	
var myChart_book = echarts.init(document.getElementById('book'));
 option_book = {
		    title : {
		        text: '2.图书类别统计',
		        //subtext: '纯属虚构',
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    legend: {
		        orient : 'vertical',
		        x : 'left',
		        data:[]
		    },
		    toolbox: {
		        show : true,
		        feature : {
		            mark : {show: true},
		            dataView : {show: true, readOnly: false},
		            magicType : {
		                show: true, 
		                type: ['pie', 'funnel'],
		                option: {
		                    funnel: {
		                        x: '25%',
		                        width: '50%',
		                        funnelAlign: 'left',
		                        max: 1548
		                    }
		                }
		            },
		            restore : {show: true},
		            saveAsImage : {show: true}
		        }
		    },
		    calculable : true,
		    series : [
		        {
		            name:'数量',
		           type:'pie',
		            radius : '55%',
		            center: ['50%', '60%'],
		            data:[
		               
		            ]
		        }
		    ]
		};
 
 $(function() {
		var name = [];
		var result = [];	
		var tmp = [];
		$.ajax({
			url:'<%=path%>/home/getGenreCount',
			type:'post',
			data:{},
			success:function(data){
				var res = $.parseJSON(data);
				$.each(res,function(i,n){	
					name.push(n);
					tmp.push(n);
				});
				$.post("<%=path%>/home/getBookGenre",{	
				},function(data){					
					var re1 = $.parseJSON(data);
					//alert(data);
					$.each(re1,function(i,n){
						
						result.push({
							
							value:n,
							name:tmp[i]
							
						});
					});
					myChart_book.setOption({
						legend: {
				            data: name
				        },
						
				        series: [{
				            
				            data: result
				        }]
				    });
					});
				
				
			}
		});
		});
 
		                    
myChart_book.setOption(option_book);

// 使用刚指定的配置项和数据显示图表。

</script>

</body>
</html>
