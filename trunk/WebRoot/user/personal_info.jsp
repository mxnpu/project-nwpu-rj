<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
  <jsp:include page="header.jsp"></jsp:include>
  <head>
    <title><s:text name="personal_info.pers"/></title>
   	<script type="text/javascript" src="../js/datePicker/WdatePicker.js"></script>
   	<script type="text/javascript" src="../js/image.js"></script>
   	<script type="text/javascript" src="../js/personInfo.js"></script>
  </head>
  
  <body onload="PersonInfo.ready();"> 
  <iframe src="about:blank" name="fileUploadFrame1" style="display:none;" >
  </iframe>
  <div id="wrap">
  	
  	<s:form action="fileUpload.action" method="post" enctype="multipart/form-data" id="fileForm"
  				target="fileUploadFrame1" >
    	&nbsp;&nbsp;<img id="photo" alt="Photo" src="${session.currentUser.photo}" width="150" height="200" />	
    	<s:file id="uploadimg" name="photo" 
			onchange="ImageObject.preViewImage(this.id, 'photo', 'little');
				document.getElementById('fileForm').submit();"></s:file>
	</s:form>
  	
    <form action="modifyInfo.action" method="post" id="infoForm">
    	<table width="400">
    		<tr>
    			<td><label><s:text name="personal_info.username"/></label></td>
    			<td>
    				<input type="text" value="${session.currentUser.userName }" id="username" name="username"
    					tabindex="1" maxlength="16" 
    					onBlur="Validate.required(this,4,16,'User Name Required','userNameError');
              				myNameValidateAjax.validate(this.value); "/>
              	</td>
    			<td><div class="errorMsg" id="userNameError"></div></td>
    		</tr>
    		<tr>
    			<td><label><s:text name="personal_info.password"/></label></td>
    			<td><input name="password" id="password" type="password" 
    					value='<s:property value="#session.currentUser.password"/>'
    					tabindex="2" maxlength="16" 
    					onBlur="Validate.required(this,4,16,'Password Required','passwordError'); "/>
    			</td>
    			<td><div class="errorMsg" id="passwordError"></div></td>
    		</tr>
    		<tr>
              <th width="100"><label for="confirmPassword"><s:text name="registerform.passwordConf"/></label></th>
              <td><input type="password" name="confirmPassword" id="confirmPassword" 
              			value='<s:property value="#session.currentUser.password"/>'
              			class="t_input" tabindex="4" maxlength="16" 
              		onBlur="Validate.required(this,4,16,'Password Confirm Required','passwordComfirmError'); "></td>
              <td><div class="errorMsg" id="passwordComfirmError"></div></td>
            </tr>
    		<tr>
    			<td><label><s:text name="personal_info.right_name"/></label></td>
    			<td>
    				<input name="realname" id="realname" type="text"
    					value='<s:property value="#session.currentUser.realName"/>'
    					tabindex="3" maxlength="16" 
    					onBlur="Validate.required(this,'RealName Required','realNameError'); "/>
    			</td>
    			<td><div class="errorMsg" id="realNameError"></div></td>
    		</tr>
    		<tr>
    			<td><label><s:text name="registerform.email"/></label></td>
    			<td>
    				<input name="email" id="email" type="text"
    					value='<s:property value="#session.currentUser.email"/>'
    					tabindex="4" maxlength="50" 
    					onBlur="Validate.email(this, 'validateEmailError')"/>
    			</td>
    			<td><div class="errorMsg" id="validateEmailError"></div></td>
    		</tr>
    		<tr>
    			<td><label><s:text name="personal_info.sex"/></label></td>
    			<td>
    				<s:if test='#session.currentUser.gender == "M"'>
    					<input name="gender" type="radio" value="male" checked="checked" tabindex="5"/>
    					<s:text name="personal_info.man"/> 
    					<input name="gender" type="radio" value="female" tabindex="6"/>
    					<s:text name="personal_info.woman"/>
    				</s:if>
    				<s:else>
    					<input name="gender" type="radio" value="male" tabindex="5"/>
    					<s:text name="personal_info.man"/> 
    					<input name="gender" type="radio" value="female" checked="checked" tabindex="6"/>
    					<s:text name="personal_info.woman"/>
    				</s:else>
    			</td>
    		</tr>
    		<tr>
    			<td><label><s:text name="home_birth"/></label></td>
    			<td>
    				<input type="text" name="birthday" id="birthday" 
    					class="t_input" tabindex="7" maxlength="16" 
    					onFocus="WdatePicker({readOnly:true,highLineWeekDay:false})"
    					value='<s:property value="#session.currentUser.birth"/>'>
                	<img onClick="WdatePicker({el:'date',readOnly:true,highLineWeekDay:false})" 
                		src="../js/datePicker/skin/datePicker.gif" width="16" height="22" align="middle"/>
                </td>
    		</tr>
    		<tr>
    			<td><label><s:text name="personal_info.phone"/></label></td>
    			<td><input name="phone" id="phone" type="text" 
    					tabindex="8" maxlength="16" 
						value='<s:property value="#session.currentUser.phone"/>'/></td>
    		</tr>
    		<tr>
    			<td><label><s:text name="home_love"/></label></td>
    			<td>
    				<textarea name="hobby" id="hobby" 
    					tabindex="9"
    					onfocus="javascript:this.innerHTML=this.innerHTML.trim();">
    					<s:property value="#session.currentUser.hoby"/>
    				</textarea>
    			</td>
    		</tr>
    		<tr>
              <th width="100"><label for="validateCode"><s:text name="registerform.validateCode"/></label></th>
              <td>
                <p>
                  <img src="random.action" onClick="Validate.changeCode(this)" title="Click to flush the random code"/>
                </p>
                <p>
                  <input type="text" name="validateCode" id="validateCode" 
                  		class="t_input" tabindex="10" maxlength="6" 
                  		onBlur="Validate.required(this,6,6,'RandomCode required','userValiCodeError')">
                </p>
              </td>
              <td><div class="errorMsg" id="userValiCodeError"></div></td>
            </tr>
    	</table>
    	<input type="button" value='<s:text name="personal_info.submit"/>' 
    		onclick="document.getElementById('infoForm').submit();">
    	<input type="reset" value='<s:text name="personal_info.reset"/>'>
    </form>
  </div>
  </body>
  <jsp:include page="footer.jsp"></jsp:include>
</html>
