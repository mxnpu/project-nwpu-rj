<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/style/headStyle.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/style/toolboxStyle.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/style/blog.css"/>
        <link rel="stylesheet" href="<%=basePath%>/style/navStyle.css" type="text/css" media="screen" />
        <script type='text/javascript' src='jquery-1.2.6.min.js'></script>
        <script type='text/javascript' src='kwicks.js'></script>
        <script type='text/javascript' src='custom.js'></script>
    </head>
	<jsp:include page="header.jsp"></jsp:include>
	<body>
      <div id="mainPanel">
<!--Global Toolbox-->
        <div id="global_toolbox">
            <ul id="photolayer">
<!--主人的头像-->
			  <li>
                <img src="image/test_amiao.png"/>
              </li>
              <li id="host_item_1">
                <s:text name="all_blog.score"/>：100
              </li>
              <li id="host_item_2">
                <s:text name="all_blog.visited"/>：100
              </li>
              <li id="host_item_3">
                VIP
              </li>
            </ul>
        </div>
<!--News Panel-->
        <div id="content_bg">
          <div class="content_tab_header">
            <ul class="content_tab">
              <li class="content_tab_active"><a href="#"><span><s:text name="all_blog.my_blog"/></span></a></li>
              <li><a href="#"><span><s:text name="all_blog.friend_blog"/></span></a></li>
              <li><a href="#"><span><s:text name="all_blog.my_blog_comment"/></span></a></li>
            </ul>
          </div>
          <div id="content">

            <a href="write_blog.jsp"><font color="0xFFFFFF"><s:text name="all_blog.write_blog"/></font></a>
				<ul id="content_list">
					<s:iterator value="blogs" var="blog">
						<li class="content_item">
							<ul class="blog_editor">
								<li>
									<img src="<%=basePath%>/style/image/icon_blog.png" />
								</li>
								<li>
									<s:a href="showBlog?id=%{#blog.id}&state=edit"><s:text name="all_blog.edit"/></s:a>
								</li>
								<li>
									<s:a href="deleteBlog?id=%{#blog.id}"><s:text name="all_blog.delete"/></s:a>
								</li>
							</ul>
							<span class="blog_item"> <label>
									<s:a href="showBlog?id=%{#blog.id}&state=show">
										<s:property value="#blog.title" />
									</s:a>
								</label> <br> <s:property value="#blog.content" /> </span>
						</li>
					</s:iterator>
				</ul>

          </div>
           <div>
					<s:iterator var="i" begin="1" end="%{totalPage}" step="1">
						<a
							href="<s:url action="showAllBlogs"><s:param name="pageNow" value="#i"></s:param></s:url>"><s:property
								value="#i" />
						</a>
					</s:iterator>
				</div>
        </div>
        
        <div id="footer">
          <p class="r_option">
            <a href="javascript:;" onClick="window.scrollTo(0,0);" id="a_top" title="TOP"><img src="image/top.gif" alt="" style="padding: 5px 6px 6px;"></a>
          </p>
          <p><s:text name="footer.tip"/><a href="mailto:admin@gmail.com"><s:text name="footer.tipinfo"/></a>
        </div>
        
      </div>
	</body>
</html>
