<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><base href="<%=basePath%>">
<title>Add admin</title>
<script type="text/javascript" src="js/prototype-1.6.0.3.js"></script>
<script type="text/javascript" src="js/adminValidate.js"></script>
<link rel="stylesheet" type="text/css" href="style/style.css" />
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
   	  <div class="rightBox">
    	  <label class="labelFont1">Add Administrator</label>
        <p>&nbsp;
        </p>
        <s:form action="admin/Admin_addInput.action" method="post" >
          <table width="517">
  <tr>
    <td width="179">*Username:</td>
    <td width="226">
    <label>
      <input type="text" name="adminDTO.username" required="true" size="40" 
      id="adminDTO.username" class="t_input" maxlength="16"
	  onblur="validateLength(this, 'userNameError', 4, 16);"/>
    </label> 
    </td>
    <td width="100">
    <div class="errorMsg" id="userNameError"></div>
    </td>
  </tr>
  <tr>
    <td>*Password:</td>
    <td><label>
      <input name="adminDTO.password" type="password" required="true" size="40" 
      id="adminDTO.password" class="t_input" maxlength="16"
	  onblur="validateLength(this, 'passwordError', 4, 16);"/>
    </label></td>
    <td width="100">
    <div class="errorMsg" id="passwordError"></div>
    </td>
  </tr>
  <tr>
    <td>*ConfirmPassword:</td>
    <td><label>
      <input name="adminDTO.confirmPassword" type="password" required="true" size="40" 
      id="admin.confirnPassword" class="t_input" maxlength="16"
	  onblur="validateLength(this, 'repasswordError', 4, 16);"/>
    </label></td>
    <td width="100">
    <div class="errorMsg" id="repasswordError"></div>
    </td>
  </tr>
  <tr>
    <td>*Real Name:</td>
    <td><label>
      <input name="adminDTO.real_name" type="text" size="40" 
      id="admin.realName" class="t_input" maxlength="16"
	  onblur="validateLength(this, 'realNameError', 4, 16);"/>
    </label></td>
    <td width="100">
    <div class="errorMsg" id="realNameError"></div>
    </td>
  </tr>
  <tr>
    <td>Telephone:</td>
    <td><label>
      <input name="adminDTO.phone" type="text" size="40" 
      id="admin.phone" class="t_input" maxlength="16"
	  onblur="bePhoneNumber(this, 'phoneError');"/>
    </label></td>
    <td width="100">
    <div class="errorMsg" id="phoneError"></div>
    </td>
  </tr>
  <tr>
    <td>Email:</td>
    <td><label>
      <input name="adminDTO.email" type="text"  size="40" 
      id="admin.email" class="t_input" maxlength="40"
	  onblur="validateEmail(this, 'emailError');" />
    </label></td>
    <td width="100">
    <div class="errorMsg" id="emailError"></div>
    </td>
  </tr>
  <tr>
    <td>Address:</td>
    <td><label>
      <input name="adminDTO.address" type="text" id="adminInfoAddressUpdate" size="40" />
      </label></td>
      <td width="100">
    <div class="errorMsg" id="addressError"></div>
    </td>
  </tr>
  </table>
		<p>&nbsp;
        </p>
		<table width="460">
  <tr>
    <td width="66">&nbsp;</td>
    <td width="167"><label>
            <input class="button1" type="submit" name="addAdministratorSubmit" id="addAdministratorSubmit" value="Submit" />
          </label></td>
    <td width="211"><label>
            <input class="button1" type="reset" name="addAdministratorClear" id="addAdministratorClear" value="Reset" />
          </label></td>
  </tr>
</table>
        </s:form>
        <p>&nbsp;
        </p>
      </div>
    </div>
    <div class="tail">Copyright(c) 2010.  All rights reserved.</div>
  </div>
</div>
</body>
</html>
