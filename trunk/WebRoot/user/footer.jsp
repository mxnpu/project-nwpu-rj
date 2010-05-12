<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>
  <head>
  	<link rel="stylesheet" type="text/css" href="<%=basePath%>/style/style.css"/>
  </head>
  
  <body>
  <div id="footer">
        <p class="r_option">
          <a href="javascript:;" onClick="window.scrollTo(0,0);" id="a_top" title="TOP"><img src="<%=basePath%>/style/image/top.gif" alt="" style="padding: 5px 6px 6px;"></a>
        </p>
        <p>交友乐园 - Good Friend 网友互动社区 - <a href="mailto:admin@gmail.com">联系我们</a>
      </div>
  </body>
</html>
