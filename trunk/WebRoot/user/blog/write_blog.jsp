<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 

<html>
  <head>
    
    <title>写新日志</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="../../js/kindeditor/kindeditor.js"></script>
	<script type="text/javascript">
    	KE.show({
        	id : 'content',
   	    });	
    	</script>
  </head>
  
  <body> 
  	<div id="header">
  	</div>
  	
  	<div id="main">
  		<label>发表新日志</label><br><br>
  		<form action="publishBlog" method="post">
    	<label>标题：</label><input id="title" name="title" type="text"><br><br>
    	
    	<textarea id="content" rows="20" cols="80" name="content"></textarea><br><br>
    	<button type="submit">发布</button>
     	</form>
    </div>
   <div id="footer">
   </div>
  </body>
</html>
