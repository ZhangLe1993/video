<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>登录</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="自媒体视频网站,自媒体视频网站,自媒体视频网站">
	<meta http-equiv="description" content="自媒体视频网站">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/0.png" type="image/x-icon" />
	<style type="text/css">
	   /* .error{position:absolute;left:500px;top:220px;color:red;font-size: 13px;} */
	   body{background:#fff;}
	</style>
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/skin/js/gVerify.js"></script>
    <!-- <script type="text/javascript">
           function changeCode()
           {
               var systemCode = document.getElementById("systemCode");
               systemCode.src="${pageContext.request.contextPath}/SystemCodeServlet?aa="+new Date();
           }
     </script> -->
  </head>
  <body>
    <div id="loginDiv" style="background:#fff;position:fixed;display:block;top: 100px; left: 456.5px;border:3px double #0099FF;width:460px;height:360px;background:url(${pageContext.request.contextPath }/resources/images/login/login_logo.gif) no-repeat 200px 50px;background-size:310px 300px;">
    <div style="width:460px;height:57px;background:gray;">
	     <img src="${pageContext.request.contextPath }/resources/images/login/login_in.gif" width="57" height="57" style="border-radius:50%;float:left;"/>
	     <div style="color: #00CCFF;font: 20px 'Microsoft Yahei','\5FAE\8F6F\96C5\9ED1',SimHei,'\9ED1\4F53';float:left;margin-top:15px;margin-left:50px;position:relative;"><span>欢迎登录尤物网</span></div>
		 <a href="#" id="close_btn" style="position:relative;float:right;top:15px;margin-right:1px;"><img style="border-radius:50%;" src="${pageContext.request.contextPath }/resources/images/login/close.png"/></a>
    </div>
    <div style="width: auto;height: auto;font-family:Microsoft Yahei;">
        <div>
	       <div style="height: 21px;line-height: 21px;padding: 0px 0 0 105px;"><p>${requestScope.error}</p></div>
		   <div style="width: 380px;min-height: 190px;padding: 0 0 10px 30px;">
		      <form method="POST" action="${pageContext.request.contextPath }/TalkLoginServlet">
			      <p style="position:relative;margin-bottom: 10px;font: 20px;-webkit-box-sizing: content-box;margin-top:20px;">
				     <label style="color:#2EAFBB;">帐&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</label>
					 <span><input style="height:35px;width:250px;" type="text" name="loginname" placeholder="手机号/用户名/邮箱" autocomplete="off"></span>
				  </p>
				  <p>
				     <label style="color:#2EAFBB;">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</label>
					 <span><input style="height:35px;width:250px;" type="password" name="password" maxlength="20" placeholder="请输入您的密码"></span>
				  </p>
				  <p>
				     <label style="color:#2EAFBB;">验&nbsp;证&nbsp;码</label>
					 <span><input style="height:35px;width:150px;" type="text" name="validateCode" maxlength="5" placeholder="请输入验证码"></span>
					 <div title="点击更换" style="height:35px;width:95px;position:relative;top:-51px;left:215px;" id="v_container"></div>
				  </p>
				  <p><input type="button" onclick="userLogin();" value="" style="position:relative;top:-50px;cursor:pointer;position:relative;left:62px;width:250px;height:35px;background:url(${pageContext.request.contextPath }/resources/images/login/loginbut.png);background-size:250px 35px;"> </p>
				  <p style="position:relative;top:-30px;">
				     <span style="position:relative;top:-15px;font-size:10px;color:#2EAFBB;font-family:Microsoft Yahei">第三方登录：</span>
					 <span>
					   <a style="text-decoration: none;position:relative;top:-10px;" href="#" title="新浪微博登录"><img src="${pageContext.request.contextPath }/resources/images/login/sinabut.png"/></a>
					 </span>
				  </p>
			  </form>
		  </div>
        </div>
      </div>
    </div>
    <!--登陆框结束  -->
  </body>
  <script>
        var verifyCode = new GVerify("v_container");
        function validateCode(){
        	var res = verifyCode.validate($("input[name='validateCode']").val());
            if(res){
                console.log("验证码正确");
                return true;
            }else{
            	console.log("验证码错误");
                return false;
            }
        }
        function changeCode(){
        	verifyCode = new GVerify("v_container");
        }
        
        function userLogin(){
        	if(validateCode()){
        		$.ajax({
            		url:'${pageContext.request.contextPath }/login/toLogin.do',
            		type:'post',
            		success:function(data){
            			
            		},
            		error:function(){
            			
            		}
            	});
        	}else{
        		console.log("验证码错误");
        	}
        }
    </script>
</html>
