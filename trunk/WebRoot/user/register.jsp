<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>Register Page</title>
		<script type="text/javascript" src="../js/prototype-1.6.0.3.js"></script>
		<script type="text/javascript" src="../js/formUtils.js"></script> 
		<script type="text/javascript" src="../js/datePicker/WdatePicker.js"></script>
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
					<br/>
					欢迎您
					<s:if test="#session.currentUser.userName != null">
						, <s:property value="#session.currentUser.userName"/>
					</s:if>
					<br/>
					<a href="login.jsp">登录</a> |
					<a href="register.jsp">注册</a>
				</div>
			</div>
		</div>
    
    <div id="wrap">
      <form id="loginform" name="loginform" action="register.action" method="post" class="c_form">
        <table cellpadding="0" cellspacing="0" class="formtable">
          <caption>
            <h2>注册GoodFriend帐号</h2>
            <p>如果您在本站已拥有帐号，请使用已有的帐号信息直接进行登录即可，不需重复注册。</p>
          </caption>


          <tbody style="display:;">
          	<tr>
            	<td></td>
            	<td><div class="errorMsg">${requestScope.errorMsg }</div></td>
            </tr>
            <tr>
              <th width="100"><label for="username">用户名</label></th>
              <td><input type="text" name="username" id="username" class="t_input" tabindex="2" maxlength="16" 
              		onBlur="Validate.required(this,4,16,'用户名需要','userNameError');
              				myNameValidateAjax.validate(this.value); "></td>
              <td><div class="errorMsg" id="userNameError"></div></td>
            </tr>
            <tr>
              <th width="100"><label for="password">密　码</label></th>
              <td><input type="password" name="password" id="password" class="t_input" tabindex="3" maxlength="16" onBlur="Validate.required(this,4,16,'密码需要','passwordError'); "></td>
              <td><div class="errorMsg" id="passwordError"></div></td>
            </tr>
            <tr>
              <th width="100"><label for="confirmPassword">密码确认</label></th>
              <td><input type="password" name="confirmPassword" id="confirmPassword" class="t_input" tabindex="4" maxlength="16" onBlur="Validate.required(this,4,16,'密码确认需要','passwordComfirmError'); "></td>
              <td><div class="errorMsg" id="passwordComfirmError"></div></td>
            </tr>
            <tr>
              <th width="100"><label for="realname">真实姓名</label></th>
              <td><input type="text" name="realname" id="realname" class="t_input" tabindex="5" maxlength="16" onBlur="Validate.required(this,'真实姓名需要','realNameError'); "></td>
              <td><div class="errorMsg" id="realNameError"></div></td>
            </tr>
            <tr>
              <th width="100"><label>性　别</label></th>
              <td>
              	<div onclick="FormUtil.changePhoto();">
                <input type="radio" name="gender" id="gender" value="male" tabindex="6" checked="checked"/><label for="male">男</label>
				<input type="radio" name="gender" id="gender" value="female" tabindex="7"/><label for="female">女</label>
				</div>
              </td>
            </tr>
            <tr>
              <th width="100"><label for="email">Email</label></th>
              <td><input type="text" name="email" id="email" class="t_input" tabindex="8" maxlength="16" onBlur="Validate.email(this, 'validateEmailError')"></td>
              <td><div class="errorMsg" id="validateEmailError"></div></td>
            </tr>
            <tr>
              <th width="100"><label for="birthday">生　日</label></th>
              <td>
                <input type="text" name="birthday" id="birthday" class="t_input" tabindex="9" maxlength="16" onFocus="WdatePicker({readOnly:true,highLineWeekDay:false})">
                <img onClick="WdatePicker({el:'date',readOnly:true,highLineWeekDay:false})" src="../js/datePicker/skin/datePicker.gif" width="16" height="22" align="middle"/>
              </td>
            </tr>
            <tr>
              <th width="100"><label for="phone">电　话</label></th>
              <td><input type="text" name="phone" id="phone" class="t_input" tabindex="10" maxlength="16"></td>
            </tr>
            <tr>
              <th width="100"><label for="hobby">爱　好</label></th>
              <td><textarea rows="3" cols="21" name="hobby" id="hobby" class="t_input" tabindex="11"></textarea></td>
            </tr>
            <tr>
              <th width="100"><label for="validateCode">验证码</label></th>
              <td>
                <p>
                  <img src="random.action" onClick="Validate.changeCode(this)" title="点击图片刷新验证码"/>
                </p>
                <p>
                  <input type="text" name="validateCode" id="validateCode" class="t_input" tabindex="12" maxlength="16" onBlur="Validate.required(this,6,6,'验证码需要','userValiCodeError')">
                </p>
              </td>
              <td><div class="errorMsg" id="userValiCodeError"></div></td>
            </tr>
          </tbody>
          <tbody>
            <tr>
            <th width="100">&nbsp;</th>
              <td>
                <input type="submit" id="loginsubmit" name="loginsubmit" value="注册" class="submit" tabindex="13">
                <input type="reset" id="loginreset" name="loginreset" value="重置" class="reset" tabindex="14">
              </td>
            </tr>
          </tbody>
        </table>
      </form>
      
      <div id="photoDiv">      	
      	<table>
      		<tr>
      			<td><label >默认头像:</label><br/></td>
      			<td></td>
      		</tr>
      		<tr>
      			<td></td>
      			<td><img id="photo" alt="默认头像" src="../pictures/default/default_male.png"><br></td>
      		</tr>

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