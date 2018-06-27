<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<title>新闻详细</title>
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
					<div class="col-md-12">					
						<div class="newsData">
							<h4 >${news.title}</h4>
							<span>发布时间:<fmt:formatDate value="${news.creatTime}" pattern="yyyy-MM-dd hh:mm:ss"/>&nbsp;&nbsp;作者:${news.writer }</span>
							<hr />
							<p>
							${news.content }
							</p>
							<span><a href="/community/news?type=notice" class="btn">返回</a></span>
						</div>
					</div>					
				</div>
			</div>
		</div>
		<!--中部结束-->
		<%@ include file="common/foot.jsp"%>
	</body>
</html>
