<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN">
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>用户登录</title>
<link
	href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/main.css"
	rel="stylesheet" />
<script
	src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
<script
	src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script
	src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script type="text/javascript">
	$().ready(function() {
		// 在键盘按下并释放及提交后验证提交表单
		$("#form").validate({
			submitHandler : function(form) {
				form.submit();
			},
			rules : {
				userId : {
					required : true,
					rangelength : [ 11, 11 ],
					number : true,
					digits : true
				},
				password : {
					required : true,
					rangelength : [ 6, 12 ]
				},
			},
			messages : {
				userId : {
					required : "请输入用户名",
					rangelength : "请输入11位学号"
				},
				password : {
					required : "请输入密码",
					rangelength : "请输入6-12位密码"
				},
			},
		});
	});
</script>
<style type="text/css">
.error {
	color: red;
	padding-left: 5px;
}

.form-control {
	display: inline-block;
	width: 183px;
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
			<div class="row clearfix" style="border:1px solid;margin-top:30px">
				<div class="col-md-9">
					<div class="form1">
						<h1 align="center">用户登陆</h1>
						<hr class="line1" />
						<form class="form-horizontal" role="form" id="form" name="form"
							action="/community/doLogin" method="post">
							<div class="form-group">
								<div class="col-sm-offset-5 col-sm-3">
									<label style="color:red">${msg}</label>
								</div>
							</div>
							<div class="form-group">
								<label for="userId"
									class="col-sm-offset-2 col-sm-2 control-label">用户名:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="userId"
										name="userId" placeholder="请输入用户名">
								</div>
							</div>
							<div class="form-group">
								<label for="password"
									class="col-sm-offset-2 col-sm-2 control-label">密码:</label>
								<div class="col-sm-8">
									<input type="password" class="form-control" id="password"
										name="password" placeholder="请输入密码">
								</div>
							</div>
							<div class="form-group" style="padding-top:30px">
								<div class="col-sm-offset-5 col-sm-3">
									<button type="submit" class="btn btn-default"
										style="width: 100px;background-color: #FA710D;color: #fff;">登录</button>
								</div>
							</div>
						</form>

					</div>
				</div>
				<div class="col-md-3">
					<div class="form1right">
						<h4 class="text-center">
							还没有账号？
							<h4>
								<div class="text-center">
									<a href="/community/register" class="btn btn-default"
										style="background-color:#E5E5E5 ;">立即注册</a>
								</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--中部结束-->
	<%@ include file="common/foot.jsp"%>
</body>
</html>
