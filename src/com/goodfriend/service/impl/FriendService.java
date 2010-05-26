package com.goodfriend.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

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
	
	private UserDAO userDao;


	public void addFriend(Friends friend) {
		// TODO Auto-generated method stub

	}

	public void deleteFriend(Friends friend) {
		// TODO Auto-generated method stub

		friendDao.delete(friend);
	}
	
	//添加id为friendID的用户为好友
	public void addFriend(User user, int friendID){
		User userFriend = userDao.findById(friendID);
		Friends friend = new Friends();
		friend.setGroup("");
		//暂时不需要对方同意
		friend.setSuccess("Y");
		
		friend.setUserFriend(userFriend);
		friend.setUser(user);

		friendDao.merge(friend);
	}
	
	//删除user和friend之间的好友关系
	public void deleteFriend(User user, int friendID){
		
		User friend = userDao.findById(friendID);
		
		Iterator<Friends> friendsIt1 = friendDao.findByProperty("user", user).iterator();
		
		Iterator<Friends> friendsIt2 = friendDao.findByProperty("userFriend", user).iterator();
	
		Friends tempFriend;
		
		User tempUser;
		
		while(friendsIt1.hasNext()){
			tempFriend = friendsIt1.next();
			tempUser = tempFriend.getUserFriend();
			if (tempUser.equals(friend)){
				
				deleteFriend(tempFriend);
				return;
			}
		}
		
		while(friendsIt2.hasNext()){
			tempFriend = friendsIt2.next();
			tempUser = tempFriend.getUser();
			if (tempUser.equals(friend)){
			
				deleteFriend(tempFriend);
				return;
			}
		}
	
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


	/**
	 * 根据部分用户名查找已经存在的好友
	 * @param owner
	 * @param userName
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public List<User> searchFriendsByPage(User owner, String userName, int pageNow, int pageSize){
		List<User> allFriends = getFriends(owner);
		List<User> friends = new ArrayList<User>();
		for (int i = 0; i < allFriends.size(); i++){
			if (allFriends.get(i).getUserName().contains(userName)){
				friends.add(allFriends.get(i));
			}
		}
		
		if (pageNow * pageSize - pageSize > friends.size()){
			return friends;
		}else if (pageNow * pageSize > friends.size()){
			return friends.subList(pageNow * pageSize - pageSize, friends.size());
		}else{
			return friends.subList(pageNow * pageSize - pageSize, pageNow * pageSize);
		}
	}
	
	public int getSearchedTotalPage(User owner, String userName, int pageSize){
		List<User> allFriends = getFriends(owner);
		List<User> friends = new ArrayList<User>();
		for (int i = 0; i < allFriends.size(); i++){
			if (allFriends.get(i).getUserName().contains(userName)){
				friends.add(allFriends.get(i));
			}
		}
		return (int)Math.ceil(friends.size() / (double)pageSize);
	}
	
	public UserDAO getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDAO userDao) {
		this.userDao = userDao;
	}

	public Friends getFriend(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

}