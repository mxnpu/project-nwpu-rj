<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>所有日志</title>
    

	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script type="text/javascript">
    	function del(){
    		if (confirm("确定要删除该日志吗？")){
    			window.location="index.jsp";
    		}else{
    			
    		}	
    	}
    </script>
  </head>
  
  <jsp:include page="header.jsp"></jsp:include>
  <body><br>
  	<div align="center">  
		<a href="write_blog.jsp">写日志</a><br>
		<s:iterator value="blogs" var="blog">
			<div><label><s:property value="#blog.title" /></label><s:a href="showBlog?id=%{#blog.id}">编辑</s:a><a id="del" href=""onclick="del()">删除</a></div>
			<div style="width:500px; height:100px; overflow:hidden"><s:property value="#blog.content" /></div>
		</s:iterator>
		<div>	
			<s:iterator var="i" begin="1" end="%{totalPage}" step="1">
				<a href="<s:url action="showAllBlogs"><s:param name="pageNow" value="#i"></s:param></s:url>"><s:property value="#i"/></a>
			</s:iterator>
			
		</div>
  	</div>
  </body>
  <jsp:include page="footer.jsp"></jsp:include>
</html>
