package com.goodfriend.action;

import java.util.HashMap;
import java.util.Map;

import com.goodfriend.model.User;
import com.goodfriend.service.IUserService;
import com.opensymphony.xwork2.ActionContext;

public class LoginAction {
	private static final long serialVersionUID = 1L;

	private IUserService userService;
	private String username;
	private String password;
	private String validateCode;
	private Map<String, Object> session;

	public String login() throws Exception {
		
		//从session中取出RandomAction.java 中生成的验证码 random  
		String randomString =(String)(ActionContext.getContext().getSession().get("random")); 
		
		// 判断验证码是否正确
		if (randomString.equals(validateCode)) {
			User dbUser = userService.getUser(username);
			// 判断用户名和密码
			if (dbUser != null && dbUser.getPassword().equals(password) ){
				session = (Map<String, Object>) ActionContext.getContext()
						.getSession();
				if (session == null) {
					session = new HashMap<String, Object>();
				}
				session.put("currentUser", dbUser);
				return "success";
			}
			else {
				
			}
		}
		else {
			ActionContext.getContext().getSession().put("errorMsg","验证码没有匹配");
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
