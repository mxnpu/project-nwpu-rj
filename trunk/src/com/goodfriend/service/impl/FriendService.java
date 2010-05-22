package com.goodfriend.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.goodfriend.dao.impl.FriendsDAO;
import com.goodfriend.dao.impl.UserDAO;
import com.goodfriend.model.Friends;
import com.goodfriend.model.User;
import com.goodfriend.service.IFriendService;
/**
 * 
 * @author 
 *
 */
public class FriendService implements IFriendService {
	
	private FriendsDAO friendDao;
	



	public void addFriend(Friends friend) {
		// TODO Auto-generated method stub

	}

	public void deleteFriend(Friends friend) {
		// TODO Auto-generated method stub

	}

	/**
	 * 获得该用户的所有好友
	 */
	public List<User> getFriends(User owner) {
		// TODO Auto-generated method stub
		

		
		Iterator<Friends> friendsIt1 = friendDao.findByProperty("user", owner).iterator();
		
		Iterator<Friends> friendsIt2 = friendDao.findByProperty("userFriend", owner).iterator();
		
		List<User> friendList = new ArrayList<User>();
		//利用set不能保存相同元素的特性
		HashSet<User> set = new HashSet<User>();
		
		Friends tempFriend;
		User tempUser;
		
		while(friendsIt1.hasNext()){
			System.out.println("friendsIt1");
			tempFriend = friendsIt1.next();
//			System.out.println(tempFriend.get);
			//双方已经同意建立好友关系
			if (tempFriend.getSuccess().equals("Y")){
				tempUser = tempFriend.getUserFriend();
				tempUser.getUserName();
				set.add(tempUser);
			}
			
		}
		
		while(friendsIt2.hasNext()){
			
			tempFriend = friendsIt2.next();
			//双方已经同意建立好友关系
			if (tempFriend.getSuccess().equals("Y")){
				tempUser = tempFriend.getUser();
				tempUser.getUserName();
				set.add(tempUser);
				
			}
			
		}
		
		Iterator<User> it = set.iterator();
		while(it.hasNext()){
			friendList.add(it.next());
		}
		
		
		return friendList;
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
	


	public List<User> getFriendsByPage(User owner, int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		List<User> friends = getFriends(owner);
		
		if (pageNow * pageSize - pageSize > friends.size()){
			return friends;
		}else if (pageNow * pageSize > friends.size()){
			return friends.subList(pageNow * pageSize - pageSize, friends.size());
		}else{
			return friends.subList(pageNow * pageSize - pageSize, pageNow * pageSize);
		}

	}

	public int getTotalPage(User owner, int pageSize) {
		// TODO Auto-generated method stub
		List<User> friends = getFriends(owner);
		return (int)Math.ceil(friends.size() / (double)pageSize);
	}

}
