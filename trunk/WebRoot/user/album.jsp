<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title><s:text name="album.title"/></title>
    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <jsp:include page="header.jsp"></jsp:include>
  <body>
    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="1000" height="800">
	<param name="movie" value="<%=basePath%>/resources/Album.swf">
	<param name="quality" value="high">
	<embed src="<%=basePath%>/resources/Album.swf?id=<s:property value="#session.currentUser.idUser"/>&state=host" quality="high" type="application/x-shockwave-flash" width="1000" height="800"></embed>
	</object> 
    
  </body>
</html>
