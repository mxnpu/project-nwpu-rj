package com.goodfriend.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Map;

import org.apache.commons.lang.time.DateUtils;

import com.goodfriend.model.User;
import com.goodfriend.service.IUserService;
import com.opensymphony.xwork2.ActionContext;

/**
 * 用户注册请求处理Action类
 * 
 * @author xurunhua
 * @CreateTime 2010.05.13
 * @LastModifiedtime 2010.05.13
 */
public class RegisterAction {
    private String username;
    private String password;
    private String confirmPassword;
    private String realname;
    private String gender;
    private String birthday;
    private String phone;
    private String email;
    private String hobby;
    private String validateCode;

    private InputStream inputStream;

    private static final String SUCCESS = "success";
    private static final String FAILED = "failed";

    private IUserService userService;

    /**
     * 处理用户注册请求的方法
     * 
     * @return
     * @throws Exception
     */
    public String register() throws Exception {

	// 从session中取出RandomAction.java 中生成的验证码 random
	String randomString = (String) (ActionContext.getContext().getSession()
		.get("random"));
	if (randomString.toLowerCase().equals(validateCode.toLowerCase())) {

	    if (!userService.isUserExist(username)) {

		User user = new User();

		/* validate the user name */
		if (username != null && !username.equals("")) {
		    if (username.length() < 4 | username.length() > 16) {
			ActionContext.getContext().put("errorMsg",
				"用户名长度应在4-16");
			return FAILED;
		    }
		    user.setUserName(username);
		} else {
		    ActionContext.getContext().put("errorMsg", "用户名不能为空");
		    return FAILED;
		}

		/* validate the pass word */
		if (password != null && confirmPassword != null
			&& !password.equals("")
			&& password.equals(confirmPassword)) {
		    user.setPassword(password);
		} else {
		    ActionContext.getContext().put("errorMsg",
			    "密码不能为空或两次输入密码不一致");
		    return FAILED;
		}

		/* validate the real name. */
		if (realname != null && !realname.equals("")) {
		    user.setRealName(realname);
		} else {
		    ActionContext.getContext().put("errorMsg", "真实用户名不能为空");
		    return FAILED;
		}

		/* validate the gender. */
		if (gender != null && gender.equals("male")) {
		    user.setGender("M");
		} else if (gender != null && gender.equals("female")) {
		    user.setGender("F");
		} else {
		    user.setGender("");
		}

		/* validate the birthday. */
		if (birthday != null && !birthday.equals("")) {
		    String[] pattern = new String[] { "yyyy-MM", "yyyyMM",
			    "yyyy/MM", "yyyyMMdd", "yyyy-MM-dd", "yyyy/MM/dd",
			    "yyyyMMddHHmmss", "yyyy-MM-dd HH:mm:ss",
			    "yyyy/MM/dd HH:mm:ss" };
		    Date date = DateUtils.parseDate(birthday, pattern);
		    user.setBirthday(date);
		} else {
		    user.setBirthday(new Date());
		}

		/* validate the phone */
		if (phone != null) {
		    user.setPhone(phone);
		} else {
		    user.setPhone("");
		}

		/* validate the email */
		if (email != null) {
		    user.setEmail(email);
		} else {
		    user.setEmail("");
		}

		/* validate the hobby. */
		if (hobby != null) {
		    user.setHoby(hobby);
		} else {
		    user.setHoby("");
		}

		if (gender != null && gender.equals("male")) {
		    user.setPhoto("../pictures/default/default_male.png");
		} else {
		    user.setPhoto("../pictures/default/default_female.png");
		}

		userService.addUser(user);

		if (userService.isUserExist(username)) {
		    ActionContext.getContext().getSession().put("currentUser",
			    user);
		    return SUCCESS;
		} else {
		    ActionContext.getContext().put("errorMsg", "Sorry,服务器内部错误");
		    return FAILED;
		}

	    } else {
		ActionContext.getContext().put("errorMsg", "该用户名已被注册");
	    }
	} else {
	    ActionContext.getContext().put("errorMsg", "验证码错误,请重新输入");
	}
	return FAILED;
    }

    /**
     * 异步交互时，验证用户名是否已经存在 如果存在，不允许使用注册
     * 
     * @return success
     */
    public String validateName() throws Exception {
	System.out.println("execute.... validate name ......");
	Map<String, Object> parameters = ActionContext.getContext()
		.getParameters();
	String[] parameter = (String[]) parameters.get("valiName");
	System.out.println(parameter[0]);
	if (userService.isUserExist(parameter[0])) {
	    toInStream("用户名已经存在");
	} else {
	    toInStream("可以注册");
	}
	return SUCCESS;
    }

    private void toInStream(String str) {
	try {

	    inputStream = new ByteArrayInputStream(str.getBytes("utf-8"));

	} catch (UnsupportedEncodingException e) {
	    e.printStackTrace();
	}

    }

    public String getUsername() {
	return username;
    }

    public void setUsername(String username) {
	this.username = username;
    }

    public String getPassword() {
	return password;
    }

    public void setPassword(String password) {
	this.password = password;
    }

    public String getConfirmPassword() {
	return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
	this.confirmPassword = confirmPassword;
    }

    public String getRealname() {
	return realname;
    }

    public void setRealname(String realname) {
	this.realname = realname;
    }

    public String getGender() {
	return gender;
    }

    public void setGender(String gender) {
	this.gender = gender;
    }

    public String getBirthday() {
	return birthday;
    }

    public void setBirthday(String birthday) {
	this.birthday = birthday;
    }

    public String getPhone() {
	return phone;
    }

    public void setPhone(String phone) {
	this.phone = phone;
    }

    public String getEmail() {
	return email;
    }

    public void setEmail(String email) {
	this.email = email;
    }

    public void setValidateCode(String validateCode) {
	this.validateCode = validateCode;
    }

    public String getValidateCode() {
	return validateCode;
    }

    public void setUserService(IUserService userService) {
	this.userService = userService;
    }

    public IUserService getUserService() {
	return userService;
    }

    public void setInputStream(InputStream inputStream) {
	this.inputStream = inputStream;
    }

    public InputStream getInputStream() {
	return inputStream;
    }

    /**
     * @param hobby the hobby to set
     */
    public void setHobby(String hobby) {
	this.hobby = hobby;
    }

    /**
     * @return the hobby
     */
    public String getHobby() {
	return hobby;
    }
}
