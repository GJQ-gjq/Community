<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    	<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>用户注册</title>
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
		    	  userId:{
		    		  required:true, 
		    		  rangelength:[11,11],
		    		  number:true,
		    		  digits:true
		    	  },
		    	  password:{
		    		  required:true, 
		    		  rangelength:[6,12],
		    	  },
		    	  password2:{
		    		  required:true, 
		    		  rangelength:[6,12],
		    		  equalTo: "#password"
		    	  },
		    	  userName:{
		    		  required:true,
		    		 	minlength:2,
		    	  },
		    	  college:{
		    		  required:true,
		    	  },
		    	  grade:{
		    		  required:true,
		    	  },
		    	  tel:{
		    		  required:true,
		    		  rangelength:[11,11],
		    		  number:true,
		    		  digits:true
		    	  },	  
		      },
		  messages:{
			  userId:{
				  required:"请输入用户名", 
				  rangelength: "请输入11位学号"
			  },
			  password:{
	    		  required:"请输入密码", 
	    		  rangelength:"请输入6-12位密码",
	    	  },
	    	  password2:{
	    		  required:"请再次输入密码", 
	    		  rangelength:"请输入6-12位密码",
	    		  equalTo: "两次输入密码不一致"
	    	  },
	    	  userName:{
	    		  required:"请输入真实姓名",
	    		  rangelength:"请输入大于2位的姓名",
	    	  },
	    	  college:{
	    		  required:"请选择学院",
	    	  },
	    	  grade:{
	    		  required:"请选择班级",
	    	  },
	    	  tel:{
	    		  required:"请输入手机号",
	    		  rangelength:"请输入11位手机号"
	    	  },
		  	}
		  });
		 });
		
		//定义了班级的二维数组，里面的顺序跟学院的顺序是相同的。通过selectedIndex获得学院的下标值来得到相应的班级数组
		   var grade=[
		   ["A1411","A1412","A1413","B1451"],
		   ["B1411","B1441","B1421","A1451"],
		   ["A1331","A1312","B1531","B1451"],
		   ["A1612","A1651","A1641","B1613"],
		   
		   ];
		 
		   function getGrade(){
		     //获得学院下拉框的对象
		     var sltCollege=document.getElementById("college");;
		     //获得班级下拉框的对象
		     var sltGrade=document.getElementById("grade");;     
		     //得到对应班级的学院数组
		     var collegeGrade=grade[sltCollege.selectedIndex - 1];
		  
		     //清空学院下拉框，仅留提示选项
		     sltGrade.length=1;
		  
		     //将学院数组中的值填充到班级下拉框中
		     for(var i=0;i<collegeGrade.length;i++){
		       sltGrade[i+1]=new Option(collegeGrade[i],collegeGrade[i]);
		     }
		   }
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
					<%@ include file="common/header.jsp"%>
				</div>
				<!--logo结束-->
				<%@ include file="common/nav.jsp"%>
			</div>
		</div>
		<!--顶部结束-->
		<div class="middle">
			<div class="container">
				<div class="row clearfix" style="border:1px solid;height:660px;margin-top:5px">
					<div class="col-md-9">
						<div class="form1" style="height:660px">
							<h1 align="center">用户注册</h1>
							<hr class="line1" />
							<form class="form-horizontal" role="form" id="form"  action="/community/doRegister" method="post">
								<div class="form-group">
							    <div class="col-sm-offset-5 col-sm-3">				      
							        <label style="color:red">${msg}</label>
							    </div>
							  </div>
								<div class="form-group">
									<label for="userId" class="col-sm-offset-2 col-sm-2 control-label">用户名:</label>
									<div class="col-sm-8">
										<input type="text"  class="form-control" id="userId" name="userId" placeholder="请输入学号">
									</div>
									
								</div>
								<div class="form-group">
									<label for="password" class="col-sm-offset-2 col-sm-2 control-label">密码:</label>
									<div class="col-sm-8">
										<input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
									</div>
								</div>
								<div class="form-group">
									<label for="password2" class="col-sm-offset-2 col-sm-2 control-label">确认密码:</label>
									<div class="col-sm-8">
										<input type="password" class="form-control" id="password2" name="password2" placeholder="请再输入密码">
									</div>
								</div>
								<div class="form-group">
									<label for="userName" class="col-sm-offset-2 col-sm-2 control-label">真实姓名:</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="userName" name="userName" placeholder="请输入姓名">
									</div>
								</div>
								<div class="form-group">
									<label for="sex" class="col-sm-offset-2 col-sm-2 control-label">性别:</label>
									<div class="col-sm-8">
										<label class="radio-inline">
								        <input type="radio" name="userSex" id="man" value="男" checked="checked"> 男
								   </label>
										<label class="radio-inline">
								        <input type="radio" name="userSex" id="woman"  value="女"> 女
								   </label>
									</div>
								</div>
								<div class="form-group">
									<label for="college" class="col-sm-offset-2 col-sm-2 control-label">学院:</label>
									<div class="col-sm-8">
										<select class="form-control" id="college" name="college" onChange="getGrade()" style="appearance: none;-moz-appearance: none;">
											<option value="" selected="selected">请选择学院</option>
											<option value="信息学院">信息学院</option>					
											<option value="文传学院">文传学院</option>					
											<option value="外语学院">外语学院</option>					
											<option value="体育学院">体育学院</option>					
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="grade" class="col-sm-offset-2 col-sm-2 control-label">班级:</label>
									<div class="col-sm-8">
										<select class="form-control" id="grade" name="grade" style="appearance: none;-moz-appearance: none;">
											<option value="" selected="selected">请选择班级</option>				
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="tel" class="col-sm-offset-2 col-sm-2 control-label">手机号码:</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="tel" name="tel" placeholder="请输入手机号码">
									</div>
								</div>
								<div class="form-group" style="padding-top:20px">
									<div class="col-sm-offset-4 col-sm-6">
										<button type="submit" class="btn btn-default" style="width: 100px;background-color: #FA710D;color: #fff;">立即注册</button>
									</div>
								</div>
							</form>

						</div>
					</div>
					<div class="col-md-3">
						<div class="form1right" style="height: 594px;">
							<h4 class="text-center">已有账号？<h4>
							<div class="text-center"><a href="/community/selectPower" class="btn btn-default" style="background-color:#E5E5E5 ;">立即登陆</a></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--中部结束-->
		<%@ include file="common/foot.jsp"%>
	</body>
</html>
