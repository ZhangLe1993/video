<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>下载</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
</head>
<body>
<form class="layui-form" action="">
  <div class="layui-form-item">
    <label class="layui-form-label">格式选择</label><br><br><br>
    <div class="layui-input-block" style="margin-left: 40px;">
      <input type="radio" name="format" value="flv" title="flv" checked style="margin-left:-70px;"><br>
      <input type="radio" name="format" value="mp4" title="mp4" disabled><br>
      <input type="radio" name="format" value="mkv" title="mkv" disabled><br>
    </div>
  </div>
  <div class="layui-form-item" style="margin-bottom:8px;">
    <div class="layui-input-block" style="margin-left: 90px;">
      <button class="layui-btn" lay-submit lay-filter="formDemo">立即下载</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
  <input type="hidden" name="videoId" value="${videoId }"/>
  <input type="hidden" name="videoSrc" value="${videoSrc }"/>
</form>
<script type="text/javascript" src="${pageContext.request.contextPath }/layer/layer.js"></script>
<script src="${pageContext.request.contextPath }/layui/layui.js"></script>
<script src="${pageContext.request.contextPath }/base/base.js" charset="utf-8"></script>
<script>
//Demo
layui.use('form', function(){
  var form = layui.form;
  
  //监听提交
  /* form.on('submit(formDemo)', function(data){
    layer.msg(JSON.stringify(data.field));
    return false;
  }); */
  
  /* function downloadFile(fileName, xxzjbh) {
      location.href = '${ctx}/bhr/filedownload.do?xxzjbh=' + xxzjbh + "&fileName=" + fileName;
  } */
  
  
  form.on('submit(formDemo)', function(data){
	  	var videoId = $("input[name='videoId']").val();
		var videoSrc = $("input[name='videoSrc']").val();
	  	console.log(videoId+":"+videoSrc);
	    //layer.msg(JSON.stringify(data.field));
	    url = getRootPath()+'/video/filedownload.do?videoId='+videoId+'&videoSrc='+videoSrc;
	    location.href=url;
	    /* $.get(getRootPath()+'/video/filedownload.do',{videoId:videoId,videoSrc:videoSrc},function(data){
	    	return;
	    },'json'); */
	    //var index = parent.layer.getFrameIndex(window.name);
	    //parent.layer.close(index);
	    return false;
	  });
});
</script>
</body>
</html>