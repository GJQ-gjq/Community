<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link href="${pageContext.request.contextPath}/static/css/page.css"
	rel="stylesheet" />
<script
	src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/js/paging.js"></script>
<style type="text/css">
.page_div .current {
	background-color: rgb(23, 180, 255);
	border-color: rgb(23, 180, 255);
	color: #FFFFFF;
}
</style>
</head>


<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li>成员管理</li>
			<li>成员列表</li>
		</ul>
	</div>

	<div class="rightinfo">

		<div class="tools">
			<form action="/community/clubManager/searchName" method="post">
				<ul class="seachform">
					<li><label>姓名：</label> <input name="userName" value= "${userName}" type="text"
						class="scinput" />
					</li>
					<li><label>&nbsp;</label><input type="submit" class="scbtn"
						value="查询" /></li>
				</ul>
			</form>
		</div>

		<input type="hidden" id="msg" value="${msg }">
		<table class="tablelist">
			<c:if test="${fn:length(result.dataList) eq 0 }">
			<tr>
			<td colspan="8" style="text-align:center;height:;color:green">亲,您的社团还没有成员哦！快去发布招新公告招人吧！</td>		
			</tr>
			</c:if>	
			<thead>
				<tr>
					<th><input name="" type="checkbox" value="" checked="checked" />
					</th>
					<th>学号</th>
					<th>姓名</th>
					<th>性别</th>
					<th>学院</th>
					<th>班级</th>
					<th>入社时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${result.dataList}" var="userInClub">
					<tr>
						<td><input name="" type="checkbox" value="${userInClub.id }" /></td>
						<td>${userInClub.userId }</td>
						<td>${userInClub.user.userName }</td>
						<td>${userInClub.user.userSex }</td>
						<td>${userInClub.user.college }</td>
						<td>${userInClub.user.grade }</td>			
						</td>
						<td><fmt:formatDate value="${userInClub.inTime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
						<td style="text-align: center;"><a
							href="/community/clubManager/deleteMember?id=${userInClub.id}"
							class="tablelink" class="click">踢出社团</a></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
		<br />
		<form method="post" id="newsForm"></form>
		<c:if test="${result.totalRecord!=0 }">
		<div id="page" class="page_div" style="float:right;"></div>
		</c:if>
	</div>

	<script type="text/javascript">
$("#page").paging({
	pageNo:${result.currentPage},
	totalPage: ${result.totalPage},
	totalSize: ${result.totalRecord},
	callback: getNews
	})
	
	function getNews(num) {	
		$("#newsForm").attr("action", "/community/clubManager/userList?pageNo="+num+"&userName=${userName}");
		$("#newsForm").submit();
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