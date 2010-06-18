package com.goodfriend.admin.action;

import com.goodfriend.admin.dto.AdminDTO;
import com.goodfriend.admin.dto.UserDTO;
import com.goodfriend.dao.IUserDAO;
import com.goodfriend.model.Admin;
import com.goodfriend.model.User;
import com.goodfriend.service.IAdminService;
import com.goodfriend.service.IUserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.ArrayList;
import java.util.List;

public class SearchUserAction{
	private IUserService userService;
	private IAdminService adminService;
	private List<User> userlists ;
	private List<Admin> adminlists;
	private User user = new User();
	private Admin admin = new Admin();
	private List<User> lists1 = new ArrayList();
	private List<Admin> lists0 = new ArrayList();
	private UserDTO userDTO;
	private AdminDTO adminDTO;
	private int id_user;
	private int id_admin;
	private String realname;
	private String isAdmin;
	private String username;
	//private String gender;
	
	//private IUserService userService;
	

	public String searchUser () throws Exception{
		
		System.out.println(isAdmin);
		System.out.println(username);
		System.out.println(realname);
		//System.out.println(gender);
		
		//如果用户名和真名都不为空
		if(username!=null && !username.equals("") && realname!=null && !realname.equals("")){
			
			if(isAdmin.equals("true")){ //如果是管理员
				if(adminService.getAdmins()!=null){
					adminlists=adminService.getAdmins();
					for(int i=0; i<adminlists.size(); i++){ // 完全匹配
						if(adminlists.get(i).getUsername().equals(username) && adminlists.get(i).getRealName().equals(realname)){
							lists0.add(adminlists.get(i));
						}
					}
					for(int i=0; i<adminlists.size();i++){ //只有username匹配
						if(adminlists.get(i).getUsername().equals(username)&& !adminlists.get(i).getRealName().equals(realname)&& adminlists.get(i).getRealName().contains(realname)){
							lists0.add(adminlists.get(i));
						}
					}
					for(int i=0; i<adminlists.size();i++){ //只有realname匹配
						if(!adminlists.get(i).getUsername().equals(username) && adminlists.get(i).getUsername().contains(username)&& adminlists.get(i).getRealName().equals(realname)){
							lists0.add(adminlists.get(i));
						}
					}
					for(int i=0; i<adminlists.size();i++){ //模糊匹配
						if(!adminlists.get(i).getUsername().equals(username) && adminlists.get(i).getUsername().contains(username)&& !adminlists.get(i).getRealName().equals(realname)&& adminlists.get(i).getRealName().contains(realname)){
							lists0.add(adminlists.get(i));
						}
					}
					if(lists0.size()!=0){
						return "adminSuccess";//返回管理员列表
					}else
						return "null";
				}
				else return "null"; //搜索结果为空
			}
			else{ //如果是用户
				if(userService.getUsers()!=null){
					userlists=userService.getUsers();
					for(int i=0; i<userlists.size(); i++){
						if(userlists.get(i).getUserName().equals(username) && userlists.get(i).getRealName().equals(realname)){
							lists1.add(userlists.get(i));
						}
					}
					for(int i=0; i<userlists.size(); i++){
						if(userlists.get(i).getUserName().equals(username) && !userlists.get(i).getRealName().equals(realname) && userlists.get(i).getRealName().contains(realname)){
							lists1.add(userlists.get(i));
						}
					}
					for(int i=0; i<userlists.size(); i++){
						if(!userlists.get(i).getUserName().equals(username) && userlists.get(i).getUserName().contains(username) && userlists.get(i).getRealName().equals(realname)){
							lists1.add(userlists.get(i));
						}
					}
					for(int i=0; i<userlists.size(); i++){
						if(!userlists.get(i).getUserName().equals(username) && userlists.get(i).getUserName().contains(username) && !userlists.get(i).getRealName().equals(realname) && userlists.get(i).getRealName().contains(realname)){
							lists1.add(userlists.get(i));
						}
					}
					if(lists1.size()!=0){
						return "userSuccess"; //返回用户列表
					}else 
						return "null";
				}else
					return "null";
			}
			//如果用户名不空 真名为空
		}else if(username!=null && !username.equals("") && (realname==null || realname.equals(""))){
			
			if(isAdmin.equals("true")){ //如果是管理员
				if(adminService.getAdmins()!=null){
					adminlists=adminService.getAdmins();
					for(int i=0; i<adminlists.size(); i++){
						if(adminlists.get(i).getUsername().equals(username)){
							lists0.add(adminlists.get(i));
						}
					}
					for(int i=0; i<adminlists.size(); i++){
						if(!adminlists.get(i).getUsername().equals(username) && adminlists.get(i).getUsername().contains(username)){
							lists0.add(adminlists.get(i));
						}
					}
					if(lists0.size()!=0){
						return "adminSuccess";  //返回管理员列表
					}else
						return "null";
				}
				else return "null"; //搜索结果为空
			}
			else{
				if(userService.getUsers()!=null){
					userlists=userService.getUsers();
					for(int i=0; i<userlists.size(); i++){
						if(userlists.get(i).getUserName().equals(username)){
							lists1.add(userlists.get(i));
						}
					}
					for(int i=0; i<userlists.size(); i++){
						if(!userlists.get(i).getUserName().equals(username) && userlists.get(i).getUserName().contains(username)){
							lists1.add(userlists.get(i));
						}
					}
					if(lists1.size()!=0){
						return "userSuccess"; //返回用户列表
					}else 
						return "null";
				}else
					return "null";
			}
			//如果用户名为空 真名不空
		}else if((username==null || username.equals("")) && realname!=null && !realname.equals("")){
			
			if(isAdmin.equals("true")){ //如果是管理员
				if(adminService.getAdmins()!=null){
					adminlists=adminService.getAdmins();
					for(int i=0; i<adminlists.size(); i++){
						if(adminlists.get(i).getRealName().equals(realname)){
							lists0.add(adminlists.get(i));
						}
					}
					for(int i=0; i<adminlists.size(); i++){
						if(!adminlists.get(i).getRealName().equals(realname) && adminlists.get(i).getRealName().contains(realname)){
							lists0.add(adminlists.get(i));
						}
					}
					if(lists0.size()!=0){
						return "adminSuccess";  //返回管理员列表
					}else
						return "null";
				}
				else return "null"; //搜索结果为空
			}
			else{
				if(userService.getUsers()!=null){
					userlists=userService.getUsers();
					for(int i=0; i<userlists.size(); i++){
						if(userlists.get(i).getRealName().equals(realname)){
							lists1.add(userlists.get(i));
						}
					}
					for(int i=0; i<userlists.size(); i++){
						if(!userlists.get(i).getRealName().equals(realname) && userlists.get(i).getRealName().contains(realname)){
							lists1.add(userlists.get(i));
						}
					}
					if(lists1.size()!=0){
						return "userSuccess"; //返回用户列表
					}else 
						return "null";
				}else
					return "null";
			}
		}else{
			//如果用户名和真名都为空的话 返回错误提示
			ActionContext.getContext().put("errorMsg", "the username and realname can't be null");
			return "false";
		}
	}
	
	public String deleteUser() {
		userService.deleteUser(userService.getUser(id_user));
		return "delete_user";
	}
	public String deleteAdmin() {
		adminService.deleteUser(adminService.getAdmin(id_admin));
		return "delete_admin";
	}
	
	public String userUpdateInput() {
		user = userService.getUser(id_user);
		//System.out.println(user.getUserName());
		return "user_update_input";
	}
	public String adminUpdateInput() {
		admin = adminService.getAdmin(id_admin);
		//System.out.println(admin.getUsername());
		return "admin_update_input";
	}
	
	public String userUpdate() {		
		userService.updateUser(user);
		return "user_update_success";
	}
	public String adminUpdate() {		
		adminService.updateAdmin(admin);
		return "admin_update_success";
	}

	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	public IAdminService getAdminService() {
		return adminService;
	}

	public void setAdminService(IAdminService adminService) {
		this.adminService = adminService;
	}

	public List<User> getUserlists() {
		return userlists;
	}

	public void setUserlists(List<User> userlists) {
		this.userlists = userlists;
	}

	public List<Admin> getAdminlists() {
		return adminlists;
	}

	public void setAdminlists(List<Admin> adminlists) {
		this.adminlists = adminlists;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public List<User> getLists1() {
		return lists1;
	}

	public void setLists1(List<User> lists1) {
		this.lists1 = lists1;
	}

	public List<Admin> getLists0() {
		return lists0;
	}

	public void setLists0(List<Admin> lists0) {
		this.lists0 = lists0;
	}

	public UserDTO getUserDTO() {
		return userDTO;
	}

	public void setUserDTO(UserDTO userDTO) {
		this.userDTO = userDTO;
	}

	public int getId_user() {
		return id_user;
	}

	public void setId_user(int idUser) {
		id_user = idUser;
	}

	public int getId_admin() {
		return id_admin;
	}

	public void setId_admin(Integer idAdmin) {
		id_admin = idAdmin;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public AdminDTO getAdminDTO() {
		return adminDTO;
	}

	public void setAdminDTO(AdminDTO adminDTO) {
		this.adminDTO = adminDTO;
	}

	public void setId_admin(int idAdmin) {
		id_admin = idAdmin;
	}
	

}
