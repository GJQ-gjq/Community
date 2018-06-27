<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<title>顶部</title>
<link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
</head>

<body style="background:url(${pageContext.request.contextPath}/static/images/topbg.gif) repeat-x;">
    <div class="topleft">
    <a href="/community/admin/main" target="_parent"><img src="${pageContext.request.contextPath}/static/images/logo.png" title="系统首页" /></a>
    </div>
           
            
    <div class="topright">    
    <ul>
    <li><span><img src="${pageContext.request.contextPath}/static/images/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    <li><a href="/community/admin/loginOut" target="_parent">退出</a></li>
    </ul>
     
    <div class="user">
    <span style="width:55px">${admin.adminName}</span>
    </div>    
    
    </div>
</body>
</html>
