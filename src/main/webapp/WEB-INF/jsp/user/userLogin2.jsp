<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
	
	<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
	<meta name="applicable-device" content="pc,mobile">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/login/css/bootstrap.min.css">	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/login/css/index.css">   
	<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/0.png" type="image/x-icon" />
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/login/css/font_24081_aym082o86np3z0k9.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/layer/theme/default/layui.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/login/css/global.css" charset="utf-8">
<%-- 	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/resources/login/js/core.js"></script> --%>
	
	<link id="layuicss-layer" rel="stylesheet" href="${pageContext.request.contextPath }/layer/theme/default/layer.css" media="all">
	<script type="text/javascript" src="${pageContext.request.contextPath }/layui/layui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/layer/layer.js"></script>
	<style type="text/css">
	   body{background:#fff;}
	</style>
	
  </head>
<body>
<div class="layui-container fly-marginTop"> 
	<div class="fly-panel fly-panel-user" pad20=""> 
		<div class="layui-tab layui-tab-brief" lay-filter="user"> 
			<ul class="layui-tab-title"> 
				<li class="layui-this">登入</li> 
				<li><a href="${pageContext.request.contextPath }/user/toUserRegister.do">注册</a></li> 
			</ul> 
			<div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;"> 
				<div class="layui-tab-item layui-show"> 
					<div class="layui-form layui-form-pane"> 
						<form id="userLoginForm" method="post"> 
							<div class="layui-form-item"> 
								<label for="L_email" class="layui-form-label">手机/邮箱</label> 
								<div class="layui-input-inline"> 
									<input type="text" id="L_loginName" name="userLoginName" required="" lay-verify="required" autocomplete="off" class="layui-input"> 
								</div> 
							</div> 
							<div class="layui-form-item"> 
								<label for="L_pass" class="layui-form-label">密码</label> 
								<div class="layui-input-inline"> 
									<input type="password" id="L_pass" name="userPassword" required="" lay-verify="required" autocomplete="off" class="layui-input"> 
								</div> 
							</div>
							<div class="layui-form-item"> 
								<label for="L_vercode" class="layui-form-label">人类验证</label> 
								<div class="layui-input-inline">
									<input type="hidden" id="infoAnswer" name="infoAnswer" value="${validate.infoAnswer }"/>  
									<input type="text" id="L_vercode" name="vercode" required="" lay-verify="required" placeholder="请回答后面的问题" autocomplete="off" class="layui-input"> 
								</div> 
								<div class="layui-form-mid"> 
									<span style="color: #c00;">请在输入框填上：${validate.infoQuestion }</span> 
								</div> 
							</div> 
							<div class="layui-form-item"> 
								<a id="loginBtn" onclick="javascript:void(0);" class="layui-btn" >立即登录</a> 
								<span style="padding-left:20px;"> 
									<a href="${pageContext.request.contextPath }/user/toUserForget.do">忘记密码？</a> 
								</span> 
							</div> 
							<div class="layui-form-item fly-form-app"> 
								<span>或者使用社交账号登入</span> 
								<a href="${pageContext.request.contextPath }/user/toQQLogin.do" onclick="layer.msg('正在通过QQ登入', {icon:16, shade: 0.1, time:0})" class="iconfont icon-qq" title="QQ登入"></a> 
								<a href="${pageContext.request.contextPath }/user/toWeiboLogin.do" onclick="layer.msg('正在通过微博登入', {icon:16, shade: 0.1, time:0})" class="iconfont icon-weibo" title="微博登入"></a> 
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
  $(function(){
	  $("#loginBtn").on("click",function(){
		  userLogin();
	  });
  });
  function userLogin(){
	var loginName = $("#L_loginName").val();
	var userPassword = $("#L_pass").val();
	if(loginName.length==0 || loginName==null || loginName==undefined || loginName==''){
		layer.msg('用户名为空', {icon: 5});
		return;
	}
	if(userPassword.length==0 || userPassword==null || userPassword==undefined || userPassword==''){
		layer.msg('密码为空', {icon: 5});
		return;
	}
	
	var infoAnswer = $("input[name='infoAnswer']").val();
	var userAnswer = $("input[name='vercode']").val();
	if(userAnswer.length==0 || userAnswer==null || userAnswer==undefined || userAnswer==''){
		layer.msg('请输入验证', {icon: 5});
		return;
	}
	if(userAnswer!=infoAnswer){
		layer.msg('验证不正确', {icon: 5});
		return;
	}
	
  	var data = '{"loginName":"'+loginName+'","userPassword":"'+userPassword+'"}';
  	$.ajax({
  		url:getRootPath()+'/user/login/toUserLogin.do',
  		type:'post',
  		data:data,
  		async:false,
		contentType:false,
		processData:false,
		cache:false,
  		success:function(data){
  			console.log(data);
  			if(data.oK){
  				console.log("登录成功");
  				layer.msg('登录成功', {icon: 1});
  				setTimeout(function(){
					window.parent.location.reload();
				},1200*1);
  			}else{
  				console.log("用户名不存在或密码错误");
  				layer.msg('用户名不存在或密码错误', {icon: 5});
  			}
  		},
  		error:function(){
  			console.log("服务异常");
  		}
  	});
  }
</script>
</html>
