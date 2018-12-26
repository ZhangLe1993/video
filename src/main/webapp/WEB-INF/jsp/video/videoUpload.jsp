<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resource/easyui/themes/bootstrap/easyui.css"> 
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resource/easyui/themes/demo.css">   
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resource/easyui/themes/icon.css">  
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resource/dist/css/wangEditor.min.css"> 
	
	<link href="${pageContext.request.contextPath }/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
	<script src="${pageContext.request.contextPath }/resource/bootstrap/jquery/2.1.1/jquery.min.js"></script> 
	 
    
    <script type="text/javascript" src="${pageContext.request.contextPath }/resource/easyui/jquery.easyui.min.js"></script> 
    <script src="${pageContext.request.contextPath }/resource/bootstrap/js/bootstrap.min.js"></script>  
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resource/bootstrap/table/bootstrap-table.min.css">
    <script src="${pageContext.request.contextPath }/resource/bootstrap/table/bootstrap-table.min.js"></script>
	<script src="${pageContext.request.contextPath }/resource/bootstrap/table/bootstrap-table.js"></script>  
	<script src="${pageContext.request.contextPath }/resource/bootstrap/table/bootstrap-table-zh-CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/easyui/easyui-lang-zh_CN.js"></script>
<title>上传视频</title>
</head>
<body>
	<!-- 新增账号弹窗 -->
    
    <div style="width:745px;height:500px;border:1px solid #2EAFBB;background:#fff;">
        <div style="width:100%;height:100%;position:relative;top:20px;" fit="true">
        <form id="uploadForm" method="post">
           <p>
               <label style="color:red;position:relative;left:20px;">*</label>
               <label style="position:relative;left:25px;color:#2EAFBB;font-size:15px;font-weight:BOLD;">视频标题</label>
               <input style="position:relative;left:40px;width:240px;height:30px;" type="text" name="title"/>
           </p>
           <br>
           <p>
               <label style="color:red;position:relative;left:20px;">*</label>
               <label style="position:relative;left:25px;color:#2EAFBB;font-size:15px;font-weight:BOLD;">视频描述</label> 
               <input style="position:relative;left:40px;width:240px;height:30px;" type="text" name="descript"/> 
           </p>
           <br>
           <p>
               <label style="color:red;position:relative;left:20px;">*</label>
               <label style="position:relative;left:25px;color:#2EAFBB;font-size:15px;font-weight:BOLD;">视频文件</label>
               
               <label style="position:relative;left:40px;">
               	<input  style="width:240px;height:30px;" name="src" type="file" /> 
               </label>        
           </p>
           <p>
               <a style="position:relative;left:115px;margin-top:30px;width:240px;height:30px;background:#2EAFBB;" onclick="upload()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">确认</a>           
           </p>
           </form>
           <a  style="position:relative;left:450px;top:-244px;width:240px;height:30px;background:#2EAFBB;" href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">重新选择</a>
        </div>
    </div>
    <!--  -->
    <script type="text/javascript">
  //提交新增用户表单
    function upload()
    {
    	var title = $("input[name='title']").val();
    	var descript = $("input[name='descript']").val();
       
        if(title.length==0)
        {
        	$.messager.alert('提示信息', '视频标题不可为空！', 'warning'); 
        	return;
        }
        if(descript.length==0)
        {
        	$.messager.alert('提示信息', '视频描述不可为空！', 'warning'); 
        	return;
        }
        else
        {
        	var form = new FormData(document.getElementById("uploadForm"));
        	$.ajax
        	(
        	  {
        		  url:'${pageContext.request.contextPath }/video/upload.do',
        		  type:'post',
        		  data:form,
        		  async:false,
        		  processData:false,
        		  cache:false,
        		  dataType:'json',
        		  contentType:false,
        		  success:function(msg)
        		  {
        			  if('success'==msg.key)
        		      {
        				  $.messager.alert('提示信息', '新增成功！', 'warning'); 
        		      }
        			  else
        			  {
        				  $.messager.alert('提示信息', '新增失败！', 'warning'); 
        			  }
        		  },
        	      error:function(msg)
        	      {
        	    	  $.messager.alert('提示信息', '服务器异常！', 'warning');
        	      }
        	  }		
        	);
        }
    }

    </script>
</body>
</html>