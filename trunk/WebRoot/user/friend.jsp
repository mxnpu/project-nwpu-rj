<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>我的好友</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <jsp:include page="header.jsp"></jsp:include>
  <body>
   <div id="search">
   		<input type="text"/><button>搜索</button>
   </div>
   <div id="main">
   		<s:iterator value="friends" var="user">
   			<label><s:property value="#user.userName" /></label><br>
   		</s:iterator>
   		
   		<div>	
			<s:iterator var="i" begin="1" end="%{totalPage}" step="1">
				<a href="<s:url action="showFriends"><s:param name="pageNow" value="#i"></s:param></s:url>"><s:property value="#i"/></a>
			</s:iterator>
			
		</div>
   </div>
  </body>
   <jsp:include page="footer.jsp"></jsp:include>
</html>
