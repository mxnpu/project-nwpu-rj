<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>Register Page</title>
		<script type="text/javascript" src="../js/prototype-1.6.0.3.js"></script>
		<script type="text/javascript" src="../js/formUtils.js"></script> 
		<script type="text/javascript" src="../js/datePicker/WdatePicker.js"></script>
	</head>

	<body onload="FormUtil.focusOnFirst()">
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
						<td><input type="text" name="username" maxlength="16" 
								onblur="Validate.required(this,4,16,'用户名需要','userNameError'); "/></td>
						<td>
							<div class="errorMsg" id="userNameError"></div>
						</td>
					</tr>
					<tr>
						<td>密码：</td>
						<td><input type="password" name="password" maxlength="16" 
								onblur="Validate.required(this,4,16,'密码需要','passwordError'); "/></td>
						<td>
							<div class="errorMsg" id="passwordError"></div>
						</td>
					</tr>
					<tr>
						<td>密码确认：</td>
						<td><input type="password" name="confirmPassword" maxlength="16" 
								onblur="Validate.required(this,4,16,'密码确认需要','passwordComfirmError'); "/></td>
						<td>
							<div class="errorMsg" id="passwordComfirmError"></div>
						</td>
					</tr>
					<tr>
						<td>真实姓名：</td>
						<td><input type="text" name="realname" maxlength="16" 
								onblur="Validate.required(this,'真实姓名需要','realNameError'); "/></td>
						<td>
							<div class="errorMsg" id="realNameError"></div>
						</td>
					</tr>
					<tr>
						<td>性别：</td>
						<td>
							<input type="radio" name="gender" value="male"/>男
							<input type="radio" name="gender" value="female"/>女 
						</td>
						<td>
						</td>
					</tr>
					<tr>
						<td>Email：</td>
						<td><input type="text" name="email"
								onblur="Validate.email(this, 'validateEmailError')"/> </td>
						<td>
							<div class="errorMsg" id="validateEmailError"></div>
						</td>
					</tr>
					<tr>
						<td>生日：</td>
						<td><input type="text" name="birthday" 
								onfocus="WdatePicker({readOnly:true,highLineWeekDay:false})"id="date"/> 
							<img onclick="WdatePicker({el:'date',readOnly:true,highLineWeekDay:false})" 
							src="../js/datePicker/skin/datePicker.gif" width="16" height="22" align="middle"/>
						</td>
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
						<td><input type="text" name="validateCode" 
								onblur="Validate.required(this,6,6,'验证码需要','userValiCodeError')"/></td>
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
