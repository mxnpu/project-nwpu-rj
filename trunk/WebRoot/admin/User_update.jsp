<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'admin_update.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <div class="globalheader">
  <div class = "globalselect">
	<ul>
		<li><a href="admin/homePlacard">Home</a></li>
    	<li><a href="admin/Placard_list">Public Information</a></li>
        <li><a href="admin/Admin_list">All Admins</a></li>
        <li><a href="admin/User_list">All Users</a></li>
        <li><a href="admin/Admin_addInput.jsp">Add Admin</a></li>
        <li><a href="admin/logout.action">Logout</a></li>
    </ul>
  </div>
</div>
    This is User_update page. <br>
     Success to update^_^
    <a href="admin/Admin_index.jsp"> return to admin index</a>
    <s:debug></s:debug>
  </body>
</html>
