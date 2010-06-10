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
					<s:text name="header.welcome"></s:text>
					<s:if test="#session.currentUser.userName != null">
						, <s:property value="#session.currentUser.userName"/>
					</s:if>
					<br/>
					<a href="login.jsp"><s:text name="header.login"></s:text></a> |
					<a href="register.jsp"><s:text name="header.register"></s:text></a>	
				</div>
			</div>
		</div>
    
    <div id="wrap">
      <form id="loginform" name="loginform" action="register.action" method="post" class="c_form">
        <table cellpadding="0" cellspacing="0" class="formtable">
          <caption>
            <h2><s:text name="registerform.captiontips"/></h2>
            <p><s:text name="loginform.captiontips"></s:text></p>
          </caption>


          <tbody style="display:;">
          	<tr>
            	<td></td>
            	<td><div class="errorMsg">${requestScope.errorMsg }</div></td>
            </tr>
            <tr>
              <th width="100"><label for="username"><s:text name="registerform.username"/></label></th>
              <td><input type="text" name="username" id="username" class="t_input" tabindex="2" maxlength="16" 
              		onBlur="Validate.required(this,4,16,'User Name Required','userNameError');
              				myNameValidateAjax.validate(this.value); "></td>
              <td><div class="errorMsg" id="userNameError"></div></td>
            </tr>
            <tr>
              <th width="100"><label for="password"><s:text name="registerform.password"/></label></th>
              <td><input type="password" name="password" id="password" class="t_input" tabindex="3" maxlength="16" 
              		onBlur="Validate.required(this,4,16,'Password Required','passwordError'); "></td>
              <td><div class="errorMsg" id="passwordError"></div></td>
            </tr>
            <tr>
              <th width="100"><label for="confirmPassword"><s:text name="registerform.passwordConf"/></label></th>
              <td><input type="password" name="confirmPassword" id="confirmPassword" class="t_input" tabindex="4" maxlength="16" 
              		onBlur="Validate.required(this,4,16,'Password Confirm Required','passwordComfirmError'); "></td>
              <td><div class="errorMsg" id="passwordComfirmError"></div></td>
            </tr>
            <tr>
              <th width="100"><label for="realname"><s:text name="registerform.realname"/></label></th>
              <td><input type="text" name="realname" id="realname" class="t_input" tabindex="5" maxlength="16" 
              			onBlur="Validate.required(this,'RealName Required','realNameError'); "></td>
              <td><div class="errorMsg" id="realNameError"></div></td>
            </tr>
            <tr>
              <th width="100"><label><s:text name="registerform.gender"/></label></th>
              <td>
              	<div onclick="FormUtil.changePhoto();">
                <input type="radio" name="gender" id="gender" value="male" tabindex="6" checked="checked"/>
                	<label for="male"><s:text name="registerform.male"/></label>
				<input type="radio" name="gender" id="gender" value="female" tabindex="7"/>
					<label for="female"><s:text name="registerform.female"/></label>
				</div>
              </td>
            </tr>
            <tr>
              <th width="100"><label for="email"><s:text name="registerform.email"/></label></th>
              <td><input type="text" name="email" id="email" class="t_input" tabindex="8" 
              		onBlur="Validate.email(this, 'validateEmailError')"></td>
              <td><div class="errorMsg" id="validateEmailError"></div></td>
            </tr>
            <tr>
              <th width="100"><label for="birthday"><s:text name="registerform.birthday"/></label></th>
              <td>
                <input type="text" name="birthday" id="birthday" class="t_input" tabindex="9" maxlength="16" onFocus="WdatePicker({readOnly:true,highLineWeekDay:false})">
                <img onClick="WdatePicker({el:'date',readOnly:true,highLineWeekDay:false})" src="../js/datePicker/skin/datePicker.gif" width="16" height="22" align="middle"/>
              </td>
            </tr>
            <tr>
              <th width="100"><label for="phone"><s:text name="registerform.phone"/></label></th>
              <td><input type="text" name="phone" id="phone" class="t_input" tabindex="10" maxlength="16"></td>
            </tr>
            <tr>
              <th width="100"><label for="hobby"><s:text name="registerform.hobby"/></label></th>
              <td><textarea rows="3" cols="21" name="hobby" id="hobby" class="t_input" tabindex="11"></textarea></td>
            </tr>
            <tr>
              <th width="100"><label for="validateCode"><s:text name="registerform.validateCode"/></label></th>
              <td>
                <p>
                  <img src="random.action" onClick="Validate.changeCode(this)" title="Click to flush the random code"/>
                </p>
                <p>
                  <input type="text" name="validateCode" id="validateCode" class="t_input" tabindex="12" maxlength="16" 
                  		onBlur="Validate.required(this,6,6,'RandomCode required','userValiCodeError')">
                </p>
              </td>
              <td><div class="errorMsg" id="userValiCodeError"></div></td>
            </tr>
          </tbody>
          <tbody>
            <tr>
            <th width="100">&nbsp;</th>
              <td>
                <input type="submit" id="loginsubmit" name="loginsubmit" value='<s:text name="registerform.registerbtn"/>' class="submit" tabindex="13">
                <input type="reset" id="loginreset" name="loginreset" value='<s:text name="registerform.resetbtn"/>' class="reset" tabindex="14">
              </td>
            </tr>
          </tbody>
        </table>
      </form>
      
      <div id="photoDiv">      	
      	<table>
      		<tr>
      			<td><label><s:text name="registerform.defaultPhoto"/></label><br/></td>
      			<td></td>
      		</tr>
      		<tr>
      			<td></td>
      			<td><img id="photo" alt="DefaultPhoto" src="../pictures/default/default_male.png"><br></td>
      		</tr>

      	</table>
      </div>
    </div>
    
     <div id="footer">
        <p class="r_option">
          <a href="javascript:;" onClick="window.scrollTo(0,0);" id="a_top" title="TOP"><img src="../style/image/top.gif" alt="" style="padding: 5px 6px 6px;"></a>
        </p>
        <p><s:text name="footer.tip" /><a href="mailto:admin@gmail.com"><s:text name="footer.tipinfo" /></a>
      </div>
    
  </body>

</html>