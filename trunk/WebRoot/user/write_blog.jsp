<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:include page="header.jsp"></jsp:include>
<html> 
	<head>
		<title><s:text name="write_blog.write_blog" /></title>
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
  		<div class="title_div">
  			<label><s:text name="write_blog.publish_blog"/></label><br><br>
  		</div>
  		<form action="publishBlog" method="post">
  			<div id="titleDiv">
	  			<span ><s:text name="write_blog.title"/></span>
    			<input id="title" name="title" type="text"><br><br>
  			</div>	
    		<textarea id="content" rows="20" cols="80" name="content"></textarea>
    		<br>
    		<button type="submit"><s:text name="index.publish"/></button>
     	</form>
    </div>
  </body>
  <jsp:include page="footer.jsp"></jsp:include>
</html>

