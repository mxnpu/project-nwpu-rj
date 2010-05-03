package com.goodfriend.daomanager.impl;

import java.util.List;

import com.goodfriend.dao.IUserDAO;
import com.goodfriend.daomanager.IUserDaoManager;
import com.goodfriend.model.User;

public class UserDaoManager implements IUserDaoManager {

	private IUserDAO userDao;
	
	public void addUser(User user) {
		userDao.save(user);
	}

	public void deleteUser(User user) {
		userDao.delete(user);
	}

	public User getUser(Integer id) {
		User user = null;
		user = userDao.findById(id);
		return user;
	}

	public User getUser(String userName) {
		User user = null;
		List<User> users = null;
		users = userDao.findAll();
		for (User temp : users) {
			if (temp.getUserName().equals(userName)) {
				user = temp;
				break;
			}
		}
		return user;
	}

	public List<User> getUsers() {
		List<User> users = null;
		users = userDao.findAll();
		return users;
	}

	public void updateUser(User user) {
		userDao.attachDirty(user);
	}

	public void setUserDao(IUserDAO userDao) {
		this.userDao = userDao;
	}

	public IUserDAO getUserDao() {
		return userDao;
	}

	public boolean isUserExist(String username) {
		List<User> users = userDao.findByUserName(username);
		for(User temp : users) {
			if (temp.getUserName().equals(username)) {
				return true;
			}
		}
		return false;
	}

}
