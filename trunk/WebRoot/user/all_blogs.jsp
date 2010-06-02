<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>所有日志</title>


		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>/style/blog.css">
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>/style/jquery.jmodal.css">
		<link rel="stylesheet" href="<%=basePath%>/style/toolboxStyle.css"
			type="text/css" media="screen" />

		<script type="text/javascript" src="<%=basePath%>/js/jquery-1.3.1.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>/js/jquery.jmodal.js"></script>
	</head>

	<jsp:include page="header.jsp"></jsp:include>
	<body>
		<br>
		<!--Global Toolbox-->
		<div id="global_toolbox">
			<ul class="toollist">
				<li id="photolayer">
				</li>
			</ul>
		</div>
		<div id="content_bg">
			<a href="write_blog.jsp">写日志</a>
			<div class="content_tab_header">
				<ul class="content_tab">
					<li class="content_tab_active">
						<a href="#"><span>好友的日志</span> </a>
					</li>
					<li>
						<a href="#"><span>我的日志</span> </a>
					</li>
					<li>
						<a href="#"><span>我评论过的日志</span> </a>
					</li>
				</ul>
			</div>
			<div id="content">

				<ul id="content_list">
					<s:iterator value="blogs" var="blog">
						<li class="content_item">
							<ul class="blog_editor">
								<li>
									<img src="<%=basePath%>/style/image/icon_blog.png" />
								</li>
								<li>
									<s:a href="showBlog?id=%{#blog.id}&state=edit">编辑</s:a>
								</li>
								<li>
									<s:a href="deleteBlog?id=%{#blog.id}">删除</s:a>
								</li>
							</ul>
							<span> <label>
									<s:a href="showBlog?id=%{#blog.id}&state=show"><s:property value="#blog.title" /></s:a>
								</label> <br> 
								<s:property value="#blog.content" /> 
								
								</span>
						</li>
						
						
					</s:iterator>
				</ul>
			</div>
			<a href="#" id="load">载入新鲜事</a>
			<s:iterator var="i" begin="1" end="%{totalPage}" step="1">
				<a
					href="<s:url action="showAllBlogs"><s:param name="pageNow" value="#i"></s:param></s:url>"><s:property
						value="#i" /> </a>
			</s:iterator>
		</div>

	</body>
	<div id="footer">
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</html>
