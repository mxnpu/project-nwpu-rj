<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<jsp:include page="header.jsp"></jsp:include>
<html> 
	<head>
		<title><s:text name="title.read_blog"/></title>
		<link rel="stylesheet" type="text/css" href="../style/style.css"/>
		<script type="text/javascript" src="../js/kindeditor/kindeditor.js"></script>
		<script type="text/javascript" src="../js/blog.js"></script>
		<script type="text/javascript">
    	KE.show({
        	id : 'content'
   	    });	

   	    function loadContent(content){
   	   	    alert(content);
   	    	document.getElementById('content').innerHTML = content;
   	    }
    	</script>
  </head>
  
  <body> 
  	<div id="header">
  	</div>
  	
  	<div id="wrap">
  		<br><br>
  		<form action="updateBlog" method="post">
  		<input id="id" name="id" style="display:none" value="<s:property value="blog.id" />">
    	<label><s:property value="blog.title" /></label><br>
     	${blog.content }<br>
     	</form>
     	<br>
     	<div id="replies">
     		<textarea id="replyContent" name="replyContent" rows="2" cols="100"></textarea><br>
     		<button id="<s:property value="blog.id" />" 
     			onclick="replyBlogAjax.reply(this.id)"><s:text name="title.return"/></button><br>
     		<label><s:text name="title.all_return"/></label>
     		<div>
     			<ul id="ul_blog_replies">
     			<s:iterator value="replyList" var="reply">
     				<li>
     					<img alt="Photo" src='<s:property value="#reply.user.photo"/>' 
  							width="50" height="65"/>
  	  					<a href='<s:url action="home.action" namespace="/user">
  	  						<s:param name="userId" value="#reply.user.idUser"></s:param></s:url>' >
  	  						<s:property value="#reply.user.userName"/>
  	  					</a>
  	  					
  	  					<span>:<s:property value="#reply.content"/></span><br>
  	  					<span><s:property value="#reply.time"/></span> 	
  					</li>
     			</s:iterator>
     			</ul>
     		</div>
     	</div>
    </div>
   <div id="footer">
   </div>
  </body>
  <jsp:include page="footer.jsp"></jsp:include>
</html>

