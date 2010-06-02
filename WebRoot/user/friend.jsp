<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>我的好友</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <jsp:include page="header.jsp"></jsp:include>
  <body>
   <form action="searchFriends">
  	<div id="search" align="left">
  		<s:if test="%{userName} != null">
   			<input id="userName" name="userName" type="text" value="#username" /><button type="submit">搜索</button>
  		</s:if>
  		<s:else>
  			<input id="userName" name="userName" type="text" /><br>
  			<input type="radio" name="scope" id="scope" value="fromFriends" checked="checked"/>好友  <input type="radio" name="scope" id="scope" value="fromAll"/>全部 <button type="submit">搜索</button>
  		</s:else>
  	</div>
   </form>
   <div id="main" align="center">
   		<s:iterator value="friends" var="user">
   			<img src="<s:property value="#user.photo" />"></img>
   			<a href="a.jsp"><s:property value="#user.userName" /></a>
   			<a href="deleteFriend?friendId=<s:property value="#user.idUser" />">删除好友</a>
   			<br>
   		</s:iterator>
   		
   		<div>	
			<s:iterator var="i" begin="1" end="%{totalPage}" step="1">
				<a href="<s:url action="getFriendsByPage"><s:param name="userName" value="%{userName }"></s:param><s:param name="totalPage" value="%{totalPage }"></s:param><s:param name="pageAction" value="%{pageAction }"></s:param><s:param name="pageNow" value="#i"></s:param></s:url>"><s:property value="#i"/></a>
			</s:iterator>
			
		</div>
   </div>
   <div id="request" align="right">
   		<label>好友请求：</label><br>
   		<s:iterator value="requestList" var="user">
   			<a href="a.jsp"><s:property value="#user.userName"/></a>请求加你为好友。 <a href="addFriend?friendId=<s:property value="#user.idUser" />">同意</a>  <a href="refuseFriend?friendId=<s:property value="#user.idUser" />">拒绝</a><br>
   		</s:iterator>
   </div>
  </body>
   <jsp:include page="footer.jsp"></jsp:include>
</html>
