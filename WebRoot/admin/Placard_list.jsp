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
<title>Placard list</title>
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
    	  <li class="nevigation_li"><a href="admin/Placard_list" class="nevigation_a">Public <br>&nbsp;Information</a></li>
          <li class="nevigation_li"><a href="admin/User_list" class="nevigation_a">User <br>&nbsp;Management</a></li>
          <li class="nevigation_li"><a href="admin/Admin_list" class="nevigation_a">Administrator <br>&nbsp;Management</a></li>
          <li class="nevigation_li"><a href="admin/search.jsp" class="nevigation_a">Search</a></li>
          <li class="nevigation_li"><a href="admin/logout.action" class="nevigation_a">Logout</a></li>
          </ul>
    	</div>
    	<div class="rightBox"><label class="labelFont1">Public Information List</label>
          <p>&nbsp;
          </p>
          <div align="right"><a href="admin/Placard_addInput.jsp" class="moreA">Add New Public Information</a></div>
          <table width="502">
            <tr>
              <th width="296" align="center">Title</th>
              <th width="91">&nbsp;</th>
              <th width="99">&nbsp;</th>
            </tr>
            <s:iterator value="placardLists" var="pd">
 			<tr>
  				<td align="center"><a href="admin/Placard_viewPlacard?id=<s:property value="#pd.idPlacard"/>" class="linkA"><s:property value="#pd.title"/></a></td>
    			<td><a href="admin/Placard_updateInput?id=<s:property value="#pd.idPlacard"/>" class="linkA">Update</a></td>
    			<td><a href="admin/Placard_delete?id=<s:property value="#pd.idPlacard"/>" class="linkA">Delete</a></td>
  			</tr>
  		    </s:iterator>
          </table>
          <!-- <div align="right">
          	<a href="#" class="moreA">&lt;&lt;</a>
          	<a href="#" class="moreA">1</a>
            <a href="#" class="moreA">2</a>
            <a href="#" class="moreA">3</a>
            <a href="#" class="moreA">4</a>
            <a href="#" class="moreA">5</a>
            <a href="#" class="moreA">&gt;&gt;</a>
          </div> -->
          <br>
      </div>
    </div>
   <div class="tail">Copyright(c) 2010.  All rights reserved.</div>
  </div>
</div>
</body>
</html>
