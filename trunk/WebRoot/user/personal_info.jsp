<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>个人详细信息</title>
    
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
    			<td><label>头像：</label></td>
    			<td><img src="${session.currentUser.photo}"/></td>
    			<td><button>更改头像</button></td>
    		</tr>
    		<tr>
    			<td><label>用户名：</label></td>
    			<td><input type="text" value="${session.currentUser.userName }"/></td>
    		</tr>
    		<tr>
    			<td><label>密码：</label></td>
    			<td><input name="password" id="password" type="text" value="#session.currentUser.password"/></td>
    		</tr>
    		<tr>
    			<td><label>真实姓名：</label></td>
    			<td><input name="realName" id="realName" type="text"/></td>
    		</tr>
    		<tr>
    			<td><label>E-mail：</label></td>
    			<td><input name="email" id="email" type="text"/></td>
    		</tr>
    		<tr>
    			<td><label>性别：</label></td>
    			<td><input name="gender" type="radio" value="male" checked="checked"/>男 <input name="gender" type="radio" value="female"/>女</td>
    		</tr>
    		<tr>
    			<td><label>生日：</label></td>
    			<td> <input type="text" name="birthday" id="birthday" class="t_input" tabindex="9" maxlength="16" onFocus="WdatePicker({readOnly:true,highLineWeekDay:false})">
                <img onClick="WdatePicker({el:'date',readOnly:true,highLineWeekDay:false})" src="../js/datePicker/skin/datePicker.gif" width="16" height="22" align="middle"/></td>
    		</tr>
    		<tr>
    			<td><label>联系电话：</label></td>
    			<td><input name="phone" id="phone" type="text" value="${session.currentUser.phone }"/></td>
    		</tr>
    		<tr>
    			<td><label>爱好：</label></td>
    			<td><textarea name="hobby" id="hobby">${session.currentUser.hobby }</textarea></td>
    		</tr>
    	</table>
    	<button type="submit">提交</button><button type="reset">重置</button>
    </form>
  </body>
  <jsp:include page="footer.jsp"></jsp:include>
</html>
