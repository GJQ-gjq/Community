<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8" />
<title>首页</title>
<link href="${pageContext.request.contextPath}/static/css/main.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
</head>

<body style="margin: 0 auto;">
	<div class="top">
		<div class="container">
			<div class="row clearfix">
				<%@ include file="common/header.jsp"%>
			</div>
			<!--logo结束-->
			<%@ include file="common/nav.jsp"%>
			<!--导航结束-->
			<%@ include file="common/carousel.jsp"%>
			<!--轮播图结束-->
		</div>
	</div>
	<!--顶部结束-->
	<div class="middle">
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-4">
					<div class="sitebar1">
						<div class="title1">
							<strong>微视频</strong><span><a src="#">more>></a>
							</span>
						</div>
						<div class="vidio1">
							<embed
								src='http://player.youku.com/player.php/sid/${vedios[0].vUrl }==/v.swf'
								allowFullScreen='true' quality='high' width='313' height='168'
								align='middle' allowScriptAccess='always'
								type='application/x-shockwave-flash'></embed>
						</div>
						<div class="vidio2" style="margin-top: 16px;">
							<embed
								src='http://player.youku.com/player.php/sid/${vedios[1].vUrl }==/v.swf'
								allowFullScreen='true' quality='high' width='313' height='168'
								align='middle' allowScriptAccess='always'
								type='application/x-shockwave-flash'></embed>
						</div>
					</div>
					<div class="sitebar2">
						<div class="title1">
							<strong>友情链接</strong><span><a src="#">more>></a>
							</span>
						</div>
						<ul>
							<li><a href="http://www.jju.edu.cn/">九江学院</a>
							</li>
							<li><a href="http://youth.jju.edu.cn/">九江学院团委网站</a>
							</li>
							<li><a href="http://xsc.jju.edu.cn/">学工部</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-md-8">
					<div class="newsList">
						<ul class="nav nav-tabs">
							<li class="active"><a data-toggle="tab" href="#notice">公告</a>
							</li>
							<li><a data-toggle="tab" href="#news">新闻</a>
							</li>
						</ul>
						<div class="tab-content">
							<div id="notice" class="tab-pane fade in active">
								<div class="newsInfo">
									<h4>
										<a href="/community/newsInfo?newsId=${newslist[0].newsId}">${newslist[0].title}</a>
									</h4>
									<p>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${newslist[0].content}....</p>
								</div>
								<ul>
									<c:forEach var="idx" begin="1" end="7">
										<li><a
											href="/community/newsInfo?newsId=${newslist[idx].newsId}">${newslist[idx].title}</a><span><fmt:formatDate
													value="${newslist[idx].creatTime}" pattern="yyyy-MM-dd" />
										</span>
										</li>
									</c:forEach>
								</ul>
							</div>
							<div id="news" class="tab-pane fade">
								<div class="newsInfo">
									<h4>
										<a href="/community/newsInfo?newsId=${newslist[8].newsId}">${newslist[8].title}</a>
									</h4>
									<p>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${newslist[8].content}...</p>
								</div>
								<ul>
									<c:forEach var="idx" begin="9" end="15">
										<li><a
											href="/community/newsInfo?newsId=${newslist[idx].newsId}">${newslist[idx].title}</a><span><fmt:formatDate
													value="${newslist[idx].creatTime}" pattern="yyyy-MM-dd" />
										</span>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--中部结束-->
	<%@include file="common/foot.jsp"%>
</body>
</html>
