<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
   <title>无标题文档</title>
<link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>

</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li>首页</li>
    </ul>
    </div>
    
    <div class="mainindex">
    
    <br /><br />
    <div class="welinfo">
    	
    <span><img src="${pageContext.request.contextPath}/static/images/sun.png" alt="天气" /></span>
    <b>${admin.adminName }，欢迎使用信息管理系统</b>
    </div>
    
    <div class="welinfo">
    <span><img src="${pageContext.request.contextPath}/static/images/time.png" alt="时间" /></span>
    <i>您当前登录的时间：<fmt:formatDate value="<%=new Date() %>" pattern="yyyy-MM-dd hh:mm:ss"/></i>
    </div>
    
    <div class="xline"></div>
    <br /><br />
    <ul class="iconlist">
    
    <li><img src="${pageContext.request.contextPath}/static/images/ico02.png" /><p><a href="/community/admin/addNews">发布公告</a></p></li>
    <li><img src="${pageContext.request.contextPath}/static/images/ico04.png" /><p><a href="/community/admin/fileUpload">资料上传</a></p></li>
    <li><img src="${pageContext.request.contextPath}/static/images/ico06.png" /><p><a href="/community/admin/cApplyList">社团申请审核</a></p></li>
    <li><img src="${pageContext.request.contextPath}/static/images/ico07.png" /><p><a href="/community/admin/userList">人员管理</a></p></li> 
            
    </ul>
    
    <br /><br />
    <div class="xline"></div>
    <div class="box"></div>
    
    <div class="welinfo">
    <span><img src="${pageContext.request.contextPath}/static/images/dp.png" alt="提醒" /></span>
    <b>信息管理系统使用指南</b>
    </div>
    
    <ul class="infolist">
    <li><span>您可以快速进行公告发布和管理操作</span><a class="ibtn">公告发布或管理</a></li>
    <li><span>您可以快速进行文件上传操作</span><a class="ibtn">文件上传</a></li>
    <li><span>您可以进行密码修改、账户设置等操作</span><a class="ibtn">账户管理</a></li>
    </ul>
    
    <div class="xline"></div>
    
    <div class="info"><b>查看网站使用指南，您可以了解相关信息</b></div>
    
    <ul class="umlist">
    <li>如何发布文章</li>
    <li>如何访问网站</li>
    <li>如何管理用户</li>
    <li>系统设置</li>
    </ul>
    
    
    </div>
</body>
</html>