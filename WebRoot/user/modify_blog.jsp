<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<jsp:include page="header.jsp"></jsp:include>
<html> 
	<head>
		<title>查看日志</title>
		<link rel="stylesheet" type="text/css" href="../style/style.css"/>
		<script type="text/javascript" src="../js/kindeditor/kindeditor.js"></script>
		<script type="text/javascript">
    	KE.show({
        	id : 'content'
   	    });	
    	</script>
  </head>
  
  <body> 
  	<div id="header">
  	</div>
  	
  	<div id="wrap">
  		<br><br>
  		<form action="updateBlog" method="post">
  		<input id="id" name="id" style="display:none" value="<s:property value="blog.id" />">
    	<label>标题：</label><input id="title" name="title" type="text" value="<s:property value="blog.title" />"><br><br>
    	
    	<textarea id="content" rows="20" cols="80" name="content"><s:property value="blog.content" /></textarea><br><br>

    	<button type="submit">发布</button>
     	</form>
     	<br>
     	<div id="replies">
     		<form action="addBlogReply?id=<s:property value="blog.id" />" method="post">
     		<textarea id="replyContent" name="replyContent" rows="5" cols="100"></textarea><br>
     		<button type="submit">回复</button><br>
     		</form>
     		<label>所有回复：</label>
     		<s:iterator value="replyList" var="reply">
     			<div id="reply">
     				<a href=""><s:property value="#reply.user.userName" /></a>:
     				<s:property value="#reply.content" /><br>
     			</div>
     		</s:iterator>
     	</div>
    </div>
   <div id="footer">
   </div>
  </body>
  <jsp:include page="footer.jsp"></jsp:include>
</html>

