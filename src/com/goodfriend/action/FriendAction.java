package com.goodfriend.action;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.goodfriend.model.Friends;
import com.goodfriend.model.User;
import com.goodfriend.service.IFriendService;
import com.goodfriend.service.IUserService;
import com.opensymphony.xwork2.ActionContext;

public class FriendAction {
	
	private IFriendService friendService;
	
	private List<User> friends;
	
	private int pageNow = 1;

	private int pageSize = 5;

	private int totalPage;


	//分页获得所有好友
	public String showFriends(){
		
		User user = (User)ActionContext.getContext().getSession().get("currentUser");
		
		friends = friendService.getFriendsByPage(user, pageNow, pageSize);
		Collections.sort(friends);
		for (int i = 0; i < friends.size(); i++){
			System.out.println(friends.get(i).getUserName());
		}
		totalPage = friendService.getTotalPage(user, pageSize);
		
		return "success";
	}
	
	public IFriendService getFriendService() {
		return friendService;
	}

	public void setFriendService(IFriendService friendService) {
		this.friendService = friendService;
	}


	public List<User> getFriends() {
		return friends;
	}

	public void setFriends(List<User> friends) {
		this.friends = friends;
	}

	public int getPageNow() {
		return pageNow;
	}

	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}


}
