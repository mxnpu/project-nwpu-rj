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
	<jsp:include page="header.jsp"></jsp:include>
  	<head>
    	<title><s:text name="friend.myfriend"/></title>
		<script type="text/javascript" src="../js/jquery-ui-1.7.2.custom.min.js"></script>
		<script type="text/javascript" src="../js/friend.js"></script>
		<link type="text/css" href="../style/jquery-ui-1.7.2.custom.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/style/toolboxStyle.css" />
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/style/blog.css" />
  	</head>
  <body>
  
  <div id="mainPanel">
  
  	<div id="global_toolbox">
	<form action="searchFriends">
		<div id="search" align="left">
			<s:if test="%{userName} != null">
				<input id="userName" name="userName" type="text" value="#username" />
				<button type="submit"><s:text name="friend.search"/></button>
			</s:if>
			<s:else>
				<input id="userName" name="userName" type="text" />
				<br>
				<input type="radio" name="scope" id="scope" value="fromFriends" checked="checked" />
				<s:text name="friend.goodfriend"/>
				<input type="radio" name="scope" id="scope" value="fromAll" />
				<s:text name="friend.all"/>
				<button type="submit"><s:text name="friend.search"/></button>
			</s:else>
		</div>

	</form>
 	</div>
  	<div id="main" align="center">
   		<s:iterator value="friends" var="user">
   			<div id='<s:property value="#user.idUser" />' class="delete_friend_div">
   				<img src="<s:property value="#user.photo" />"></img>
   				<a href="a.jsp"><s:property value="#user.userName" /></a>
   				<label class="delete_friend"><s:text name="friend.delete_friend"/></label>
   			</div>
   			<br>
   		</s:iterator>
   		
   		<div>	
			<s:iterator var="i" begin="1" end="%{totalPage}" step="1">
				<a href="<s:url action="getFriendsByPage">
					<s:param name="userName" value="%{userName }"></s:param>
					<s:param name="totalPage" value="%{totalPage }"></s:param>
					<s:param name="pageAction" value="%{pageAction }"></s:param>
					<s:param name="pageNow" value="#i"></s:param>
					</s:url>">
					<s:property value="#i"/>
				</a>
			</s:iterator>
		</div>
   	</div>
   </div>
   
   <div id="request" align="right">
   		<label><s:text name="friend.friend_ask"/></label>
   		<br>
   		<s:iterator value="requestList" var="mail">
   			<a href="a.jsp"><s:property value="#mail.fromUser.userName"/></a>
   			<s:text name="friend.ask_add_friend"/>
   			<a href="addFriend?friendId=<s:property value="#mail.fromUser.idUser" />">
   			<s:text name="friend_allow"/></a>  
   			<a href="refuseFriend?friendId=<s:property value="#mail.fromUser.idUser" />">
   			<s:text name="friend_refuse"/></a>
   			<br>
   		</s:iterator>
   </div>
   
   <!-- UI-dialog -->
   <div id="dialog" title='<s:text name="gossip_delete_confirm"/>'>
		<p><s:text name="friend.deldialog.content"/></p>
   </div>
  </body>
  <jsp:include page="footer.jsp"></jsp:include>
</html>
