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
  <title>基本设置</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/login/css/font_24081_aym082o86np3z0k9.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/layer/theme/default/layui.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/login/css/global.css" charset="utf-8">
  <link id="layuicss-layer" rel="stylesheet" href="${pageContext.request.contextPath }/layer/theme/default/layer.css" media="all">
  <script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
  <script src="${pageContext.request.contextPath }/base/base.js" charset="utf-8"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/layer/layer.js"></script>
  
  <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
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
        <li class="layui-nav-item layui-this">
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
    <div style="padding: 15px;" id="app">
				<div class="fly-panel fly-panel-user" pad20="">
					<div class="layui-tab layui-tab-brief" lay-filter="user">
						<ul class="layui-tab-title" id="LAY_mine">
							<li class="layui-this" lay-id="info">我的资料</li>
							<li lay-id="avatar">头像</li>
							<li lay-id="pass">密码</li>
							<li lay-id="bind">帐号绑定</li>
						</ul>
						<div class="layui-tab-content" style="padding: 20px 0;">
							<div class="layui-form layui-form-pane layui-tab-item layui-show">
								<form method="post" id="">
									<div class="layui-form-item">
										<label for="L_email" class="layui-form-label">手机</label>
										<div class="layui-input-inline">
											<input type="text" id="L_phone" name="phone" required=""
												lay-verify="phone" autocomplete="off" value="14755117607"
												class="layui-input" disabled=""
												style="cursor: not-allowed !important;">
										</div>
										<div class="layui-form-mid layui-word-aux">
											<span style="color: #5FB878">您已完成手机号绑定，已正式成为社区实名用户。</span>
											手机号暂不支持修改。
										</div>
									</div>
									<div class="layui-form-item">
										<label for="L_email" class="layui-form-label">邮箱</label>
										<div class="layui-input-inline">
											<input type="text" id="L_email" name="email" required=""
												lay-verify="email" autocomplete="off"
												value="zhangyule1993@sina.com" class="layui-input">
										</div>
										<div class="layui-form-mid layui-word-aux">
											您的邮箱已激活，也可以作为登入名</div>
									</div>
									<div class="layui-form-item">
										<label for="L_username" class="layui-form-label">昵称</label>
										<div class="layui-input-inline">
											<input type="text" id="L_username" name="username"
												required="" lay-verify="required" autocomplete="off"
												value="人鬼殊途" class="layui-input">
										</div>
										<div class="layui-inline">
											<div class="layui-input-inline">
												<input type="radio" name="sex" value="0" checked=""
													title="男">
												<div
													class="layui-unselect layui-form-radio layui-form-radioed">
													<i class="layui-anim layui-icon"></i>
													<div>男</div>
												</div>
												<input type="radio" name="sex" value="1" title="女">
												<div class="layui-unselect layui-form-radio">
													<i class="layui-anim layui-icon"></i>
													<div>女</div>
												</div>
											</div>
										</div>
									</div>
									<div class="layui-form-item">
										<label for="L_city" class="layui-form-label">城市</label>
										<div class="layui-input-inline">
											<input type="text" id="L_city" name="city" autocomplete="off"
												value="合肥" class="layui-input">
										</div>
									</div>
									<div class="layui-form-item layui-form-text">
										<label for="L_sign" class="layui-form-label">签名</label>
										<div class="layui-input-block">
											<textarea placeholder="随便写些什么刷下存在感" id="L_sign" name="sign"
												autocomplete="off" class="layui-textarea"
												style="height: 80px;">古来帝王皆寂寞</textarea>
										</div>
									</div>
									<div class="layui-form-item">
										<button class="layui-btn" key="set-mine" lay-filter="*"
											lay-submit="">确认修改</button>
									</div>
								</form>
							</div>
							<div class="layui-form layui-form-pane layui-tab-item">
								<div class="layui-form-item">
									<div class="avatar-add">
										<p>建议尺寸168*168，支持jpg、png、gif，最大不能超过50KB</p>
											<button type="button" class="layui-btn upload-img" id="photoBtn">
												<i class="layui-icon"></i>上传头像
											</button>
											<input type="file" name="file" class="layui-upload-file">
											<img v-bind:src="photoSrc">
										<span class="loading"></span>
									</div>
								</div>
							</div>
							<div class="layui-form layui-form-pane layui-tab-item">
								<div class="layui-form-item">
									<label for="L_pass" class="layui-form-label">新密码</label>
									<div class="layui-input-inline">
										<input type="password" id="L_pass" name="pass" required=""
											lay-verify="required" autocomplete="off" class="layui-input">
									</div>
									<div class="layui-form-mid layui-word-aux">6到16个字符</div>
								</div>
								<div class="layui-form-item">
									<label for="L_repass" class="layui-form-label">确认密码</label>
									<div class="layui-input-inline">
										<input type="password" id="L_repass" name="repass" required=""
											lay-verify="required" autocomplete="off" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<button class="layui-btn" key="set-mine" lay-filter="*"
										lay-submit="">确认修改</button>
								</div>
							</div>
							<div class="layui-form layui-form-pane layui-tab-item">
								<ul class="app-bind">
									<li class="fly-msg  app-havebind"><i
										class="iconfont icon-qq"></i> <span>已成功绑定，您可以使用QQ帐号直接登录Fly社区，当然，您也可以</span>
										<a href="javascript:;" class="acc-unbind" type="qq_id">解除绑定</a>
									</li>
									<li class="fly-msg "><i class="iconfont icon-weibo"></i> <a
										href="/app/weibo/" class="acc-weibo" type="weibo_id"
										onclick="layer.msg('正在绑定微博', {icon:16, shade: 0.1, time:0})">立即绑定</a>
										<span>，即可使用微博帐号登录Fly社区</span></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    © layui.com - 底部固定区域
  </div>
</div>
<script src="${pageContext.request.contextPath }/layui/layui.js"></script>
<script>


var userId = '';
$(function(){
	var user = '';
	user = getLoginInfo();
	if(user==''){
		location.href = getRootPath()+"/video/toVideoList";
	}else{
		userId = user.userId;
		drawTop(user);
	}
});

//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
  
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

function drawBody(user){
	var app = new Vue({
		  el: '#app',
		  data: {
			userNickName: user.userNickName,
		    userIntegral: user.userIntegral,
		    userRegisterTime: user.userRegisterTime,
		    userAddressDetail: user.userAddressDetail,
		    photoSrc:getRootPath()+'/user/login/getUserPhotoImg.do?userId='+user.userId
		  }
	});
}

layui.use('upload', function(){
	  var upload = layui.upload;
	  //执行实例
	  var uploadInst = upload.render({
	    elem: '#photoBtn' //绑定元素
	    ,url: getRootPath()+'/user/login/set/photo?userId='+userId //上传接口
	    ,before: function(obj){
            //预读本地文件示例，不支持ie8
            obj.preview(function(index, file, result){
            	drawPhotoSRC(result);
            });
        }
	    ,done: function(res,index){
	      //上传完毕回调
	      console.log(res);
	      //drawPhoto();
	    }
	    ,error: function(){
	      //请求异常回调
	    }
	  });
});


function drawPhoto(){
	var app = new Vue({
		  el: '#app',
		  data: {
		    photoSrc:getRootPath()+'/user/login/getUserPhotoImg.do?userId='+userId
		  }
	});
}

function drawPhotoSRC(src){
	var app = new Vue({
		  el: '#app',
		  data: {
		    photoSrc:src
		  }
	});
}

$(function(){
	/* $("li[lay-id='avatar']").on("click",function(){
		//drawPhoto();
		//$("li[lay-id='avatar']").click();
	}); */
})
</script>
</body>
</html>