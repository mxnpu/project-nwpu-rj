<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>Register Page</title>

	</head>

	<body>
		<h1>
			Welcome to become one of us.
		</h1>
		<hr />
		<br>
		The register information.
		<br />
		<s:form action="register.action" method="post" >
			<s:textfield name="username" label="UserName" maxlength="16"
				required="ture"></s:textfield>
			<s:password name="password" label="Password" maxlength="16"
				required="true"></s:password>
			<s:password name="confirmPassword" label="ConfirmPassword"
				maxlength="16" required="true"></s:password>
			<s:textfield name="realname" label="RealName" maxlength="16"
				required="true"></s:textfield>
			<s:radio name="gender" list="#{1:'Male',0:'Female'}" label="Gender"></s:radio>
			<s:textfield name="birthday" label="Birthday(yyyy-mm-dd)"></s:textfield> 
			<s:textfield name="email" label="Email"></s:textfield>
			<s:textfield name="phone" label="Phone"></s:textfield>
			<s:textarea name="hoby" label="Hoby" ></s:textarea>
			<s:reset></s:reset>
			<s:submit></s:submit>
		</s:form>
	</body>
</html>
