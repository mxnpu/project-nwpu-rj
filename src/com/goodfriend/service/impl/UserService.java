package com.goodfriend.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.goodfriend.dao.IUserDAO;
import com.goodfriend.model.User;
import com.goodfriend.service.IUserService;

public class UserService implements IUserService {

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
	
	public void updateUser(Integer id, User user) {

		User oldUser = userDao.findById(id);
		oldUser.setUserName(user.getUserName());
		oldUser.setRealName(user.getRealName());
		oldUser.setGender(user.getGender());
		oldUser.setBirthday(user.getBirthday());
		oldUser.setPhone(user.getPhone());
		oldUser.setEmail(user.getEmail());
		oldUser.setHoby(user.getHoby());
		oldUser.setPhoto(user.getPhoto());
		oldUser.setLastLogoutTime(user.getLastLogoutTime());
		userDao.attachDirty(oldUser);		
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

	public List<User> getAllUsers() {
		// TODO Auto-generated method stub
		return userDao.findAll();
	}

	public List<User> searchUser(String userName){
		List<User> allUsers = userDao.findAll();
		List<User> result = new ArrayList<User>();
		
		for(int i = 0; i < allUsers.size(); i++){
			if (allUsers.get(i).getUserName().contains(userName)){
				result.add(allUsers.get(i));
			}
		}
		
		return result;
	}

	public int getTotalPage(String userName, int pageSize) {
	
		List<User> users = searchUser(userName);
		return (int)Math.ceil(users.size() / (double)pageSize);
	}

	public List<User> searchUserByPage(String userName, int pageNow,
			int pageSize) {
		// TODO Auto-generated method stub
		List<User> users = searchUser(userName);
		if (pageNow * pageSize - pageSize > users.size()){
			return users;
		}else if (pageNow * pageSize > users.size()){
			return users.subList(pageNow * pageSize - pageSize, users.size());
		}else{
			return users.subList(pageNow * pageSize - pageSize, pageNow * pageSize);
		}
		
	}
	
	
}
