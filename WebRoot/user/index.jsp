<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<jsp:include page="header.jsp"></jsp:include>
<html>
  <head>
    <title>首页</title>
    <script type="text/javascript" src="../js/prototype-1.6.0.3.js"></script>
    <script type="text/javascript" src="../js/Statement.js"></script>
    <script type="text/javascript" src="../js/LatestMsg.js"></script>
  </head>
  
  <body onload="myNewStatement.update();myLatestMsg.update();"> 
  <div id="wrap">
  	  <div id="photo">
  	  	<img alt="Photo" src="${session.currentUser.photo}" /><br/> 
  	  	<a href="editPhoto.action">编辑头像</a>
  	  	<br/>
  	  </div>
  	  <div id="statementDiv">
  	  	最新状态： <label id="showLastStmt"></label><br>
  	  	<textarea rows="1" cols="80" name="statement" id="statement" title="更新你的新状态吧"></textarea><br/>
  	  	<input type="button" value="发布" onclick="myStatementChange.update()" />
  	  	<br>
  	  	<br>
  	  </div>
  	  <div id="latesMsgDiv">
  	  	<s:debug></s:debug>
  	  	<label>好友新鲜事</label>
  	  	<br>
  	  	
  	  	<s:iterator value="#session.msg" var="message">  	  		
  	  		<s:if test="#message.type == 'statement'">
  	  			<br/>
  	  			<img alt="Photo" src="<s:property value="#message.owner.photo"/>" />
  	  			<a href=""><s:property value="#message.owner.userName"/></a>
  	  			<br/>
  	  			<s:property value="#message.content"/><br/>
  	  			<s:property value="#message.recordTime"/><br/>
  	  		</s:if>
  	  		<s:if test="#message.type == 'blog'">
  	  			<br/>
  	  			<img alt="Photo" src="<s:property value="#message.owner.photo"/>" />
  	  			<a href=""><s:property value="#message.owner.userName"/></a>
  	  			<br/>
  	  			<s:property value="#message.title"/><br/>
  	  			<textarea rows="2" cols="80" ><s:property value="#message.content"/></textarea><br/>
  	  			<s:property value="#message.recordTime"/><br/>
  	  		</s:if>
  	  	</s:iterator>
  	  	<!-- 
  	  	<c:forEach var="message" items="${session.msg}">
  	  	${message.content }<br/>
  	  		<c:if test="${message.type == 'statement'}">
  	  			<br/>
  	  			<img alt="Photo" src="${message.owner.photo}" />
  	  			<a href="">${message.owner.userName}</a>
  	  			<br/>
  	  			${message.content }<br/>
  	  			${message.recordTime}<br/>
  	  		</c:if>
  	  		<c:if test="${message.type == 'blog'}">
  	  			<br/>
  	  			<img alt="Photo" src="${message.owner.photo}" />
  	  			<a href="">${message.owner.userName}</a>
  	  			<br/>
  	  			${message.title }
  	  			<textarea rows="2" cols="80" >${message.content }</textarea><br/>
  	  			${message.recordTime}<br/>
  	  		</c:if>
  	  	</c:forEach>
  	  	  -->
  	  	<br>		
  	  </div>
  </div>
  </body>
</html>
<jsp:include page="footer.jsp"></jsp:include>