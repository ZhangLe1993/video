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
	<div style="position:relative;width:100%;height:100%;margin-top:0px;padding-top:20px;">
		<div style="position:relative;width:105px;height:105px;margin-left:20px;">
			<a style="cursor:pointer;" href="javascript:void(0);" onclick="downloadFile();"><img title="爱奇艺万能播放器" alt="爱奇艺万能播放器" src="${pageContext.request.contextPath }/resources/images/aqiy.jpg"></a>
		</div>
	</div>
</div>
</body>
<script src="${pageContext.request.contextPath }/base/base.js" charset="utf-8"></script>
<script type="text/javascript">
function downloadFile() {
	var src = '/tools/aqiyiPlayer.zip';
	url = getRootPath()+'/user/toolDownload.do?toolRelativeSrc='+src;
    location.href=url;
} 
</script>
</html>
