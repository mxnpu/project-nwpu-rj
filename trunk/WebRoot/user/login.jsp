<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	
		<title>Good Friend 互动社区</title>
		<script type="text/javascript" src="../js/prototype-1.6.0.3.js"></script>
		<script type="text/javascript" src="../js/detect.js"></script>
		<script type="text/javascript" src="../js/eventutil.js"></script>
		<script type="text/javascript" src="../js/formUtils.js"></script> 
		<link rel="stylesheet" type="text/css" href="../style/style.css"/>
	</head>
	
  <body>
  	
  	<div id="header">
			<div class="headerwarp">

				<h1 class="logo">
					<a href="#"> <img src="../style/image/bf_logo.png"
							alt="Good Friend" /> </a>
				</h1>
				<div class="nav_account">
					<br>
					欢迎您
					<s:if test="#session.currentUser.userName != null">
						, <s:property value="#session.currentUser.userName"/>
					</s:if>
					<br>      
					<a href="login.jsp">登录</a> |
					<a href="register.jsp">注册</a>
				</div>
			</div>
		</div>
  	
  	
    <div id="wrap">
      <form id="loginform" name="loginform" action="login" method="post" class="c_form">
        <table cellpadding="0" cellspacing="0" class="formtable">
          <caption>
            <h2>用GoodFriend帐号登录</h2>
            <p>如果您在本站已拥有帐号，请使用已有的帐号信息直接进行登录即可，不需重复注册。</p>   
          </caption>
			
          <tbody style="display:;">
            <tr>
            	<td></td>
            	<td><div class="errorMsg">${requestScope.errorMsg }</div></td>
            </tr>
            <tr>
              <th width="100"><label for="username">用户名</label></th>
              <td><input type="text" name="username" id="username" class="t_input" tabindex="2" 
		              onBlur="Validate.required(this,4,16,'用户名需要','userNameError');"></td>
              <td><div class="errorMsg" id="userNameError"></div></td>
            </tr>
            <tr>
              <th width="100"><label for="password">密　码</label></th>
              <td><input type="password" name="password" id="password" class="t_input" tabindex="3" 
              		onBlur="Validate.required(this,4,16,'密码需要','userPasswordError')"
              		></td>
              <td><div class="errorMsg" id="userPasswordError"></div></td>
            </tr>
            <tr>
              <th width="100"></th>
              <td>
              	<input type="radio" value="admin" name="purview"/>管理员
              	<input type="radio" value="user" name="purview" checked="checked"/>用户
              </td>
              <td></td>
            </tr>
            <tr>
              <th width="100">&nbsp;</th>
              <td>
                <input type="checkbox" id="cookietime" name="cookietime" style="margin-bottom: -2px;"><label for="cookietime">下次自动登录</label>
              </td>
            </tr>
          </tbody>
          <tbody>
            <tr>
            <th width="100">&nbsp;</th>
              <td>
                <input type="button" id="loginsubmit" name="loginsubmit" value="登录" class="submit" tabindex="5" onClick="this.disabled=true;this.form.submit();">
              </td>
            </tr>
          </tbody>
        </table>
      </form>
      
      <div class="c_form">
        <table cellpadding="0" cellspacing="0" class="formtable">
          <caption>
          <h2>还没有注册吗？</h2>
          <p>如果还没有本站的通行帐号，请先注册一个属于自己的帐号吧。</p>
          </caption>
          <tbody>
            <tr>
              <td>
                <a href="register.jsp" target="_blank" id="register">
                  <strong>立即注册</strong>
                </a>              
			  </td>
            </tr>
          </tbody>
        </table>
      </div>
      
      
      
    </div>
    
    <div id="footer">
        <p class="r_option">
          <a href="javascript:;" onClick="window.scrollTo(0,0);" id="a_top" title="TOP"><img src="../style/image/top.gif" alt="" style="padding: 5px 6px 6px;"></a>
        </p>
        <p>交友乐园 - Good Friend 网友互动社区 - <a href="mailto:admin@gmail.com">联系我们</a>
      </div>
  </body>

</html>
