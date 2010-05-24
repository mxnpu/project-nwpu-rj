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
  </head>
  
  <body onload="myNewStatement.update()"> 
  <div id="wrap">
  	  <div id="photoDiv">
  	  	<img alt="Photo" src="${session.currentUser.photo}" /><br/> 
  	  	<a href="editPhoto.action">编辑头像</a>
  	  	<br/>
  	  </div>
  	  <div id="statementDiv">
  	  	最新状态： <label id="showLastStmt"></label><br>
  	  	<textarea rows="1" cols="80" name="statement" id="statement" title="更新你的新状态吧"></textarea><br/>
  	  	<input type="button" value="发布" onclick="myStatementChange.update()" />
  	  </div>
  </div>
  </body>
</html>
<jsp:include page="footer.jsp"></jsp:include>