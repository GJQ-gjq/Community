<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN">
  <head>
    <base href="<%=basePath%>">
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>社团申请</title>
		<link href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/static/css/main.css" rel="stylesheet" />	 		
  		<script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
		<script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
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
		    	  name:{
		    		  required:true, 
		    		  rangelength:[3,12],		    		  
		    	  },
		    	  reason:{
		    		  required:true, 
		    		  rangelength:[50,100],
		    	  }
		      },
		  messages:{
			  name:{
	    		  required:"请输入社团名称", 
	    		  rangelength:"3-12个字符",		    		  
	    	  },
	    	  reason:{
	    		  required:"请输入申请原因", 
	    		  rangelength:"50-100个字符",
	    	  }
		  	}
		  });
		 });
		$().ready(function() {			
			// 在键盘按下并释放及提交后验证提交表单
			  $("#form1").validate({
				  submitHandler: function(form1) {
				    	form1.submit();      
				    },
				  rules:{
			    	  cName:{
			    		  required:true, 
			    		  rangelength:[3,12],		    		  
			    	  },
			    	  cType:{
			    		  required:true,
			    	  },
			    	  college:{
			    		  required:true,
			    	  },
			    	  introduce:{
			    		  required:true, 
			    		  rangelength:[50,300],
			    	  }
			      },
			  messages:{
				  cName:{
		    		  required:"请输入社团名称", 
		    		  rangelength:"3-12个字符",		    		  
		    	  },
		    	  cType:{
		    		  required:"请选择社团类别",
		    	  },
		    	  college:{
		    		  required:"请选择所属学院",
		    	  },
		    	  introduce:{
		    		  required:"请输入社团简介", 
		    		  rangelength:"50-300个字符",
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
		.form-control{
		display: inline-block;
		width:183px;
		}
		</style>
  </head>
  <body style="margin: 0 auto ;width: 1000px;">
		<div class="top">
			<div class="container">
				<div class="row clearfix">
					<%@ include file="../common/header1.jsp"%>
				</div>
				<!--logo结束-->
					<%@ include file="../common/nav.jsp"%>		
			</div>
		</div>
		<!--顶部结束-->
		<div class="middle">
			<div class="container">
				<div class="row clearfix">
					<div class="col-md-3">
						<div class="leftmenu" style="height: 720px;">
							<h3>申请社团</h3>
							<ul class="menuson">
								<li class="active">
									<a href="/community/student/clubApply">社团申请</a>
								</li>
								<li>
									<a href="/community/student/clubApplyList">申请状态</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="col-md-9">
						<div style="padding-top:20px ;"><img src="${pageContext.request.contextPath}/static/images/4.jpg" style="width:742px;height:179px;"></div>
						<div class="apply">
							<ul id="myTab" class="nav nav-tabs">
								<li class="active"><a href="#applyClub" data-toggle="tab">加入社团申请</a></li>
								<li><a href="#buildClub" data-toggle="tab">成立社团申请</a></li>
							</ul>
							<div id="myTabContent" class="tab-content">
								<div class="tab-pane fade in active" id="applyClub">
							<form class="form-horizontal" role="form" id="form"  action="/community/student/doClubApply" method="post">
							<div class="form-group">
							    <div class="col-sm-offset-5 col-sm-3">				      
							        <input id="msg1" type="hidden" value="${msg1}">
							    </div>
							  </div>
							<div class="form-group">
								<label for="name" class="col-sm-2 control-label">社团名称:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="name" name="name" placeholder="请输入社团名称">
								</div>
							</div>									
							
							<div class="form-group">
								<label for="introduction" class=" col-sm-2 control-label">申请原因:</label>
								<div class="col-sm-8">
									<textarea name="reason" placeholder="50-100字以内" style="width:500px;height:200px;resize:none"></textarea>
								</div>
							</div>												
							
							<div class="form-group">
								<div class="col-sm-offset-4 col-sm-6">
									<button type="submit" class="btn btn-default" style="width: 100px;background-color: #FA710D;color: #fff;">提交申请</button>
								</div>
							</div>
						</form>
								</div>
								<div class="tab-pane fade" id="buildClub">
							<form class="form-horizontal" role="form" id="form1"   action="/community/student/buildClub" method="post">
							<div class="form-group">
								<label for="cName" class="col-sm-2 control-label">社团名称:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="cName" name="cName" placeholder="请输入社团名称">
								</div>
							</div>

							<div class="form-group">
								<label for="cType" class=" col-sm-2 control-label">社团类型:</label>
								<div class="col-sm-8">
									<select class="form-control" id="cType" name="cType" style="appearance: none;-moz-appearance: none;">
										<option value="">--请选择社团类型--</option>
										<option value="实践类">实践类</option>
										<option value="体育类">体育类</option>
										<option value="公益类">公益类</option>
										<option value="科技类">科技类</option>
										<option value="语言文化类">语言文化类</option>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label for="college" class=" col-sm-2 control-label">所属学院:</label>
								<div class="col-sm-8">
									<select class="form-control" id="college" name="college" style="appearance: none;-moz-appearance: none;">
										<option value="">--请选择学院--</option>
										<option value="信息学院">信息学院</option>
										<option value="外语学院">外语学院</option>
										<option value="体育学院">体育学院</option>
									</select>
								</div>
							</div>		
							
							<div class="form-group">
								<label for="introduce" class=" col-sm-2 control-label">社团简介:</label>
								<div class="col-sm-8">
									<textarea  name="introduce" placeholder="50-300字以内" style="width:500px;height:200px;resize:none"></textarea>
								</div>
							</div>												
							
							<div class="form-group">
								<div class="col-sm-offset-4 col-sm-6">
									<button type="submit" class="btn btn-default" style="width: 100px;background-color: #FA710D;color: #fff;">提交申请</button>
								</div>
							</div>
						</form>
								</div>
							</div>
						</div>
				</div>
			</div>
		</div>
		
		<!--中部结束-->
		<%@ include file="../common/foot.jsp"%>
		<script type="text/javascript">	
			$(function() {
				//导航切换
				$(".menuson a").click(function() {
					$(this).parent('li').siblings().removeClass("active");
					$(this).parent('li').addClass("active");				
				});
			})
			
			$(function() {
			var msg1=document.getElementById("msg1").value;
				if(msg1!=null&&msg1!=""){
					alert(msg1);
					document.getElementById("msg1").value ="";
				}
			})
			
			
		</script>
	</body>
</html>
