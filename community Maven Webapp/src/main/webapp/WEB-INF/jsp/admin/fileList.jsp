<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    <link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet" type="text/css" />
	<script  src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
  	<link href="${pageContext.request.contextPath}/static/css/page.css" rel="stylesheet" />
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
    <li><a href="#">用户管理</a></li>
    <li><a href="#">管理员列表</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
   
    
    <input type="hidden" id="msg" value="${msg }">
    <table class="tablelist">
    	<thead>
    	<tr>
        <th><input name="" type="checkbox" value="" checked="checked"/></th>
        <th>文件名</th>
        <th>上传时间</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${result.dataList }" var="file">
        <tr>
        <td><input name="" type="checkbox" value="${file.fileId }" /></td>
        <td><c:set var="fileName" value="${file.fileName}"/>${fn:substringBefore(fileName, '.doc')}</td>
        <td><fmt:formatDate value="${file.uploadTime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
        <td style="text-align: center;"><a href="/community/admin/deleteFile?fileId=${file.fileId }" class="tablelink"> 删除</a></td>
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
		pageNo:${result.currentPage},
		totalPage: ${result.totalPage},
		totalSize: ${result.totalRecord},
		callback: getNews
		})
		
		function getNews(num) {	
			$("#newsForm").attr("action", "/community/admin/fileList?pageNo="+num);
			$("#newsForm").submit();
			 return false;				 
			};
		$(function() {
			var msg=document.getElementById("msg").value;
				if(msg!=null&&msg!=""){
					alert(msg);
					document.getElementById("msg").value ="";
				}
			});
	</script>
  </body>
</html>
