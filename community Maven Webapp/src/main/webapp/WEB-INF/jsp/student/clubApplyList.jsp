<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		<title>社团申请状态</title>
		<link href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/static/css/main.css" rel="stylesheet" />	 		
  		<script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
		<script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
  		<script type="text/javascript">
			$(function() {
				//导航切换
				$(".menuson a").click(function() {
					$(this).parent('li').siblings().removeClass("active");
					$(this).parent('li').addClass("active");
				});
			})
		</script>
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
						<div class="leftmenu" style="height: 740px;">
							<h3>申请社团</h3>
							<ul class="menuson">
								<li >
									<a href="/community/student/clubApply">社团申请</a>
								</li>
								<li class="active">
									<a href="/community/student/clubApplyList">申请状态</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="col-md-9">
						<div style="padding-top:20px ;"><img src="${pageContext.request.contextPath}/static/images/4.jpg" style="width:742px;height:179px;"></div>
						<div class="apply">
							<ul id="myTab" class="nav nav-tabs">
								<li class="active"><a href="#applyClubState" data-toggle="tab">加入申请状态</a></li>
								<li><a href="#buildClubState" data-toggle="tab">成立申请状态</a></li>
							</ul>
							<div id="myTabContent" class="tab-content">
								<div class="tab-pane fade in active" id="applyClubState">
								<!-- 后台返回结果为空 -->
								<c:if test="${fn:length(applies) eq 0 }">
									<span style="text-align:center;">无申请记录</span>
								</c:if>	
								<!-- 后台返回结果不为空 -->
								<c:if test="${fn:length(applies) gt 0 }">			
									<table class="table table-bordered">							  
								  <thead>
								    <tr>
								      <th>社团名称</th>
								      <th class="text-center">类别</th>
									  <th class="text-center">所属学院</th>							      
								      <th class="text-center">申请加入时间</th>
								      <th class="text-center">审核状态</th>
								    </tr>
								  </thead>
								  <tbody>
								  <c:forEach items="${applies}" var="apply">
								    <tr>
								      <td>${apply.community.name}</td>
								      <td class="text-center">${apply.community.type }</td>
								      <td class="text-center">${apply.community.college }</td>
								      <td class="text-center"><fmt:formatDate value="${apply.applyTime}" pattern="yyyy-MM-dd"/></td>
								      <td class="text-center">
								      <c:if test="${apply.check==-1 }"><span style="color:blue">待审核</span></c:if>
								      <c:if test="${apply.check==0 }"><span style="color:red">未通过</span></c:if>
									  <c:if test="${apply.check==1 }"><span style="color:green">通过</span></c:if>
								      </td>
								    </tr>
								    </c:forEach>											    
								  </tbody>
								</table>
								</c:if>
								</div>							
								<div class="tab-pane fade" id="buildClubState">
								<c:if test="${fn:length(buildApplies) eq 0 }">
									<span class="text-center">无申请记录</span>
								</c:if>	
								<c:if test="${fn:length(buildApplies) gt 0 }">				
									<table class="table table-bordered">							  
								  <thead >
								    <tr>
								      <th>社团名称</th>
								      <th class="text-center">类别</th>
									  <th class="text-center">所属学院</th>							      
								      <th class="text-center">申请成立时间</th>
								      <th class="text-center">审核状态</th>
								    </tr>
								  </thead>
								  <tbody>
								  <c:forEach items="${buildApplies}" var="buildApply">
								    <tr>
								      <td>${buildApply.name }</td>
								      <td class="text-center">${buildApply.type }</td>
								      <td class="text-center">${buildApply.college }</td>
								      <td class="text-center"><fmt:formatDate value="${buildApply.applyTime}" pattern="yyyy-MM-dd"/></td>
								      <td class="text-center">
								      <c:if test="${buildApply.check==-1 }"><span style="color:blue">待审核</span></c:if>
								      <c:if test="${buildApply.check==0 }"><span style="color:red">未通过</span></c:if>
									  <c:if test="${buildApply.check==1 }"><span style="color:green">通过</span></c:if>
								      </td>
								    </tr>
								    </c:forEach>								   				    
								  </tbody>
								</table>
								</c:if>
								</div>
							</div>
						</div>
						</div>
				</div>
			</div>
		</div>
		<!--中部结束-->
		<%@ include file="../common/foot.jsp"%>
	</body>
</html>
