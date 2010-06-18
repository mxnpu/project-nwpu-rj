package com.goodfriend.admin.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.goodfriend.admin.dto.PlacardDTO;
import com.goodfriend.admin.dto.UserDTO;
import com.goodfriend.dao.IFriendsDAO;
import com.goodfriend.model.Placard;
import com.goodfriend.model.User;
import com.goodfriend.service.IFriendService;
import com.goodfriend.service.IPlacardService;
import com.goodfriend.service.IUserService;
import com.opensymphony.xwork2.ActionSupport;


public class ManagerUserAction extends ActionSupport implements SessionAware {

	private static final String FAILED = "failed";
	private int id;
	private String isMale;
	private String isFemale;
	private Map<String, Object> session;
	private User user = new User();
	private UserDTO userDTO;
	private List<User> userLists;
	private IUserService userService;
	private IFriendService friendService;
	/**
	 * 删除用户项
	 * @return
	 */
	public String delete() {
		
		userService.deleteUser(userService.getUser(id));
		//friendService.增加删除关联表
		return "del_success";
	} 
	
	public int getId() {
		return id;
	}

	
	public User getUser() {
		return user;
	}
	
	public UserDTO getUserDTO() {
		return userDTO;
	}
	
	public List<User> getUserLists() {
		return userLists;
	}

	public IUserService getUserService() {
		return userService;
	}

	/**
	 * 显示用户列表
	 * @return
	 */
	public String list() {
		
		userLists = userService.getUsers();
		return "User_list";
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setUserDTO(UserDTO userDTO) {
		this.userDTO = userDTO;
	}

	public void setUserLists(List<User> userLists) {
		this.userLists = userLists;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	/**
	 * 更新用户信息
	 * @return
	 */
	public String update() {
		
		userService.updateUser((Integer)session.get("idUser"), user);
		return "update_success";
	}

	/**
	 * 更新用户信息输入表项
	 * @return
	 */
	public String updateInput() {
		
		user = userService.getUser(id);
		session.put("idUser", id);
		return "update_input";
	}	
	/**
	 * 更新用户信息输入表项
	 * @return
	 */
	public String viewUserInfo() {
		
		user = userService.getUser(id);
		session.put("idUser", id);
		return "view_user_info";
	}	
	
}
