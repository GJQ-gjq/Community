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
				  url:{
					  required:true,
				  }
			  },
			  messages:{
				  url:{
					  required:"请填写地址",
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
    <li>事务管理</li>
    <li>首页视频</li>
    </ul>
    </div>
    
    <div class="formbody">
    
    
    <div id="usual1" class="usual"> 
    
    <div class="itab">
  	<ul> 
    <li><a href="#tab1" class="selected">视频设置</a></li> 
  	</ul>
    </div> 
    
  	<div id="tab1" class="tabson">
    
    <form id="form" action="/community/admin/doUpdateVideo" method="post" >
    <ul class="forminfo" style="padding-top: 20px;">
    <li><span style="color:red;padding-left:100px"><strong>${msg }</strong></span></li>
    <li><label style="width: 100px;">视频地址设置<b>*</b></label><input id="url" name="url" type="text" class="dfinput" placeholder="请填写视频地址"  style="width:518px;"/></li>  	
    <li style="padding-top: 20px;"><label>&nbsp;</label><input  type="submit" class="btn" value="立即设置"/></li>
    </ul>
    </form>
    </div> 

	</div> 
 </div>
  </body>
</html>
