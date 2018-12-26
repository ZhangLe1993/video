<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
 	.mask{
 		margin:0;
 		padding:0;
 		border:none;
 		width:100%;
 		height:100%;
 		background:#333;
 		opacity:0.6;
 		filter:alpha(opacity=60);
 		z-index:9999;
 		position:fixed;
 		top:0;
 		left:0;
 		display:none;
 	}
 	.panel{
 		z-index:10000;
 		display:none;
 		width:750px;
 		height:500px;
 		border:1px solid #2EAFBB;
 		position:absolute;
 		top:100px;
 		left:295px;
 		background:#fff;
 	}
 	.closeArea{
 		position:relative;
 		margin:0px;
 		padding:0px;
 		background:#2EAFBB;
 		width:100%;
 		height:50px;
 	}
 	.closeBtn{
 		position:relative;
 		border-radius:50%;
 		top:10px;
 		float:right;
 	}
 	.mainArea{
 		width:100%;
 		height:100%;
 	}
</style>
</head>

<body>
	<a id="addmenu">弹出</a>
	<div id="floatFloor" class="panel">
        <div class="closeArea">
           <a id="close_btn" href="javascript:void(0)"><img alt="" class="closeBtn" title="点击关闭" src="${pageContext.request.contextPath }/resource/images/closebut.png"></a>
        </div>
        <div class="mainArea">
        
        </div>
    </div>
<script src="${pageContext.request.contextPath }/resource/bootstrap/jquery/2.1.1/jquery.min.js"></script> 
<script type="text/javascript">
//弹出新增面板
$(
    function ($)
    {
        //弹出新增面板
        $("#addmenu").hover(function (){$(this).stop().animate({opacity: '1'}, 600);}, function () {$(this).stop().animate({opacity: '0.6'}, 1000);}).on('click', function (){$("body").append("<div id='mask'></div>");$("#mask").addClass("mask").fadeIn("slow");$("#floatFloor").fadeIn("slow");});
        //关闭
        $("#close_btn").hover(function () { $(this).css({ color: 'black' }) }, function () { $(this).css({ color: '#999' }) }).on('click', function () {$("#floatFloor").fadeOut("fast");$("#mask").css({ display: 'none' });});
        //取消
        $("#cancel_btn").hover(function () { $(this).css({ color: 'black' }) }, function () { $(this).css({ color: '#000' }) }).on('click', function () {$("#floatFloor").fadeOut("fast");$("#mask").css({ display: 'none' });});
    }
 );
</script>
</body>
</html>
