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
		<title>新闻列表</title>
		<link href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/static/css/main.css" rel="stylesheet" />	 		
		<link href="${pageContext.request.contextPath}/static/css/page.css" rel="stylesheet" />
		<script  src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
		<script src="${pageContext.request.contextPath}/static/js/paging.js"></script>	 		
	
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
					<div class="col-md-3" >
						<div class="leftmenu" >
						<h3>社团快讯</h3>
						<ul class="menuson">
							<li id="notice"><a href="/community/news?type=notice">公告</a></li>
							<li id="news"><a href="/community/news?type=news">新闻</a></li>
						</ul>
						</div>
					</div>
					<div class="col-md-9">
						<div style="padding-top:20px ;"><img src="${pageContext.request.contextPath}/static/images/4.jpg" style="width:742px;height:179px;"></div>
						<div class="newsList">
								<h4 style="padding-top: 8px;color: #5D5D5D;" >
								<c:if test="${type eq 'news'}">新闻</c:if>
								<c:if test="${type eq 'notice'}">公告</c:if>
								</h4>
								<hr />								
							  <div class="tab-content">
							    <div id="notice" class="tab-pane fade in active">
							      	<ul id="result">
							      	
							      	</ul>
							    </div>
							    <form  method="post" id="newsForm">
							    	<input type="hidden" id="type" value="${type}">
							    </form>
							    <div id="page" class="page_div" ></div>
							  </div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--中部结束-->
		<%@ include file="common/foot.jsp"%>
		<script type="text/javascript">
			var type=document.getElementById("type").value;		
			getData(1);
			function getData(num) {	
			  $.ajax({
					url:"/community/getNews",
					data:{ pageNo:num,type:type},
					type:"post",
					dataType: "json",
					success: function (data){
					console.log(data.result);	
					var li="";
					for(var i=0;i<data.result.dataList.length;i++){
						li+="<li><a href='/community/newsInfo?newsId="+data.result.dataList[i].newsId+"'>"
						+data.result.dataList[i].title+"</a>"+		
						"<span>"+DateFomat(data.result.dataList[i].creatTime)+"</span></li>"
						}
					    console.log(li);
						$("#result").html(li);
						$("#page").paging({
							pageNo:num,
							totalPage: data.result.totalPage,
							totalSize: data.result.totalRecord,
							callback: function(num){
								getData(num)
							}
						})
					
					},
					error: function (){
						alert("加载出错！");
					} 	
					});							 
				}
		function DateFomat(str){
			if(str == null || str == "" || typeof(str)=="undefined"){  
                return "";  
             }  
             var now = new Date(str);  
             var year = now.getFullYear();  
             var month =(now.getMonth() + 1).toString();  
             var day = (now.getDate()).toString();  
             if (month.length == 1) {  
                  month = "0" + month;  
             }  
             if (day.length == 1) {  
                  day = "0" + day;  
             }  
              var dateTime = year +"-"+ month +"-"+  day;  
            return dateTime;  
		}	
			$(function() {
				//导航切换
				if(type=="notice"){
					$("#notice").addClass("active");
				}else{
					$("#news").addClass("active");
				}
			})
			</script>
	</body>
</html>
