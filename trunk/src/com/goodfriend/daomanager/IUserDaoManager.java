package com.goodfriend.daomanager;

import java.util.List;

import com.goodfriend.model.User;

/**
 * The the manager DAO to the user
 * 
 * @author
 * @version 
 * Last modify time : 2010.05.03 
 */
public interface IUserDaoManager {
	public void addUser(User user);
	public User getUser(Integer id);
	public User getUser(String userName);
	public List<User> getUsers();
	public void updateUser(User user);
	public void deleteUser(User user);
	public boolean isUserExist(String username);
}