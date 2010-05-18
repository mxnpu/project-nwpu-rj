<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<jsp:include page="header.jsp"></jsp:include>
<html>
  <head>
    <title>首页</title>
  </head>
  
  <body> 
  <div id="wrap">
  	  <div id="photo">
  	  	<img alt="Photo" src="${session.currentUser.photo}" /><br/> 
  	  	<a href="editPhoto.action?id=${session.currentUser.idUser }">编辑头像</a>
  	  </div>
  	  
  </div>
  </body>
</html>
<jsp:include page="footer.jsp"></jsp:include>