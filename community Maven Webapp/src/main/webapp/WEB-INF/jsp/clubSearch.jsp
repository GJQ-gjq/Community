<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<title>社团检索</title>
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
						<!-- session结果不为空 -->
				<c:if test="${user1.userName==null }">
						<%@ include file="common/header.jsp"%>
				</c:if>	
				<!-- session结果为空 -->
				<c:if test="${user1.userName!=null}">
						<%@ include file="common/header1.jsp"%>
				</c:if>	
				</div>
				<!--logo结束-->
					<%@ include file="common/nav.jsp"%>		
			</div>
		</div>
		<!--顶部结束-->
		<div class="middle">
			<div class="container">
				<div class="row clearfix">
					<div class="col-md-12" style="height: 560px;border: 1px solid #CCCCCC;margin-top:20px;">					
						<div class="typesearch">					
							<ul>
								<li>社团类别:</li>
								<li ><a id="0" class="active">全部</a></li>
								<li><a id="1" >艺术类</a></li>
								<li><a id="2" >实践类</a></li>
								<li><a id="3" >科技类</a></li>
								<li><a id="4" >体育类</a></li>
								<li><a id="5" >公益类</a></li>
								<li><a id="6" >语言文化类</a></li>								
							</ul>
						</div>
						<div class="searchbar">					
							<span>所属学院：</span><input type="text" name="college" id="college"  /><button id="cbtn" type="button">确认</button>
						</div>
						<div class="searchbar">
							<span>社团名称：</span><input type="text" name="name" id="name" /><button id="nbtn" type="button">确认</button>	
						</div>
						<div class="clublist">								
							<table class="table table-hover">							  
							  <thead>
							    <tr>
							      <th>社团名称</th>
							      <th class="text-center">类别</th>
								  <th class="text-center">社长</th>							      
							      <th class="text-center">所属学院</th>
							      <th class="text-center">详细</th>
							    </tr>
							  </thead>
							  <tbody id="result">
							 							  						    							   
							  </tbody>
							</table>
						</div>
						<div id="page" class="page_div"></div>
					</div>					
				</div>
			</div>
		</div>
		<!--中部结束-->
		<%@ include file="common/foot.jsp"%>
		<script type="text/javascript">
		var type="";
		var college="";
		var name="";
		getClub(1)
		$(".typesearch").find("a").click(
				function(){
				$(".typesearch").find("a").removeClass("active");
				$(this).addClass("active");
				type=$(this).text();
				if(type=="全部"){
					type="";
				}
				$("#college").val("");
				$("#name").val("");
				college="";
				name="";
				console.log(type);
				getClub(1)
				})
		$("#cbtn").click(function(){
			college=$("#college").val();
			console.log(college);
			type="";
			name="";
			$("#name").val("");
			getClub(1)
		})		
		$("#nbtn").click(function(){
			name=$("#name").val();
			console.log(name);
			type="";
			college="";
			$("#college").val("");
			getClub(1)
		})		
		function getClub(num) {		
			$.ajax({
				url:"/community/getClub",
				data:{ 
					pageNo:num,
					type:type,
					name:name,
					college:college
					},
				type:"post",
				dataType: "json",
				success: function (data){
				console.log(data.result);	
				var td="";
				for(var i=0;i<data.result.dataList.length;i++){
					td+="<tr>";
					td+="<td>"+data.result.dataList[i].name+"</td>";
					td+="<td class='text-center'>"+data.result.dataList[i].type+"</td>";
					td+="<td class='text-center'>"+data.result.dataList[i].builder+"</td>";
					td+="<td class='text-center'>"+data.result.dataList[i].college+"</td>";
					td+="<td class='text-center'><a href='/community/clubInfo?id="+data.result.dataList[i].id+"'>查看</a></td>";
					td+="<tr>";
					}
				    //console.log(td);
					$("#result").html(td);
					$("#page").paging({
						pageNo:num,
						totalPage: data.result.totalPage,
						totalSize: data.result.totalRecord,
						callback: function(num){
							getClub(num)
						}
						})
				} 	
			})
			}
			</script>
	</body>
</html>
