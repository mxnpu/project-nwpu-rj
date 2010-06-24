<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><base href="<%=basePath%>">
<title>Search Result</title>
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
    	<div class="rightBox">
    	  <label class="labelFont1">Search Result List</label>
          <p>&nbsp;
          </p>
          <div align="left"><label class="labelFont2">10 user found in total</label>
          </div>
          <table width="502">
            <tr>
              <th width="296">Username</th>
              <th width="91">&nbsp;</th>
              <th width="99">&nbsp;</th>
            </tr>
            <s:iterator value="lists1" var="user">
            <tr>
              <td><s:property value="#user.userName"/></td>
              <td>
                <label>
                	<a href="admin/User_updateInput?id=<s:property value="#user.idUser"/>" class="linkA">Modify</a>
                </label>
              </td>
              <td>
                <label>
                	<a href="admin/User_delete?id=<s:property value="#user.idUser"/>" class="linkA">Delete</a>
                </label>
              </td>
            </tr>
            </s:iterator>
          </table>
          <p>&nbsp;</p>
          <p>&nbsp;
          </p>
      </div>
    </div>
    <div class="tail">Copyright(c) 2010.  All rights reserved.</div>
  </div>
</div>
</body>
</html>
