package com.goodfriend.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.goodfriend.dao.impl.UserDAO;
import com.goodfriend.model.User;
import com.opensymphony.xwork2.ActionContext;

public class LoginAction {
	private static final long serialVersionUID = 1L;

	private UserDAO userDao;
	private User user;
	private Map<String, Object> session;
	
	public String execute() throws Exception {
		System.out.println("login action execute...........");
		List<User> users = userDao.findByUserName(user.getUserName());
		if (users != null) {
			for (User temp : users) {
				if (temp.getPassword().equals(user.getPassword())) {
					session = (Map<String, Object>) ActionContext.getContext().getSession();
					if (session == null) {
						session = new HashMap<String, Object>();
					}
					session.put("currentUser", temp);
					return "success";
				}
			}
		}
		return "login";
	}
	
	public void setUserDao(UserDAO userDao) {
		this.userDao = userDao;
	}

	public UserDAO getUserDao() {
		return userDao;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public User getUser() {
		return user;
	}
	
	
	
}
