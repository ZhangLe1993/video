<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>捐助</title>
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
	
	<link id="layuicss-layer" rel="stylesheet" href="${pageContext.request.contextPath }/layer/theme/default/layer.css" media="all">
	<script type="text/javascript" src="${pageContext.request.contextPath }/layui/layui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/layer/layer.js"></script>
	<style type="text/css">
	   body{background:#fff;}
	</style>
  </head>
<body>
<div>
	<div style="position:relative;background-color:#009688;margin-top:20px;">
		<div style="position:relative;width:48%;float:left;margin-left:5px;">
			<div style="position:relative;padding:5px;vertical-align: middle;text-align: center;">
				<img style="position:relative;margin:0 auto;" width="250px" height="250px" src="${pageContext.request.contextPath }/resources/pay/zhifubao_pay.jpg"/>
			</div>
			<div style="position:relative;vertical-align: middle;text-align: center;">
				<label style="position:relative;display:block;font-size:25px;color:#009688;font-weight:bold;">支　付　宝</label>
			</div>
		</div>
		<div style="position:relative;width:48%;float:right;margin-right:5px;">
			<div style="position:relative;padding:5px;vertical-align: middle;text-align: center;">
				<img style="position:relative;margin:0 auto;" width="250px" height="250px" src="${pageContext.request.contextPath }/resources/pay/weixin_pay.jpg"/>
			</div>
			<div style="position:relative;vertical-align: middle;text-align: center;">
				<label style="position:relative;display:block;font-size:25px;color:#009688;font-weight:bold;">微　信</label>
			</div>
		</div>
	</div>
</div>
</body>
</html>
