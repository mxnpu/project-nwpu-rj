<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title><s:text name="personal_info.pers"/></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="../js/datePicker/WdatePicker.js"></script>

  </head>
  <jsp:include page="header.jsp"></jsp:include>
  <body> 
    <form action="modifyInfoAction" >
    	<table width="400">
    		<tr>
    			<td><label><s:text name="personal_info.photo"/></label></td>
    			<td><img src="${session.currentUser.photo}"/></td>
    			<td><button><s:text name="personal_info.change_photo"/></button></td>
    		</tr>
    		<tr>
    			<td><label><s:text name="personal_info.username"/></label></td>
    			<td><input type="text" value="${session.currentUser.userName }"/></td>
    		</tr>
    		<tr>
    			<td><label><s:text name="personal_info.password"/></label></td>
    			<td><input name="password" id="password" type="text" value="#session.currentUser.password"/></td>
    		</tr>
    		<tr>
    			<td><label><s:text name="personal_info.right_name"/></label></td>
    			<td><input name="realName" id="realName" type="text"/></td>
    		</tr>
    		<tr>
    			<td><label>E-mail：</label></td>
    			<td><input name="email" id="email" type="text"/></td>
    		</tr>
    		<tr>
    			<td><label><s:text name="personal_info.sex"/></label></td>
    			<td><input name="gender" type="radio" value="male" checked="checked"/><s:text name="personal_info.man"/> <input name="gender" type="radio" value="female"/><s:text name="personal_info.woman"/></td>
    		</tr>
    		<tr>
    			<td><label><s:text name="home_birth"/></label></td>
    			<td> <input type="text" name="birthday" id="birthday" class="t_input" tabindex="9" maxlength="16" onFocus="WdatePicker({readOnly:true,highLineWeekDay:false})">
                <img onClick="WdatePicker({el:'date',readOnly:true,highLineWeekDay:false})" src="../js/datePicker/skin/datePicker.gif" width="16" height="22" align="middle"/></td>
    		</tr>
    		<tr>
    			<td><label><s:text name="personal_info.phone"/></label></td>
    			<td><input name="phone" id="phone" type="text" value="${session.currentUser.phone }"/></td>
    		</tr>
    		<tr>
    			<td><label><s:text name="home_love"/></label></td>
    			<td><textarea name="hobby" id="hobby">${session.currentUser.hobby }</textarea></td>
    		</tr>
    	</table>
    	<button type="submit"><s:text name="personal_info.submit"/></button><button type="reset"><s:text name="personal_info.reset"/></button>
    </form>
  </body>
  <jsp:include page="footer.jsp"></jsp:include>
</html>
