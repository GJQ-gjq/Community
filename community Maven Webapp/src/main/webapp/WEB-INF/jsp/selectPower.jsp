<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
		<title>选择用户类型</title>
		<link href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/static/css/main.css" rel="stylesheet" />	  		
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
				<div class="row clearfix">
					<div class="choose">
					<div class="col-md-3">	
						<div style="width:300px;padding-top:60px ;"><img src="${pageContext.request.contextPath}/static/images/login_bg.jpg"></div>					
					</div>
					<div class="col-md-9">
						<div class="right">
							<h3 ><strong>请选择你的用户类型</strong><h3>
							<div class="power">
								<ul>
									<li><a href="/community/login" class="btn" >学生</a></li>
									<li><a href="/community/backLogin" class="btn" >社长</a></li>
									<li><a href="/community/backLogin" class="btn" >管理员</a></li>
								</ul>						
							</div>
														
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
