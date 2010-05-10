package com.goodfriend.action;

import java.util.Date;

import org.apache.commons.lang.time.DateUtils;

import com.goodfriend.model.User;
import com.goodfriend.service.IUserService;
import com.opensymphony.xwork2.ActionContext;

public class RegisterAction {
	private String username;
	private String password;
	private String confirmPassword;
	private String realname;
	private String gender;
	private String birthday;
	private String phone;
	private String email;
	private String hoby;
	private String validateCode;

	private static final String SUCCESS = "success";
	private static final String FAILED = "failed";

	private IUserService userService;

	public String register() throws Exception {
		
		//从session中取出RandomAction.java 中生成的验证码 random  
		String randomString =(String)(ActionContext.getContext().getSession().get("random"));
		if (randomString.toLowerCase().equals(validateCode.toLowerCase())) {
			
			if (!userService.isUserExist(username)) {
			
				User user = new User();
				if (username != null && !username.equals("")) {
					user.setUserName(username);
				} else {
					return FAILED;
				}
				if (password != null && confirmPassword != null
						&& !password.equals("")
						&& password.equals(confirmPassword)) {
					user.setPassword(password);
				} else {
					return FAILED;
				}
				if (realname != null && !realname.equals("")) {
					user.setRealName(realname);
				} else {
					return FAILED;
				}
				if (gender != null && gender.equals("male")) {
					user.setGender("M");
				} else if (gender != null && gender.equals("female")) {
					user.setGender("F");
				} else {
					user.setGender("");
				}
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
				if (phone != null) {
					user.setPhone(phone);
				} else {
					user.setPhone("");
				}

				if (email != null) {
					user.setEmail(email);
				} else {
					user.setEmail("");
				}
				if (hoby != null) {
					user.setHoby(hoby);
				} else {
					user.setHoby("");
				}
				user.setPhoto("Default psth");

				userService.addUser(user);

				if (userService.isUserExist(username)) {
					ActionContext.getContext().getSession().put("currentUser", user);
					return SUCCESS;
				} else {
					return FAILED;
				}

			}
			else {
				
			}
		}
		else {
			
		}
		return FAILED;
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

	public String getHoby() {
		return hoby;
	}

	public void setHoby(String hoby) {
		this.hoby = hoby;
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
}
