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

<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
<title>用户管理</title>
</head>
<body>
<nav class="breadcrumb">
	<i class="Hui-iconfont">&#xe67f;</i> 首页 
		<span class="c-gray en">&gt;</span> 用户中心 
		<span class="c-gray en">&gt;</span> 用户管理 
		<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" >
			<i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 日期范围：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d %H:%m\'}',dateFmt:'yyyy-MM-dd HH:mm' })" id="datemin" class="input-text Wdate" style="width:150px;">
		-
		<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d %H:%m',dateFmt:'yyyy-MM-dd HH:mm' })" id="datemax" class="input-text Wdate" style="width:150px;">
		<input type="text" class="input-text" style="width:250px" placeholder="输入会员名称、电话、邮箱" id="search" name="search">
		<button type="submit" class="btn btn-success radius" id="search_button" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l">
			<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius">
				<i class="Hui-iconfont">&#xe6e2;</i> 批量删除
			</a> 
			<a href="javascript:;" onclick="member_add('添加用户','../account/toAddMember.html','','510')" class="btn btn-primary radius">
				<i class="Hui-iconfont">&#xe600;</i> 添加用户
			</a>
		</span> 
	</div>
	<div class="mt-20">
		<table id="demo" lay-filter="test"></table>
		<!--  
		<script type="text/html" id="barDemo">
    		<a class="layui-btn layui-btn-primary layui-btn-mini" lay-event="detail">查看</a>
    		<a class="layui-btn layui-btn-mini" lay-event="edit">编辑</a>
    		<a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="del">删除</a>
		</script>
		-->
		<!-- 序号监听事件 -->
		<script type="text/html" id="indexTpl">
    		{{d.LAY_TABLE_INDEX+1}}
		</script>
		
		<script type="text/html" id="barDemo">
			{{#  if(d.userStatus == '1'){ }}
				<a lay-event="stop" style="text-decoration:none" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a> 
				&nbsp;
				<a lay-event="detail" title="详情" href="javascript:;" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe665;</i></a> 
				&nbsp;
				<a lay-event="changePwd" style="text-decoration:none" class="ml-5" onClick="change_password('修改密码','change-password.html','10001','600','270')" href="javascript:;" title="修改密码"><i class="Hui-iconfont">&#xe63f;</i></a>
				&nbsp; 
				<a lay-event="del" title="删除" href="javascript:;" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
			{{# }else if(d.userStatus == '2'){ }}
				<a lay-event="start" style="text-decoration:none" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe615;</i></a>
				&nbsp;
				<a lay-event="detail" title="详情" href="javascript:;" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe665;</i></a> 
				&nbsp;
				<a lay-event="changePwd" style="text-decoration:none" class="ml-5" onClick="change_password('修改密码','change-password.html','10001','600','270')" href="javascript:;" title="修改密码"><i class="Hui-iconfont">&#xe63f;</i></a>
				&nbsp; 
				<a lay-event="del" title="删除" href="javascript:;" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
			{{# }else{  }}
				<a lay-event="detail" title="详情" href="javascript:;" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe665;</i></a> 
				&nbsp;
				<a lay-event="changePwd" style="text-decoration:none" class="ml-5" onClick="change_password('修改密码','change-password.html','10001','600','270')" href="javascript:;" title="修改密码"><i class="Hui-iconfont">&#xe63f;</i></a> 
				&nbsp;
				<a lay-event="del" title="删除" href="javascript:;" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>	
			{{# } }}
		</script>
		<!-- 0 未激活，1已启用，2：禁用 -->
		<script type="text/html" id="status">
			{{#  if(d.userStatus == '0'){ }}
				<span class="label radius">未激活</span>
			{{# }else if(d.userStatus == '1'){ }}
				<span class="label label-success radius">已启用</span>
			{{# }else{  }}
				<span class="label label-danger radius">禁用</span>
			{{# } }}
		</script>
		
		<!-- 0 未知，1男，2：女 -->
		<script type="text/html" id="sex">
			{{#  if(d.userSex == '0'){ }}
				未知
			{{# }else if(d.userSex == '1'){ }}
				男
			{{# }else{  }}
				女
			{{# } }}
		</script>
	</div>
</div>
<!--_footer 作为公共模版分离出去-->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/account/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/account/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/account/static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer 作为公共模版分离出去-->
<script src="${pageContext.request.contextPath }/layui/layui.js"></script>
<script>
layui.use('table', function(){
  var table = layui.table;
  //第一个实例
  table.render({
     elem: '#demo'
    ,height: 315
    ,url: '${pageContext.request.contextPath}/account/getMemberList.do' //数据接口
    ,page: true //开启分页
    ,limit: 10
    ,size: 'sm'
    ,limits: [10, 20, 30, 40, 50]
    ,loading: true
    ,cols: [[ //表头
        {field: 'userId',fixed: 'left',checkbox: true},
        {type:'numbers', title: '序号', width:50,templet:'#indexTpl'},
        {field: 'userRealName', title: '用户名', width:100},
        {field: 'userSex', title: '性别', width:80, sort: true,toolbar:"#sex"},
        {field: 'userPhone', title: '手机号', width:120}, 
        {field: 'userEmail', title: '邮箱', width: 150},
        {field: 'userAddressDivisions', title: '地址', width: 200, sort: true},
        {field: 'userRegisterTime', title: '注册时间', width: 150, sort: true},
        {field: 'userStatus', title: '状态', width: 80,toolbar:"#status"},
        {field: 'right', title: '操作', width: 135, toolbar:"#barDemo"}
    ]]
  });
  
  //table.init();
  //监听表格复选框选择
  table.on('checkbox(test)', function(obj){
      console.log(obj);
  });
  
  //监听工具条
  table.on('tool(test)', function(obj){
	    var data = obj.data;
	    //JSON.stringify(data);往后台传string
	    if(obj.event === 'stop'){
	      //layer.msg('ID：'+ data.id + ' 的查看操作');
	    	member_stop(data.userId);
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
	    } else if(obj.event === 'changePwd'){
	      
	    }
	});
  
  
  //-------
});
</script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/account/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript">
/*用户-添加*/
function member_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*用户-查看*/
function member_show(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*用户-停用*/
function member_stop(id){
	layer.confirm('确认要停用吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '',
			dataType: 'json',
			//data:{"news":JSON.stringify(news)},
			success: function(data){
				$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>');
				$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
				$(obj).remove();
				layer.msg('已停用!',{icon: 5,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}

/*用户-启用*/
function member_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '',
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>');
				$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
				$(obj).remove();
				layer.msg('已启用!',{icon: 6,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});
	});
}
/*用户-编辑*/
function member_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*密码-修改*/
function change_password(title,url,id,w,h){
	layer_show(title,url,w,h);	
}
/*用户-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '${pageContext.request.contextPath}/account/deleteMemberByUserId.do?userId='+id,
			dataType: 'json',
			async:false,
			success: function(msg){
				/* alert(msg); */
				console.log(msg);
				if(msg.key=='success'){
					$(obj).parent().parent().remove();
					layer.msg('已删除!',{icon:1,time:1000});
					$("#size_show").text($("#size_show").text()-1);
					/* location.replace(location.href); */
				}else{
					layer.msg('程序异常!',{icon:1,time:1000});
				}
			},
			error:function(msg) {
				//console.log(data.msg);
				console.log(msg);
				console.log("服务异常");
			},
		});		
	});
}

$("#search_button").bind("click",function(){
	console.log("执行搜索方法");
	search();
});


function search(){
	var start = $("#datemin").val();
	var end = $("#datemax").val();
	console.log(start);
	console.log(end);
	var search = $("#search").val();
	console.log(search);
	var data = {"start":start,"end":end,"search":search};
	$.ajax({
		url:'${pageContext.request.contextPath}/account/getMemberListBySearch.do',
		type:'post',
		dataType:'json',
		data: {"data":JSON.stringify(data)},
		success:function(data){
			console.log(data);
			reloadTable(data)
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
		    ,height: 315
		    ,data: data
		    /* ,url: '${pageContext.request.contextPath}/account/getMemberList.do' //数据接口 */
		    ,page: true //开启分页
		    ,limit: 10
		    ,size: 'sm'
		    ,limits: [10, 20, 30, 40, 50]
		    ,loading: true
		    ,cols: [[ //表头
		        {field: 'userId',fixed: 'left',checkbox: true},
		        {type:'numbers', title: '序号', width:50,templet:'#indexTpl'},
		        {field: 'userRealName', title: '用户名', width:100},
		        {field: 'userSex', title: '性别', width:80, sort: true,toolbar:"#sex"},
		        {field: 'userPhone', title: '手机号', width:120}, 
		        {field: 'userEmail', title: '邮箱', width: 150},
		        {field: 'userAddressDivisions', title: '地址', width: 200, sort: true},
		        {field: 'userRegisterTime', title: '注册时间', width: 150, sort: true},
		        {field: 'userStatus', title: '状态', width: 80,toolbar:"#status"},
		        {field: 'right', title: '操作', width: 135, toolbar:"#barDemo"}
		    ]]
		  });
		  
		  //table.init();
		  //监听表格复选框选择
		  table.on('checkbox(test)', function(obj){
		      console.log(obj);
		  });
		  
		  //监听工具条
		  table.on('tool(test)', function(obj){
			    var data = obj.data;
			    //JSON.stringify(data);往后台传string
			    if(obj.event === 'stop'){
			      //layer.msg('ID：'+ data.id + ' 的查看操作');
			    	member_stop(data.userId);
			    } else if(obj.event === 'del'){
			      layer.confirm('是否确定删除 <span style="color:orange">【</span><span>'+data.userRealName+'</span><span style="color:orange">】</span>', function(index){
			    	  $.ajax({
			  			type: 'POST',
			  			url: '${pageContext.request.contextPath}/account/deleteMemberByUserId.do?userId='+id,
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
			  			},
			  		});	
			    	  
			        
			        layer.close(index);
			      });
			    } else if(obj.event === 'edit'){
			      
			    } else if(obj.event === 'changePwd'){
			      
			    }
			});
		  //-------
		});
}
</script> 
</body>
</html>