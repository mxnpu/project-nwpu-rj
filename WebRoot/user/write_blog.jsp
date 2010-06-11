<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:include page="header.jsp"></jsp:include>
<html> 
	<head>
		<title><s:text name="write_blog.write_blog"/></title>
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
  		<label><br><s:text name="write_blog.publish_blog"/></label><br><br>
  		<form action="publishBlog" method="post">
    	<label><s:text name="write_blog.title"/></label><input id="title" name="title" type="text"><br><br>
    	
    	<textarea id="content" rows="20" cols="80" name="content"></textarea><br><br>

    	<button type="submit"><s:text name="index.publish"/></button>
     	</form>
    </div>
   <div id="footer">
   </div>
  </body>
  <jsp:include page="footer.jsp"></jsp:include>
</html>

