package com.goodfriend.action;

import java.util.HashMap;
import java.util.Map;

import com.goodfriend.daomanager.IUserDaoManager;
import com.goodfriend.model.User;
import com.opensymphony.xwork2.ActionContext;

public class LoginAction {
	private static final long serialVersionUID = 1L;

	private IUserDaoManager userDaoManager;
	private User user;
	private Map<String, Object> session;

	public String login() throws Exception {
		System.out.println("login action execute...........");
		User dbUser = userDaoManager.getUser(user.getUserName());
		if (dbUser != null && dbUser.getPassword().equals(user.getPassword())){
			session = (Map<String, Object>) ActionContext.getContext()
					.getSession();
			if (session == null) {
				session = new HashMap<String, Object>();
			}
			session.put("currentUser", dbUser);
			return "success";
		}
		return "login";
	}

	public String logout() throws Exception {
		session = (Map<String, Object>) ActionContext.getContext().getSession();
		session.remove("currentUser");
		return "index";
	}
	
	public void setUser(User user) {
		this.user = user;
	}

	public User getUser() {
		return user;
	}

	public void setUserDaoManager(IUserDaoManager userDaoManager) {
		this.userDaoManager = userDaoManager;
	}

	public IUserDaoManager getUserDaoManager() {
		return userDaoManager;
	}

}
