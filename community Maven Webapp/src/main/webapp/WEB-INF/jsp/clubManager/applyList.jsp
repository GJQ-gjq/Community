<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <li>加入社团申请列表</li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    <form action="/community/clubManager/searchApply" method="post">	
    	<ul class="seachform">			
				<li><label>姓名：</label> <input name="userName" value="${userName }" type="text" class="scinput" />
				</li>
				<li><label>&nbsp;</label><input  type="submit"
					class="scbtn" value="查询" /></li>
			</ul>
		</form>
    </div>
    
    <input type="hidden" id="msg" value="${msg }">
    <table class="tablelist">
    	<c:if test="${fn:length(result.dataList) eq 0 }">
			<tr>
			<td colspan="7" style="text-align:center;height:;color:green">亲,您的社团还没有人申请哦！快去发布招新公告招人吧！</td>		
			</tr>
			</c:if>	
    	<thead>
    	<tr>
        <th><input name="" type="checkbox" value="" checked="checked"/></th>
        <th>申请人</th>
        <th>学院</th>
        <th>班级</th>
        <th>申请时间</th>
        <th>审批状态</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${result.dataList }" var="apply">
        <tr>
        <td><input name="" type="checkbox" value="${apply.applyId }" /></td>
        <td>${apply.user.userName }</td>
        <td>${apply.user.college }</td>
        <td>${apply.user.grade }</td>     
        <td><fmt:formatDate value="${apply.applyTime }" pattern="yyyy-MM-dd hh:mm:ss"/></td>
        <td>
         <c:if test="${apply.check==-1}">待审核</c:if>
        </td>
        <td style="text-align: center;"><button style="color:#056dae;cursor:pointer;background-color:#fff;"  value="${apply.applyId }" class="click">查看</button>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/community/clubManager/updateCheck?check=1&applyId=${apply.applyId }" class="tablelink">通过</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/community/clubManager/updateCheck?check=0&applyId=${apply.applyId }" class="tablelink">不通过</a></td>
        </tr>
         </c:forEach>
        </tbody>
    </table>
     <form  method="post" id="newsForm"></form>
	<c:if test="${result.totalRecord!=0 }">
		<div id="page" class="page_div" style="float:right;"></div>
		</c:if>
   	<br />
    
    
    <div class="tip" style="width: 485px;height: 300px;">
    	<div class="tiptop"><span>申请原因</span><a></a></div>
        
      <div class="tipinfo" style="padding-top: 30px;margin:0 auto;">
        <div class="tipright">
        <cite id="reason"></cite>
        </div>
        </div>

    </div>
    </div>
     <script type="text/javascript">
    $("#page").paging({
		pageNo:${result.currentPage},
		totalPage: ${result.totalPage},
		totalSize: ${result.totalRecord},
		callback: getNews
		})
		
		function getNews(num) {	
			$("#newsForm").attr("action", "/community/clubManager/applyList?pageNo="+num+"&userName=${userName}");
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
		$(document).ready(function(){
		  $(".click").click(function(){
			  $.ajax({
				url:"/community/clubManager/getReason",
				data:{ applyId:this.value},
				type:"post",
				dataType: "json",
				success: function (data){
				//console.log(data.reason);
					$("#reason").text(data.reason);
					$(".tip").fadeIn(200);
					},
				error: function (){
					alert("加载出错！");
				} 	
				});
		  
		  });
		  
		  $(".tiptop a").click(function(){
		  $(".tip").fadeOut(200);
		});	
		});
	</script>
  </body>
</html>
