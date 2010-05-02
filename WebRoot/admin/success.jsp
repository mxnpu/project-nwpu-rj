<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Login Success Page</title>
  </head>
  
  <body> 
    The Successful Page. <hr>
    Welcome you, <s:property value="#session.currentUser.userName"/> <br>
  </body>
</html>
