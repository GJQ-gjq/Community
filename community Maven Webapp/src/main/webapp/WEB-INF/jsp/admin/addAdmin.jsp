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
				  adminName:{
		    		  required:true, 
		    		  minlength:2,
		    	  },
		    	  adminPassword:{
		    		  required:true, 
		    		  rangelength:[6,12],
		    	  },
		    	  adminPassword1:{
		    		  required:true, 
		    		  rangelength:[6,12],
		    		  equalTo: "#adminPassword"
		    	  },
		    	  college:{
		    		  required:true,
		    	  },  	 	  
		      },
		  messages:{
			  adminName:{
				  required:"请输入用户名", 
				  minlength: "用户名大于2位"
			  },
			  adminPassword:{
	    		  required:"请输入密码", 
	    		  rangelength:"6-12位密码",
	    	  },
	    	  adminPassword1:{
	    		  required:"请再次输入密码", 
	    		  rangelength:"6-12位密码",
	    		  equalTo: "两次密码不一致"
	    	  },
	    	  college:{
	    		  required:"请选择学院",
	    	  },
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
    <li>用户管理</li>
    <li>添加管理员</li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>填写信息</span></div>
    <form id="form" action="/community/admin/doAddAdmin"  method="post" >
    <ul class="forminfo" style="padding-top: 20px;padding-left: 50px;">
    <li><span style="color:red;padding-left:100px"><strong>${msg }</strong></span></li>
    <li><label>用户名：</label><input id="adminName" name="adminName" type="text" class="dfinput" /></li>
    <li><label>密码：</label><input id="adminPassword" name="adminPassword" type="password" class="dfinput" /></li>
    <li><label>确认密码：</label><input id="adminPassword1" name="adminPassword1" type="password" class="dfinput" /></li>
    <li><label>男：</label><cite><input name="sex" type="radio" value="男" checked="checked" />男&nbsp;&nbsp;&nbsp;&nbsp;<input name="sex" type="radio" value="女" />女</cite></li>
    <li><label>学院：</label>
    	<select class="dfinput" id="college" name="college"> 
    		<option value="" selected="selected">请选择学院</option>
    		<option value="信息学院">信息学院</option>
    		<option value="文传学院">文传学院</option>
    		<option value="外语学院">外语学院</option>
    	</select>
    </li>
    <li><label>&nbsp;</label><input  type="submit" class="btn" value="确认添加"/></li>
    </ul>
    </form>
    
    </div>
  </body>
</html>
