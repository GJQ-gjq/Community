<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <li>社团管理</li>
    <li>类别列表</li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    	<ul class="seachform">
    		<form action="/community/admin/searchType" method="post">			
				<li><label>类别：</label> <input name="type" value="${type }"  type="text" class="scinput" />
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
        <th><input name="" type="checkbox" value="" checked="checked"/></th>
        <th>编号</th>
        <th>类别名称</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${result.dataList }" var="type">
        <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>${type.typeId }</td>
        <td>${type.typeName }</td>
        <td style="text-align: center;"><a href="/community/admin/deleteType?typeId=${type.typeId }" class="tablelink"> 删除</a></td>
        </tr>
        </tbody>
        </c:forEach> 
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
			$("#newsForm").attr("action", "/community/admin/cTypeList?pageNo="+num+"&type=${type}");
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
