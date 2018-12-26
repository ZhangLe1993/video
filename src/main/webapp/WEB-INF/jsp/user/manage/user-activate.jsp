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
				<li class="layui-this">邮箱激活</li> 
			</ul> 
			<div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;"> 
				<div class="layui-tab-item layui-show"> 
					<div class="layui-form layui-form-pane"> 
						<form id="userLoginForm" method="post"> 
							<div class="layui-form-item"> 
								<label for="L_email" class="layui-form-label">邮箱验证码</label> 
								<div class="layui-input-inline"> 
									<input type="text" id="activate_code" name="activate_code" required="" lay-verify="required" autocomplete="off" class="layui-input"> 
								</div> 
								<div class="layui-form-mid"> 
									<span style="color: #c00;">请填写发送到您邮箱上的验证码</span> 
								</div> 
							</div> 
							
							<div class="layui-form-item"> 
								<a id="loginBtn" onclick="javascript:void(0);" class="layui-btn" >立即验证</a> 
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
	var loginName = $("#activate_code").val();
	if(loginName.length==0 || loginName==null || loginName==undefined || loginName==''){
		layer.msg('激活码为控', {icon: 5});
		return;
	}
  }
  
//校验短信邮箱验证码
  function autoCheckCode(userCode)
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
             url: getRootPath() + '/user/login/checkEmailValidateCode.do?userCode='+userCode,
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
</script>
</html>
