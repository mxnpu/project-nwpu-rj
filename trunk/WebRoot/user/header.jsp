<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
    String basePath = request.getScheme() + "://"
		    + request.getServerName() + ":" + request.getServerPort()
		    + request.getContextPath();
%>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/style/headStyle.css" />
		<link rel="stylesheet" href="<%=basePath%>/style/navStyle.css" type="text/css"
			media="screen" />
		<script type='text/javascript' src='<%=basePath%>/js/jquery-1.3.2.min.js'></script>
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
				<div class="nav_account">
					<s:text name="header.welcome"/>
					<s:if test="#session.currentUser.userName != null">
						, <s:property value="#session.currentUser.userName"/>
						 <a href="<%=basePath%>/user/logout.action"><s:text name="header.quit"/></a>
					</s:if> 
					<s:else>
						<a href="<%=basePath%>/user/login.jsp"><s:text name="loginform.loginbtn"/></a> |
						<a href="<%=basePath%>/user/register.jsp"><s:text name="header.register"/></a>
					</s:else>		
					
				</div>
				<div class="global_nav">
					<ul class="kwicks">
						<li id="kwick1">
							<a href="<%=basePath%>/user/first.action"><s:text name="header.homepage"/></a>
						</li>
						<li id="kwick2">
							<a href="<%=basePath%>/user/home.action?userId=${session.currentUser.idUser}">
							<s:text name="header.personal_homepage"/></a>
						</li>
						<li id="kwick3">
							<a href="showAllBlogs"><s:text name="header.blog"/></a>
						</li>
						<li id="kwick4">
							<a href="showFriends"><s:text name="friend.goodfriend"/></a>
						</li>
						<li id="kwick5">
							<a href='<s:url action="allGossip.action">
							<s:param name="userId" value="#session.currentUser.idUser"></s:param>
							</s:url>'><s:text name="gossip_leave_message"/></a>
						</li>
						<li id="kwick6">
							<a href="#"><s:text name="header.personal_information"/></a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</body>
</html>
 