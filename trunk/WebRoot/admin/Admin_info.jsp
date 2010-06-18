<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Update Admin Info</title><base href="<%=basePath%>">
<style type="text/css">
<!--
@import url("admin/images/admin_base.css");
-->
</style>
</head>

<body>
<div class="globalBox">
  <div class="mainBox">
    <div class="header"></div>
    <div class="contentBox">
   	  <div class="leftNevigation"><label class="labelFont1">Nevigation</label>
    	  <ul class="nevigation_ul">
       	    <li class="nevigation_li"><a href="admin/Admin_index.jsp" class="nevigation_a">Home</a></li>
    	  <li class="nevigation_li"><a href="admin/Placard_list" class="nevigation_a">Public &nbsp;Information</a></li>
          <li class="nevigation_li"><a href="admin/User_list" class="nevigation_a">User &nbsp;Management</a></li>
          <li class="nevigation_li"><a href="admin/Admin_list" class="nevigation_a">Administrator &nbsp;Management</a></li>
          <li class="nevigation_li"><a href="admin/search.jsp" class="nevigation_a">Search</a></li>
          <li class="nevigation_li"><a href="admin/logout.action" class="nevigation_a">Logout</a></li>
          </ul>
    	</div>
   	  <div class="rightBox">
    	  <label class="labelFont1">Update Administrator's Information</label>
        <p>&nbsp;
        </p>
        <form action="admin/Admin_update.action" method="post">
          <table width="517">
  <tr>
    <td width="179">Username:</td>
    <td width="326"><label><s:property value="admin.username"/>
      </label></td>
  </tr>
  <tr>
    <td>Password:</td>
    <td><label><s:property value="admin.password"/>
      </label></td>
  </tr>
  <tr>
    <td>True Name:</td>
    <td><label><s:property value="admin.realName"/>
      </label></td>
  </tr>
  <tr>
    <td>Telephone:</td>
    <td><label><s:property value="admin.phone"/>
    </label></td>
  </tr>
  <tr>
    <td>Email:</td>
    <td><label><s:property value="admin.email"/>
    </label></td>
  </tr>
  <tr>
    <td>Address:</td>
    <td><label><s:property value="admin.address"/>
      </label></td>
  </tr>
  </table>
		<p>&nbsp;
        </p>
		<table width="460">
</table>
        </form>
        <p>&nbsp;
        </p>
      </div>
    </div>
    <div class="tail">Copyright(c) 2010. --RJ010706--. All rights reserved.</div>
  </div>
</div>
</body>
</html>
