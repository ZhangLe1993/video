<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/account/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/account/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/account/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/account/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/account/static/h-ui.admin/css/style.css" />
<title>新增图片</title>
<link href="${pageContext.request.contextPath }/resources/account/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<style>
.today_hot_link{
		position: relative;
    	width: 100%;
		height:160px;
		cursor:pointer;
		display: inline-block;
	}
</style>
</head>
<body>
<div class="page-container">
	<form class="form form-horizontal" id="form-article-add">
		<input type="hidden" value="" id="videoContent" name="videoContent">
		<input type="hidden" value="" id=videoCover name="videoCover">
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>视频名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="请输入视频名称" id="videoName" name="videoName">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">视频标题：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="请输入标题" id="videoTitle" name="videoTitle">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">视频描述：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="请输入描述" id="videoDescript" name="videoDescript">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">栏目类型：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="0" placeholder="" id="channelType" name="channelType">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">小类型：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="0" placeholder="" id="videoType" name="videoType">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">视频来源：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="0" placeholder="" id="videoSource" name="videoSource">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">视频上传：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<div class="uploader-list-container" > 
					<div class="queueList" style="height:200px">
						<div id="dndArea" class="placeholder" style="height:200px">
							<div id="filePicker-2"></div>
							<!-- <p>或将视频拖到这里</p> -->
						</div>
						<div id="preview" class="placeholder1" style="height:200px;display:none;">
							<!-- 嵌入Flash播放器 -->
							
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button onClick="article_save_submit('1');" class="btn btn-primary radius" type="button">
					<i class="Hui-iconfont">&#xe632;</i> 保存并提交审核
				</button>
				<button onClick="article_save_submit('0');" class="btn btn-secondary radius" type="button">
					<i class="Hui-iconfont">&#xe632;</i> 保存草稿
				</button>
				<button onClick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
		</div>
	</form>
	<span style="display: none;">
		<form id="videoForm">
			<input id="video" type="file" name="video">
		</form>
	</span>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/account/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/account/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/account/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/account/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/account/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/account/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/account/lib/jquery.validation/1.14.0/messages_zh.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/account/lib/webuploader/0.1.5/webuploader.min.js"></script> 
<script src="${pageContext.request.contextPath }/base/base.js" charset="utf-8"></script>
<script type="text/javascript">
function article_save(state){
	window.parent.location.reload();
}

$(function(){
	// 实例化
    uploader = WebUploader.create({
        pick: {
            id: '#filePicker-2',
            label: '双击选择视频'
        },
        formData: {
            uid: 123
        },
        dnd: '#dndArea',
        // 禁掉全局的拖拽功能。这样不会出现图片拖进页面的时候，把图片打开。
        disableGlobalDnd: true,
        fileNumLimit: 300,
        fileSizeLimit: 200 * 1024 * 1024,    // 200 M
        fileSingleSizeLimit: 50 * 1024 * 1024    // 50 M
    });
	
	
	////////////////////////////////////////////////////////////////////////////
	$("#filePicker-2").bind("click",function(){
		return false;
	});
	
	$("#filePicker-2").bind("dblclick",function(){
		$("input[name='video']").click();
	});
	
	$("input[name='video']").bind("change",function(){
		//var src = $(this).val();
		var form = new FormData(document.getElementById("videoForm"));
		$.ajax({
			url:'${pageContext.request.contextPath}/account/prevUpload.do',
			type:'post',
			data:form,
			async:false,
			contentType:false,
  		  	processData:false,
  		  	cache:false,
			dataType:'json',
			success:function(data){
				if(data.code == 200){
					console.log(data.data.pictureSrc);
					setTimeout(function(){
						$("#dndArea").attr("style","display:none;");
						$("#preview").removeAttr("style","display:none;");
						var html = '<div align="center" style="height:200px;width:100%;">'
									+'<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="100%" height="200" id="VideoPlayer" align="middle">'
									+'<param name="allowScriptAccess" value="*"/>'
									+'<param name="allowFullScreen" value="true"/>'
									+'<param name="movie" value="'+getPath()+'/video/tools/Flvplayer.swf?video='+getRootPath()+data.data.videoSrc+'"/>'
									+'<param name="quality" value="high" />'
									+'<param name="bgcolor" value="#ffffff" />'
									+'<embed src="'+getPath()+'/video/tools/Flvplayer.swf?video='+getRootPath()+data.data.videoSrc+'" flashvars="vcastr_file='+getRootPath()+data.data.videoSrc+'&IsAutoPlay=0&IsContinue=1&LogoText=WanQingMovie"  quality="high" bgcolor="#000000" width="100%" height="200" name="VideoPlayer" align="middle" allowScriptAccess="*" allowFullScreen="true" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer"/>'
									+'</object>'
									+'</div>';
									console.log(html);
						$("#preview").append(html);
						$("input[name='videoContent']").val(data.data.videoSrc);
						$("input[name='videoCover']").val(data.data.pictureSrc);
					},1000*5);
				}else{
					console.log("网络连接超时");
				}
			},
			error:function(data){
				console.log("服务器异常");
			}
		});
	});
});

/**
 * 保存并提交审核
 */
function article_save_submit(videoState){
	var form = new FormData(document.getElementById("form-article-add"));
	$.ajax({
		url:'${pageContext.request.contextPath}/account/saveVideo.do?videoState='+videoState,
		type:'post',
		data:form,
		async: false,
		contentType: false,
		processData: false,
		cache:false,
		dataType:'json',
		success:function(data){
			if(data.key == 'success'){
				layer.msg('保存成功',{icon: 6,time:1000});
				setTimeout(function(){
					window.parent.location.reload();
				},1200*1);
			}else{
				layer.msg('保存失败',{icon: 5,time:1000});
			}
		},
		error:function(data){
			layer.msg('服务异常',{icon: 5,time:1000});
		}
	});
}
</script>
</body>
</html>