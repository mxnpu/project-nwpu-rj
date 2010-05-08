<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>Register Page</title>
		<script type="text/javascript" src="../js/formUtils.js"></script>
	</head>

	<body>
		<h1>
			欢迎注册成为我们的一员.
		</h1>
		<hr/>
		<br/>
		<br/>
		<div id="loginForm">
			<form action="register.action" method="post">
				<table>
				<thead>
					<tr>
						<th>请填写你的注册信息.<br/><br/></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>用户名：</td>
						<td><input type="text" name="username" maxlength="16" /></td>
						<td></td>
					</tr>
					<tr>
						<td>密码：</td>
						<td><input type="password" name="password" maxlength="16" /></td>
						<td></td>
					</tr>
					<tr>
						<td>密码确认：</td>
						<td><input type="password" name="confirmPassword" maxlength="16" /></td>
						<td></td>
					</tr>
					<tr>
						<td>真实姓名：</td>
						<td><input type="text" name="realname" maxlength="16" /></td>
						<td></td>
					</tr>
					<tr>
						<td>性别：</td>
						<td>
							<input type="radio" name="gender" value="male"/>男
							<input type="radio" name="gender" value="female"/>女 
						</td>
						<td></td>
					</tr>
					<tr>
						<td>Email：</td>
						<td><input type="text" name="email"/> </td>
						<td></td>
					</tr>
					<tr>
						<td>生日：<br>(YYYY-MM-DD)</td>
						<td><input type="text" name="birthday"/> </td>
						<td></td>
					</tr>
					<tr>
						<td>电话：</td>
						<td><input type="text" name="phone"/> </td>
						<td></td>
					</tr>
					<tr>
						<td>爱好：</td>
						<td><textarea rows="4" cols="16" name="hoby" ></textarea> </td>
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
						<td><input type="reset" value="重置"/> </td>
						<td><input type="submit" value="注册"> </td>
						<td></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>	
						<td>Tips:如有问题,联系我们</td>
					</tr>
				</tfoot>
			</table>
			</form>
		</div>
		
	</body>
</html>
