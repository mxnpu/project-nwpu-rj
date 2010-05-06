package com.goodfriend.daomanager.impl;

import java.util.List;

import com.goodfriend.dao.impl.FriendsDAO;
import com.goodfriend.daomanager.IFriendDaoManager;
import com.goodfriend.model.Friends;
import com.goodfriend.model.User;

public class FriendDaoManager implements IFriendDaoManager {
	
	private FriendsDAO fiendDao;

	public void addFriend(Friends friend) {
		// TODO Auto-generated method stub

	}

	public void deleteFriend(Friends friend) {
		// TODO Auto-generated method stub

	}

	public List<User> getFriends(User owner) {
		// TODO Auto-generated method stub
		return null;
	}

	public void updateFriend(Friends friend) {
		// TODO Auto-generated method stub

	}

	public void setFiendDao(FriendsDAO fiendDao) {
		this.fiendDao = fiendDao;
	}

	public FriendsDAO getFiendDao() {
		return fiendDao;
	}

}
