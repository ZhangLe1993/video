<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/account/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/account/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/account/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/account/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/account/static/h-ui.admin/css/style.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/account/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/account/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/account/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/account/static/h-ui.admin/js/H-ui.admin.js"></script>
<script src="${pageContext.request.contextPath }/layui/layui.js"></script>
<title>用户管理</title>
</head>
<body>
<nav class="breadcrumb">
	<i class="Hui-iconfont">&#xe67f;</i> 首页 
		<span class="c-gray en">&gt;</span> 内容管理 
		<span class="c-gray en">&gt;</span> 视频管理 
		<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" >
			<i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 创建时间：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d %H:%m\'}',dateFmt:'yyyy-MM-dd HH:mm' })" id="datemin" class="input-text Wdate" style="width:150px;">
		-
		<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d %H:%m',dateFmt:'yyyy-MM-dd HH:mm' })" id="datemax" class="input-text Wdate" style="width:150px;">
		<input type="text" class="input-text" style="width:250px" placeholder="输入标题、名称、描述" id="search" name="search">
		<button type="submit" class="btn btn-success radius" id="search_button" name=""><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l">
			<a href="javascript:;" onclick="batchDelete()" class="btn btn-danger radius">
				<i class="Hui-iconfont">&#xe6e2;</i> 批量删除
			</a> 
			<a href="javascript:;" onclick="member_add('添加视频','${pageContext.request.contextPath }/account/toVideoAddForm.do','','510')" class="btn btn-primary radius">
				<i class="Hui-iconfont">&#xe600;</i> 添加视频
			</a>
		</span> 
	</div>
	<div class="mt-20">
		<table id="demo" lay-filter="test"></table>
		<script type="text/html" id="indexTpl">
    		{{d.LAY_TABLE_INDEX+1}}
		</script>
		<script type="text/html" id="barDemo">
			{{#  if(d.videoState == '0'){ }}
				<a class="layui-btn  layui-btn-normal layui-btn-xs" lay-event="detail">预览</a>
				&nbsp;
				<a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="info">通知</a>
			{{# }else if(d.videoState == '1'){ }}
				<a class="layui-btn  layui-btn-normal layui-btn-xs" lay-event="detail">预览</a>
				&nbsp;
				<a class="layui-btn layui-btn-xs" lay-event="audit">审核</a>
			{{# }else if(d.videoState == '2'){ }}
				<a class="layui-btn  layui-btn-normal layui-btn-xs" lay-event="detail">预览</a>
				&nbsp;
				<a class="layui-btn layui-btn-danger layui-btn-xs" lay-option="6" lay-event="update">删除</a>
			{{# }else if(d.videoState == '3'){ }}
				<a class="layui-btn  layui-btn-normal layui-btn-xs" lay-event="detail">预览</a>
				&nbsp;
				<a class="layui-btn layui-btn-xs" lay-option="4" lay-event="update">发布</a>
			{{# }else if(d.videoState == '4'){ }}
				<a class="layui-btn  layui-btn-normal layui-btn-xs" lay-event="detail">预览</a>
				&nbsp;
				<a class="layui-btn layui-btn-warm layui-btn-xs" lay-option="5" lay-event="update">下架</a>
			{{# }else if(d.videoState == '5'){ }}
				<a class="layui-btn  layui-btn-normal layui-btn-xs" lay-event="detail">预览</a>
				&nbsp;
				<a class="layui-btn layui-btn-xs" lay-option="4" lay-event="update">发布</a>
			{{# }else{  }}
				<a class="layui-btn  layui-btn-normal layui-btn-xs" lay-event="detail">预览</a>
				&nbsp;
				<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">移除</a>
			{{# } }}
		</script>
		<!-- 0 未激活，1已启用，2：禁用 -->
		<script type="text/html" id="status">
			{{#  if(d.videoState == '0'){ }}
				<span class="label label-default radius">未提交</span>
			{{# }else if(d.videoState == '1'){ }}
				<span class="label label-info radius">待审核</span>
			{{# }else if(d.videoState == '2'){ }}
				<span class="label label-danger radius">不通过</span>
			{{# }else if(d.videoState == '3'){ }}
				<span class="label label-success radius">通过</span>
			{{# }else if(d.videoState == '4'){ }}
				<span class="label label-success radius">已发布</span>
			{{# }else if(d.videoState == '5'){ }}
				<span class="label label-primary radius">已下架</span>
			{{# }else if(d.videoState == '6'){ }}
				<span class="label label-warning radius">已删除</span>
			{{# }else{  }}
				<span class="label label-danger radius">异常数据</span>
			{{# } }}
		</script>
	</div>
</div>
</body>
<script type="text/javascript">
function member_add(title,url,w,h){
	layer_show(title,url,w,h);
}
function doBatchDelete(videoIds){
	$.ajax({
		type: 'POST',
		url: '${pageContext.request.contextPath}/video/batchDelete.do',
		dataType: 'json',
		//data:JSON.stringify(videoIds),
		data:{"videoIds[]":videoIds},
		async:false,
		success: function(msg){
			console.log(msg);
			if(msg){
				layer.msg('删除成功!',{icon:1,time:1000});
				setTimeout(function(){
					location.replace(location.href);
				},2000);
			}else{
				layer.msg('删除失败!',{icon:5,time:1000});
			}
		},
		error:function(msg) {
			layer.msg('程序异常!',{icon:5,time:1000});
		}
	});
}
function updateState(videoId,videoState,title){
	$.ajax({
		type: 'POST',
		url: '${pageContext.request.contextPath}/video/updateVideoState.do?videoId='+videoId+"&videoState="+videoState,
		dataType: 'json',
		async:false,
		success: function(msg){
			console.log(msg);
			if(msg.key=='success'){
				layer.msg(title+'成功!',{icon:1,time:1000});
				setTimeout(function(){
					location.replace(location.href);
				},2000);
			}else{
				layer.msg(title+'失败!',{icon:5,time:1000});
			}
		},
		error:function(msg) {
			layer.msg('程序异常!',{icon:5,time:1000});
		}
	});
}
var object = null;
function batchDelete(){
	 console.log("批量删除");
	 if(object!=null && object.data.length!=0 && object.data!=undefined){
		 console.log(object.data);
		 console.log(object.data.length);
		 var size = object.data.length;
		 var videoIds = [];
		 var videos = object.data;
		 //var video = null;
		 for(var i=0;i<size;i++)
  	     {
			 console.log("将"+videos[i].videoId+"加入到videoIds集合");
			 videoIds.push(videos[i].videoId);   
  	     }
		 console.log(videoIds);
		 layer.confirm('<span style="color:orange"></span><span>是否确定删除所选中行</span><span style="color:orange"></span>', function(index){
			 doBatchDelete(videoIds);
			 layer.close(index);
	     });
	 }else{
		 layer.msg('当前没有选择任何行!',{icon:5,time:1000});
	 }
 }
</script>
<script src="${pageContext.request.contextPath }/layui/layui.js"></script>
<script>

layui.use('table', function(){
  var table = layui.table;
  //第一个实例
  table.render({
     elem: '#demo'
    ,id: 'videoId'
    ,height: 315
    ,url: '${pageContext.request.contextPath}/account/getVideoList.do' //数据接口
    ,page: true //开启分页
    ,limit: 10
    ,size: 'sm'
    //,where: {token: 'sasasas', id: 123}
    ,limits: [10, 20, 30, 40, 50]
    ,loading: true
    ,cols: [[ //表头
        {field: 'videoId',fixed: 'left',checkbox: true},
        {type:'numbers', title: '序号', width:50,templet:'#indexTpl'},
        {field: 'videoName', title: '名称', width:120},
        {field: 'videoTitle', title: '标题', width:120, sort: true},
        {field: 'channelType', title: '栏目', width:100}, 
        {field: 'videoType', title: '类型', width: 100},
        {field: 'videoSource', title: '来源', width: 100, sort: true},
        {field: 'createTime', title: '创建时间', width: 150, sort: true},
        {field: 'videoState', title: '状态', width: 90,toolbar:"#status"},
        {field: 'right', title: '操作', width: 235, toolbar:"#barDemo"}
    ]]
  });
  
  //table.init();
  //监听表格复选框选择
  table.on('checkbox(test)', function(obj){

      console.log(obj.data);
      if(obj.data.videoState!='6'){
    	  object = table.checkStatus('videoId');
    	  console.log(object.data);
      }
  });
  
  //var object = table.checkStatus('videoId');
  //console.log(object.data);
  
  //监听工具条
  table.on('tool(test)', function(obj){
	    var data = obj.data;
	    //JSON.stringify(data);往后台传string
	    console.log(obj);
	    if(obj.event === 'update'){
	    	//debugger;
	    	//layer.msg('状态变更为：'+ $(this).attr("lay-option") + '');
	    	var videoState = $(this).attr("lay-option");
	    	var title="";
	    	if(videoState=='4'){
	    		title="发布";
	    	}else if(videoState=='5'){
	    		title="下架";
	    	}else{
	    		title="删除";
	    	}
	    	layer.confirm('是否确定'+title+' <span style="color:orange">【</span><span>'+data.videoName+'</span><span style="color:orange">】</span>', function(index){
	    		updateState(data.videoId,videoState,title);
	    		layer.close(index);
	    	});
	    	
	        //layer.msg('ID：'+ data.id + ' 的查看操作');
	    	//member_stop(data.userId);
	    } else if(obj.event === 'del'){
	      layer.confirm('是否确定删除 <span style="color:orange">【</span><span>'+data.userRealName+'</span><span style="color:orange">】</span>', function(index){
	    	  $.ajax({
	  			type: 'POST',
	  			url: '${pageContext.request.contextPath}/account/deleteMemberByUserId.do?userId='+data.userId,
	  			dataType: 'json',
	  			async:false,
	  			success: function(msg){
	  				console.log(msg);
	  				if(msg.key=='success'){
	  					obj.del();
	  					layer.msg('删除成功!',{icon:1,time:1000});
	  				}else{
	  					layer.msg('程序异常!',{icon:5,time:1000});
	  				}
	  			},
	  			error:function(msg) {
	  				layer.msg('程序异常!',{icon:5,time:1000});
	  			}
	  		});	
	        layer.close(index);
	      });
	    } else if(obj.event === 'detail'){
	    	member_show(data.userNickName,getPath()+'/video/account/toMemberShow.do?userId='+data.userId,data.userId,'360','400');
	    } else if(obj.event === 'audit'){
	    	layer.confirm('是否审核通过？', {
	    		  btn: ['通过', '不通过'] //可以无限个按钮
	    		},function(index, layero){
    		    	console.log("通过");
    		    	updateState(data.videoId,'3','审核');
    		  	},function(index, layero){
	    			console.log("不通过");
	    			updateState(data.videoId,'2','审核');
	    		});
	    }
	});
  
  
  //-------
});

$("#search_button").bind("click",function(){
	console.log("执行搜索方法");
	search();
});

function search(){
	var start = $("#datemin").val();
	var end = $("#datemax").val();
	console.log(start);
	console.log(end);
	if(end.length!=0 && start.length==0){
		console.log("请输入开始时间");
		layer.msg('请输入开始时间!',{icon:5,time:1000});
		return;
	}
	if(end.length==0 && start.length!=0){
		console.log("请输入结束时间");
		layer.msg('请输入结束时间!',{icon:5,time:1000});
		return;
	}
	var search = $("#search").val();
	console.log(search);
	var data = {"start":start,"end":end,"search":search};
	$.ajax({
		url:'${pageContext.request.contextPath}/video/getVideoListBySearch.do',
		type:'post',
		dataType:'json',
		data: {"data":JSON.stringify(data)},
		success:function(data){
			console.log(data);
			reloadTable(data);
		},
		error:function(){
			
		}
	});
}

function reloadTable(data){
	layui.use('table', function(){
		  var table = layui.table;
		  //第一个实例
		  table.render({
     elem: '#demo'
    ,id: 'videoId'
    ,height: 315
    ,data: data
    ,page: true //开启分页
    ,limit: 10
    ,size: 'sm'
    ,where: {token: 'sasasas', id: 123}
    ,limits: [10, 20, 30, 40, 50]
    ,loading: true
    ,cols: [[ //表头
        {field: 'videoId',fixed: 'left',checkbox: true},
        {type:'numbers', title: '序号', width:50,templet:'#indexTpl'},
        {field: 'videoName', title: '名称', width:120},
        {field: 'videoTitle', title: '标题', width:120, sort: true},
        {field: 'channelType', title: '栏目', width:100}, 
        {field: 'videoType', title: '类型', width: 100},
        {field: 'videoSource', title: '来源', width: 100, sort: true},
        {field: 'createTime', title: '创建时间', width: 150, sort: true},
        {field: 'videoState', title: '状态', width: 90,toolbar:"#status"},
        {field: 'right', title: '操作', width: 235, toolbar:"#barDemo"}
    ]]
  });
  
  //table.init();
  //监听表格复选框选择
  table.on('checkbox(test)', function(obj){

      console.log(obj.data);
      if(obj.data.videoState!='6'){
    	  object = table.checkStatus('videoId');
    	  console.log(object.data);
      }
  });
  
  //var object = table.checkStatus('videoId');
  //console.log(object.data);
  
  
  
  //监听工具条
  table.on('tool(test)', function(obj){
	    var data = obj.data;
	    //JSON.stringify(data);往后台传string
	    console.log(obj);
	    if(obj.event === 'update'){
	    	//debugger;
	    	//layer.msg('状态变更为：'+ $(this).attr("lay-option") + '');
	    	var videoState = $(this).attr("lay-option");
	    	var title="";
	    	if(videoState=='4'){
	    		title="发布";
	    	}else if(videoState=='5'){
	    		title="下架";
	    	}else{
	    		title="删除";
	    	}
	    	layer.confirm('是否确定'+title+' <span style="color:orange">【</span><span>'+data.videoName+'</span><span style="color:orange">】</span>', function(index){
	    		updateState(data.videoId,videoState,title);
	    		layer.close(index);
	    	});
	    	
	        //layer.msg('ID：'+ data.id + ' 的查看操作');
	    	//member_stop(data.userId);
	    } else if(obj.event === 'del'){
	      layer.confirm('是否确定删除 <span style="color:orange">【</span><span>'+data.userRealName+'</span><span style="color:orange">】</span>', function(index){
	    	  $.ajax({
	  			type: 'POST',
	  			url: '${pageContext.request.contextPath}/account/deleteMemberByUserId.do?userId='+data.userId,
	  			dataType: 'json',
	  			async:false,
	  			success: function(msg){
	  				console.log(msg);
	  				if(msg.key=='success'){
	  					obj.del();
	  					layer.msg('删除成功!',{icon:1,time:1000});
	  				}else{
	  					layer.msg('程序异常!',{icon:5,time:1000});
	  				}
	  			},
	  			error:function(msg) {
	  				layer.msg('程序异常!',{icon:5,time:1000});
	  			}
	  		});	
	        layer.close(index);
	      });
	    } else if(obj.event === 'detail'){
	    	member_show(data.userNickName,getPath()+'/video/account/toMemberShow.do?userId='+data.userId,data.userId,'360','400');
	    } else if(obj.event === 'audit'){
	    	layer.confirm('是否审核通过？', {
	    		  btn: ['通过', '不通过'] //可以无限个按钮
	    		},function(index, layero){
    		    	console.log("通过");
    		    	updateState(data.videoId,'3','审核');
    		  	},function(index, layero){
	    			console.log("不通过");
	    			updateState(data.videoId,'2','审核');
	    });
	    }
	});
//-------
});
}
</script>
</html>