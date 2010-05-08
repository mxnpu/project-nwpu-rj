<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>Welcome</title>
		<script type="text/javascript" src="../js/formUtils.js"></script>  
	</head>

	<body>
		<h1>Welcome to our web site.</h1>
		<hr />
		<br>The user's login page<br />
		<form action="login" method="post">
			<table>
			<thead>
				<tr>	
					<td></td>
					<td>欢迎登录</td>
				</tr>						
			</thead>
			<tbody>
				
				<tr>
					<td>用户名:</td>
					<td><input type="text" name="username" /></td>
					<td></td>
				</tr>
				<tr>
					<td>密    码:</td>
					<td><input type="password" name="password"></td>
					<td></td>
				</tr>
				<tr>
					<td>验证码:</td>
					<td><input type="text" name="validateCode"></td>
					<td>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<img src="random.action" 
						     onclick="changeValidateCode(this)" 
						     title="点击图片刷新验证码"/>
					</td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td>
						还没有注册?<a href="register.jsp">注册</a>
					</td>
					<td></td>
				</tr>
				<tr>
					<td><input type="reset" value="重置"> </td>
					<td><input type="submit" value="登录"> </td>
					<td></td>
				</tr>
				
			</tbody>
			</table>
		</form>
	</body>
</html>
