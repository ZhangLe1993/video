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
<title>用户中心</title>
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
<script src="${pageContext.request.contextPath }/base/base.js" charset="utf-8"></script>
<style type="text/css">
body {
	background: #fff;
}
</style>

</head>
<body>
	<div class="fly-header layui-bg-black">
		<div class="layui-container" style="width:100%;">
			<a class="fly-logo" href="/"> 
				<!-- <img src="//res.layui.com/images/fly/logo.png" alt="layui"> -->
				个人中心
			</a>
			<ul class="layui-nav fly-nav-user" style="position:absolute;margin-right:20px;">
				<li class="layui-nav-item">
					<a class="fly-nav-avatar" href="/video/user/toUserManageIndex.html" id="LAY_header_avatar"> 
						<cite class="layui-hide-xs">人鬼殊途</cite> 
						<img src="//thirdqq.qlogo.cn/qqapp/101235792/4D83CB7E10C234FC2112F9A11EEB3635/100">
						<span class="layui-nav-more"></span>
					</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="/user/"><i class="layui-icon"></i>用户中心</a>
						</dd>
						<dd>
							<a href="/user/set/"><i class="layui-icon"></i>基本设置</a>
						</dd>
						<hr>
						<dd>
							<a href="/user/message/"><i class="iconfont icon-tongzhi" style="top: 4px;"></i>我的消息</a>
						</dd>
						<dd>
							<a href="/u/12830496"><i class="layui-icon" style="margin-left: 2px; font-size: 22px;"></i>我的主页</a>
						</dd>
						<hr style="margin: 5px 0;">
						<dd>
							<a href="/user/logout/" style="text-align: center;">退出</a>
						</dd>
					</dl>
				</li>
				<span class="layui-nav-bar" style="width: 0px; left: 0px; opacity: 0;"></span>
			</ul>
		</div>
	</div>
	<div class="layui-container fly-marginTop fly-user-main" style="width:100%">
		<ul class="layui-nav layui-nav-tree layui-inline" lay-filter="user">
			<li class="layui-nav-item">
				<a href="/u/12830496/"> <i class="layui-icon"></i> 我的主页</a>
			</li>
			<li class="layui-nav-item layui-this">
				<a href="/user/"> <i class="layui-icon"></i> 用户中心</a>
			</li>
			<li class="layui-nav-item ">
				<a href="/user/set/"> <i class="layui-icon"></i> 基本设置</a>
			</li>
			<li class="layui-nav-item ">
				<a href="/user/post/"> <i class="iconfont icon-tiezi"></i> 我的帖子</a>
			</li>
			<li class="layui-nav-item ">
				<a href="/user/message/"> <i class="layui-icon"></i> 我的消息</a>
			</li>
			<li class="layui-nav-item ">
				<a href="/user/product/"> <i class="iconfont icon-chanpin"></i> 我的产品</a>
			</li>
			<span class="layui-nav-bar"></span>
		</ul>
		<div class="site-tree-mobile layui-hide">
			<i class="layui-icon"></i>
		</div>
		<div class="site-mobile-shade"></div>
		<div class="fly-panel fly-panel-user" pad20="" style="padding-top: 50px;">
			<div class="fly-msg" style="margin-bottom: 20px;">
				您的邮箱尚未验证，这比较影响您的帐号安全，<a href="/user/activate/">立即去激活？</a>
			</div>
			<div class="layui-row layui-col-space20">
				<div class="layui-col-md6">
					<div class="fly-panel fly-signin fly-panel-border">
						<div class="fly-panel-title">
							签到 <i class="fly-mid"></i> <a href="javascript:;" class="fly-link" id="LAY_signinHelp">说明</a> <i class="fly-mid"></i>
							<a href="javascript:;" class="fly-link" id="LAY_signinTop">活跃榜<span class="layui-badge-dot"></span></a> 
							<span class="fly-signin-days">已连续签到<cite>0</cite>天</span>
						</div>
						<div class="fly-panel-main fly-signin-main" style="height:70px;">
							<button class="layui-btn layui-btn-danger" id="LAY_signin">今日签到</button>
							<span>可获得<cite>5</cite>飞吻
							</span>
						</div>
					</div>
				</div>
				<div class="layui-col-md6">
					<div class="fly-panel fly-panel-border">
						<div class="fly-panel-title">我的会员信息</div>
						<div class="fly-panel-main layui-text"
							style="padding: 18px 15px; height: 70px; line-height: 26px;">
							<p>您的财富经验值：0</p>
							<p>您当前为：非 VIP</p>
						</div>
					</div>
				</div>
				<div class="layui-col-md12" style="margin-top: -20px;">
					<div class="fly-panel fly-panel-border">
						<div class="fly-panel-title">快捷方式</div>
						<div class="fly-panel-main">
							<ul class="layui-row layui-col-space10 fly-shortcut">
								<li class="layui-col-sm3 layui-col-xs4"><a
									href="/user/set/"><i class="layui-icon"></i><cite>修改信息</cite></a>
								</li>
								<li class="layui-col-sm3 layui-col-xs4"><a
									href="/user/set/#avatar"><i class="layui-icon"></i><cite>修改头像</cite></a>
								</li>
								<li class="layui-col-sm3 layui-col-xs4"><a
									href="/user/set/#pass"><i class="layui-icon"></i><cite>修改密码</cite></a>
								</li>
								<li class="layui-col-sm3 layui-col-xs4"><a
									href="/user/set/#bind"><i class="layui-icon"></i><cite>帐号绑定</cite></a>
								</li>
								<li class="layui-col-sm3 layui-col-xs4"><a href="/jie/add/"><i
										class="layui-icon"></i><cite>发表新帖</cite></a></li>
								<li class="layui-col-sm3 layui-col-xs4"><a
									href="/column/share/"><i class="layui-icon"></i><cite>查看分享</cite></a>
								</li>
								<li class="layui-col-sm3 layui-col-xs4 LAY_search"><a
									href="javascript:;"><i class="layui-icon"></i><cite>搜索资源</cite></a>
								</li>
								<li class="layui-col-sm3 layui-col-xs4"><a
									href="/user/post/#collection"><i class="layui-icon"></i><cite>我的收藏</cite></a>
								</li>
								<li class="layui-col-sm3 layui-col-xs4"><a
									href="/jie/15697/"><i class="layui-icon"></i><cite>成为赞助商</cite></a>
								</li>
								<li class="layui-col-sm3 layui-col-xs4"><a
									href="/jie/2461/"><i class="layui-icon"></i><cite>关注公众号</cite></a>
								</li>
								<li class="layui-col-sm3 layui-col-xs4"><a
									href="http://www.layui.com/doc/"><i class="layui-icon"></i><cite>文档</cite></a>
								</li>
								<li class="layui-col-sm3 layui-col-xs4"><a
									href="http://www.layui.com/demo/"><i class="layui-icon"></i><cite>示例</cite></a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="fly-footer">
		<p>
			<a href="http://fly.layui.com/">Fly社区</a> 2018 © <a
				href="http://www.layui.com/">layui.com</a>
		</p>
		<p>
			<a href="http://fly.layui.com/jie/3147/" target="_blank">付费计划</a> <a
				href="http://www.layui.com/template/fly/" target="_blank">获取Fly社区模版</a>
			<a href="http://fly.layui.com/jie/2461/" target="_blank">微信公众号</a>
		</p>
		<p class="fly-union">
			<a href="https://www.upyun.com?from=layui" target="_blank"
				rel="nofollow" upyun=""><img
				src="//res.layui.com//images/other/upyun.png?t=1"></a> <span>提供
				CDN 赞助</span>
		</p>
	</div>
	<script>
	//注意：导航 依赖 element 模块，否则无法进行功能性操作
	layui.use('element', function(){
	  var element = layui.element;
	  //…
	});
	</script>
	<script type="text/javascript">var cnzz_protocol =(("https:" ==document.location.protocol) ?" https://" :" http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_30088308'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "w.cnzz.com/c.php%3Fid%3D30088308' type='text/javascript'%3E%3C/script%3E"));</script>
	<span id="cnzz_stat_icon_30088308"></span>
	<script src="${pageContext.request.contextPath }/resources/login/js/c.js" type="text/javascript"></script>
	<ul class="layui-fixbar" style="width:40px;height:40px;">
		<li class="layui-icon" lay-type="bar1"
			style="background-color: #009688;width:40px;height:40px;"></li>
		<li class="layui-icon layui-fixbar-top" lay-type="top"
			style="background-color: #009688;width:40px;height:40px;"></li>
	</ul>
</body>
</html>
