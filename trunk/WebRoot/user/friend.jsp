<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title><s:text name="friend.myfriend" />
		</title>
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>/style/headStyle.css" />
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>/style/toolboxStyle.css" />
		<!-- <link rel="stylesheet" type="text/css"
			href="<%=basePath%>/style/blog.css" /> -->
		<link rel="stylesheet" href="<%=basePath%>/style/navStyle.css"
			type="text/css" media="screen" />
		<script type='text/javascript' src='jquery-1.2.6.min.js'></script>
		<script type='text/javascript' src='kwicks.js'></script>
		<script type='text/javascript' src='custom.js'></script>
	</head>

	<body>
		<div id="header">
			<jsp:include page="header.jsp"></jsp:include>
		</div>
		<div id="mainPanel">
			<div id="global_toolbox">
				<form action="searchFriends">
					<div id="search" align="left">
						<s:if test="%{userName} != null">
							<input id="userName" name="userName" type="text"
								value="#username" />
							<button type="submit">
								<s:text name="friend.search" />
							</button>
						</s:if>
						<s:else>
							<input id="userName" name="userName" type="text" />
							<br>
							<input type="radio" name="scope" id="scope" value="fromFriends"
								checked="checked" />
							<s:text name="friend.goodfriend" />
							<input type="radio" name="scope" id="scope" value="fromAll" />
							<s:text name="friend.all" />
							<button type="submit">
								<s:text name="friend.search" />
							</button>
						</s:else>
					</div>
				</form>
			</div>
			<div id="main" align="center">
				<s:iterator value="friends" var="user">
					<img src="<s:property value="#user.photo" />"></img>
					<a href="home?userId=<s:property value="#user.idUser"/>"><s:property
							value="#user.userName" />
					</a>
					<a href="deleteFriend?friendId=<s:property value="#user.idUser" />"><s:text
							name="friend.delete_friend" />
					</a>
					<br>
				</s:iterator>

				<div>
					<s:iterator var="i" begin="1" end="%{totalPage}" step="1">
						<a
							href="<s:url action="getFriendsByPage"><s:param name="userName" value="%{userName }"></s:param><s:param name="totalPage" value="%{totalPage }"></s:param><s:param name="pageAction" value="%{pageAction }"></s:param><s:param name="pageNow" value="#i"></s:param></s:url>"><s:property
								value="#i" />
						</a>
					</s:iterator>

				</div>
			</div>
		</div>
		<div id="request" align="right">
			<label>
				<s:text name="friend.friend_ask" />
			</label>
			<br>
			<s:iterator value="requestList" var="mail">

				<a href="home?userId=<s:property value="#mail.fromUser.idUser"/>"
					target="_blank"><s:property value="#mail.fromUser.userName" />
				</a>
				<s:text name="friend.ask_add_friend" />
				<a
					href="addFriend?friendId=<s:property value="#mail.fromUser.idUser" />&mailId=<s:property value="#mail.id" />"><s:text
						name="friend_allow" />
				</a>
				<a
					href="refuseFriend?friendId=<s:property value="#mail.fromUser.idUser" />&mailId=<s:property value="#mail.id" />"><s:text
						name="friend_refuse" />
				</a>
				<br>

			</s:iterator>
		</div>
	</body>
	<jsp:include page="footer.jsp"></jsp:include>
</html>
