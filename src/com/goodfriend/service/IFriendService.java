package com.goodfriend.service;

import java.util.List;

import com.goodfriend.model.Friends;
import com.goodfriend.model.User;

public interface IFriendService {
	public void addFriend(Friends friend);
	public List<User> getFriends(User owner);
	public void updateFriend(Friends friend);
	public void deleteFriend(Friends friend);
	
	public List<User> getFriendsByPage(User owner, int pageNow, int pageSize);
	
	public int getTotalPage(User owner, int pageSize);
}
