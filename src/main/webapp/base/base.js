function getPath(){
	return location.origin;
}


function getRootPath(){  
    //获取当前网址，如： http://localhost:8083/video/share/meun.jsp  
    var curWwwPath=window.document.location.href;  
    //获取主机地址之后的目录，如： video/share/meun.jsp  
    var pathName=window.document.location.pathname;  
    var pos=curWwwPath.indexOf(pathName);  
    //获取主机地址，如： http://localhost:8083  
    var localhostPaht=curWwwPath.substring(0,pos);  
    //获取带"/"的项目名，如：/video  
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);  
    return(localhostPaht+projectName);  
} 

function isNotEmpty(param){
	if(param==undefined || param==null || param=='null' || param.length==0){
		return false;
	}
	return true;
} 

function IsEmail(email)
{
   var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
   if(!myreg.test(email)){
        return false;
   } else{
        return true;
   }
}

function getLoginInfo(){
	var object = '';
	$.ajax({
		url:getRootPath()+'/user/login/getCurrentLoginUser.do',
  		type:'post',
  		async:false,
		contentType:false,
		processData:false,
		cache:false,
  		success:function(data){
  			if(data.oK){
  				object = data.obj;
  				console.log('有');
  			}else{
  				console.log('无');
  			}
  		},
  		error:function(){
  			console.log("服务异常");
  		}
	});
	return object;
}

function loginOut(){
	layer.confirm('您确定退出？', {
		  skin: 'layui-layer-molv',
		  btn: ['确定','取消'] //按钮
		}, function(){
			$.post(getRootPath()+'/user/login/out.do','',function(data){
				//parent.location.reload(); //刷新父亲对象（用于框架）
				//opener.location.reload(); //刷新父窗口对象（用于单开窗口）
				//top.location.reload();    //刷新最顶端对象（用于多开窗口）
				if(data.oK){
					//window.location.reload(); //刷新当前页面.
					closeWin();
					/*setTimeout(function(){
						parent.layer.msg('退出成功', {
						    time: 2000, //2s后自动关闭
						    btn: ['明白了', '知道了']
						  });
					},2000);*/
				}
			},'json');
		  //layer.msg('的确很重要', {icon: 1});
		}, function(){
		  /* layer.msg('也可以这样', {
		    time: 20000, //20s后自动关闭
		    btn: ['明白了', '知道了']
		  }); */
		}
	);
}
function closeWin() {
	  window.opener=null;
	  window.open('','_self');
	  window.close();
}

function IsPhone(Tel)
{
     var re = new RegExp(/^((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)$/);
     var retu = Tel.match(re);
     if(retu){
          return true;
     } else{
          return false;
      }
 }
function Objects(list,count){ 
    this.list=list; 
    this.count=count; 
} 

function getVideoListMore(limit,page,channelType,videoType,videoSource){
	if(page=='null'){
		page = 1;
	}
	var objects = {}; 
	var list = [];
	var length = 0;
	$.ajax({
		url:getRootPath()+'/user/getVideoListMore.do?limit='+limit+'&page='+page+'&channelType='+channelType+'&videoType='+videoType+'&videoSource='+videoSource,
		type:'post',
		dataType:'json',
		async:false,
		success:function(data){
			if(data.code==0){
				//layer.msg('数据加载成功、祝您观影愉快',{icon: 6,time:1300});
				console.log(data.count);
				console.log('数据加载成功、祝您观影愉快');
				list = data.data;
				length = data.count;
			}else{
				layer.msg('浏览器异常',{icon: 5,time:1000});
			}
		},
		error:function(){
			layer.msg('站点处于维护中',{icon: 5,time:1000});
		}
	});
	objects = new Objects(list,length);
	return objects;
}


function getVideoListKey(limit,page,keyword){
	if(page=='null'){
		page = 1;
	}
	var objects = {}; 
	var list = [];
	var count = 0;
	$.ajax({
		url:getRootPath()+'/user/getVideoListKey.do?limit='+limit+'&page='+page+'&keyword='+keyword,
		type:'get',
		dataType:'json',
		async:false,
		success:function(data){
			if(data.code==0){
				console.log(data.count);
				list = data.data;
				count = data.count;
			}else{
				layer.msg('浏览器异常',{icon: 5,time:1000});
			}
		},
		error:function(){
			layer.msg('站点处于维护中',{icon: 5,time:1000});
		}
	});
	objects = new Objects(list,count);
	return objects;
}
