<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<jsp:include page="header.jsp"></jsp:include>
<html>
	<head>
		<title>Register Page</title>
		<script type="text/javascript" src="../js/prototype-1.6.0.3.js"></script>
		<script type="text/javascript" src="../js/formUtils.js"></script> 
		<script type="text/javascript" src="../js/datePicker/WdatePicker.js"></script>
		<link rel="stylesheet" type="text/css" href="../style/style.css"/>
	</head>

  <body onLoad="FormUtil.focusOnFirst()">
   
    
    <div id="wrap">
      <form id="loginform" name="loginform" action="register.action" method="post" class="c_form">
        <table cellpadding="0" cellspacing="0" class="formtable">
          <caption>
            <h2>注册GoodFriend帐号</h2>
            <p>如果您在本站已拥有帐号，请使用已有的帐号信息直接进行登录即可，不需重复注册。</p>
          </caption>


          <tbody style="display:;">
            <tr>
              <th width="100"><label for="username">用户名</label></th>
              <td><input type="text" name="username" id="username" class="t_input" tabindex="2" maxlength="16" onBlur="Validate.required(this,4,16,'用户名需要','userNameError'); "></td>
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
                <input type="radio" name="gender" id="male" value="male" tabindex="6"/><label for="male">男</label>
				<input type="radio" name="gender" id="female" value="female" tabindex="7"/><label for="female">女</label>
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
                  <img src="random.action" onClick="changeValidateCode(this)" title="点击图片刷新验证码"/>
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
    </div>
  </body>

</html>
<jsp:include page="footer.jsp"></jsp:include>