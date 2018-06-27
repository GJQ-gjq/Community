<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>左侧导航</title>
<link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
})	
</script>


</head>

<body style="background:#f0f9fd;">
	<div class="lefttop"><span></span>菜单</div>
    
    <dl class="leftmenu">
        
   <dd>
    <div class="title">
    <span><img src="${pageContext.request.contextPath}/static/images/leftico02.png" /></span>成员管理
    </div>
    <ul class="menuson">
        <li><cite></cite><a href="/community/clubManager/userList" target="rightFrame">成员列表</a><i></i></li>
        </ul>     
    </dd> 
    
    
    <dd><div class="title"><span><img src="${pageContext.request.contextPath}/static/images/leftico03.png" /></span>公告管理</div>
    <ul class="menuson">
        <li><cite></cite><a href="/community/clubManager/newsList" target="rightFrame">公告列表</a><i></i></li>
        <li><cite></cite><a href="/community/clubManager/addNews" target="rightFrame">发布公告</a><i></i></li>
    </ul>    
    </dd>  
    
    
    <dd><div class="title"><span><img src="${pageContext.request.contextPath}/static/images/leftico04.png" /></span>社团管理</div>
    <ul class="menuson">
        <li><cite></cite><a href="/community/clubManager/clubInfo" target="rightFrame">社团资料</a><i></i></li>
        <li><cite></cite><a href="/community/clubManager/applyList" target="rightFrame">申请审核</a><i></i></li>
    </ul>
    
    </dd> 
    <dd>  
    <div class="title">
    <span><img src="${pageContext.request.contextPath}/static/images/leftico01.png" /></span>个人信息管理
    </div>
    	<ul class="menuson">
        <li><cite></cite><a href="/community/clubManager/updateManagerPsw" target="rightFrame">修改密码</a><i></i></li>
        </ul>    
    </dd> 
    </dl>
</body>
</html>
