<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<link href="${pageContext.request.contextPath}/static/css/page.css" rel="stylesheet" />
<script
	src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/paging.js"></script>
	
	<style type="text/css">
	.page_div .current {
				background-color:rgb(23,180,255);
				border-color: rgb(23,180,255);
				color: #FFFFFF;
			}
	</style>
</head>


<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li>用户管理</li>
			<li>管理员列表</li>
		</ul>
	</div>

	<div class="rightinfo">

		<div class="tools">
		<form action="/community/admin/searchAdmin" method="post">
			<ul class="seachform">			
				<li><label>用户名：</label> <input name="adminName" type="text" class="scinput" />
				</li>
				<li><label>&nbsp;</label><input  type="submit"
					class="scbtn" value="查询" /></li>
			</ul>
			</form>
		</div>

		<input type="hidden" id="msg" value="${msg }"> 
		<table class="tablelist">
			<thead>
				<tr>
					<th><input name="" type="checkbox" value="" checked="checked" />
					</th>
					<th>用户名</th>
					<th>性别</th>
					<th>学院</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${admins }" var="admins">
				<tr>
					<td><input  type="checkbox" value="${admins.adminId }" />
					</td>
					<td>${admins.adminName }</td>
					<td>${admins.sex }</td>
					<td>${admins.college }</td>
					<td style="text-align: center;">
					<a href="/community/admin/deleteAdmin?adminId=${admins.adminId }" class="tablelink"> 删除</a>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>

		<br />
			<form  method="post" id="newsForm"></form>
		<div id="page" class="page_div" style="float:right;"></div>
	</div>
	<script type="text/javascript">
	$("#page").paging({
		pageNo:1,
		totalPage: 1,
		totalSize: ${size},
		callback: getNews
		})
		
		function getNews(num) {	
			//$("#newsForm").attr("action", "/community/admin/newsList?pageNo="+num+"&writer=${writer}");
			//$("#newsForm").submit();
			 return false;				 
			}
$(function() {
	var msg=document.getElementById("msg").value;
		if(msg!=null&&msg!=""){
			alert(msg);
			document.getElementById("msg").value ="";
		}
	})
</script>
</body>
</html>