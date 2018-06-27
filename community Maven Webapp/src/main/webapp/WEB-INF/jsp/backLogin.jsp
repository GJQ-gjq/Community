<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
 <title>欢迎登录后台管理系统</title>
<link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet" type="text/css" />
<script  src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/js/cloud.js" type="text/javascript"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
		<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script language="javascript">
	$(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })  
});  
	$().ready(function() {			
			// 在键盘按下并释放及提交后验证提交表单
			  $("#form").validate({
				  submitHandler: function(form) {
				    	form.submit();      
				    },
				  rules:{
					  adminName:{
  						required:true, 
  					},
  					adminPassword:{
  		    		  required:true, 
  		    			minlength:6
  		    	  	},
				 	 },
		    	 	messages:{
		    	 		adminName:{
						  required:"", 
					  },
					  adminPassword:{
			    		  required:"", 
			    		  minlength:"大于6位数"
			    	  },
		    	 	},
			 	});
		 });   
</script> 
<style type="text/css">
		.loginbox ul li label{
			color:red;	
		}
		.error{
			color:red;		
		}		
		</style>
</head>

<body style="background-color:#1c77ac; background-image:url(${pageContext.request.contextPath}/static/images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">



    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  


<div class="logintop">    
    <span>欢迎登录后台管理界面平台</span>           
    </div>
    
    <div class="loginbody">
    
    <span class="systemlogo"></span> 
       
    <div class="loginbox" style="margin-top:130px;">
    <form id="form" action="/community/main" method="post" >
    <ul style="padding-top:">
    <li><input id="adminName" name="adminName" type="text" class="loginuser" placeholder="请输入用户名"/></li>
    <li><input id="adminPassword" name="adminPassword" type="password" class="loginpwd" placeholder="请输入密码"/></li>
    <li><input  type="submit" class="loginbtn" value="登录"/><label style="color:red">${msg}</label></li>
    </ul>
    </form>
    
    </div>
    
    </div>
    
    
    
    <div class="loginbm">Copyright 2017.九江学院社团联合会 All rights reserved.</div>
</body>
</html>

