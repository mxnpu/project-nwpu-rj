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
<title>Add placard</title>
<script type="text/javascript" src="js/prototype-1.6.0.3.js"></script>
<script type="text/javascript" src="js/datePicker/WdatePicker.js"></script>
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
   	  <div class="rightBox2">
<label class="labelFont1">Add Public Information</label>
          <br>
        <s:form action="admin/Placard_addInput.action" method="post" >
        <table width="512">
        	<tr>
              <td width="118" height="43">Title:</td>
              <td width="382"><label>
              <input name="placardDTO.title" type="text" maxlength="16" required="ture" size="50"/>
              </label></td>
            </tr>
            <tr>
              <td height="204" valign="top">Content:</td>
              <td><label>
              <textarea name="placardDTO.content" cols="50" rows="14"></textarea>
              </label></td>
            </tr>
        </table>
        <table width="460">
  <tr>
    <td width="66">&nbsp;</td>
    <td width="167"><label>
    		<input class="button1" type="submit" name="addPublicInformationSubmit" id="addPublicInformationSubmit" value="Submit" />
          </label></td>
    <td width="211"><label>
    		<input class="button1" type="reset" name="addPublicInformationClear" id="addPublicInformationClear" value="Reset" /> 
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
