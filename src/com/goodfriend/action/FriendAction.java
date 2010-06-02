package com.goodfriend.action;


import java.sql.Date;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.goodfriend.model.Mail;
import com.goodfriend.model.User;
import com.goodfriend.service.IFriendService;
import com.goodfriend.service.IMailService;
import com.goodfriend.service.IUserService;
import com.opensymphony.xwork2.ActionContext;

public class FriendAction implements ServletRequestAware {

	private IFriendService friendService;
	
	private IMailService mailService;

	private List<User> friends;

	private int pageNow = 1;

	private int pageSize = 5;

	private int totalPage;

	// 要查找的全部或部分用户名
	private String userName;

	// 表示点击分页链接后要将请求发送到哪个action
	private String pageAction;
	//保存请求添加你为好友的用户
	private List<User> requestList;
	
	// 表示要搜索的范围 是从自己的好友里搜索还是从所有用户里搜索
	private String scope;

	private HttpServletRequest request;
	
	/**
	 * 添加一个好友请求,向对方发送一封站内信
	 * @return
	 */
	public String addFriendToRequestList(){
		User user = (User) ActionContext.getContext().getSession().get(
		"currentUser");
		int friendID = Integer.parseInt(request.getParameter("friendId"));
		friendService.addFriendToRequest(user, friendID);
		System.out.println("asd");
		mailService.addFriendRequest(friendID, user);
		return "success";
	}
	/**
	 * 确定好友关系
	 * @return
	 */
	public String addFriend(){
		User user = (User) ActionContext.getContext().getSession().get(
		"currentUser");
		int friendID = Integer.parseInt(request.getParameter("friendId"));
		friendService.addFriend(user, friendID);

		return "success";
	}
	
	/**
	 * 拒绝一个用户的好友申请
	 * @return
	 */
	public String refuseFriend(){
		User user = (User) ActionContext.getContext().getSession().get(
		"currentUser");
		int friendID = Integer.parseInt(request.getParameter("friendId"));
		friendService.refuseFriend(user, friendID);

		return "success";
	}

	// 分页获得所有好友
	public String showFriends() {

		User user = (User) ActionContext.getContext().getSession().get(
				"currentUser");

		friends = friendService.getFriendsByPage(user, pageNow, pageSize);

		Collections.sort(friends);

		totalPage = friendService.getTotalPage(user, pageSize);
		
		requestList = friendService.getFriends(user, "N");

		pageAction = "showFriends";

		return "success";
	}

	// 从自己的好友中搜索部分好友
	public String searchFriends() {

		User user = (User) ActionContext.getContext().getSession().get(
				"currentUser");
		requestList = friendService.getFriends(user, "N");
		if (scope.equals("fromFriends")) {

			friends = friendService.searchFriendsByPage(user, userName,
					pageNow, pageSize);

			Collections.sort(friends);

			totalPage = friendService.getSearchedTotalPage(user, userName,
					pageSize);
		}else if (scope.equals("fromAll")){
			System.out.println(userName);
			return "searchUser";
		}

		pageAction = "searchFriends";

		return "success";
	}

	// 点击分页标签的时候调用这个方法
	public String getFriendsByPage() {
		User user = (User) ActionContext.getContext().getSession().get(
				"currentUser");
		requestList = friendService.getFriends(user, "N");
		if (pageAction.equals("searchFriends")) {
			friends = friendService.searchFriendsByPage(user, userName,
					pageNow, pageSize);
		} else if (pageAction.equals("showFriends")) {
			friends = friendService.getFriendsByPage(user, pageNow, pageSize);
		}
		return "success";
	}

	public String deleteFriend() {
		User user = (User) ActionContext.getContext().getSession().get(
				"currentUser");
		requestList = friendService.getFriends(user, "N");
		int friendID = Integer.parseInt(request.getParameter("friendId"));
		friendService.deleteFriend(user, friendID);

		return "success";
	}

	public IFriendService getFriendService() {
		return friendService;
	}

	public void setFriendService(IFriendService friendService) {
		this.friendService = friendService;
	}

	public IMailService getMailService() {
		return mailService;
	}
	public void setMailService(IMailService mailService) {
		this.mailService = mailService;
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

	public String getPageAction() {
		return pageAction;
	}

	public void setPageAction(String pageAction) {
		this.pageAction = pageAction;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}


	public void setServletRequest(HttpServletRequest arg0) {

		request = arg0;
	}

	public String getScope() {
		return scope;
	}

	public void setScope(String scope) {
		this.scope = scope;
	}

	public List<User> getRequestList() {
		return requestList;
	}

	public void setRequestList(List<User> requestList) {
		this.requestList = requestList;
	}

}
