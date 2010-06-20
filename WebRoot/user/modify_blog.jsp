<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<jsp:include page="header.jsp"></jsp:include>
<html> 
	<head>
		<title><s:text name="modify_blog.blog_edit"/></title>
		<script type="text/javascript" src="../js/kindeditor/kindeditor.js"></script>
		<link type="text/css" rel="stylesheet" href="../style/writeBlog.css" />	
		<script type="text/javascript">
    	KE.show({
        	id : 'content'
   	    });	
    	</script>
  </head>
  
  <body> 	
  	<div id="contentPanel">
  		<br><br>
  		<form action="updateBlog" method="post">
  			<input id="id" name="id" style="display:none" value="<s:property value="blog.id" />">
  			<div id="titleDiv">
	  			<label><s:text name="modify_blog.title"/></label>
    			<input id="title" name="title" type="text" value="<s:property value="blog.title" />"><br><br>
  			</div>	 	
    		<textarea id="content" rows="20" cols="80" name="content"><s:property value="blog.content" /></textarea><br>

    		<button type="submit"><s:text name="modify_blog.publish"/></button>
     	</form>
     	<br>	
    </div>
  </body>
  <jsp:include page="footer.jsp"></jsp:include>
</html>

