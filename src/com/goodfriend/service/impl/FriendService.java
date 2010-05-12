package com.goodfriend.service.impl;

import java.util.List;

import com.goodfriend.dao.impl.FriendsDAO;
import com.goodfriend.model.Friends;
import com.goodfriend.model.User;
import com.goodfriend.service.IFriendService;

public class FriendService implements IFriendService {
	
	private FriendsDAO friendDao;

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

	public void setFriendDao(FriendsDAO friendDao) {
		this.friendDao = friendDao;
	}

	public FriendsDAO getFriendDao() {
		return friendDao;
	}

}
