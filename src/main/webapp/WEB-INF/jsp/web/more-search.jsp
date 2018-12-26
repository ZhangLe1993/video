<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>搜索</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta name="keywords" content="青汤文化影视网">
	<meta name="description" content="青汤文化影视网-收集唯美古风小视频，让传统文化更加绚烂">
	
	<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
	<meta name="applicable-device" content="pc,mobile">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/0.png" type="image/x-icon" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/index/index.css">
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/login/css/font_24081_aym082o86np3z0k9.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/layer/theme/default/layui.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/login/css/global.css" charset="utf-8">
	
	<link id="layuicss-layer" rel="stylesheet" href="${pageContext.request.contextPath }/layer/theme/default/layer.css" media="all">
	<style type="text/css">
	   body{background:#fff;}
	   .select-btn{
	   		margin-top: 7px;
	        margin-left: 10px;
	   }
	   
		@media (min-width: 1600px) {
		    .fly-redef{
		    	width: 86%;
		    }
		}
	</style>
  </head>
<body style="overflow: hidden;">
<div>
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
	<div>
		<form class="layui-form layui-form-pane" action="">
  			<div class="layui-form-item" pane>
    			<label class="layui-form-label">频道</label>
    			<div class="layui-input-block">
    				<input type="button" class="layui-btn layui-btn-xs select-btn" name="pddm" val="all" value="全部" title="全部">
    				<input type="button" class="layui-btn layui-btn-primary layui-btn-xs select-btn" name="pddm" val="0" value="镇店之宝" title="镇店之宝">
      				<input type="button" class="layui-btn layui-btn-primary layui-btn-xs select-btn" name="pddm" val="1" value="国色仙香" title="国色仙香">
      				<input type="button" class="layui-btn layui-btn-primary layui-btn-xs select-btn" name="pddm" val="2" value="揾英雄泪" title="揾英雄泪">
    			</div>
  			</div>
  			<div class="layui-form-item" pane>
    			<label class="layui-form-label">类型</label>
    			<div class="layui-input-block">
    				<input type="button" class="layui-btn layui-btn-xs select-btn" name="lxdm" val="all" value="全部" title="全部">
      				<input type="button" class="layui-btn layui-btn-primary layui-btn-xs select-btn" name="lxdm" val="0" value="古风" title="古风">
      				<input type="button" class="layui-btn layui-btn-primary layui-btn-xs select-btn" name="lxdm" val="1" value="戏腔" title="戏腔">
      				<input type="button" class="layui-btn layui-btn-primary layui-btn-xs select-btn" name="lxdm" val="2" value="忧伤" title="忧伤">
      				<input type="button" class="layui-btn layui-btn-primary layui-btn-xs select-btn" name="lxdm" val="3" value="经典" title="经典">
      				<input type="button" class="layui-btn layui-btn-primary layui-btn-xs select-btn" name="lxdm" val="4" value="孤独" title="孤独">
      				<input type="button" class="layui-btn layui-btn-primary layui-btn-xs select-btn" name="lxdm" val="5" value="思念" title="思念">
      				<input type="button" class="layui-btn layui-btn-primary layui-btn-xs select-btn" name="lxdm" val="6" value="民族" title="民族">
    			</div>
  			</div>
  			<div class="layui-form-item" pane>
    			<label class="layui-form-label">来源</label>
    			<div class="layui-input-block">
    				<input type="button" class="layui-btn layui-btn-xs select-btn" name="lydm" val="all" value="全部" title="全部">
      				<input type="button" class="layui-btn layui-btn-primary layui-btn-xs select-btn" name="lydm" val="0" value="腾讯QQ" title="腾讯QQ">
      				<input type="button" class="layui-btn layui-btn-primary layui-btn-xs select-btn" name="lydm" value="微信" val="1" title="微信">
      				<input type="button" class="layui-btn layui-btn-primary layui-btn-xs select-btn" name="lydm" value="微博" val="2" title="微博">
      				<input type="button" class="layui-btn layui-btn-primary layui-btn-xs select-btn" name="lydm" value="腾讯视频" val="3" title="腾讯视频">
      				<input type="button" class="layui-btn layui-btn-primary layui-btn-xs select-btn" name="lydm" value="网易云音乐" val="4" title="网易云音乐">
      				<input type="button" class="layui-btn layui-btn-primary layui-btn-xs select-btn" name="lydm" value="酷狗音乐" val="5" title="酷狗音乐">
      				<input type="button" class="layui-btn layui-btn-primary layui-btn-xs select-btn" name="lydm" value="凤凰网" val="6" title="凤凰网">
    			</div>
  			</div>
		</form>
	</div>
</div>
<div class="fly-main fly-redef" style="overflow: hidden;">
	<ul class="fly-case-list">
		<!-- <li data-id="484"> <a class="fly-case-img" href="http://pengyichen.cn" target="_blank" rel="nofollow"> <img src="//cdn.layui.com/upload/2018_2/8240064_1519732007694_1035.jpg" alt="Tpblog"> <cite class="layui-btn layui-btn-primary layui-btn-small">去围观</cite> </a> <h2><a href="http://pengyichen.cn" target="_blank" rel="nofollow">Tpblog</a></h2> <p class="fly-case-desc">Tpblog基于tp5.0+layui2.x开发的个人博客系统，摒弃了一切繁杂的元素，将简洁清爽发挥到极致。</p> <div class="fly-case-info"> <a href="/u/8240064" class="fly-case-user" target="_blank"><img src="//q.qlogo.cn/qqapp/101235792/23A4EFD753C4422B7ABAD528B5B438C9/100"></a> <p class="layui-elip" style="font-size: 12px;"><span style="color: #666;">听雨</span> 2018-2-27 </p> <p>获得<a class="fly-case-nums fly-case-active" href="javascript:;" data-type="showPraise" style=" padding:0 5px; color: #01AAED;">20</a>个赞</p> <button class="layui-btn layui-btn-primary fly-case-active" data-type="praise">点赞</button> </div> </li> -->
	</ul>
	<div style="text-align: center;" id="pages"></div>
</div>
<div style="position:relative;width:100%;height:150px;background:#2EAFBB;top:40px;overflow: hidden;">
		<footer class="footer mt-20">
			<div class="container">
				<p>关于青汤|服务条款|广告服务|人才招聘|客服中心|网站导航<br>
					Copyright &copy;2018-2030         青汤网<br>
					<a href="#" target="_blank" title="青汤网">青汤网 版权所有</a></p>
			</div>
		</footer>
	</div>
<script src="${pageContext.request.contextPath }/base/base.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/account/lib/layer/2.4/layer.js"></script>
<script src="${pageContext.request.contextPath }/layui/layui.js"></script>
<script type="text/javascript">
//注意：导航 依赖 element 模块，否则无法进行功能性操作
layui.use('element', function(){
  var element = layui.element;
  //…
});

$(function(){
	var user = '';
	user = getLoginInfo();
	if(user!=''){
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
///////////////////////////////////////////////////////////////////////////////////
</script>
<script type="text/javascript">
var laypage = '';
var initLImit = 16;
var pddm = 'all';
var lxdm = 'all';
var lydm = 'all';

layui.use('laypage', function(){
	  laypage = layui.laypage;
	  var objects = getVideoListMore(initLImit,'null',pddm,lxdm,lydm);
	  var list = objects.list;
	  var length = objects.count;
	  console.log(length);
	  //执行一个laypage实例
	  getPageInfo(list,length);
});

function getPageInfo(list,length){
	laypage.render({
	    elem: 'pages' //注意，这里的 test1 是 ID，不用加 # 号
	    ,count: length //数据总数，从服务端得到
	    ,limit: initLImit
	    //,curr: location.hash.replace('#!fenye=', '1') //获取起始页
	    //,hash: 'fenye' //自定义hash值
	    ,jump: function(obj, first){
	    	//console.log(obj.limit);
	    	//模拟渲染
	    	doDrawing(list);
	    	obj.curr; //当前页
	    	obj.limit; //得到每页显示的条数
	    	if(!first){
	    		objects = getVideoListMore(obj.limit,obj.curr,pddm,lxdm,lydm);
	    		list = objects.list;
	    		var length = objects.count;
	    		doDrawing(list);
	    	}
	    }
	});
}	
$(function(){
	myclick('pddm');
	myclick('lxdm');
	myclick('lydm');

});

function myclick(param_name){
	$("input[name='"+param_name+"']").each(function(){
		$(this).bind('click',function(){
			//样式改变
			var hasStyleObj = $(this).parent().find("input[class='layui-btn layui-btn-xs select-btn']");
			
			var value = $(this).attr("val");
			var thisStyle = $(this).attr("class");
			
			if(thisStyle!='layui-btn layui-btn-xs select-btn'){
				//console.log('追加绿色样式');
				$(this).removeClass("layui-btn-primary");
			}
			//console.log('取消绿色样式');
			$(hasStyleObj).addClass("layui-btn-primary");
			
			//执行搜索
			if('pddm'==param_name){
				pddm = value;
			}else if('lxdm'==param_name){
				lxdm = value;
			}else if('lydm'==param_name){
				lydm = value;
			}else{
				console.log('浏览器异常');
			}
			searchMore(pddm,lxdm,lydm);
		});
	});
}

function searchMore(pddm,lxdm,lydm){
	console.log('开始');
	console.log('pddm='+pddm);
	console.log('lxdm='+lxdm);
	console.log('lydm='+lydm);
	var objects = getVideoListMore(initLImit,'null',pddm,lxdm,lydm);
	var list = objects.list;
	var length = objects.count;
	console.log(length);
	//执行一个laypage实例
	getPageInfo(list,length);
}

function doDrawing(list){
	if(list.length==0){
		$("ul[class='fly-case-list']").html('<li style="position:absolute;margin-left:70px;display:block;width:100%;height:300px;"><img width="200px" height="200px" src="'+getRootPath()+'/resources/more/zanwu.png"/><span style="font-size:50px;color:#FF8040;">&nbsp;&nbsp;这里空空如也!</span></li>');
	}else{
		$("ul[class='fly-case-list']").html('');
		for(var i=0;i<list.length;i++){
			var html = '';
			if((i+1)%4 == 0){
				html += '<br>';
			}
			html = '<li data-id="484">'
						+'<a class="fly-case-img" href="'+getRootPath()+'/video/play.do?id='+list[i].videoId+'" target="_blank" rel="nofollow">' 
						+'<img src="'+getRootPath()+list[i].videoCover+'" alt="'+list[i].videoName+'">' 
						+'<cite class="layui-btn layui-btn-primary layui-btn-small">播放</cite>' 
						+'</a>' 
						+'<h2>'
						+'<a href="'+getRootPath()+'/video/play.do?id='+list[i].videoId+'" target="_blank" rel="nofollow">'+list[i].videoName+'</a>'
						+'</h2>' 
						+'<p class="fly-case-desc">'+list[i].videoTitle+'</p>' 
						+'<div class="fly-case-info">' 
						+'<a href="/u/8240064" class="fly-case-user" target="_blank">'
						+'<img src="'+getRootPath()+'/user/login/getUserPhotoImg.do?userId='+list[i].createPersonId+'"></a>' 
						+'<p class="layui-elip" style="font-size: 12px;"><span style="color: #666;">'+list[i].createPersonName+'</span>  ' +subString(list[i].createTime)+'</p>' 
						+'<p>获得<a class="fly-case-nums fly-case-active" href="javascript:;" data-type="showPraise" style=" padding:0 5px; color: #01AAED;">'+ ((list[i].downloadCount == undefined) ? 0 : list[i].downloadCount) +'</a>次下载</p>' 
						+'<button url="'+list[i].videoContent+'" name="'+list[i].videoId+'" onclick="downloadBind(this);" class="layui-btn layui-btn-primary fly-case-active" data-type="praise">下载</button>' 
						+'</div>' 
						+'</li>';
			console.log(list[i]);
			$("ul[class='fly-case-list']").append(html);
		}
	}
}

function subString(createTime){
	return createTime.substring(0, 10);
}

function downloadBind(obj){
	var videoId = $(obj).attr("name");
	var videoSrc = $(obj).attr("url");
	console.log("下载路径："+videoSrc);
	console.log("执行下载");
	var user = '';
	user = getLoginInfo();
	if(user==''){
		console.log("请登录");
		layer.msg("请登录",{offset: '100px'});
		return;
	}
	$.get(getRootPath()+'/video/videoPrevDownload.do',{videoId:videoId,videoSrc:videoSrc},function(data){
		console.log(data);
		if(data.oK){
			layer.alert('<span style="color:#009688;font-size:15px;letter-spacing:5px;">本站目前只支持flv格式下载,是否确定下载<br>稍后您可在本站下载播放工具进行播放</span>', {
				  title:'下载',
				  offset: '100px',
				  skin: 'layui-layer-molv' //样式类名
				}, function(){
				  layer.open({
					type:2,
					title:'下载',
					offset: '100px',
					area: ['370px', '255px'],
				    skin: 'layui-layer-lan'
				    ,anim: 4 //动画类型
				    ,content: getRootPath()+'/video/skip/to/download/form.do?videoId='+videoId+'&videoSrc='+videoSrc
				  });
				});
		}else{
			layer.alert('<span style="color:#009688;font-size:15px;letter-spacing:5px;">文件状态异常，不支持下载，<br>请贿赂管理员，<br>管理员QQ：1032089468</span>', {
				  title:'下载',
				  offset: '100px',
				  skin: 'layui-layer-molv' //样式类名
			});
			console.log("文件状态异常，不支持下载，请贿赂管理员，管理员QQ：1032089468");
		}
	},'json');
}
</script>
</body>
</html>
