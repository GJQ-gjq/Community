<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    <link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet" type="text/css" />
	<script  src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
  	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
  <script type="text/javascript">
  $().ready(function() {			
		// 在键盘按下并释放及提交后验证提交表单
		  $("#form").validate({
			  submitHandler: function(form) {
			    	form.submit();
			    },
			  rules:{
				  oldPassword:{
					  required:true,
					  rangelength:[6,12]
				  },
				  managerPassword:{
					  required:true,
					  rangelength:[6,12]
				  },
				  managerPassword1:{
					  required:true,
					  rangelength:[6,12],
					  equalTo:"#managerPassword"
				  }
			  },
			  messages:{
				  oldPassword:{
					  required:"请输入旧密码",
					  rangelength:"6-12位密码"
				  },
				  managerPassword:{
					  required:"请输入新密码",
					  rangelength:"6-12位密码"
				  },
				  managerPassword1:{
					  required:"请再输入新密码",
					  rangelength:"6-12位密码",
				  	  equalTo: "两次密码不一致"
				  }
			  }
		  });
		 });
</script>
<style type="text/css">
	.error{
			color:red;
			padding-left:5px;
		}
	</style>
  </head>
  
  <body>
    <div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li>个人信息管理</li>
    <li>修改密码</li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>修改密码</span></div>
    <form id="form" action="/community/clubManager/doUpdateManagerPsw" method="post" >
    <ul class="forminfo" style="padding-top: 20px;padding-left: 50px;">
    <li><span style="color:red;padding-left:100px"><strong>${msg }</strong></span></li>
    <li><label>旧密码：</label><input id="oldPassword"  name="oldPassword" type="password" class="dfinput" /></li>
    <li><label>新密码：</label><input id="managerPassword"   name="managerPassword" type="password" class="dfinput" /></li>
    <li><label>确认新密码：</label><input id="managerPassword1"   name="managerPassword1" type="password" class="dfinput" /></li>
    <li style="padding-top: 20px;"><label>&nbsp;</label><input  type="submit" class="btn" value="确认修改"/></li>
    </ul>
    </form>
    
    </div>
  </body>
</html>
