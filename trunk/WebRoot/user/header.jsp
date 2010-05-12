<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/style/style.css"/>
	</head>
	<body>
		<div id="header">
			<div class="headerwarp">

				<h1 class="logo">
					<a href="#"> <img src="<%=basePath%>/style/image/bf_logo.png"
							alt="Good Friend" /> </a>
				</h1>
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
			
			<div id="wrap">
				<div id="navigator">
					<ul>
            		<li><a href="<%=basePath%>/user/index.jsp">首页</a></li>
    				<li><a href="">个人主页</a></li>
    				<li><a href="<%=basePath%>/user/blog/write_blog.jsp">日志</a></li>
    				<li><a href="">好友</a></li>
    				<li><a href="">相册</a></li>
    				<li><a href="">留言</a></li>
    				<li><a href="">个人管理</a></li>
    				</ul>
				</div>
			</div>
		</div>
	</body>
</html>
