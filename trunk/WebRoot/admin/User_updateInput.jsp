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
<title>User Update</title>
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
    	  <label class="labelFont1">Update User's Information</label>
        <p>&nbsp;
        </p>
        <form action="admin/User_update.action" method="post">
          <table width="517">
  <tr>
    <td width="179">Username:</td>
    <td width="326"><label>
    	<input name="user.userName" type="text" value="<s:property value="user.userName"/>" size="40"/>
      </label></td>
  </tr>
  <tr>
          <td>Password:</td>
          <td><label>
            <input name="user.password" value="<s:property value="user.password"/>" size="40"/>
          </label></td>
        </tr>
  <tr>
    <td>Real Name:</td>
    <td><label>
    	<input name="user.realName" type="text" value="<s:property value="user.realName"/>" size="40"/>
      </label></td>
  </tr>
  <tr>
          <td>Gender:</td>
          <td><label>
          	<input type="radio" name="user.gender" value="M" tabindex="6" />male
			<input type="radio" name="user.gender" value="F" tabindex="7" />female
			<script>
			 	var radioObjects = document.getElementsByName("user.gender");
                for(var i = 0;i < radioObjects.length;i++){
                    if(radioObjects[i].value == "<s:property value="user.gender"/>"){
                        radioObjects[i].checked =  'checked';
                    }
                }
        	</script>
            <!--<input name="user.gender" value="" size="40"/>-->
          </label></td>
        </tr>
        <tr>
          <td>Birthday:</td>
          <td><label>
            <input name="user.birthday" value="<s:property value="user.birthday"/>" size="40"/>
          </label></td>
        </tr>
        <tr>
          <td>Telephone:</td>
          <td><label>
            <input name="user.phone" value="<s:property value="user.phone"/>" size="40"/>
          </label></td>
        </tr>
        <tr>
          <td>E-mail:</td>
          <td><label>
            <input name="user.email" value="<s:property value="user.email"/>" size="40"/>
          </label></td>
        </tr>
        <tr>
          <td>Hobby:</td>
          <td><label>
            <input name="user.hoby" value="<s:property value="user.hoby"/>" size="40"/>
          </label></td>
        </tr>
        <tr>
          <td>Photo:</td>
          <td><label>
            <input name="user.photo" value="<s:property value="user.photo"/>" size="40"/>
          </label></td>
        </tr>
        <tr>
          <td>Last Logout Time:</td>
          <td><label>
            <input name="user.lastLogoutTime" value="<s:property value="user.lastLogoutTime"/>" size="40"/>
          </label></td>
        </tr>
  </table>
		<p>&nbsp;
        </p>
		<table width="460">
  <tr>
    <td width="66">&nbsp;</td>
    <td width="167"><label>
            <input class="button1" type="submit" value="Submit" />
          </label></td>
    <td width="211"><label>
      <input class="button1" type="submit" value="Reset" />
    </label></td>
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
