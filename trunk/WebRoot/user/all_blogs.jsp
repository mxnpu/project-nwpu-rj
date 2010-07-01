<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
	<jsp:include page="header.jsp"></jsp:include>
	<head>
		<link rel="stylesheet" type="text/css" href="../style/viewBlogPanelStyle.css"/>
    </head>
	<body>
      <div id="mainPanel">
        <div id="global_toolbox">
            <ul id="photolayer">
			  <li>
                <img id="userPhoto" src="${session.currentUser.photo}"
							width="200" height="250" />
              </li>
             
            </ul>
        </div>

        <div id="content_bg">
          <div class="content_tab_header">
            <ul class="content_tab">
              <li class="content_tab_active"><a href="#"><span><s:text name="all_blog.my_blog"/></span></a></li>
            </ul>
          </div>
          <div id="content">
            <a href="towrite_blog.action" class="write_blog"><s:text name="all_blog.write_blog"/></a>
            <br>
			<ul id="content_list">
			<s:iterator value="blogs" var="blog">
				<li class="content_item">
					<ul class="blog_editor">
						<li>
							<img src="../style/image/icon_blog.png" />
						</li>
						<li>
							<s:a href="showBlog?id=%{#blog.id}&state=edit"><s:text name="all_blog.edit"/></s:a>
						</li>
						<li>
							<s:a href="deleteBlog?id=%{#blog.id}"><s:text name="all_blog.delete"/></s:a>
						</li>
					</ul>
					<span class="blog_item"> 
						<label>
							<s:a href="showBlog?id=%{#blog.id}&state=show">
								<h4><s:property value="#blog.title" /></h4>
							</s:a>
						</label> 
						${blog.content}
					</span>
				</li>
			</s:iterator>
			<li id="pageIndex">	
				<s:iterator var="i" begin="1" end="%{totalPage}" step="1">
						<a href="<s:url action="showAllBlogs"><s:param name="pageNow" value="#i"></s:param></s:url>"><s:property
								value="#i" />
						</a>
				</s:iterator>
			</li>      	
			</ul>
		</div>
			
        </div>        
      </div>
      <jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>
