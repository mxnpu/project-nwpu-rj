<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
    String basePath = request.getScheme() + "://"
		    + request.getServerName() + ":" + request.getServerPort()
		    + request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/style/headStyle.css" />
		<link rel="stylesheet" href="<%=basePath%>/style/navStyle.css" type="text/css"
			media="screen" />
		<script type='text/javascript' src='<%=basePath%>/js/jquery-1.2.6.min.js'></script>
		<script type='text/javascript' src='<%=basePath%>/js/kwicks.js'></script>
		<script type='text/javascript' src='<%=basePath%>/js/custom.js'></script>
	</head>
	<body>
		<div id="header">
			<div class="headerwarp">
				<h1 class="logo">
					<a href="#"> <img src="<%=basePath%>/style/image/bf_logo.png" alt="Good Friend" />
					</a>
				</h1>
				<div class="global_nav">
					<ul class="kwicks">
						<li id="kwick1">
							<a href="<%=basePath%>/user/index.jsp">首页</a>
						</li>
						<li id="kwick2">
							<a href="#">个人主页</a>
						</li>
						<li id="kwick3">
							<a href="<%=basePath%>/user/blog/write_blog.jsp">日志</a>
						</li>
						<li id="kwick4">
							<a href="#">好友</a>
						</li>
						<li id="kwick5">
							<a href="#">留言板</a>
						</li>
						<li id="kwick6">
							<a href="#">个人信息</a>
						</li>
					</ul>
				</div>
				<div class="nav_account">
					欢迎您
					<s:if test="#session.currentUser.userName != null">
						, <s:property value="#session.currentUser.userName"/>
					</s:if>
					<br>
					<a href="<%=basePath%>/user/login.jsp">登录</a> |
					<a href="<%=basePath%>/user/register.jsp">注册</a>
					<s:if test="#session.currentUser.userName != null">
						| <a href="<%=basePath%>/user/logout.action">退出</a>
					</s:if> 
				</div>
			</div>
		</div>
	</body>
</html>
 