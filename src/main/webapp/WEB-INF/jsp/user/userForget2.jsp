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
	<%-- <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/resources/login/js/core.js"></script> --%>
	
	<link id="layuicss-layer" rel="stylesheet" href="${pageContext.request.contextPath }/layer/theme/default/layer.css" media="all">
	<style type="text/css">
	   body{background:#fff;}
	</style>
	
  </head>
<body>
<div class="layui-container fly-marginTop"> 
	<div class="fly-panel fly-panel-user" pad20=""> 
		<div class="layui-tab layui-tab-brief" lay-filter="user"> 
			<ul class="layui-tab-title"> 
				<li><a href="${pageContext.request.contextPath }/user/toUserLogin.do">登入</a></li> 
				<li class="layui-this">找回密码</li> 
			</ul> 
			<div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;"> 
				<div class="layui-tab-item layui-show"> 
					<div class="layui-btn-container" style="margin: 10px 0;"> 
						<a href="javascript:;" class="layui-btn layui-btn-sm">通过邮箱找回</a> 
						<a href="${pageContext.request.contextPath }/user/toUserForget.do?type=phone" class="layui-btn layui-btn-sm layui-btn-primary">通过手机找回</a> 
					</div> 
					<div class="layui-form layui-form-pane"> 
						<form method="post"> 
							<div class="layui-form-item"> 
								<label for="L_email" class="layui-form-label">邮箱</label> 
								<div class="layui-input-inline"> 
									<input type="text" id="L_email" name="email" required="" lay-verify="email" autocomplete="off" class="layui-input"> 
								</div> 
							</div> 
							<div class="layui-form-item"> 
								<label for="L_vercodeQuiz" class="layui-form-label">人类验证</label> 
								<div class="layui-input-inline"> 
									<input type="text" id="L_vercodeQuiz" name="vercodeQuiz" required="" lay-verify="required" placeholder="请回答后面的问题" autocomplete="off" class="layui-input"> 
								</div> 
								<div class="layui-form-mid"> 
									<span style="color: #c00;">请在输入框填上：Hello layui</span> 
								</div> 
							</div> 
							<div class="layui-form-item"> 
								<button class="layui-btn" alert="1" lay-filter="*" lay-submit="">提交</button> 
							</div> 
						</form> 
					</div> 
				</div> 
			</div> 
		</div> 
	</div> 
</div>
</body>
</html>
