<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<base href="<%=basePath%>">
		<title>Welcome</title>
		<script type="text/javascript" src="js/prototype-1.6.0.3.js"></script>
		<script type="text/javascript" src="js/adminValidate.js"></script>
		<link rel="stylesheet" type="text/css" href="style/style.css" />
		<style type="text/css">
<!--
.globalheader {
	margin: 10px;
	padding: 10px;
}

.globalheader li {
	display: inline;
	background-repeat: repeat-x;
	background-image: url(admin/images/headbg2.jpg);
	height: 60px;
	width: 600px;
	font-family: "Freestyle Script";
	font-size: xx-large;
	text-align: center;
	vertical-align: middle;
	list-style-type: disc;
	padding-top: 8px;
	padding-right: 700px;
	padding-bottom: 8px;
	padding-left: 60px;
	color: #303;
}

.globalheader ul {
	list-style: none;
	padding: 8px;
}

.globalheader .globalselect ul li a {
	height: auto;
	text-decoration: none;
	background-repeat: repeat-x;
	background-image: url(admin/images/headbg2.jpg);
	font-size: 16px;
	color: #004;
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-top-style: none;
	border-right-style: solid;
	border-bottom-style: none;
	border-left-style: none;
	border-top-color: #666;
	border-right-color: #666;
	border-bottom-color: #666;
	border-left-color: #666;
	margin-top: 0px;
	margin-right: -4px;
	margin-bottom: 0px;
	margin-left: -4px;
	padding-top: 9px;
	padding-right: 20px;
	padding-bottom: 9px;
	padding-left: 20px;
}

.globalselect {
	width: 900px;
	height: auto;
	margin: 30px auto 30px auto;
	padding: 0px;
	vertical-align: middle;
}

.maincontent {
	width: 900px;
	height: auto;
	margin: 10px auto 10px auto;
	padding: 0px;
}

.submitButton {
	font-family: "Î¢ÈíÑÅºÚ";
	color: #333;
	padding: 3px;
	font-style: normal;
	text-decoration: none;
}

.maincontent #form1 div table tr td table tr td p {
	color: #30C;
	font-family: "Î¢ÈíÑÅºÚ";
	font-size: 24px;
}
-->
</style>
	</head>

	<body>
		<div class="globalheader">
			<div class="globalselect">
				<ul>
					<li>
						Good Friends
					</li>
				</ul>
			</div>
		</div>
		<div class="maincontent">
			<hr align="center" width="600" size="3" noshade="noshade"
				color="#6666CC" />
		</div>
		<div class="maincontent">
			<form action="admin/login.action" method="post">
				<div align="left center">
					<table width="100%" border="0">
						<tr>
							<td width="6%">
								&nbsp;
							</td>
							<td width="50%">
								<img src="admin/images/loginimage.gif" width="400" height="250" />
							</td>
							<td width="44%">
								<table width="90%" border="0">
									<tr>
										<td>
											<p>
												&nbsp;
											</p>
											<p>
												Administrator Login:
											</p>
											<p>
												&nbsp;
											</p>
										</td>
									</tr>
									<tr>
										<td></td>
										<td>
											<div class="errorMsg">
												${requestScope.errorMsg }
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<table width="95%" border="0">
												<tr>
													<td>
														<div align="left">
															ID:
														</div>
													</td>
													<td>
														<input type="text" name="admin.username"
															id="admin.username" class="t_input" maxlength="16"
															onblur="validateLength(this, 'userNameError', 4, 16);" />
													</td>
													<td>
														<div class="errorMsg" id="userNameError"></div>
													</td>

												</tr>
												<tr>
													<td>
														<div align="left">
															Password:
														</div>
													</td>
													<td>
														<input type="password" name="admin.password"
															id="admin.password" class="t_input" maxlength="16"
															onblur="validateLength(this, 'passwordError', 4, 16);" />
													</td>
													<td>
														<div class="errorMsg" id="passwordError"></div>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<p>
												&nbsp;
											</p>
											<table width="95%" border="0">
												<tr>
													<td width="11%">
														&nbsp;
													</td>
													<td width="32%">
														<input type="reset" class="submitButton" value="Reset">
													</td>
													<td width="57%">
														<input type="submit" class="submitButton" value="Login">
													</td>
												</tr>
											</table>
											<p>
												&nbsp;
											</p>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
				<p></p>
			</form>
		</div>
	</body>
</html>
