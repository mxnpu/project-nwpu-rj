<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>所有日志</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <jsp:include page="../header.jsp"></jsp:include>
  <body><br>
  	<div align="center">  

		<s:iterator value="blogs" var="blog">
			<div><s:property value="#blog.title" /></div>
			<div style="width:500px; height:100px; overflow:hidden"><s:property value="#blog.content" /></div>
		</s:iterator>
		<div>
			<s:iterator var="i" begin="1" end="%{totalPage}" step="1">
				<a href="<s:url action="showAllBlogs"><s:param name="pageNow" value="#i"></s:param></s:url>"><s:property value="#i"/></a>
			</s:iterator>
			
		</div>
  	</div>
  </body>
  <jsp:include page="../footer.jsp"></jsp:include>
</html>
