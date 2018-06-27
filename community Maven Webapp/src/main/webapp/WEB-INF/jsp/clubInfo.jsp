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
		<title>社团详细</title>
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
					<div class="col-md-12" style="height: 600px;border: 1px solid #CCCCCC;margin-top:20px;">					
						<div class="cInfo">
							<h3>社团详情</h3>
							<hr />
						<table class="table table-bordered">							
							<tr >
								<td  width="120px">社团名称：</td>
								<td>${community.name}</td>
							</tr >
							<tr>
								<td width="120px">社团类别：</td>
								<td>${community.type}</td>
							</tr>
							<tr>
								<td width="120px">社长名称：</td>
								<td>${community.builder}</td>
							</tr>							
							<tr>
								<td width="120px">所属学院：</td>
								<td>${community.college}</td>
							</tr>
							<tr>
								<td width="120px">人数：</td>
								<td>${community.num}</td>
							</tr>
							<tr>
								<td style="width: 120px;line-height: 200px;">社团简介：</td>
								<td style="height: 200px;text-align: left;">${community.introduce}</td>
							</tr>
							
						</table>
						<span><a href="/community/clubSearch" class="btn">返回</a></span>
						</div>
					</div>					
				</div>
			</div>
		</div>
		<!--中部结束-->
		<%@ include file="common/foot.jsp"%>
	</body>
</html>
