<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'add_admin.jsp' starting page</title>
    
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
    <br>
	The register information.
	<br />
	<s:form action="admin/add.action" method="post" >
			<s:textfield name="adminDTO.username" label="UserName" maxlength="16"
				required="ture"></s:textfield>
			<s:password name="adminDTO.password" label="Password" maxlength="16"
				required="true"></s:password>
			<s:password name="adminDTO.confirmPassword" label="ConfirmPassword"
				maxlength="16" required="true"></s:password>
			<s:textfield name="adminDTO.real_name" label="RealName" maxlength="16"
				required="true"></s:textfield>
			<s:textfield name="adminDTO.email" label="Email"></s:textfield>
			<s:textfield name="adminDTO.phone" label="Phone"></s:textfield>
			<s:textarea name="adminDTO.address" label="address" ></s:textarea>
			<s:reset></s:reset>
			<s:submit></s:submit>
		</s:form>
  </body>
</html>
