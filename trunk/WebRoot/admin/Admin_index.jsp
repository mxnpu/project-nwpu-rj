<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><base href="<%=basePath%>">
<title>Admin Home</title>
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
          <li class="nevigation_li"><a href="admin/homePlacard" class="nevigation_a">Home</a></li>
    	  <li class="nevigation_li"><a href="admin/Placard_list" class="nevigation_a">Public &nbsp;Information</a></li>
          <li class="nevigation_li"><a href="admin/User_list" class="nevigation_a">User &nbsp;Management</a></li>
          <li class="nevigation_li"><a href="admin/Admin_list" class="nevigation_a">Administrator &nbsp;Management</a></li>
          <li class="nevigation_li"><a href="admin/search.jsp" class="nevigation_a">Search</a></li>
          <li class="nevigation_li"><a href="admin/logout.action" class="nevigation_a">Logout</a></li>
          </ul>
    	</div>
    	<div class="administratorInformation"><label class="labelFont1">Admin Info</label>
          <ul class="admin_info_ul">
            <li class="admin_info_li"><B>Username:</B><br><s:property value="#session.currentAdmin.username"/></li>
            <li class="admin_info_li"><B>Real Name:</B><br><s:property value="#session.currentAdmin.realName"/></li>
            <li class="admin_info_li"><B>Telephone:</B><br><s:property value="#session.currentAdmin.phone"/></li>
            <li class="admin_info_li"><B>E-mail:</B><br><s:property value="#session.currentAdmin.email"/></li>
            <li class="admin_info_li"><B>Address:</B><br><s:property value="#session.currentAdmin.address"/></li>
          </ul>
          <p>&nbsp;
          </p>
        <label>
        	<div align="right"><a href="admin/Admin_updateInput?id=<s:property value="#session.currentAdminId"/>" class="moreA">Modify</a></div>
          <!-- <input class="button1" type="submit" name="adminInfoUpdate" id="adminInfoUpdate" value="Update" /> -->
        </label>
  	  </div>
    	<div class="publicInformationList"><label class="labelFont1">Public Information </label>
          <table width="300">
  <tr>
    <th>Title  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="admin/Placard_list">more</a></th>
  </tr>
  <s:iterator value="placardLists" var="pd">
  <tr>
    <td><s:property value="#pd.title"/></td>
  </tr>
  </s:iterator>
</table><br>

    	</div>
    </div>
    <div class="tail">Copyright(c) 2010. --RJ010706--. All rights reserved.</div>
  </div>
</div>
</body>
</html>
