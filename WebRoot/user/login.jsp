<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>Welcome</title>
		<script type="text/javascript" src="../js/prototype-1.6.0.3.js"></script>
		<script type="text/javascript" src="../js/formUtils.js"></script> 
	</head>

	<body onload="FormUtil.focusOnFirst()">
		<h1>Welcome to our web site.</h1>
		<hr />
		<br/><s:property value="#session.getAttribute('errorMsg')"/> <br/>
		<form action="login" method="post" id="loginForm">
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
					<td>
						<input type="text" name="username" 
							onblur="Validate.required(this,'用户名需要','userNameError');"/>
					</td>
					<td><div class="errorMsg" id="userNameError"></div></td>
				</tr>
				<tr>
					<td>密    码:</td>
					<td><input type="password" name="password"
							onblur="Validate.required(this,'密码需要','userPasswordError')">
					</td>
					<td>
						<div class="errorMsg" id="userPasswordError"></div>
					</td>
				</tr>
				<tr>
					<td>验证码:</td>
					<td><input type="text" name="validateCode"
							onblur="Validate.required(this,'验证码需要','userValiCodeError')"></td>
					<td>
						<div class="errorMsg" id="userValiCodeError"></div>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<img src="random.action" 
						     onclick="Validate.changeCode(this)" 
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
					<td>
						<input type="button" value="登录" onclick="this.disabled=true;this.form.submit();"> 
					</td>
					<td></td>
				</tr>
				
			</tbody>
			</table>
		</form>
	</body>
</html>
