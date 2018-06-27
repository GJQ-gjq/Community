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
	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/additional-methods.js"></script>
	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
  	<script type="text/javascript">
  	$().ready(function() {			
		// 在键盘按下并释放及提交后验证提交表单
		  $("#form").validate({
			  submitHandler: function(form) {
			    	form.submit(); 
			    	
			    },
			  rules:{
				  file:{
		    		  required:true, 
		    		  
		    	  }    	   	 	  
		      },
		  messages:{
			  file:{
				  required:"请选择文件", 
				  accept: "文件格式不正确"
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
  		</script>
  </head>
  
  <body>
       <div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li>事务管理</li>
    <li>资料上传</li>
    </ul>
    </div>
    
    <div class="formbody">
    
    
    <div id="usual1" class="usual"> 
    
    <div class="itab">
  	<ul> 
    <li><a href="#tab1" class="selected">资料上传</a></li> 
  	</ul>
    </div> 
    
  	<div id="tab1" class="tabson">
    
    <form id="form" action="/community/admin/doFileUpload" enctype="multipart/form-data" method="post" >
    <ul class="forminfo" style="padding-top: 20px;">
    <li><span style="color:red;padding-left:200px"><strong>${msg }</strong></span></li>
    <li><label style="width: 150px;padding-left:100px">请选择文件(*.doc)<b>*</b></label><input style="border:1px solid" id="file" name="file" type="file"  accept="application/msword"  /></li>  	
    <li style="padding-top: 20px;padding-left:80px"><label>&nbsp;</label><input  type="submit" class="btn" value="立即上传"/></li>
    </ul>
    </form>
    </div> 

	</div> 
 </div>
  </body>
</html>
