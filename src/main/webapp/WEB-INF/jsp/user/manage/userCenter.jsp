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
  <title>用户中心</title>
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
        <li class="layui-nav-item layui-this">
          	<a href="/video/user/center"> <i class="layui-icon" style="font-size:20px;"></i>　用户中心</a>
        </li>
        <li class="layui-nav-item">
			<a href="/video/user/settings"> <i class="layui-icon" style="font-size:20px;"></i>　基本设置</a>
		</li>
        <li class="layui-nav-item">
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
    	<div class="fly-panel fly-panel-user" pad20="" style="padding-top:20px;"> 
    		<div class="fly-msg" style="margin-bottom: 20px;"> 您的邮箱尚未验证，这比较影响您的帐号安全，<a href="javascript:void(0);" onclick="toActivate();">立即去激活？</a> </div> <div class="layui-row layui-col-space20"> <div class="layui-col-md6"> <div class="fly-panel fly-signin fly-panel-border"> <div class="fly-panel-title"> 签到 <i class="fly-mid"></i> <a href="javascript:;" class="fly-link" id="LAY_signinHelp">说明</a> <i class="fly-mid"></i> <a href="javascript:;" class="fly-link" id="LAY_signinTop">活跃榜<span class="layui-badge-dot"></span></a> <span class="fly-signin-days">已连续签到<cite>0</cite>天</span> </div> <div class="fly-panel-main fly-signin-main"><button class="layui-btn layui-btn-danger" id="LAY_signin">今日签到</button><span>可获得<cite>5</cite>飞吻</span></div> </div> </div> <div class="layui-col-md6"> <div class="fly-panel fly-panel-border"> <div class="fly-panel-title"> 我的会员信息 </div> <div class="fly-panel-main layui-text" style="padding: 18px 15px; height: 50px; line-height: 26px;"> <p>您的财富经验值：0</p> <p>您当前为：非 VIP</p> </div> </div> </div> <div class="layui-col-md12" style="margin-top: -20px;"> <div class="fly-panel fly-panel-border"> <div class="fly-panel-title"> 快捷方式 </div> <div class="fly-panel-main"> <ul class="layui-row layui-col-space10 fly-shortcut"> <li class="layui-col-sm3 layui-col-xs4"> <a href="/user/set/"><i class="layui-icon"></i><cite>修改信息</cite></a> </li> <li class="layui-col-sm3 layui-col-xs4"> <a href="/user/set/#avatar"><i class="layui-icon"></i><cite>修改头像</cite></a> </li> <li class="layui-col-sm3 layui-col-xs4"> <a href="/user/set/#pass"><i class="layui-icon"></i><cite>修改密码</cite></a> </li> <li class="layui-col-sm3 layui-col-xs4"> <a href="/user/set/#bind"><i class="layui-icon"></i><cite>帐号绑定</cite></a> </li> <li class="layui-col-sm3 layui-col-xs4"> <a href="/jie/add/"><i class="layui-icon"></i><cite>发表新帖</cite></a> </li> <li class="layui-col-sm3 layui-col-xs4"> <a href="/column/share/"><i class="layui-icon"></i><cite>查看分享</cite></a> </li> <li class="layui-col-sm3 layui-col-xs4 LAY_search"> <a href="javascript:;"><i class="layui-icon"></i><cite>搜索资源</cite></a> </li> <li class="layui-col-sm3 layui-col-xs4"> <a href="/user/post/#collection"><i class="layui-icon"></i><cite>我的收藏</cite></a> </li> <li class="layui-col-sm3 layui-col-xs4"> <a href="/jie/15697/"><i class="layui-icon"></i><cite>成为赞助商</cite></a> </li> <li class="layui-col-sm3 layui-col-xs4"> <a href="/jie/2461/"><i class="layui-icon"></i><cite>关注公众号</cite></a> </li> <li class="layui-col-sm3 layui-col-xs4"> <a href="http://www.layui.com/doc/"><i class="layui-icon"></i><cite>文档</cite></a> </li> <li class="layui-col-sm3 layui-col-xs4"> <a href="http://www.layui.com/demo/"><i class="layui-icon"></i><cite>示例</cite></a> </li> </ul> </div> </div> </div> </div> </div>
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


function toActivate(){
		layer.open({
			type: 2,//type为1时，content为String类型如<div></div>
			skin: 'layui-layer-molv',
			title: '又想激活',
			maxmin: true, //开启最大化最小化按钮
			//offset: 'rb',
			//time: 2000, //2秒后自动关闭
			//anim: 2,
			area: ['600px', '400px'],
			content: getRootPath()+'/user/activate/'
		});
	}

/* $(function(){
	$.ajax({
		url:getRootPath()+'/user/login/getCurrentLoginUser.do',
  		type:'post',
  		async:false,
		contentType:false,
		processData:false,
		cache:false,
  		success:function(data){
  			if(data.oK){
  				var object = data.obj;
  				//console.log('有');
  				var html = '<ul class="layui-nav layui-layout-right">'
  			      			+'<li class="layui-nav-item">'
  			    			+'<a href="javascript:;">'
  			  				+'<img src="http://t.cn/RCzsdCq" class="layui-nav-img">'
  							+'人鬼殊途'
  							+'</a>'
  							+'<dl class="layui-nav-child">'
  							+'<dd><a href=""><i class="layui-icon" style="font-size:20px;color: #1E9FFF;">&#xe68e;</i>　我的主页</a></dd>'
  							+'<dd><a href=""><i class="layui-icon" style="font-size:20px;color: #1E9FFF;">&#xe612;</i>　用户中心</a></dd>'
  							+'<dd><a href=""><i class="layui-icon" style="font-size:20px;color: #1E9FFF;">&#xe620;</i>　基本设置</a></dd>'
  							+'<dd><a href=""><i class="layui-icon" style="font-size:20px;color: #1E9FFF;">&#xe63a;</i>　我的消息</a></dd>'
  							+'<dd><a href=""><i class="layui-icon" style="font-size:20px;color: #1E9FFF;">&#xe857;</i>　我的资源</a></dd>'
  							+'<dd><a href=""><i class="layui-icon" style="font-size:20px;color: #1E9FFF;">&#xe65c;</i>　退　　出</a></dd>'
  							+'</dl>'
  							+'</li>'
  							+'</ul>';
  				console.log(data.obj);
  				$("#top-no-login").html(html);
  			}else{
  				console.log('无');
  			}
  		},
  		error:function(){
  			console.log("服务异常");
  		}
	});
});
 */
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