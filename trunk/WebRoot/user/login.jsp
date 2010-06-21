<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	
		<title><s:text name="title.login"></s:text></title>
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
				<div class="nav_account" style="width: 250px;">
					<br>
					<s:text name="header.welcome"></s:text>
					<s:if test="#session.currentUser.userName != null">
						, <s:property value="#session.currentUser.userName"/>
					</s:if>
					<br>      
					<a href="tologin.action"><s:text name="header.login"></s:text></a> |
					<a href="toregister.action"><s:text name="header.register"></s:text></a>
					 
					<s:set name="current_locale" 
  							value="#session['WW_TRANS_I18N_LOCALE'] == null ? locale : #session['WW_TRANS_I18N_LOCALE']"/>
  	
  					<s:url id="chinese_url" value="select.action">
  						<s:param name="request_locale" value="@java.util.Locale@CHINA"/>
  					</s:url>
  					<s:url id="english_url" value="select.action">
  						<s:param name="request_locale" value="@java.util.Locale@US"/>
  					</s:url>
  	
  					<s:if test="#current_locale.equals(@java.util.Locale@CHINA)">
  						| <s:a href="%{#chinese_url}"><strong><s:text name="chinese"/></strong></s:a>
  						<s:a href="%{#english_url}"><s:text name="english"/></s:a>
  					</s:if>
  					<s:else>
  						| <s:a href="%{#chinese_url}"><s:text name="chinese"/></s:a>
  						<s:a href="%{#english_url}"><strong><s:text name="english"/></strong></s:a>
 				 	</s:else>
			 
				</div>
			</div>
		</div>
  	
  	
    <div id="wrap">
      <form id="loginform" name="loginform" action="login" method="post" class="c_form">
        <table cellpadding="0" cellspacing="0" class="formtable">
          <caption>
            <h2><s:text name="loginform.caption"></s:text></h2>
            <p><s:text name="loginform.captiontips"></s:text></p>   
          </caption>
			
          <tbody style="display:;">
            <tr>
            	<td></td>
            	<td><div class="errorMsg">${requestScope.errorMsg }</div></td>
            </tr>
            <tr>
              <th width="100"><label for="username"><s:text name="loginform.username"></s:text></label></th>
              <td><input type="text" name="username" id="username" class="t_input" tabindex="2" 
		              onBlur="Validate.required(this,4,16,'UserNameRequired','userNameError');"></td>
              <td><div class="errorMsg" id="userNameError"></div></td>
            </tr>
            <tr>
              <th width="100"><label for="password"><s:text name="loginform.password"></s:text></label></th>

              <td><input type="password" name="password" id="password" class="t_input" tabindex="3" 
              		onBlur="Validate.required(this,4,16,'PasswordRequired','userPasswordError')"
              		></td>

              <td><div class="errorMsg" id="userPasswordError"></div></td>
            </tr>
            <tr>
              <th width="100"></th>
              <td>
              	<input type="radio" value="admin" name="purview"/><s:text name="loginform.admin"></s:text>
              	<input type="radio" value="user" name="purview" checked="checked"/><s:text name="loginform.user"></s:text>
              </td>
              <td></td>
            </tr>
            
          </tbody>
          <tbody>
            <tr>
            <th width="100">&nbsp;</th>
              <td>
                <input type="button" id="loginsubmit" name="loginsubmit" value='<s:text name="loginform.loginbtn"></s:text>' class="submit" 
                	tabindex="5" onClick="this.disabled=true;this.form.submit();">
              </td>
            </tr>
          </tbody>
        </table>
      </form>
      
      <div class="c_form">
        <table cellpadding="0" cellspacing="0" class="formtable">
          <caption>
          <h2><s:text name="bottom.tip" /></h2>
          <p><s:text name="bottom.tipinfo" /></p>
          </caption>
          <tbody>
            <tr>
              <td>
                <a href="toregister.action" id="register">
                  <strong><s:text name="bottom.registerbtn" /></strong>
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
        <p><s:text name="footer.tip" />
        	<a href="mailto:admin@gmail.com"><s:text name="footer.tipinfo" /></a>
      </div>
  </body>

</html>
