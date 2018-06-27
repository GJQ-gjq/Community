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
  </head>
  <script type="text/javascript">
  		function checkForm(form) {
  			if(form.typeName.value == "") {
  			alert("类别名称不能为空!");
  			form.typeName.focus();
  			return false;
  			}
  			return true;
  			}
  		</script>
  <body>
    <div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li>社团管理</li>
    <li>添加类别</li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>填写类别信息</span></div>
    <form id="form" action="/community/admin/doAddCtype"  method="post" onsubmit="return checkForm(this);">
    <ul class="forminfo" style="padding-top: 20px;padding-left: 50px;">
    <li><span style="color:red;padding-left:100px">${msg}</span></li>
    <li><label>编号：</label><label style="text-algin:center">${typeId}</label></li>
    <li><label>类别名称：</label><input name="typeName" type="text" class="dfinput" /></li>
    <li><label>&nbsp;</label><input  type="submit" class="btn" value="确认添加"/></li>
    </ul>
    </form>
    
    </div>
  </body>
</html>
