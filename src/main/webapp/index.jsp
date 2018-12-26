<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="青汤文化影视网">
<meta name="description" content="青汤文化影视网-收集唯美古风小视频，让传统文化更加绚烂">
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/0.png" type="image/x-icon" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/index/index.css">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<title>青汤文化影视网</title>
</head>
<body>
<div id="top-login" style="display:none;">
	<ul class="layui-nav layui-bg-green right-aligned" lay-filter="">
  		<li class="layui-nav-item">
    		<a href="">捐助</a>
  		</li>
  		<li class="layui-nav-item">
    		<a href="">消息<span class="layui-badge">9</span></a>
  		</li>
  		<li class="layui-nav-item">
    		<a id="myPhoto_a" href="">
    			<img id="myPhoto_img" src="${pageContext.request.contextPath }/resources/images/myPhoto.jpg" class="layui-nav-img">我
    		</a>
    		<dl class="layui-nav-child">
      			<dd><a href="javascript:;">用户中心</a></dd>
      			<dd><a href="javascript:;">基本设置</a></dd>
      			<dd><a href="javascript:;">我的消息</a></dd>
      			<dd><a href="javascript:;">我的主页</a></dd>
      			<dd><a href="javascript:;">我的资源</a></dd>
      			<dd><a href="toLoginOut();">退出</a></dd>
    		</dl>
  		</li>
	</ul>
</div>
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
<script type="text/javascript">
	function toLogin(){
		layer.open({
			type: 2,//type为1时，content为String类型如<div></div>
			skin: 'layui-layer-molv',
			title: '登录/注册',
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
			}
		);
	}
	function toRegister(){
		layer.open({
			type: 2,//type为1时，content为String类型如<div></div>
			skin: 'layui-layer-molv',
			title: '登录/注册',
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
			//maxmin: true, //开启最大化最小化按钮
			//offset: 'rb',
			//time: 2000, //2秒后自动关闭
			//anim: 2,
			area: ['600px', '400px'],
			content: getRootPath()+'/user/toToolsDownForm.do'
		});
	}
</script>
<div class="layui-carousel" id="test1">
  <div carousel-item>
    <div><img class="img-fit" src="${pageContext.request.contextPath }/resources/images/146249460.jpg"></div>
    <div><img class="img-fit" src="${pageContext.request.contextPath }/resources/images/146301473.jpg"></div>
    <div><img class="img-fit" src="${pageContext.request.contextPath }/resources/images/146302153.jpg"></div>
    <div><img class="img-fit" src="${pageContext.request.contextPath }/resources/images/146383359.jpg"></div>
    <div><img class="img-fit" src="${pageContext.request.contextPath }/resources/images/146803729.jpg"></div>
  </div>
</div>

<div class="tbody">
	<!-- 间隔区域 -->
	<div class="spacing"></div>
	<!-- 镇店之宝开始 -->
	<div class="today_hot_row" >
		<div class="today_hot_head">
			<div class="today_hot_head_title">
				<h2 class="title_h2">
                    <a href="javascript:void(0);" onclick="getMore('0');" target="_blank" class="title_pic_link">
                    	<span class="title_pic">
      						<img class="img_hot" src="${pageContext.request.contextPath }/resources/images/vindex/populartoday.png" alt="">
  						</span>
  						镇店之宝
  					</a>
                    <a href="javascript:void(0);" class="subtitle" target="_blank" _wind="" _stat="rec-populartoday:title_right">
                      	今生无悔入华夏，来生还住种花家！
                    </a>
                </h2>
			</div>
		</div>
		<div class="today_hot_body">
			<div class="today_hot_body_content">
				<ul class="today_hot_list" sort="today">
					
				</ul>
			</div>
		</div>
	</div>
	<!-- 镇店之宝结束 -->
	
	<!-- 间隔区域 -->
	
	<!-- 国色仙香开始 -->
	<div class="today_hot_row" >
		<div class="today_hot_head">
			<div class="today_hot_head_title">
				<h2 class="title_h2">
                    <a href="javascript:void(0);" onclick="getMore('1');" target="_blank" class="title_pic_link">
                    	<span class="title_pic">
      						<img class="img_hot" src="${pageContext.request.contextPath }/resources/images/vindex/populartoday.png" alt="">
  						</span>
  						国色仙香
  					</a>
                    <a href="javascript:void(0);" class="subtitle" target="_blank" __wind="" _stat="rec-populartoday:title_right">
                      	商女斗艳家国灭！
                    </a>
                </h2>
			</div>
		</div>
		<div class="today_hot_body">
			<div class="today_hot_body_content">
				<ul class="today_hot_list" sort="original">
					
				</ul>
			</div>
		</div>
	</div>
	<!-- 国色仙香结束 -->
	
	<!-- 间隔区域 -->
	
	<!-- 揾英雄泪开始 -->
	<div class="today_hot_row">
		<div class="today_hot_head">
			<div class="today_hot_head_title">
				<h2 class="title_h2">
                    <a href="javascript:void(0);" onclick="getMore('2');" target="_blank" class="title_pic_link">
                    	<span class="title_pic">
      						<img class="img_hot" src="${pageContext.request.contextPath }/resources/images/vindex/populartoday.png" alt="">
  						</span>
  						揾英雄泪
  					</a>
                    <a href="javascript:void(0);" class="subtitle" target="_blank" __wind="" _stat="rec-populartoday:title_right">
                      	古来帝王皆寂寞
                    </a>
                </h2>
			</div>
		</div>
		<div class="today_hot_body">
			<div class="today_hot_body_content">
				<ul class="today_hot_list" sort="others">
					
				</ul>
			</div>
		</div>
	</div>
	<!-- 揾英雄泪结束 -->
	<div id="footer" style="position:relative;width:100%;height:150px;background:#2EAFBB;top:40px;">
		<footer class="footer mt-20">
			<div class="container">
				<p>关于青汤|服务条款|广告服务|人才招聘|客服中心|网站导航<br>
					Copyright &copy;2018-2030         青汤网<br>
					<a href="#" target="_blank" title="青汤网">青汤网 版权所有</a></p>
			</div>
		</footer>
	</div>
</div>

<div class="search_div">
    <input type="text" name="search_param" class="search_input" autocomplete="off"/>
    <div class="search_lx">
    	<div class="sb_head">
        	<div class="sb_title">热门搜索</div>
        	<div class="sb_tools">
            	<a class="sb_more" href="javascript:void(0);" onclick="getMore('0');" target="_blank" title="更多热搜">
            		<span class="icon_text">更多热搜  &gt; </span>
            	</a>
        	</div>
    	</div>
    	<div class="sb_body">
            <div class="sb_item sb_item_1" data-word="牵丝戏" data-stag="101" data-abresult="">
            	<a href="javascript:;" title="牵丝戏" data-word="牵丝戏">
            		<span class="sb_num">1</span>
            		<span class="sb_name">牵丝戏</span>
            	</a>
            </div>
            <div class="sb_item sb_item_2" data-word="山鬼" data-stag="101" data-abresult=""><a href="javascript:;" title="山鬼" data-word="山鬼"><span class="sb_num">2</span><span class="sb_name">山鬼</span></a></div>
            <div class="sb_item sb_item_3" data-word="菁华浮梦" data-stag="101" data-abresult=""><a href="javascript:;" title="菁华浮梦" data-word="菁华浮梦"><span class="sb_num">3</span><span class="sb_name">菁华浮梦</span></a></div>
            <div class="sb_item sb_item_4" data-word="马步谣" data-stag="101" data-abresult=""><a href="javascript:;" title="马步谣" data-word="马步谣"><span class="sb_num">4</span><span class="sb_name">马步谣</span></a></div>
            <div class="sb_item sb_item_5" data-word="锦鲤抄" data-stag="101" data-abresult=""><a href="javascript:;" title="锦鲤抄" data-word="锦鲤抄"><span class="sb_num">5</span><span class="sb_name">锦鲤抄</span></a></div>
            <div class="sb_item sb_item_6" data-word="半壶纱" data-stag="101" data-abresult=""><a href="javascript:;" title="半壶纱" data-word="半壶纱"><span class="sb_num">6</span><span class="sb_name">半壶纱</span></a></div>
            <div class="sb_item sb_item_7" data-word="唐人" data-stag="101" data-abresult=""><a href="javascript:;" title="唐人" data-word="唐人"><span class="sb_num">7</span><span class="sb_name">唐人</span></a></div>
            <div class="sb_item sb_item_8" data-word="盗将行" data-stag="101" data-abresult=""><a href="javascript:;" title="盗将行" data-word="盗将行"><span class="sb_num">8</span><span class="sb_name">盗将行</span></a></div>
            <div class="sb_item sb_item_9" data-word="秦淮八艳" data-stag="101" data-abresult=""><a href="javascript:;" title="秦淮八艳" data-word="秦淮八艳"><span class="sb_num">9</span><span class="sb_name">秦淮八艳</span></a></div>
            <div class="sb_item sb_item_10" data-word="琴师 " data-stag="101" data-abresult=""><a href="javascript:;" title="琴师 " data-word="琴师 "><span class="sb_num">10</span><span class="sb_name">琴师 </span></a></div>
    	</div>
	</div>
    <button class="search_button">全库搜</button>
</div>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/share/share.css" media="all">
<!-- 分享区域 -->
<div id="share">
<div class="shareDiv shareDivIsShow" id="shareDiv">
		<div class="shareHead"></div>
		<div class="shareBody">
			<div class="shareBtnDiv">
				<ul class="shareUl">
					<li class="share_qq_li">
						<a class="share_qq_a" href="javascript:void(0);" onclick="shareToQQ(this);" target="_blank">
							<i class="share_qq_i">
								<svg class="share_svg" viewBox="0 0 40 40" width="40" height="40">
									<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg_icon_qq">
										<svg id="svg_icon_qq" viewBox="0 0 24 24" width="100%" height="100%">
											<path id="qq_share_click" fill="#fff" d="M20.8 17.2c0.7 1 1.2 1.4 1.6 1.1 0.4-0.3 0.6-1.1 0.5-2.5 0-0.6-0.2-1.2-0.5-1.9 -0.3-0.7-0.7-1.3-0.9-1.7 -0.3-0.4-0.5-0.7-0.8-1.1 0.1-0.2 0.1-0.4 0.1-0.7 0-0.5-0.1-0.9-0.5-1.2 0-0.1 0-0.2 0-0.3 0-0.3-0.1-0.6-0.4-0.9V7.8c0-2.1-0.7-3.9-2.2-5.4s-3.4-2.2-5.5-2.2 -4 0.7-5.5 2.2S4.3 5.7 4.3 7.8v0.3C3.9 8.3 3.7 8.7 3.7 9.1c0 0.1 0 0.1 0 0.3 -0.3 0.3-0.5 0.7-0.5 1.2 0 0.2 0.1 0.4 0.1 0.7 -0.3 0.3-0.5 0.7-0.8 1 -0.3 0.4-0.6 0.9-0.9 1.7 -0.3 0.7-0.5 1.4-0.5 2 -0.1 0.5 0 1.1 0.1 1.5 0.1 0.5 0.2 0.8 0.4 1 0.2 0.2 0.4 0.3 0.7 0 0.3-0.2 0.7-0.6 1-1.3 0.3 1 0.9 1.9 1.7 2.8 -0.1 0-0.4 0.1-0.6 0.3s-0.3 0.3-0.4 0.3c-0.1 0.1-0.1 0.2-0.1 0.3s0 0.2 0 0.3v0.1c-0.1 0-0.1 0.1-0.1 0.1 -0.3 0.3-0.3 0.7-0.1 1.3 0.5 0.9 1.6 1.4 3.4 1.4 2 0 3.4-0.4 4.1-1.2 0.4 0.1 0.8 0.1 1.2 0.1 0.3 0 0.6 0 1 0 0.7 0.8 2 1.2 4 1.2 0.6 0 1.2-0.1 1.6-0.2 1.1-0.3 1.6-0.8 1.8-1.6 0.1-0.5 0-0.9-0.3-1l0.1-0.3c0.1-0.1-0.1-0.3-0.3-0.5 -0.2-0.2-0.5-0.4-1-0.5C19.8 19 20.4 18.2 20.8 17.2L20.8 17.2z"></path>
										</svg>	
									</use>
								</svg>
							</i>
						</a>
					</li>
					<li class="share_qq_zone_li">
						<a class="share_qq_zone_a" href="javascript:void(0);" onclick="shareToQzone(this);">
							<i class="share_qq_zone_i">
								<svg class="share_svg" viewBox="0 0 40 40" width="40" height="40">
									<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg_icon_qzone">
										<svg fill="#fff" id="svg_icon_qzone" viewBox="0 0 24 24" width="100%" height="100%">
											<path d="M12.2 1c0.2-0.1 0.3 0 0.5 0.1 0.1 0.1 0.6 1.1 1.5 3 0.8 1.8 1.3 3 1.5 3.5 0.2 0.5 0.4 0.7 0.5 0.8 0.1 0 1.3 0.1 3.6 0.4l3.6 0.4c0.1 0.1 0.3 0.1 0.3 0.1 0.1 0.1 0.1 0.1 0.1 0.3s-0.9 1.1-2.7 3l-2.7 2.8 0.1 0.6c0 0.1 0 0.2 0 0.2 -0.1 0.1-0.9 0.1-2.4 0.1s-2.7-0.1-3.8-0.3c-0.7-0.1-1.1-0.2-1.1-0.3 0-0.1 0.1-0.1 0.3-0.3 0 0 0.6-0.5 1.7-1.3 1.1-0.8 2.2-1.6 3.2-2.4 1-0.7 1.5-1.2 1.6-1.3 0-0.1-0.1-0.1-0.1-0.1 -0.1 0-0.4-0.1-0.9-0.1 -1.1-0.1-2.5-0.3-4.2-0.3 -0.3 0-0.7 0-1.1 0 -2.3 0.1-4 0.2-5.1 0.4 -0.3 0.1-0.4 0.1-0.1 0.1 0.1 0.1 0.8 0.1 1.8 0.1 2 0.1 3.7 0.2 4.9 0.4l0.9 0.1c0.1 0.1 0.1 0.1 0 0.3 -0.2 0.1-1.8 1.4-4.8 3.6 -1.1 0.9-1.7 1.3-1.7 1.3 -0.1 0.1-0.2 0.3-0.1 0.3S9 17 11 17.1c1.8 0.1 3.4 0.1 4.9-0.1 1-0.1 2-0.3 2.9-0.4 0.7-0.1 1-0.2 1.1-0.1 0.1 0.1-0.2 0.3-0.8 0.5 -0.2 0.1-0.3 0.2-0.4 0.3 0 0.1 0 0.5 0.1 1.1l0.7 3.6c0.1 0.3 0.1 0.5 0.1 0.6 0.1 0.6 0 0.9-0.2 0.9 -0.1 0.1-0.3 0-0.5-0.1 -0.2-0.1-0.5-0.3-0.9-0.5 -2.2-1.4-3.8-2.3-4.8-2.9 -0.2-0.1-0.4-0.2-0.5-0.3 -0.3-0.1-0.7 0.1-1.2 0.5l-2.6 1.6c-1.5 0.9-2.4 1.5-2.6 1.6 -0.5 0.3-0.8 0.3-0.9 0.1 -0.1-0.1-0.1-0.3-0.1-0.5 0-0.2 0.1-0.8 0.3-1.7 0.7-3.6 1-5.5 1-5.7 0-0.1-0.9-1.1-2.6-2.8S1.1 10.1 1.1 10C1 9.9 1 9.8 1 9.6c0-0.1 0.1-0.2 0.1-0.3S2.1 9.2 3.7 9c2.4-0.3 3.8-0.5 4.1-0.5 0.4-0.1 0.6-0.1 0.7-0.3C8.6 8.1 9 7.1 10 5l1.8-3.5C11.9 1.3 12.1 1.1 12.2 1z"></path>
										</svg>
									</use>
								</svg>
							</i>
						</a>
					</li>
					<li class="share_weibo_li">
						<a class="share_weibo_a" href="javascript:void(0);" onclick="shareToWeibo(this);">
							<i class="share_weibo_i">
								<svg class="share_svg" viewBox="0 0 40 40" width="40" height="40">
									<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg_icon_weibo">
										<svg fill="#fff" id="svg_icon_weibo" viewBox="0 0 24 24" width="100%" height="100%">
											<path d="M18.4 11.6c0.2 0.1 0.5 0.1 0.8 0.3 0.3 0.1 0.6 0.3 0.9 0.7s0.6 0.7 0.8 1c0.2 0.4 0.3 0.9 0.3 1.5 0 0.6-0.2 1.3-0.5 1.9 -0.5 1.2-1.5 2.2-2.8 3 -1.3 0.8-2.8 1.4-4.3 1.7s-3 0.5-4.4 0.4c-0.9-0.1-1.7-0.2-2.5-0.3C6 21.5 5.2 21.3 4.3 21c-0.9-0.3-1.6-0.7-2.2-1.2S0.9 18.8 0.5 18c-0.5-0.7-0.7-1.5-0.9-2.5v-0.3c0-0.1 0-0.4 0.1-0.7 0.1-0.3 0.1-0.7 0.2-1.1 0.1-0.4 0.3-0.9 0.6-1.4 0.3-0.5 0.6-1.1 1-1.6L1.8 10c0.2-0.3 0.5-0.7 1-1.1C3.2 8.5 3.7 8 4.3 7.5 4.8 7 5.4 6.5 6.1 6c0.7-0.5 1.4-0.8 2-1.1 0.7-0.2 1.3-0.3 1.7-0.4 0.5 0 0.9 0.1 1.2 0.2 0.3 0.1 0.5 0.3 0.7 0.6C11.8 5.6 12 5.9 12 6.2c0.1 0.3 0.1 0.5 0.1 0.8 0 0.1-0.1 0.3-0.1 0.4C12 7.5 12 7.7 12 7.7V8c0 0.1 0 0.2 0 0.2s0.1 0.1 0.1 0.1c0.1 0.1 0.2 0.1 0.3 0 0.1 0 0.3-0.1 0.5-0.1L13.3 8c0.3-0.1 0.6-0.2 1-0.3s0.8-0.2 1.3-0.3c0.4-0.1 0.9-0.1 1.3 0 0.4 0.1 0.8 0.3 1.1 0.5 0.2 0.2 0.4 0.5 0.5 0.7s0.1 0.5 0.1 0.7 -0.1 0.5-0.1 0.7c-0.3 0.5-0.3 0.6-0.3 0.7L17.8 11c-0.1 0.1-0.1 0.2 0.1 0.3C17.9 11.5 18.1 11.6 18.4 11.6zM9.6 20.7c2-0.1 3.8-0.7 5.3-1.8 1.5-1.1 2.2-2.4 2.2-3.8s-0.7-2.4-2.2-3.2c-1.5-0.8-3.2-1.1-5.3-1.1 -2.1 0.1-3.9 0.7-5.3 1.6s-2.2 2.2-2.2 3.6 0.7 2.6 2.2 3.4C5.7 20.3 7.5 20.7 9.6 20.7zM8.7 12.6c0.8-0.1 1.5 0 2.1 0.2 0.6 0.2 1.1 0.5 1.3 0.9 0.3 0.4 0.5 0.9 0.7 1.4 0.1 0.5 0.1 1 0.1 1.5 -0.1 0.5-0.3 0.9-0.5 1.2 -0.7 0.9-1.6 1.5-2.6 1.7 -1.1 0.3-2.3 0.1-3.6-0.5 -0.2-0.1-0.4-0.3-0.6-0.5 -0.1-0.2-0.3-0.3-0.3-0.5 -0.1-0.1-0.1-0.3-0.1-0.5C5 17.4 5 17.2 5 17.2V17v-0.2c0-0.1 0-0.3 0.1-0.6 0-0.3 0.1-0.5 0.1-0.8 0.1-0.3 0.2-0.6 0.3-0.9 0.2-0.3 0.4-0.6 0.7-0.9 0.3-0.3 0.6-0.5 1.1-0.7C7.7 12.8 8.2 12.7 8.7 12.6zM8.7 17.7c0.3-0.3 0.4-0.6 0.4-0.9S8.9 16.2 8.7 16c-0.3-0.2-0.7-0.3-1.1-0.3 -0.4 0.1-0.7 0.2-0.9 0.5 -0.3 0.3-0.4 0.6-0.4 0.9s0.1 0.6 0.4 0.8c0.3 0.2 0.6 0.3 1 0.3 0.4-0.1 0.7-0.1 0.8-0.3L8.7 17.7zM10.4 15.7c0.1-0.1 0-0.3-0.1-0.4 -0.1-0.1-0.2-0.2-0.3-0.2s-0.3 0-0.5 0.1c-0.1 0.1-0.2 0.2-0.3 0.4 -0.1 0.2 0 0.3 0.1 0.4 0.1 0.1 0.2 0.2 0.3 0.2s0.3 0 0.4-0.1c0.1-0.1 0.2-0.2 0.2-0.3L10.4 15.7zM20.4 9.9c-0.2 0-0.3-0.1-0.5-0.2 -0.1-0.1-0.2-0.3-0.2-0.5V8.9c0.1-0.2 0.1-0.5 0-0.7s-0.1-0.5-0.3-0.8c-0.1-0.3-0.4-0.5-0.7-0.6s-0.9-0.1-1.5 0c-0.2 0-0.3-0.1-0.5-0.2 -0.1-0.1-0.2-0.3-0.2-0.5 0-0.2 0.1-0.3 0.2-0.5 0.1-0.1 0.3-0.2 0.5-0.2h0.3c0.1-0.1 0.3-0.1 0.6 0 0.3 0 0.5 0.1 0.8 0.1 0.3 0.1 0.6 0.2 0.9 0.3 0.3 0.2 0.5 0.4 0.7 0.7C20.8 6.7 21 7.1 21 7.6s0.1 1.1 0 1.6v0.1c0 0.1-0.1 0.3-0.2 0.4C20.8 9.9 20.6 9.9 20.4 9.9zM20 1.9c0.6 0.1 1.1 0.3 1.6 0.6s1.1 0.7 1.6 1.1c0.5 0.5 0.9 1.1 1.2 1.7C24.7 6 24.8 6.7 25 7.6c0.1 0.9-0.1 1.8-0.4 2.9 -0.1 0.3-0.1 0.6-0.3 0.7 -0.1 0.1-0.4 0.1-0.7 0.1 -0.3 0-0.5-0.1-0.7-0.3 -0.2-0.1-0.3-0.4-0.3-0.7 0-0.3 0.1-0.7 0.2-0.9 0.3-1.1 0.2-2.2-0.3-3.3 -0.3-0.5-0.7-0.9-1.1-1.3 -0.4-0.3-0.9-0.6-1.2-0.8 -0.4-0.1-0.8-0.3-1.2-0.4 -0.4-0.1-0.7-0.1-0.9-0.1l-0.5 0.1c-0.2 0.1-0.5 0.1-0.9 0.2 -0.3 0-0.5-0.1-0.7-0.3 -0.2-0.2-0.3-0.4-0.3-0.7s0.1-0.5 0.2-0.7c0.1-0.2 0.3-0.3 0.5-0.4 0.1 0 0.1 0 0.1 0h0.1C17.8 1.7 19 1.7 20 1.9z"></path>
										</svg>
									</use>
								</svg>
							</i>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
	<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/layer/layer.js"></script> --%>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/account/lib/layer/2.4/layer.js"></script>
<script src="${pageContext.request.contextPath }/layui/layui.js"></script>
<script>
//注意：导航 依赖 element 模块，否则无法进行功能性操作
layui.use('element', function(){
  var element = layui.element;
  //…
});

layui.use('carousel', function(){
	  var carousel = layui.carousel;
	  //建造实例
	  carousel.render({
	    elem: '#test1'
	    ,width: '100%' //设置容器宽度
	    ,height: '490px' //设置容器高度
	    ,arrow: 'always' //始终显示箭头
	    //,anim: 'updown' //切换动画方式
	  });
});
</script>

<script>

$(function(){
	$(".search_button").bind('click',function(){
		searchMore();
	});
	/**
		初始化搜索框的显示文本
	**/
	var static_text = $(".search_lx .sb_item:first").data("word");
	$(".search_input").val(static_text);
	
	//搜索输入框获得焦点方法
	/**
		显示热门搜索div
	**/
	$(".search_input").bind("focus",function(){
	    $(".search_lx").attr("class","search_lx_show");
	    $(".search_input").val('');
	});
	
	//搜索输入框失去焦点方法
	/**
		不显示热门搜索div
	**/
	//x的值相对于文档的左边缘。y的值相对于文档的上边缘  
	//x,y是全局变量;  
	//判断鼠标是否在某DIV中  
	var _x=0;
	var _y=0;
	
	$(document).mousemove(function(e){  
		_x = e.pageX;  
	    _y = e.pageY;   
	});
	var _y1 = 0;  //div上面两个的点的y值  
	var _y2 = 0;//div下面两个点的y值  
	var _x1 = 0;  //div左边两个的点的x值  
	var _x2 = 0;  //div右边两个点的x的值  
	$(".search_input").bind("blur",function(){
		var div = $('.search_lx_show');//获取你想要的DIV  
		_y1 = div.offset().top;
	    _y2 = _y1 + div.height();
	    _x1 = div.offset().left;
	    _x2 = _x1 + div.width(); 
		if( _x < _x1 || _x > _x2 || _y < _y1 || _y > _y2){  
			$(".search_lx_show").attr("class","search_lx");
			i=0;
		    $(".search_lx_show .sb_item").each(function(){
		    	$(this).removeClass("sb_item_kewdown");
		    });
		}else{  
		    
		}  
		$(".sb_item").bind('click',function(){
			var text = $(this).data("word");
        	console.log("1");
			$(".search_input").val(text);
		});
	    /* $(".search_lx_show").attr("class","search_lx"); */
	    /*
	    	键盘输入时间全局变量，不显示时置0
	    	去除键盘焦点所在背景颜色
	    */
	    /* i=0;
	    $(".search_lx_show .sb_item").each(function(){
	    	$(this).removeClass("sb_item_kewdown");
	    }) */
	});
	
	var i=0;
	$(window).keydown(function(event){
		var classes = $("div .search_lx_show").css("display");
		if(classes != 'none' && classes != undefined){
			switch(event.keyCode){
	        	case 38:
	        		if(i==0){
	        			i=10;
	        			$(".search_lx_show .sb_item:first").removeClass("sb_item_kewdown");
	        			$(".search_lx_show .sb_item:last").addClass("sb_item_kewdown");
	        			console.log(i);
	        			var text = $(".search_lx_show .sb_item:last").data("word");
		            	
	        			$(".search_input").val(text);
	        		}else{
	        			$(".search_lx_show .sb_item_"+i).removeClass("sb_item_kewdown");
	        			i--;
	        			console.log(i);
		            	$(".search_lx_show .sb_item_"+i).addClass("sb_item_kewdown");
		            	var text = $(".search_lx_show .sb_item_"+i).data("word");
		            	
		            	$(".search_input").val(text);
	        		}
	            	break;
	        	case 40:
	        		var obj;
	        		if(i==0){
	        			$(".search_lx_show .sb_item:last").removeClass("sb_item_kewdown");
		        		$(".search_lx_show .sb_item:first").addClass("sb_item_kewdown");
		        		obj = $(".search_lx_show .sb_item:first");
	        		}
	        		if(i>=10){
	        			i=0;
	        			$(".search_lx_show .sb_item:last").removeClass("sb_item_kewdown");
		        		$(".search_lx_show .sb_item:first").addClass("sb_item_kewdown");
		        		obj = $(".search_lx_show .sb_item:first");
	        		}
	        		$(".search_lx_show .sb_item_"+i).removeClass("sb_item_kewdown");
	            	i++;
	            	console.log(i);
	            	$(".search_lx_show .sb_item_"+i).addClass("sb_item_kewdown");
	            	obj = $(".search_lx_show .sb_item_"+i);
	            	var text = obj.data("word");
	            	$(".search_input").val(text);
	            	break;
	     	} 
		}
	});
	
	doxr();
	
	/* $(".today_hot_item_descript").bind("mouseenter",function(){
	    $(".item_link_img").attr("src","${pageContext.request.contextPath }/resources/images/vindex/item-hover-play.png");
	    $(".item_link_description").attr("class","item_link_description-hover");
	});
	
	$(".today_hot_item_descript").bind("mouseleave",function(){
		$(".item_link_img").attr("src","${pageContext.request.contextPath }/resources/images/vindex/item-play.png");
		$(".item_link_description-hover").attr("class","item_link_description");
	});
	
	
	$(".today_hot_link").bind("mouseenter",function(){
	    $(".item_link_img").attr("src","${pageContext.request.contextPath }/resources/images/vindex/item-hover-play.png");
	    $(".item_link_description").attr("class","item_link_description-hover");
	    $(".today_hot_item_descript").attr("class","today_hot_item_descript-hover");
	    
	});
	
	$(".today_hot_link").bind("mouseleave",function(){
		$(".item_link_img").attr("src","${pageContext.request.contextPath }/resources/images/vindex/item-play.png");
		$(".item_link_description-hover").attr("class","item_link_description");
		$(".today_hot_item_descript-hover").attr("class","today_hot_item_descript");
	}); */
	
	//today_hot_item_descript
	/* $(".car_icon").bind("click",function(){
		$(this).parent().parent().attr("href",$(".car_icon").attr("url"));
	});
	
	$(".buy_icon").bind("click",function(){
		$(this).parent().parent().attr("href",$(".buy_icon").attr("url"));
	}); */
	
	iconEvent();
});
function iconEvent(){
	$(".car_icon").bind("click",function(){
		//$(this).parent().parent().attr("href",$(".car_icon").attr("url"));
		$(this).parent().parent().attr("href","javascript:void(0);");
	});
	
	$(".car_icon").each(function() {
		var share = $($("#share").html());
		$(this).hover(function() {
			var shareDivWidth = $($("#shareDiv")).width();
			var leftLength = $(this).offset().left;
			var windowsWidth = $(window).width();
			var sub = windowsWidth-leftLength;
			$(this).parent().parent().append(share);
			if(sub<shareDivWidth){
				$("#shareDiv").css("right", "0px");
				$("#shareDiv").attr("class", "shareDivBefore shareDivIsShow");
			}
			share.slideDown("fast");
			
		}, function() {moveHide(share)});
	});
	var moveHide = function(obj) {
		$(document).mouseover(function(e){
			var x1 = obj.offset().left;
			var x2 = x1 + obj.width();
			var y1 = obj.offset().top;
			var y2 = obj.height() + obj.offset().top;
			var X = e.pageX;
			var Y = e.pageY;
			if(X < x1 || X > x2 || Y > y2) {
				obj.slideUp("fast", function() {
					obj.remove();
				});
			}
		});
	}
	
	/* $(".car_icon").bind("mouseleave",function(){
		var obj = $("#shareDiv");
		$(this).parent().parent().find(obj).remove();
	}); */
	
	$(".buy_icon").bind("click",function(){
		//$(this).parent().parent().attr("href",$(".buy_icon").attr("url"));
		$(this).parent().parent().attr("href","javascript:void(0);");
	});
	
	$(".buy_icon").each(function() {
		$(this).on("click",function() {
			var videoId = $(this).attr("name");
			var videoSrc = $(this).attr("url");
			console.log("下载路径："+videoSrc);
			console.log("执行下载");
			/* var html = '<div class="layui-form">'
			      		+'<input type="radio" name="sex" title=".Flv" checked><div class="layui-unselect layui-form-radio layui-form-radioed"><i class="layui-anim layui-icon layui-anim-scaleSpring"></i><div>.flv</div></div><br>'
			      		+'<input type="radio" name="sex" title=".mp4" disabled=""><div class="layui-unselect layui-form-radio layui-radio-disbaled layui-disabled"><i class="layui-anim layui-icon"></i><div style="color:#5FB878">.mp4</div></div><br>'
			      		+'<input type="radio" name="sex" title=".mkv" disabled=""><div class="layui-unselect layui-form-radio layui-radio-disbaled layui-disabled"><i class="layui-anim layui-icon"></i><div>.mkv</div></div>'
			      		+'</div>'; */
			var user = '';
			user = getLoginInfo();
			if(user==''){
				layer.alert('<span style="color:#009688;font-size:15px;letter-spacing:5px;">登陆后可免费下载</span>', {
					  title:'温醒提示',
					  skin: 'layui-layer-molv' //样式类名
				});
				return;
			}
			$.get(getRootPath()+'/video/videoPrevDownload.do',{videoId:videoId,videoSrc:videoSrc},function(data){
				console.log(data);
				if(data.oK){
					layer.alert('<span style="color:#009688;font-size:15px;letter-spacing:5px;">本站目前只支持flv格式下载,是否确定下载<br>稍后您可在本站下载播放工具进行播放</span>', {
						  title:'下载',
						  skin: 'layui-layer-molv' //样式类名
						}, function(){
						  layer.open({
							type:2,
							title:'下载',
							area: ['370px', '255px'],
						    skin: 'layui-layer-lan'
						    ,anim: 4 //动画类型
						    ,content: getRootPath()+'/video/skip/to/download/form.do?videoId='+videoId+'&videoSrc='+videoSrc
						  });
						});
				}else{
					layer.alert('<span style="color:#009688;font-size:15px;letter-spacing:5px;">文件状态异常，不支持下载，<br>请贿赂管理员，<br>管理员QQ：1032089468</span>', {
						  title:'下载',
						  skin: 'layui-layer-molv' //样式类名
					});
					console.log("文件状态异常，不支持下载，请贿赂管理员，管理员QQ：1032089468");
				}
			},'json');
		});
	});
}
function doxr(){
	var width = $(window).width();
	var space = "&nbsp;";
	
	console.log(width);
	var gs = 5;
	if(width == 1920){
		gs=5;
	}
	if(gs == 5){
		//space = "&nbsp;&nbsp;&nbsp;&nbsp;";
	}
	console.log(gs);
	//var htmls = '<ul class="today_hot_list">';
	var html = '';
	var list = getVideoList(gs,'0');//查询今日热门
	var original = getVideoList(gs,'1');//查询原创精选
	var others = getVideoList(gs,'3');//查询原创精选
	console.log(list);
	console.log(original);
	
	/**
	*渲染今日热门
	**/
	for(var i=0;i<gs;i++){
		//console.log(list[i].videoCover);
		//console.log(list[i].videoContent);
		html='<li class="list_item">'
				+'<a target="_blank" href="${pageContext.request.contextPath}/video/play.do?id='+list[i].videoId+'" class="today_hot_link" sort="today_hot_link'+i+'">'
					+'<span class="today_hot_link_span">'
						+'<img class="today_hot_img" src="'+getRootPath()+list[i].videoCover+'" >'
					+'</span>'
					+'<div class="fire_icon_car">'
						+'<span url="https://www.baidu.com" class="car_icon">分享</span>'
					+'</div>'
					+'<div class="fire_icon_buy">'
						+'<span url="'+list[i].videoContent+'" name="'+list[i].videoId+'" class="buy_icon">下载</span>'
					+'</div>'
					+'<div class="fire_video_name" style="position:relative;opacity:0.7;filter:alpha(opacity=50);background:#7AFEC6;width:100%;height:25px;top:-200px;">'
						+'<span style="position:relative;font-size:18px;color:#000;font-family:STFangsong;font-style: italic;font-weight: bold;margin:0 auto;text-align:center;display:block;padding-top:3px;">'+list[i].videoName+'</span>'
					+'</div>'
				+'</a>'
				+'<div class="today_hot_item_descript" sort="today_hot_item_descript'+i+'">'
					+'<strong class="item_descript">'
						+'<a target="_blank" href="${pageContext.request.contextPath}/video/play.do?id='+list[i].videoId+'" class="item_link_description" sort="item_link_description'+i+'" title="'+list[i].videoTitle+'">'+list[i].videoTitle+'</a>'
					+'</strong>'
					+'<a target="_blank" href="${pageContext.request.contextPath}/video/play.do?id='+list[i].videoId+'" class="item_link_a">'
						+'<img class="item_link_img" sort="item_link_img'+i+'" alt="" src="${pageContext.request.contextPath }/resources/images/vindex/item-play.png">'
					+'</a>'
				+'</div>'
			+'</li>'
			+space;
			//htmls = html+htmls;
		$("ul[sort='today']").append(html);
		doBind(i);
	}
	
	/**
	*渲染原创精选
	**/
	for(var i=0;i<gs;i++){
		//console.log(list[i].videoCover);
		//console.log(list[i].videoContent);
		html='<li class="list_item">'
				+'<a target="_blank" href="${pageContext.request.contextPath}/video/play.do?id='+original[i].videoId+'" class="today_hot_link" sort="today_hot_link'+(i+gs)+'">'
					+'<span class="today_hot_link_span">'
						+'<img class="today_hot_img" src="'+getRootPath()+original[i].videoCover+'" >'
					+'</span>'
					+'<div class="fire_icon_car">'
						+'<span url="https://www.baidu.com" class="car_icon">分享</span>'
					+'</div>'
					+'<div class="fire_icon_buy">'
						+'<span url="'+original[i].videoContent+'" name="'+original[i].videoId+'" class="buy_icon">下载</span>'
					+'</div>'
					+'<div class="fire_video_name" style="position:relative;opacity:0.7;filter:alpha(opacity=50);background:#ea175b;width:100%;height:25px;top:-200px;">'
						+'<span style="position:relative;font-size:18px;color:#000;font-family:STFangsong;font-style: italic;font-weight: bold;margin:0 auto;text-align:center;display:block;padding-top:3px;">'+original[i].videoName+'</span>'
					+'</div>'
				+'</a>'
				+'<div class="today_hot_item_descript" sort="today_hot_item_descript'+(i+gs)+'">'
					+'<strong class="item_descript">'
						+'<a target="_blank" href="${pageContext.request.contextPath}/video/play.do?id='+original[i].videoId+'" class="item_link_description" sort="item_link_description'+(i+gs)+'" title="'+original[i].videoTitle+'">'+original[i].videoTitle+'</a>'
					+'</strong>'
					+'<a target="_blank" href="${pageContext.request.contextPath}/video/play.do?id='+original[i].videoId+'" class="item_link_a">'
						+'<img class="item_link_img" sort="item_link_img'+(i+gs)+'" alt="" src="${pageContext.request.contextPath }/resources/images/vindex/item-play.png">'
					+'</a>'
				+'</div>'
			+'</li>'
			+space;
			//htmls = html+htmls;
		$("ul[sort='original']").append(html);
		doBind((i+gs));
	}
	
	
	/**
	*渲染青梅煮酒
	**/
	for(var i=0;i<gs;i++){
		//console.log(list[i].videoCover);
		//console.log(list[i].videoContent);
		html='<li class="list_item">'
				+'<a target="_blank" href="${pageContext.request.contextPath}/video/play.do?id='+others[i].videoId+'" class="today_hot_link" sort="today_hot_link'+(i+gs*2)+'">'
					+'<span class="today_hot_link_span">'
						+'<img class="today_hot_img" src="'+getRootPath()+others[i].videoCover+'" >'
					+'</span>'
					+'<div class="fire_icon_car">'
						+'<span url="https://www.baidu.com" class="car_icon">分享</span>'
					+'</div>'
					+'<div class="fire_icon_buy">'
						+'<span url="'+others[i].videoContent+'" name="'+others[i].videoId+'" class="buy_icon">下载</span>'
					+'</div>'
					+'<div class="fire_video_name" style="position:relative;opacity:0.7;filter:alpha(opacity=50);background:#ea175b;width:100%;height:25px;top:-200px;">'
						+'<span style="position:relative;font-size:18px;color:#000;font-family:STFangsong;font-style: italic;font-weight: bold;margin:0 auto;text-align:center;display:block;padding-top:3px;">'+others[i].videoName+'</span>'
					+'</div>'
				+'</a>'
				+'<div class="today_hot_item_descript" sort="today_hot_item_descript'+(i+gs*2)+'">'
					+'<strong class="item_descript">'
						+'<a target="_blank" href="${pageContext.request.contextPath}/video/play.do?id='+others[i].videoId+'" class="item_link_description" sort="item_link_description'+(i+gs*2)+'" title="'+others[i].videoTitle+'">'+others[i].videoTitle+'</a>'
					+'</strong>'
					+'<a target="_blank" href="${pageContext.request.contextPath}/video/play.do?id='+others[i].videoId+'" class="item_link_a">'
						+'<img class="item_link_img" sort="item_link_img'+(i+gs*2)+'" alt="" src="${pageContext.request.contextPath }/resources/images/vindex/item-play.png">'
					+'</a>'
				+'</div>'
			+'</li>'
			+space;
		$("ul[sort='others']").append(html);
		doBind((i+gs*2));
	}

}


function doBind(index){
	$("div[sort='today_hot_item_descript"+index+"']").bind("mouseenter",function(){
	    $("img[sort='item_link_img"+index+"']").attr("src","${pageContext.request.contextPath }/resources/images/vindex/item-hover-play.png");
	    $("a[sort='item_link_description"+index+"']").attr("class","item_link_description-hover");
	});
	
	$("div[sort='today_hot_item_descript"+index+"']").bind("mouseleave",function(){
	    $("img[sort='item_link_img"+index+"']").attr("src","${pageContext.request.contextPath }/resources/images/vindex/item-play.png");
	    $("a[sort='item_link_description"+index+"']").attr("class","item_link_description");
	});
	
	$("a[sort='today_hot_link"+index+"']").bind("mouseenter",function(){
	    $("img[sort='item_link_img"+index+"']").attr("src","${pageContext.request.contextPath }/resources/images/vindex/item-hover-play.png");
	    $("a[sort='item_link_description"+index+"']").attr("class","item_link_description-hover");
	    $("div[sort='today_hot_item_descript"+index+"']").attr("class","today_hot_item_descript-hover");
	});
	
	$("a[sort='today_hot_link"+index+"']").bind("mouseleave",function(){
	    $("img[sort='item_link_img"+index+"']").attr("src","${pageContext.request.contextPath }/resources/images/vindex/item-play.png");
	    $("a[sort='item_link_description"+index+"']").attr("class","item_link_description");
	    $("div[sort='today_hot_item_descript"+index+"']").attr("class","today_hot_item_descript");
	});
	
}

function getVideoList(limit,channelType){
	var list = [];
	$.ajax({
		url:'${pageContext.request.contextPath }/account/getVideoList.do?limit='+limit+'&page=1'+"&channelType="+channelType,
		type:'post',
		dataType:'json',
		async:false,
		success:function(data){
			if(data.code==0){
				//layer.msg('数据加载成功、祝您观影愉快',{icon: 6,time:1300});
				console.log('数据加载成功、祝您观影愉快');
				list = data.data;
			}else{
				layer.msg('浏览器异常',{icon: 5,time:1000});
			}
		},
		error:function(){
			layer.msg('站点处于维护中',{icon: 5,time:1000});
		}
	});
	return list;
}
</script>
<script src="${pageContext.request.contextPath }/base/base.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath }/resources/share/share.js" charset="utf-8"></script>
<script type="text/javascript">
$(function(){
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
  				console.log('有');
  				var html = '<ul class="layui-nav layui-bg-green right-aligned" lay-filter="">'
  					+'<li class="layui-nav-item">'
  					+'<a href="javascript:void(0);" onclick="toToolDownload();">工具</a>'
  					+'</li>'
  			  		+'<li class="layui-nav-item">'
  			  		+'<a href="javascript:void(0);" onclick="toDonate();">捐助</a>'
  			  		+'</li>'
  			  		+'<li class="layui-nav-item">'
  			  		+'<a href="">消息<span class="layui-badge">9</span></a>'
  			  		+'</li>&nbsp;&nbsp;'
  			  		+'<li class="layui-nav-item">'
  			  		+'<a id="myPhoto_a" href="">'
  			  		+'<img id="myPhoto_img" src="'+getRootPath()+'/user/login/getUserPhotoImg.do?userId='+object.userId+'" class="layui-nav-img">'+object.userNickName
  			  		+'</a>'
  			  		+'<dl class="layui-nav-child">'
  			  		+'<dd><a href="'+getRootPath()+'/user/home" target="_blank">我的主页</a></dd>'
  			  		+'<dd><a href="'+getRootPath()+'/user/center" target="_blank">用户中心</a></dd>'
  			  		+'<dd><a href="'+getRootPath()+'/user/settings" target="_blank">基本设置</a></dd>'
  			  		+'<dd><a href="'+getRootPath()+'/user/message/" target="_blank">我的消息</a></dd>'
  			  		+'<dd><a href="'+getRootPath()+'/user/provide/" target="_blank">我的资源</a></dd>'
  			  		+'<dd><a href="javascript:;" onclick="toLoginOut();">退出</a></dd>'
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

function close(){
	alert('关闭');
}


function getMore(channelType){
	console.log("获取更多");
	url = getRootPath() + '/webapp/toWebMoreSearch.do';
	window.open(url,'_blank');
}
</script>
<script type="text/javascript">

function searchMore(){
	var keyword = $("input[name='search_param']").val();
	console.log(keyword);
	if(keyword.length==0){
		getMore('0');
	}else{
		clearBody();
		//分业代码
		var laypage = '';
		var initLImit = 15;
		appendPageContainer();
		createPage(initLImit,keyword);
		//appendEnd();
	}
}

function clearBody(){
	var htmlx = '';
	$(".tbody").html(htmlx);
}
function appendPageContainer(){
	var html = ''
		+'<div class="today_hot_row">'
		+'<div class="today_hot_body">'
		+'<div class="today_hot_body_content">'
		+'<ul class="today_hot_list" sort="search">'
						
		+'</ul>'
		+'<div style="text-align: center;" id="pages"></div>'
		+'</div>'
		+'</div>'
		+'</div>'
		+'<div id="footer" style="position:relative;width:100%;height:150px;background:#2EAFBB;top:40px;">'
		+'<footer class="footer mt-20">'
		+'<div class="container">'
		+'<p>关于汉唐|服务条款|广告服务|人才招聘|客服中心|网站导航<br>'
		+'Copyright &copy;2018-2030         科大讯飞股份公司<br>'
		+'<a href="http://www.h-ui.net/" target="_blank" title="汉唐文化网">科大讯飞股份公司 版权所有</a></p>'
		+'</div>'
		+'</footer>'
		+'</div>';
	//var htmlx = '';
	$(".tbody").html(html);
	
}

function appendNothing(){
	var html = ''
		+'<div class="today_hot_row">'
		+'<div class="today_hot_body">'
		+'<div class="today_hot_body_content">'
		+'<ul class="today_hot_list" sort="search">'
		+'<li style="position:relative;margin-left:70px;display:block;width:100%;height:300px;">'
		+'<img width="200px" height="200px" src="'+getRootPath()+'/resources/more/zanwu.png"/>'
		+'<span style="font-size:50px;color:#FF8040;">&nbsp;&nbsp;这里空空如也!</span></li>'
		+'</ul>'
		+'</div>'
		+'</div>'
		+'</div>';
	$(".tbody").html('<div class="spacing"></div>');
	$(".tbody").append(html);
}

function appendEnd(){
	var end = '<div id="footer" style="position:relative;width:100%;height:150px;background:#2EAFBB;top:40px;">'
		+'<footer class="footer mt-20">'
		+'<div class="container">'
		+'<p>关于汉唐|服务条款|广告服务|人才招聘|客服中心|网站导航<br>'
		+'Copyright &copy;2018-2030         科大讯飞股份公司<br>'
		+'<a href="http://www.h-ui.net/" target="_blank" title="汉唐文化网">科大讯飞股份公司 版权所有</a></p>'
		+'</div>'
		+'</footer>'
		+'</div>';
	$(".tbody").append(end);
}

function removeEnd(){
	$("#footer").remove();
}


function createPage(initLImit,keyword){
	layui.use('laypage', function(){
		  laypage = layui.laypage;
		  var objects = getVideoListKey(initLImit,'null',keyword);
		  var list = objects.list;
		  var length = objects.count;
		  //console.log(length);
		  //执行一个laypage实例
		  getPageInfo(list,length,initLImit,keyword);
	});
}

function getPageInfo(list,length,initLImit,keyword){
	laypage.render({
	    elem: 'pages' //注意，这里的 test1 是 ID，不用加 # 号
	    ,count: length //数据总数，从服务端得到
	    ,limit: initLImit
	    ,jump: function(obj, first){
	    	//模拟渲染
	    	doDrawing(list);
	    	obj.curr; //当前页
	    	obj.limit; //得到每页显示的条数
	    	if(!first){
	    		objects = getVideoListKey(obj.limit,obj.curr,keyword);
	    		list = objects.list;
	    		var length = objects.count;
	    		doDrawing(list);
	    	}
	    	iconEvent();
	    }
	});
}	

function doDrawing(list){
	if(list.length==0){
		appendNothing();
		appendEnd();
	}else{
		$("ul[sort='search']").html('');
		for(var i=0;i<list.length;i++){
			//var html = '';
			if(i%5==0 && i!=0){
				appendNewLine();
			}
			appendItems(list,i);
			if(i==list.length-1){
				appendNewLine();
			}
		}
	}
}
function appendNewLine(){
	html = '</br></br></br></br></br></br>';
	$("ul[sort='search']").append(html);
}
function appendItems(list,i){
	result='<li class="list_item">'
		+'<a target="_blank" href="${pageContext.request.contextPath}/video/play.do?id='+list[i].videoId+'" class="today_hot_link" sort="today_hot_link'+(i)+'">'
			+'<span class="today_hot_link_span">'
				+'<img class="today_hot_img" src="'+getRootPath()+list[i].videoCover+'" >'
			+'</span>'
			+'<div class="fire_icon_car">'
				+'<span url="https://www.baidu.com" class="car_icon">分享</span>'
			+'</div>'
			+'<div class="fire_icon_buy">'
				+'<span url="'+list[i].videoContent+'" name="'+list[i].videoId+'" class="buy_icon">下载</span>'
			+'</div>'
			+'<div class="fire_video_name" style="position:relative;opacity:0.7;filter:alpha(opacity=50);background:#ea175b;width:100%;height:25px;top:-200px;">'
				+'<span style="position:relative;font-size:18px;color:#000;font-family:STFangsong;font-style: italic;font-weight: bold;margin:0 auto;text-align:center;display:block;padding-top:3px;">'+list[i].videoName+'</span>'
			+'</div>'
		+'</a>'
		+'<div class="today_hot_item_descript" sort="today_hot_item_descript'+(i)+'">'
			+'<strong class="item_descript">'
				+'<a target="_blank" href="${pageContext.request.contextPath}/video/play.do?id='+list[i].videoId+'" class="item_link_description" sort="item_link_description'+(i)+'" title="'+list[i].videoTitle+'">'+list[i].videoTitle+'</a>'
			+'</strong>'
			+'<a target="_blank" href="${pageContext.request.contextPath}/video/play.do?id='+list[i].videoId+'" class="item_link_a">'
				+'<img class="item_link_img" sort="item_link_img'+(i)+'" alt="" src="${pageContext.request.contextPath }/resources/images/vindex/item-play.png">'
			+'</a>'
		+'</div>'
	+'</li>'
	+'&nbsp;';
	$("ul[sort='search']").append(result);
	doBind(i);
}

function subString(createTime){
	return createTime.substring(0, 10);
}

</script>
</body>
</html>