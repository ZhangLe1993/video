<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="青汤文化影视网">
<meta name="description" content="青汤文化影视网-收集唯美古风小视频，让传统文化更加绚烂">
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/0.png" type="image/x-icon" />
<link>
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<title>视频播放</title>
<style>
	.layui-nav{
		border-radius: 0px;
	}
	.right-aligned{
		text-align:right;
	}
	
	.img-fit{
		width:100%;
		height:100%;
	}
	.area{
		position:relative;
	}
	
	/**
		页脚
	**/
	.footer {
	    border-top: 1px solid #e8e8e8;
	    padding: 15px 0;
	    font-family: tahoma,Arial;
	    font-size: 12px;
	    color: #eee;
	    line-height: 22px;
	    text-align: center;
	}


	/* 小于1400 */
	@media (max-width: 1400px) {
		
	}
	
	/* 大于1400  */
	@media (min-width: 1400px) {
		/*  小于1600 */
		@media (max-width: 1600px) {
			.spacing{
				position: relative;
				width:100%;
				height:100px;
				background-color:#000;
			} 
		}
		/* 大于1600 */
		@media (min-width: 1600px) {
			.spacing{
			position: relative;
			width:100%;
			height:124px;
			background-color:#000;
		} 
		}
	    
	}
</style>
</head>
<body>
<div>
	<!-- 头部开始 -->
	<div id="top-no-login">
		<ul class="layui-nav layui-bg-green right-aligned" lay-filter="">
	  		<li class="layui-nav-item">
	    		<a href="javascript:void(0);" onclick="toLogin();">登录</a>
	  		</li>
	  		<li class="layui-nav-item">
	    		<a href="javascript:void(0);" onclick="toRegister();">注册</a>
	  		</li>
	  		<li class="layui-nav-item">
	    		<a href="javascript:void(0);" onclick="toDonate();">捐助</a>
	  		</li>
	  		<li class="layui-nav-item">
	    		<a href="javascript:void(0);" onclick="toToolDownload();">工具</a>
	  		</li>
		</ul>
	</div>
	<div class="spacing"></div>
	<!-- 头部结束 -->
	<!-- 播放器开始 -->
	<div style="position:relative;background:#000;">
		<!-- 嵌入Flash播放器 -->
		<div align="center" class="">
			<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" id="VideoPlayer" align="middle"> 
				<param name="allowScriptAccess" value="*" /> 
				<param name="allowFullScreen" value="true" /> 
				<param name="movie" value="<%=basePath %>/video/tools/Flvplayer.swf?video=<%=basePath %>/video${media.videoContent }" /> 
				<param name="quality" value="high" /> 
				<param name="bgcolor" value="#ffffff" /> 
				<embed src="<%=basePath %>/video/tools/Flvplayer.swf?video=<%=basePath %>/video${media.videoContent }" flashvars="vcastr_file=<%=basePath %>/video${media.videoContent }&IsAutoPlay=0&IsContinue=1&LogoText=QingTang"  quality="high" bgcolor="#000000" width="640" height="480" name="VideoPlayer" align="middle" allowScriptAccess="*" allowFullScreen="true" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" /> 
			</object>
		</div>
	</div>
	<!-- 播放器结束 -->
	<div class="spacing"></div>
	<!-- 页脚 -->
	<div style="position:relative;width:100%;height:150px;background:#009688 !important;">
		<footer class="footer mt-20">
			<div class="container">
				<p>关于青汤|服务条款|广告服务|人才招聘|客服中心|网站导航<br>
					Copyright &copy;2018-2030         青汤网<br>
					<a href="#" target="_blank" title="青汤网">青汤网 版权所有</a></p>
			</div>
		</footer>
	</div>
</div>
<script src="${pageContext.request.contextPath }/base/base.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/account/lib/layer/2.4/layer.js"></script>
<script src="${pageContext.request.contextPath }/layui/layui.js"></script>
<script type="text/javascript">
layui.use('element', function(){
  var element = layui.element;
  //…
});
	
$(function(){
	var user = '';
	user = getLoginInfo();
	if(user != ''){
		drawingUserHtml(user);
	}
});


function drawingUserHtml(object){
	var html = '<ul class="layui-nav layui-bg-green right-aligned" lay-filter="">'
			+'<li class="layui-nav-item">'
			+'<a href="javascript:void(0);" onclick="toToolDownload();">工具</a>'
			+'</li>'
	  		+'<li class="layui-nav-item">'
	  		+'<a href="javascript:void(0);" onclick="toDonate();">捐助</a>'
	  		+'</li>'
	  		+'<li class="layui-nav-item">'
	  		+'<a href="javascript:void(0);">消息<span class="layui-badge">9</span></a>'
	  		+'</li>&nbsp;&nbsp;'
	  		+'<li class="layui-nav-item">'
	  		+'<a id="myPhoto_a" href="javascript:void(0);">'
	  		+'<img id="myPhoto_img" src="'+getRootPath()+'/user/login/getUserPhotoImg.do?userId='+object.userId+'" class="layui-nav-img">'+object.userNickName
	  		+'</a>'
	  		+'<dl class="layui-nav-child">'
	  		+'<dd><a href="'+getRootPath()+'/user/toUserManageIndex.html" target="_blank">我的主页</a></dd>'
	  		+'<dd><a href="javascript:;">用户中心</a></dd>'
	  		+'<dd><a href="javascript:;">基本设置</a></dd>'
	  		+'<dd><a href="javascript:;">我的消息</a></dd>'
	  		+'<dd><a href="javascript:;">我的资源</a></dd>'
	  		+'<dd><a href="javascript:;" onclick="toLoginOut();">退出</a></dd>'
	  		+'</dl>'
	  		+'</li>'
	  		+'</ul>';
		console.log(object);
		$("#top-no-login").html(html);
}
function toLogin(){
	layer.open({
		type: 2,//type为1时，content为String类型如<div></div>
		skin: 'layui-layer-molv',
		title: '登录/注册',
		offset: '100px',
		maxmin: true, //开启最大化最小化按钮
		//offset: 'rb',
		//time: 2000, //2秒后自动关闭
		//anim: 2,
		area: ['600px', '400px'],
		content: getRootPath()+'/user/toUserLogin.do'
	});
}
function toLoginOut(){
	layer.confirm('您确定退出？', {
		  skin: 'layui-layer-molv',
		  offset: '100px',
		  btn: ['确定','取消'] //按钮
		}, function(){
			$.post(getRootPath()+'/user/login/out.do','',function(data){
				//parent.location.reload(); //刷新父亲对象（用于框架）
				//opener.location.reload(); //刷新父窗口对象（用于单开窗口）
				//top.location.reload();    //刷新最顶端对象（用于多开窗口）
				if(data.oK){
					window.location.reload(); //刷新当前页面.
					setTimeout(function(){
						layer.msg('退出成功', {
							offset: '100px',
						    time: 2000, //2s后自动关闭
						    btn: ['明白了', '知道了']
						  });
					},2000);
				}
			},'json');
		  //layer.msg('的确很重要', {icon: 1});
		}, function(){
		  /* layer.msg('也可以这样', {
		    time: 20000, //20s后自动关闭
		    btn: ['明白了', '知道了']
		  }); */
		});
}
function toRegister(){
	layer.open({
		type: 2,//type为1时，content为String类型如<div></div>
		skin: 'layui-layer-molv',
		title: '登录/注册',
		offset: '100px',
		maxmin: true, //开启最大化最小化按钮
		//offset: 'rb',
		//time: 2000, //2秒后自动关闭
		//anim: 2,
		area: ['600px', '400px'],
		content: getRootPath()+'/user/toUserRegister.do'
	});
}

function toDonate(){
	layer.open({
		type: 2,//type为1时，content为String类型如<div></div>
		skin: 'layui-layer-molv',
		title: '捐助',
		offset: '100px',
		maxmin: true, //开启最大化最小化按钮
		//offset: 'rb',
		//time: 2000, //2秒后自动关闭
		//anim: 2,
		area: ['600px', '400px'],
		content: getRootPath()+'/user/toUserDonate.do'
	});
}
var top_login = $("#top-login").html();
var top_no_login = $("#top-no-login").html();

function toToolDownload(){
	layer.open({
		type: 2,//type为1时，content为String类型如<div></div>
		skin: 'layui-layer-molv',
		title: '工具下载',
		offset: '100px',
		//maxmin: true, //开启最大化最小化按钮
		//offset: 'rb',
		//time: 2000, //2秒后自动关闭
		//anim: 2,
		area: ['600px', '400px'],
		content: getRootPath()+'/user/toToolsDownForm.do'
	});
}
</script>
</body>
</html>