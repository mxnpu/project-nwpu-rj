<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>/style/headStyle.css" />
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>/style/toolboxStyle.css" />
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>/style/blog.css" />
		<link rel="stylesheet" href="<%=basePath%>/style/navStyle.css"
			type="text/css" media="screen" />
		<script type='text/javascript' src='jquery-1.2.6.min.js'></script>
		<script type='text/javascript' src='kwicks.js'></script>
		<script type='text/javascript' src='custom.js'></script>
	</head>
	<body>
		<!--Global Navigation Bar-->
		<div id="header">
			<jsp:include page="header.jsp"></jsp:include>
		</div>
		</div>
		<div id="mainPanel">
			<!--Global Toolbox-->
			<div id="global_toolbox">
				<form action="searchFriends">
					<div id="search" align="left">
						<s:if test="%{userName} != null">
							<input id="userName" name="userName" type="text"
								value="#username" />
							<button type="submit">
								搜索
							</button>
						</s:if>
						<s:else>
							<input id="userName" name="userName" type="text" />
							<br>
							<input type="radio" name="scope" id="scope" value="fromFriends" />好友  <input
								type="radio" name="scope" id="scope" value="fromAll"
								checked="checked" />全部 <button type="submit">
								搜索
							</button>
						</s:else>
					</div>
				</form>
			</div>
			<!--Friends Panel-->
			<div id="content_bg">
				<div class="content_tab_header">
					<ul class="content_tab">
						<li class="content_tab_active">
							<a href="#"><span>添加好友申请</span>
							</a>
						</li>
					</ul>
				</div>
				<div id="content">


					<ul id="content_list">
						<s:iterator value="users" var="user">
							<li class="content_item">

								<span class="friend_item">
									<ul>
										<li class="friend_photo">
											<!--啊苗头像URL-->
											<img src="<s:property value="#user.photo" />" />
										</li>
										<li class="friend_detail">
											<span> <!--自由发挥--> <a href="a.jsp"><s:property
														value="#user.userName" />
											</a> <br> <a
												href="addFriendToRequestList?friendId=<s:property value="#user.idUser" />">添加好友</a>
											</span>
										</li>
									</ul> </span>
							</li>
						</s:iterator>

					</ul>
					<div>
						<s:iterator var="i" begin="1" end="%{totalPage}" step="1">
							<a
								href="<s:url action="searchUser"><s:param name="userName" value="%{userName }"></s:param><s:param name="totalPage" value="%{totalPage }"></s:param><s:param name="pageNow" value="#i"></s:param></s:url>"><s:property
									value="#i" />
							</a>
						</s:iterator>
					</div>
				</div>
				<div id="request" align="right">
					<label>
						好友请求：
					</label>
					<br>
					<s:iterator value="requestList" var="user">
						<a href="a.jsp" /><s:property value="#user.userName" />
						</a>请求加你为好友。 <a
							href="addFriend?friendId=<s:property value="#user.idUser" />">同意</a>
						<a
							href="refuseFriend?friendId=<s:property value="#user.idUser" />">拒绝</a>
						<br>
					</s:iterator>
				</div>
			</div>
			<!--Footer-->
			<div id="footer">
				<jsp:include page="footer.jsp"></jsp:include>
			</div>

		</div>

	</body>
</html>

