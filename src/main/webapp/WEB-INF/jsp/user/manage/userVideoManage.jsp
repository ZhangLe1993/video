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
  <title>我的资源</title>
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
        <li class="layui-nav-item">
        	<a href="/video/user/message/"> <i class="layui-icon" style="font-size:20px;"></i>　我的消息</a>
        </li>
        <li class="layui-nav-item layui-this">
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
    	<div class="fly-panel fly-panel-user" pad20=""> <div class="layui-tab layui-tab-brief" lay-filter="user"> <ul class="layui-tab-title"> <li class="layui-this"><a href="/user/product/">我的产品</a></li>  </ul> <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 5px 0;"> <div class="layui-tab-item layui-show"> <form action="" class="layui-form"> <div class="layui-form-item" style="margin: 10px 0 0;"> <label class="layui-form-label" style="width: auto; padding-right: 5px;">别名筛选：</label> <div class="layui-input-inline"> <input type="text" name="alias" class="layui-input" value=""> </div> <button type="submit" class="layui-btn">搜索</button> </div> </form> <table id="LAY_productList"></table><div class="layui-form layui-border-box layui-table-view" lay-filter="LAY-table-2" style=" "><div class="layui-table-box"><div class="layui-table-header"><table cellspacing="0" cellpadding="0" border="0" class="layui-table"><thead><tr><th data-field="0" data-minwidth="300"><div class="layui-table-cell laytable-cell-2-0"><span>产品名称</span></div></th><th data-field="authProduct"><div class="layui-table-cell laytable-cell-2-authProduct"><span>别名</span></div></th><th data-field="2"><div class="layui-table-cell laytable-cell-2-2"><span>属性</span></div></th><th data-field="expiry_time"><div class="layui-table-cell laytable-cell-2-expiry_time"><span>授权有效期</span></div></th><th data-field="price"><div class="layui-table-cell laytable-cell-2-price"><span>付费金额</span></div></th><th data-field="5"><div class="layui-table-cell laytable-cell-2-5"><span>操作</span></div></th></tr></thead></table></div><div class="layui-table-body layui-table-main"><table cellspacing="0" cellpadding="0" border="0" class="layui-table"><tbody></tbody></table><div class="layui-none">您还没有任何产品授权（推荐：<a href="http://layim.layui.com/#getAuth" target="_blank" class="fly-link">layim</a>）</div></div></div><div class="layui-table-page layui-hide"><div id="layui-table-page2"></div></div><style>.laytable-cell-2-0{ width: 318px; }.laytable-cell-2-authProduct{ width: 100px; }.laytable-cell-2-2{ width: 150px; }.laytable-cell-2-expiry_time{ width: 120px; }.laytable-cell-2-price{ width: 120px; }.laytable-cell-2-5{ width: 100px; }</style></div> </div> </div> </div> </div>
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