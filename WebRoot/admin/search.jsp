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
<title>Search</title>
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
    	  <label class="labelFont1">Search</label>
        <p>&nbsp;
        </p>
        <form id="searchUserform" name="searchUserform" action="admin/searchUser.action" method="post" class="c_form">
        <table width="377">
          <tr>
            <td width="51"></td>
            <td width="124"><label>
            	<input type="radio" name="isAdmin" id="isAdmin" value="true" tabindex="6" checked="checked"/>
              <!--<input type="radio" name="searchUserOrAdministrator" value="user" id="searchUserOrAdministrator_0" />-->
              Administrator</label></td>
            <td width="186"><label>
            	<input type="radio" name="isAdmin" id="isAdmin" value="false" tabindex="7"/>
              <!--<input type="radio" name="searchUserOrAdministrator" value="administrator" id="searchUserOrAdministrator_1" />-->
              User</label></td>
          </tr>
        </table>
        
          <table width="517">
  <tr>
    <td width="179">Username:</td>
    <td width="326"><label>
    	<input type="text" name="username" id="username" onBlur="Validate.required(this,4,16,'username needs','nameError');
              				myNameValidateAjax.validate(this.value); "/>
      <!--<input name="searchInfoID" type="text" id="searchInfoID" size="40" />-->
      </label></td>
      <td><div class="errorMsg" id="nameError"></div></td> 
  </tr>
  <tr>
    <td>Real name:</td>
    <td><label>
      <input type="text" name="realname" id="realname" class="t_input" onBlur="Validate.required(this,4,16,'realname needs','nameError');myNameValidateAjax.validate(this.value); "/>
      <!--<input name="searchInfoTrueName" type="text" id="searchInfoTrueName" size="40" />-->
      </label></td>
      <td><div class="errorMsg" id="nameError"></div></td> 
  </tr>
  <!--<tr>
    <td>Telephone:</td>
    <td><label>
      <input name="searchInfoTelephone" type="text" id="searchInfoTelephone" size="40" />
    </label></td>
  </tr>
  <tr>
    <td>Email:</td>
    <td><label>
      <input name="searchInfoEmail" type="text" id="searchInfoEmail" size="40" />
    </label></td>
  </tr>
  <tr>
    <td>Address:</td>
    <td><label>
      <input name="searchInfoAddress" type="text" id="searchInfoAddress" size="40" />
      </label></td>
  </tr>
  --></table>
		<table width="460"><p>&nbsp;</p><div align="center"="errorMsg">${requestScope.errorMsg }</div>
  <tr>
    <td width="120">&nbsp;</td>
    <td width="187"><label>
            <input class="button1" type="submit" name="searchInfoSubmit" id="searchInfoSubmit" value="Search" />
          </label></td>
    <td width="137">&nbsp;</td>
  </tr>
</table>
        </form>
        <p>&nbsp;
        </p>
      </div>
    </div>
    <div class="tail">Copyright(c) 2010.  All rights reserved.</div>
  </div>
</div>
</body>
</html>
