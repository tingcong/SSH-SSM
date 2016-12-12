/**判断页面是否锁定************/
function adjustLock(){
	if(window.name=='lock'){ //防止页面刷新
		$(".locking").css("display","");
	}
};
//取得名称为name的cookie值 
function indexGetCookie(name) {
    var arg = name + "=";
            var alen = arg.length;
            var clen = document.cookie.length;
            var i = 0;
            while (i < clen) {
                var j = i + alen;
                if (document.cookie.substring(i, j) == arg)
 
                    return indexGetCookieVal(j);
                i = document.cookie.indexOf(" ", i) + 1;
            if (i == 0) break;
        }
        return null;
};
   //取得项名称为offset的cookie值 
function indexGetCookieVal(offset) {
    var endstr = document.cookie.indexOf(";", offset);
    if (endstr == -1)
        endstr = document.cookie.length;
    return unescape(document.cookie.substring(offset, endstr));
};

/*************/
function openLocking(){
	$(".locking").css("display","");
	$("#d_jcs").css("display","none");
	$(".jc6_jcs").css("display","none");
	$(".jc6ui-jcs").css("display","none");
	$("#unlock").show();
	$(".locking_txt").show();
	$("#unlocking").hide();
	$('#foot').hide();
	//给锁定位赋值
	window.name='lock';
	$(".login_main .locking_sys .user_photo").css("background-image","url("+CTX+"'${loginUser.userImg}')");
};


//点击弹出相应的DIV层
function showLoginMethod(){
	jQuery(".locking_method").slideToggle("fast");
};
function showChoiceLanguage(){
	jQuery(".choice_language").slideToggle("fast");
};
//更换登录方式DIV选择单击事件
function getPwd(){
	jQuery(".change_login").html("密码登录");
	$(".locking_method").css("display","none");
};
//Epass登录
function getEpass(){
	jQuery(".change_login").html("Epass登录");
	$(".locking_method").css("display","none");
};
//更换语言DIV选择单击事件 简体中文
function getCnSimple(){
	jQuery(".change_language").html("简体中文");
	$(".choice_language").css("display","none");
};
//繁体中文
function getCnTra(){
	jQuery(".change_language").html("繁体中文");
	$(".choice_language").css("display","none");
}
//English
function getEn(){
	jQuery(".change_language").html("English");
	$(".choice_language").css("display","none");
};

function showUnLock(){
	jQuery(".locking_pic").html("解锁");
};
function outUnLock(){
	jQuery(".locking_pic").html("");
};
//确定
function goNext(){
	//alert("111");
	$("#lockingPwd").val('');
	$("#unlock").hide();
	$(".locking_txt").hide();
	$("#unlocking").show();
	document.getElementById('lockingPwd').focus();
	document.onkeydown=function(event){e = event ? event :(window.event ? window.event : null);if(e.keyCode==13){ checkPwd();}};
};

//锁定状态通过ajax获取密码
function checkPwd(){
	//var userName="${loginUser.accounts }"; ,注释掉此变量,当前登录用户账号由服务器端直接去取
	var pwd = $("#lockingPwd").val();
	if(pwd != ""){
		$.ajax({
			url: CTX+"/sys/login!unLock.action",
			type: "POST",
			data: "password="+pwd,
			success:function(obj) {
			    if(eval(obj)==1){//login successfully
			    	//隐藏锁定层
					$(".locking").css("display","none");
					window.name='';
					document.onkeydown=function(event){e = event ? event :(window.event ? window.event : null);if(e.keyCode==13){ return false;}};
					$(".jc6_jcs").css("display","");
					$("#d_jcs").css("display","");
					$("#foot").show();
			    }else{
			    	//登录验证失败
			    	art.dialog.tips("密码错误,请重新输入！");
			    }
			}
		});	
	}else{
		art.dialog.tips("请输入密码！");
	}
};
//解锁取消
function cancelUnlock(){
	$("#unlock").show();
	$(".locking_txt").show();
	$("#unlocking").hide();
};

//解锁btn样式hover
function unlockhover(){
	$("#buttondiv").css({
		'width':'42px', 
		'height':'42px', 
		'position':'absolute', 
		'top':'8px', 'left':'200px', 'font-size':'12px', 
		'background':'url(../images/finallogin/unlock-btn.png)', 
		'background-position':'0 -42px'
	});
};
function unlockleave(){
	$("#buttondiv").css({
		'width':'42px', 'height':'42px', 'position':'absolute', 
		'top':'8px', 'left':'200px', 'font-size':'12px', 
		'background':'url(../images/finallogin/unlock-btn.png)', 
		'background-position':'0 0'
	});
};
$(function(){
	$(".locking").css("display","none");
	$(".login_loading").css("display","none");
	$(".locking_method").css("display","none");
	$(".locking_choice_language").css("display","none");
	$("#unlocking").hide();
	adjustLock();
});