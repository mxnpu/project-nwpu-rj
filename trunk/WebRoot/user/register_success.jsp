<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<jsp:include page="header.jsp"></jsp:include>
<html>
  <head>
    <title>
    	注册成功</title>
  </head>
  
  <body> 
  		<div id="wrap">
    	注册成功.欢迎<s:property value="#session.currentUser.userName"/>
    	成为我们的会员，开始我们的Web旅行吧 <br>
    	<br>
    	<a href="index.jsp">主页</a>
    	</div>
  </body>
</html>
<jsp:include page="footer.jsp"></jsp:include>
