<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<jsp:include page="header.jsp"></jsp:include>
<html>
  <head>
    <title>
    	<s:text name="regiter_success.reg_suc"/></title>
  </head>
  
  <body> 
  		<div id="mainPanel">
    	<s:text name="regiter_success.reg_suc_wel"/><s:property value="#session.currentUser.userName"/>
    	<s:text name="regiter_success.reg_suc_wel_words"/> <br>
    	<br>
    	<a href="first.action"><s:text name="regiter_success.homepage"/></a>
    	</div>
  </body>
</html>
<jsp:include page="footer.jsp"></jsp:include>
