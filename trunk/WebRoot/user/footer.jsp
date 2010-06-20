<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>

  <body>
  <div id="footer">
        <p class="r_option">
          <a href="javascript:;" onClick="window.scrollTo(0,0);" id="a_top" title="TOP"><img src="<%=basePath%>/style/image/top.gif" alt="" style="padding: 5px 6px 6px;"></a>
        </p>
        <p><s:text name="footer.tip"/><a href="mailto:admin@gmail.com"><s:text name="footer.tipinfo"/></a>
      </div>
  </body>
</html>
