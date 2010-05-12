package com.goodfriend.action;

import java.util.HashMap;
import java.util.Map;

import com.goodfriend.model.User;
import com.goodfriend.service.IUserService;
import com.opensymphony.xwork2.ActionContext;

/**
 * 用户登录请求处理Action类
 * 
 * @author xurunhua
 * Last Modified time 2010.05.12
 */
public class LoginAction {
	private static final long serialVersionUID = 1L;

	private IUserService userService;
	private String username;
	private String password;
	private String validateCode;
	private Map<String, Object> session;

	public String login() throws Exception {

		User dbUser = userService.getUser(username);
		// 判断用户名和密码
		if (dbUser != null && dbUser.getPassword().equals(password)) {
			session = (Map<String, Object>) ActionContext.getContext()
					.getSession();
			if (session == null) {
				session = new HashMap<String, Object>();
			}
			session.put("currentUser", dbUser);
			return "success";
		} else {

		}

		return "login";
	}

	public String logout() throws Exception {
		session = (Map<String, Object>) ActionContext.getContext().getSession();
		session.remove("currentUser");
		return "login";
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUsername() {
		return username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword() {
		return password;
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
