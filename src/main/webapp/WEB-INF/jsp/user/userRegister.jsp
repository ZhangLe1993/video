<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>用户登录</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="自媒体视频网站,自媒体视频网站,自媒体视频网站">
<meta http-equiv="description" content="自媒体视频网站">

<meta
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
	name="viewport">
<meta name="applicable-device" content="pc,mobile">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/login/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/login/css/index.css">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/resources/images/0.png"
	type="image/x-icon" />
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/login/css/font_24081_aym082o86np3z0k9.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/layer/theme/default/layui.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/login/css/global.css"
	charset="utf-8">
<%-- <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/resources/login/js/core.js"></script> --%>

<link id="layuicss-layer" rel="stylesheet"
	href="${pageContext.request.contextPath }/layer/theme/default/layer.css"
	media="all">
	<script type="text/javascript" src="${pageContext.request.contextPath }/layer/layer.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/layui/layui.js"></script>
<style type="text/css">
body {
	background: #fff;
}
</style>
</head>
<body>
	<div class="layui-container fly-marginTop">
		<div class="fly-panel fly-panel-user" pad20="">
			<div class="layui-tab layui-tab-brief" lay-filter="user">
				<ul class="layui-tab-title">
					<li><a
						href="${pageContext.request.contextPath }/user/toUserLogin.do">登入</a></li>
					<li class="layui-this">注册</li>
				</ul>
				<div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
					<div class="layui-tab-item layui-show">
						<div class="layui-form layui-form-pane">
							<form method="post">
								<div class="layui-form-item">
									<label for="L_email" class="layui-form-label">手机/邮箱</label>
									<div class="layui-input-inline">
										<input type="text" id="L_phone" name="phone" required="" lay-verify="phone" autocomplete="off" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label for="L_vercode" class="layui-form-label">验证码</label>
									<div class="layui-input-inline">
										<input type="text" id="L_vercode" name="vercode" required=""
											lay-verify="required" placeholder="请输入验证码"
											autocomplete="off" class="layui-input">
									</div>
									<div class="layui-form-mid" style="padding: 0 !important;">
										<button type="button" onclick="sendCode();" class="layui-btn layui-btn-normal"
											id="FLY-getvercode">获取验证码</button>
									</div>
								</div>
								<div class="layui-form-item">
									<label for="L_username" class="layui-form-label">昵称</label>
									<div class="layui-input-inline">
										<input type="text" id="L_username" name="username" required=""
											lay-verify="required" autocomplete="off" class="layui-input">
									</div>
									<div class="layui-form-mid layui-word-aux">你在社区的名字</div>
								</div>
								<div class="layui-form-item">
									<label for="L_pass" class="layui-form-label">密码</label>
									<div class="layui-input-inline">
										<input type="password" id="L_pass" name="pass" required=""
											lay-verify="required" autocomplete="off" class="layui-input">
									</div>
									<div class="layui-form-mid layui-word-aux">6到16个字符</div>
								</div>
								<div class="layui-form-item">
									<label for="L_repass" class="layui-form-label">确认密码</label>
									<div class="layui-input-inline">
										<input type="password" id="L_repass" name="repass" required=""
											lay-verify="required" autocomplete="off" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item"
									style="position: relative; left: -10px; height: 32px;">
									<input type="checkbox" name="agreement" lay-skin="primary" title="" checked="" value="0">
									<div id="layui-form-checkbox" class="layui-unselect layui-form-checkbox" lay-skin="primary">
										<i class="layui-icon"></i>
									</div>
									<a href="javascript:void(0);" onclick="toDisclaimer();" style="position: relative; top: 4px; left: 5px; color: #999;">同意用户服务条款</a>
								</div>
								<div class="layui-form-item">
									<a class="layui-btn layui-anim-fadein" lay-filter="*" onclick="userRegister();">立即注册</a>
								</div>
								<div class="layui-form-item fly-form-app">
									<span>或者直接使用社交账号快捷注册</span> <a href="/app/qq"
										onclick="layer.msg('正在通过QQ登入', {icon:16, shade: 0.1, time:0})"
										class="iconfont icon-qq" title="QQ登入"></a> <a
										href="/app/weibo/"
										onclick="layer.msg('正在通过微博登入', {icon:16, shade: 0.1, time:0})"
										class="iconfont icon-weibo" title="微博登入"></a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="${pageContext.request.contextPath }/base/base.js" charset="utf-8"></script>
<script>
function toDisclaimer(){
	parent.layer.open({
		  type: 2,
		  skin: 'layui-layer-molv',
		  area: ['700px', '500px'], //宽高
		  title: '免责声明',
		  shade: 0.6, //遮罩透明度
		  maxmin: true, //允许全屏最小化
		  anim: 1, //0-6的动画形式，-1不开启
		  content: getRootPath() + '/user/toDisclaimer.html'
		});
}

$(function() {
	$(".layui-icon").on("click",function() {
		var no_styles = "layui-unselect layui-form-checkbox";
		var styles = "layui-unselect layui-form-checkbox layui-form-checked";
		var now = $("#layui-form-checkbox").attr("class");
		if (now == no_styles) {
			$("#layui-form-checkbox").attr("class","layui-unselect layui-form-checkbox layui-form-checked");
			$("input[name='agreement']").attr("value","1");//选中
		} else {
			$("#layui-form-checkbox").attr("class","layui-unselect layui-form-checkbox");
			$("input[name='agreement']").attr("value","0");//取消选中
		}				
	});
});
function userRegister() {
	var phone = $.trim($("input[name='phone']").val());
	var username = $.trim($("input[name='username']").val());
	var pass = $.trim($("input[name='pass']").val());
	var repass = $.trim($("input[name='repass']").val());
	var vercode = $.trim($("input[name='vercode']").val());
	var isChecked = $.trim($("input[name='agreement']").val());
	if(!validateParams(phone,username,pass,repass,vercode)){
		return;
	}
	if(!autoCheckCode(vercode,phone)){
		layer.msg('验证码错误', {icon: 5});
		return;
	}
	if(!checkUserExists(phone)){
		layer.msg('手机/邮箱已被注册', {icon: 5});
		return;
	}
	if(isChecked!=1){
		layer.msg('请同意用户服务条款', {icon: 5});
		return;
	}
	var data = '{"phone":"'+phone+'","pass":"'+pass+'","username":"'+username+'"}';
	if (validateCode()) {
		$.ajax({
			url : getRootPath() + '/user/login/userRegister.do',
			type : 'post',
			data:data,
	  		async:false,
			contentType:false,
			processData:false,
			cache:false,
			dataType : 'json',
			success : function(data) {
				if(data.oK){
					//var index = parent.layer.getFrameIndex(window.name);
					//debugger;
					parent.layer.open({
						  type: 2,
						  skin: 'layui-layer-molv',
						  area: ['700px', '500px'], //宽高
						  title: '免责声明',
						  shade: 0.6, //遮罩透明度
						  maxmin: true, //允许全屏最小化
						  anim: 1, //0-6的动画形式，-1不开启
						  content: getRootPath() + '/user/toDisclaimer.html',
						  cancel: function(){ 
							    //右上角关闭回调
							    //alert("关闭");
							    //document.parent.close();
							    //return false 开启该代码可禁止点击该按钮关闭
							  window.parent.location.reload();
						  }
					});
					//window.parent.location.reload();
					//parent.layer.close(index);
					
				}else{
					layer.msg('注册失败', {icon: 5});
				}
			},
			error : function() {
				console.log("服务器异常");
			}
		});
	} else {
		console.log("验证码错误");
	}
}
//发送短信邮箱验证码
function sendCode()
{
    //var uphone = $.trim($('#uphone').attr('value'));
    var phone = $.trim($("input[name='phone']").val());
    if(IsEmail(phone)) {
    	//$.post();
        $.ajax({
           type:'post',
           dataType:'json',
           url: getRootPath() + '/user/login/sendEmailValidateCode.do?phone='+phone,
           success:function(data){
        	   if(data.oK){
        		   layer.msg('验证码发送成功，三十分钟内有效', {icon: 6},{time:2000});
        	   }else{
        		   layer.msg('请检查邮箱设置，或者联系本站管理员', {icon: 5},{time:2000});
        	   }
           },
           error:function(){
        	   layer.msg('网络异常', {icon: 5},{time:2000});
           }
       });
    } else if(IsPhone(phone)){
    	layer.msg('本站由于资金原因，暂不支持发送手机号验证码', {icon: 5},{time:2000});
    } else {
    	layer.msg('请填写正确的手机号或者邮箱', {icon: 5},{time:2000});
    }
    
    
}
//校验短信邮箱验证码
function autoCheckCode(userCode,phone)
{
	var flag = false;
    //var userCode = $.trim($("input[name='vercode']").val());
    //var phone = $.trim($("input[name='phone']").val());
    if(userCode.length==4)
    {
        $.ajax({
           type:'post',
           dataType:'json',
           async:false,
           url: getRootPath() + '/user/login/checkEmailValidateCode.do?userCode='+userCode+'&phone='+phone,
           success:function(data){
        	   if(data.oK){
        		   flag = true;
        	   }
           },
           error:function(){
        	   layer.msg('服务异常', {icon: 5});
           }
        });
    } else{
    	layer.msg('验证码为4位', {icon: 5});
    }
    return flag;
}
function validateCode() {
	return true;
}

function checkPass(pass,repass) {
	if(pass!=repass){
		//layer.msg('密码不一致', {icon: 5});
		return false;
	}
	return true;
}

function validateParams(phone,username,pass,repass,vercode) {
	if(!isNotEmpty(phone)){
		layer.msg('手机号或邮箱不可为空', {icon: 5});
		return false;
	}
	if(!IsEmail(phone) && !IsPhone(phone)){
		layer.msg('手机号/邮箱格式不正确', {icon: 5});
		return false;
	}
	if(!isNotEmpty(username)){
		layer.msg('昵称不可为空', {icon: 5});
		return false;
	}
	if(!isNotEmpty(pass)){
		layer.msg('密码不可为空', {icon: 5});
		return false;
	}
	if(!isNotEmpty(repass)){
		layer.msg('请确认密码', {icon: 5});
		return false;
	}
	if(!checkPass(pass,repass)){
		layer.msg('密码不一致', {icon: 5});
		return false;
	}
	if(!isNotEmpty(vercode)){
		layer.msg('请填写验证码', {icon: 5});
		return false;
	}
	return true;
}

function checkUserExists(phone){
	$.ajaxSetup({  
	    async : false  
	});
	var flag = false;
	$.get(getRootPath() + '/user/login/regist/exists.do',{phone:phone},function(data){
		if(data.oK){
			if(data.obj == 0){
				flag = true;
				console.log('不存在');
			}
		}
	},'json');
	return flag;
}
</script>
</html>
