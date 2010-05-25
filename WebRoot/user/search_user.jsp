<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>搜索用户</title>
    
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
  			<input type="radio" name="scope" id="scope" value="fromFriends" />好友  <input type="radio" name="scope" id="scope" value="fromAll" checked="checked"/>全部 <button type="submit">搜索</button>
  		</s:else>
  	</div>
   </form>
   <div id="main" align="center">
   		<s:iterator value="users" var="user">
   			<img src="<s:property value="#user.photo" />"></img>
   			<a href=""><s:property value="#user.userName" /></a>
   			<a href="addFriend?friendId=<s:property value="#user.idUser" />">添加好友</a>
   			<br>
   		</s:iterator>
   		
   		<div>	
			<s:iterator var="i" begin="1" end="%{totalPage}" step="1">
				<a href="<s:url action="searchUser"><s:param name="userName" value="%{userName }"></s:param><s:param name="totalPage" value="%{totalPage }"></s:param><s:param name="pageNow" value="#i"></s:param></s:url>"><s:property value="#i"/></a>
			</s:iterator>
			
		</div>
   </div>
  </body>
   <jsp:include page="footer.jsp"></jsp:include>
</html>
