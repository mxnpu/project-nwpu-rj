package com.goodfriend.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.goodfriend.service.IUserService;
import com.goodfriend.model.User;

public class UserAction implements ServletRequestAware{

	private IUserService userService;
	
	private List<User> users;
	
	private int pageNow = 1;

	private int pageSize = 5;
	
	private int totalPage;

	private HttpServletRequest request;
	
	private String userName;
	

	public String searchUser(){
		if (request.getParameter("userName") != null){
			userName = request.getParameter("userName");
			System.out.println(userName);
		}
		users = userService.searchUserByPage(userName, pageNow, pageSize);
		totalPage = userService.getTotalPage(userName, pageSize);
		
		return "success";
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
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

	public void setServletRequest(HttpServletRequest arg0) {

		request = arg0;
	}	
	
	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

}
