<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <base href="<%=basePath%>">
   
    <title>Welcome</title>
  </head>
  
  <body>
  	<h1>Welcome the administrator.</h1><br>
    The administrator's login pages.
    <br/>
    <form action="admin/login.action" method="post">
			<table>
				<tr>
					<th>Login Form</th>
				</tr>
				<tr>
					<td>UserName:</td>
					<td><input type="text" name="admin.username" /></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type="password" name="admin.password"></td>
				</tr>
				<tr>
					<td><input type="reset" value="Reset"> </td>
					<td><input type="submit" value="Login"> </td>
				</tr>

			</table>
		</form>
    
  </body>
</html>
