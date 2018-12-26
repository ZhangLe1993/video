<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-cn">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1">
	<!-- @fragment_top Start-->
	<meta charset="UTF-8">
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<title>QQ帐号安全登录</title>
	<meta name="keywords" content="QQ互联、QQ登录、安全登录、网站接入、腾讯开放平台">
	<meta name="description" content="接入QQ互联，可实现与腾讯各项服务的无缝连接，安全帐号登录体系，用户动态同步腾讯各社交平台，调用腾讯公司各业务服务。">
	<meta name="copyright" content="Tencent">
	<meta name="author" content="rtx://tencent/sng/yuanyan">
	<link rel="Shortcut Icon" href="https://imgcache.qq.com/qzone/openapi/favicon.ico?t=20130219" type="image/x-icon">
	<link rel="icon" href="https://imgcache.qq.com/qzone/openapi/favicon.ico?t=20130219" type="image/x-icon">
	<link href="https://imgcache.qq.com/open/connect/widget/pc/login/qlogin_v2.min.css?max_age=2592000&amp;v=20140818" rel="stylesheet">
	<script type="text/javascript">
    window.__start = +new Date();
    
    document.domain = 'qq.com'; // todo 这里为什么要跨域
    var _speedTiming = [+new Date];
    (function error(monitorId){
        var BID = 130;
        var errorTransport = null;
        var monitorTransport = null;
        window.onerror = function(errorMsg, url, lineNumber) {
            var bid = 'bid=' + BID;
            var mid = '';
            var msg = 'msg=' + encodeURIComponent([errorMsg, url, lineNumber, navigator.userAgent].join("|_|"));
            var src = 'https://badjs.qq.com/cgi-bin/js_report?'+ [bid,mid,msg].join("&");
            errorTransport = new Image;
            errorTransport.onerror = errorTransport.onload = function(){
                errorTransport = errorTransport.onerror = errorTransport.onload = null ;
            };
            // errorTransport.src = src;
            monitorTransport = new Image;
            monitorTransport.onerror = monitorTransport.onload = function(){
                monitorTransport = monitorTransport.onerror = monitorTransport.onload = null ;
            };
            // monitorTransport.src = "http://cgi.connect.qq.com/report/report_vm?monitors=" +"["+monitorId+"]";

          var img = document.createElement('img');
          var url = 'https://graph.qq.com/oauth2.0/report?';
          var data = {
            attr_id: 2775276,
            uls: 'Script Error: ' + errorMsg + ', line:' + lineNumber + ', url:' + location.href + ' referer:' + document.referrer,
            content_type: 0,
            client_id: Q.getParameter('client_id')
          }
          for(var key in data){
            if(url[url.length - 1] != '?')
              url += '&';
            url += key + '=' + encodeURIComponent(data[key]);
          }
          img.src = url;
        };
    })(302299);
</script>
<!-- @fragment_top End -->

</head>
<body>
	<!-- @header Start-->
	<div class="lay_top">
		<div class="lay_top_inner">
			<h1 class="logo text_hide">QQ登录</h1>
			<div class="lat_top_other">
				<a href="http://connect.qq.com" target="_blank" title="什么是QQ登录"><i
					class="icon_help_white"></i>QQ登录</a> <span class="line">|</span> <a
					href="http://connect.qq.com/toc/auth_manager?from=auth"
					id="auth_manager_link" target="_blank" title="登录授权管理">授权管理</a> <span
					class="line">|</span> <a href="http://connect.qq.com/manage"
					target="_blank" title="申请接入">申请接入</a>
			</div>
		</div>
	</div>
	<!-- @header End -->

	<div id="combine_page">
		<div class="page_login combine_page_children float_left border_right">
			<div class="lay_login_form">
				<iframe frameborder="0" width="370" height="322" id="ptlogin_iframe"
					name="ptlogin_iframe"
					src="https://xui.ptlogin2.qq.com/cgi-bin/xlogin?appid=716027609&amp;daid=383&amp;style=33&amp;login_text=%E6%8E%88%E6%9D%83%E5%B9%B6%E7%99%BB%E5%BD%95&amp;hide_title_bar=1&amp;hide_border=1&amp;target=self&amp;s_url=https%3A%2F%2Fgraph.qq.com%2Foauth2.0%2Flogin_jump&amp;pt_3rd_aid=101235792&amp;pt_feedback_link=http%3A%2F%2Fsupport.qq.com%2Fwrite.shtml%3Ffid%3D780%26SSTAG%3Dfly.layui.com.appid101235792"></iframe>
			</div>
		</div>
		<div class="page_accredit combine_page_children float_left">
			<div class="lay_main" id="lay_main">
				<div class="lay_accredit_con">
					<p class="cnt_wording"></p>
					<p class="app_site_wording">
						<a class="accredit_site" id="accredit_site_link"
							href="http://fly.layui.com" target="_blank">汉唐文化</a>将获得以下权限：
					</p>
					<div class="accredit_info" id="accredit_info">
						<ul class="accredit_info_op">
							<li class="select_all_li"><input type="checkbox"
								id="select_all" class="checkbox oauth_checkbox_all"
								hidefocus="true" checked="checked"> <label
								class="oauth_item_title" for="select_all">全选</label></li>
							<li><input name="api_choose" hidefocus="true"
								type="checkbox" class="checkbox oauth_checkbox"
								id="item_80901010" value="80901010" title="默认授权 不可更改" checked=""
								disabled=""> <label for="item_80901010"
								class="oauth_item_title">获得您的昵称、头像、性别</label></li>
						</ul>
					</div>
					<div class="oauth_tips_div">
						<p class="oauth_tips">
							授权后表明你已同意 <a href="http://connect.qq.com/agreement_chs"
								target="_blank">QQ登录服务协议</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
    _speedTiming.push(+new Date);
    var Q = {};
    Q.authsCount = 1;
    Q.isNeedLogin = false;
    Q.crtDomain = getRootPath()+'/video/toVideoList';
    Q.agree = function(){
        window.isAgreed = true;
    };
    Q.logout = function(){
        window.isLogouted = true;
    };
    
    Q.isNeedLogin = true;
    Q.getParameter = function getParameter(name) {
        var r = new RegExp("(\\?|#|&)" + name + "=([^&#]*)(&|#|$)"), m = location.href.match(r);
        return decodeURIComponent(!m ? "" : m[2]);
    };
    Q.ptlogin2 = function(){
        var s_url = 'https://graph.qq.com/oauth2.0/login_jump';
        s_url = 'https://xui.ptlogin2.qq.com/cgi-bin/xlogin?appid=101471260&daid=383&style=33&login_text=%E6%8E%88%E6%9D%83%E5%B9%B6%E7%99%BB%E5%BD%95&hide_title_bar=1&hide_border=1&target=self&s_url=' + encodeURIComponent(s_url);

        var clientId = Q.getParameter('client_id') || '';
        clientId && (s_url += ("&pt_3rd_aid="+encodeURIComponent(clientId)));

        var dmHost = ((Q.crtDomain || Q.getParameter('redirect_uri') || '').match(/http:\/\/([^/]*)\/?/i) || [])[1] || '';
        var feed_back_link = 'http://support.qq.com/write.shtml?fid=780&SSTAG='+encodeURIComponent(dmHost) + '.appid' + clientId;
        s_url += ('&pt_feedback_link=' + encodeURIComponent(feed_back_link));
        document.getElementById('ptlogin_iframe').src = s_url;
    };
    Q.ptlogin2();
    
    
    function ptlogin2_onResize(w, h) {
    	var f = document.getElementById('ptlogin_iframe');
    	f.width = w;
    	f.height = h;
    }
    if (!window.JSON) {
    	document.write('<script type="text/javascript" src="https://imgcache.qq.com/open/operate/mlib/widget/json-for-ie.js"><\/script>');
    }
</script>

	<!--@fragment_bottom Start-->
	<script
		src="https://imgcache.qq.com/c/=/open/connect/widget/pc/login/pt_adapt.js,qlogin_v2.js?v=20140527"
		charset="UTF-8"></script>
	<script>
    document.write('<script src="https://tajs.qq.com/stats?sId=52725868" charset="UTF-8"><\/script>');
</script>
	<script src="https://tajs.qq.com/stats?sId=52725868" charset="UTF-8"></script>
	<!--@fragment_bottom End -->
</body>
</html>