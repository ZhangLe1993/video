<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>我的消息</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/login/css/font_24081_aym082o86np3z0k9.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/layer/theme/default/layui.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/login/css/global.css" charset="utf-8">
  <link id="layuicss-layer" rel="stylesheet" href="${pageContext.request.contextPath }/layer/theme/default/layer.css" media="all">
  <script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
  <script src="${pageContext.request.contextPath }/base/base.js" charset="utf-8"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/layer/layer.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">我的控制台</div>
    <div id="top-no-login">
    	<ul class="layui-nav fly-nav-user"> 
    		<li class="layui-nav-item"> 
    			<a class="iconfont icon-touxiang layui-hide-xs" href="/user/login/"></a> 
    		</li> 
    		<li class="layui-nav-item"> 
    			<a href="/user/login/">登入</a> 
    		</li> 
    		<li class="layui-nav-item"> 
    			<a href="/user/reg/">注册</a> 
    		</li> 
    		<li class="layui-nav-item layui-hide-xs"> 
    			<a href="/app/qq/" onclick="layer.msg('正在通过QQ登入', {icon:16, shade: 0.1, time:0})" title="QQ登入" class="iconfont icon-qq"></a> 
    		</li> 
    		<li class="layui-nav-item layui-hide-xs"> 
    			<a href="/app/weibo/" onclick="layer.msg('正在通过微博登入', {icon:16, shade: 0.1, time:0})" title="微博登入" class="iconfont icon-weibo"></a> 
    		</li> 
    		<span class="layui-nav-bar" style="left: 24px; top: 55px; width: 0px; opacity: 0;"></span>
    	</ul>
    </div>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item">
          	<a href="/video/user/home"> <i class="layui-icon" style="font-size:20px;"></i>　我的主页</a>
        </li>
        <li class="layui-nav-item">
          	<a href="/video/user/center"> <i class="layui-icon" style="font-size:20px;"></i>　用户中心</a>
        </li>
        <li class="layui-nav-item">
			<a href="/video/user/settings"> <i class="layui-icon" style="font-size:20px;"></i>　基本设置</a>
		</li>
        <li class="layui-nav-item layui-this">
        	<a href="/video/user/message/"> <i class="layui-icon" style="font-size:20px;"></i>　我的消息</a>
        </li>
        <li class="layui-nav-item">
        	<a href="/video/user/provide/"> <i class="iconfont icon-chanpin" style="font-size:20px;"></i>　我的资源</a>
        </li>
        <li class="layui-nav-item">
        	<a href="javascript:void(0);" onclick="loginOut();"> <i class="layui-icon" style="font-size:20px;">&#xe65c;</i>　退　　出</a>
        </li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
    	<div class="fly-panel fly-panel-user" pad20=""> <div class="layui-tab layui-tab-brief" lay-filter="user" id="LAY_msg" style="margin-top: 15px;"> <button class="layui-btn layui-btn-danger layui-hide" id="LAY_delallmsg">清空全部消息</button> <div id="LAY_minemsg" style="margin-top: 10px;"> <div class="fly-none">您暂时没有最新消息</div> </div> </div></div>	
    </div>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    © layui.com - 底部固定区域
  </div>
</div>
<script src="${pageContext.request.contextPath }/layui/layui.js"></script>
<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
  
});

$(function(){
	var user = '';
	user = getLoginInfo();
	if(user==''){
		location.href = getRootPath()+"/video/toVideoList";
	}else{
		drawTop(user);
	}
});


function drawTop(object){
	//console.log('有');
		var html = '<ul class="layui-nav layui-layout-right">'
	      			+'<li class="layui-nav-item">'
	    			+'<a href="javascript:;">'
	  				+'<img src="'+getRootPath()+'/user/login/getUserPhotoImg.do?userId='+object.userId+'" class="layui-nav-img">'
					+object.userNickName
					+'</a>'
					/* +'<dl class="layui-nav-child">'
					+'<dd><a href="'+getRootPath()+'/user/home"><i class="layui-icon" style="font-size:20px;color: #1E9FFF;">&#xe68e;</i>　我的主页</a></dd>'
					+'<dd><a href="'+getRootPath()+'/user/center"><i class="layui-icon" style="font-size:20px;color: #1E9FFF;">&#xe612;</i>　用户中心</a></dd>'
					+'<dd><a href="'+getRootPath()+'/user/settings"><i class="layui-icon" style="font-size:20px;color: #1E9FFF;">&#xe620;</i>　基本设置</a></dd>'
					+'<dd><a href="'+getRootPath()+'/user/message/"><i class="layui-icon" style="font-size:20px;color: #1E9FFF;">&#xe63a;</i>　我的消息</a></dd>'
					+'<dd><a href="'+getRootPath()+'/user/provide/"><i class="layui-icon" style="font-size:20px;color: #1E9FFF;">&#xe857;</i>　我的资源</a></dd>'
					+'<dd><a href="javascript:;" onclick="toLoginOut();"><i class="layui-icon" style="font-size:20px;color: #1E9FFF;">&#xe65c;</i>　退　　出</a></dd>'
					+'</dl>' */
					+'</li>'
					+'</ul>';
		$("#top-no-login").html(html);
}
</script>
</body>
</html>