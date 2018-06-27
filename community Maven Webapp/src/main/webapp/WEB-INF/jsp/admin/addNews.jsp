<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title></title>
<link href="${pageContext.request.contextPath}/static/css/style.css"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/editor/kindeditor.js"></script>
	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script type="text/javascript">
	KE.show({
		id : 'content',
		cssPath : './index.css'
	});
	
	$().ready(function() {			
		// 在键盘按下并释放及提交后验证提交表单
		  $("#form").validate({
			  submitHandler: function(form) {
			    	form.submit();      
			    },
			  rules:{
				  title:{
		    		  required:true, 
		    		  rangelength:[10,25],
		    	  },
		    	  type:{
		    		  required:true, 		  
		    	  },
		    	  content:{
		    		  required:true, 
		    		 minlength:50,	  
		    	  },	    	  	 	  
		      },
		  messages:{
			  title:{
				  required:"请输入标题", 
				  rangelength: "10-25个字"
			  },
			  type:{
	    		  required:"请选择类别",    		  
	    	  },
	    	  content:{
	    		  required:"请输入内容", 
	    		  minlength:"至少50字",   		  
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
			<li>公告管理</li>
			<li>发布公告</li>
		</ul>
	</div>

	<div class="formbody">


		<div id="usual1" class="usual">

			<div class="itab">
				<ul>
					<li><a href="#tab1" class="selected">发布公告</a></li>
				</ul>
			</div>

			<div id="tab1" class="tabson">
				<form id="form" action="/community/admin/doAddNews" method="post" >
				<ul class="forminfo" style="padding-top:20px">
					<li><span style="padding-left:100px;color:red"><strong>${msg }</strong></span></li>
					<li><label>标题<b>*</b> </label><input id="title" name="title" type="text"
						class="dfinput" placeholder="请填写标题" style="width:518px;" /></li>
					<li><label style="float:left;">类别<b>*</b> </label> <select class="dfinput" id="type" name="type">
							<option value="" selected="selected">请选择文章类别</option>
							<option value="news">新闻</option>
							<option value="notice">公告</option>
					</select>
					</li>
					<li><label style="float:left;">通知内容<b>*</b> </label> <textarea id="content"
							name="content"
							style="width:700px;height:250px;visibility:hidden;"></textarea>
					</li>
					<li><label>&nbsp;</label><input type="submit"
						class="btn"  value="马上发布" /></li>
				</ul>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
