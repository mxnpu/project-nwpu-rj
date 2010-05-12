package com.goodfriend.admin.action;

import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.goodfriend.model.Admin;


import com.goodfriend.service.IAdminService;


import com.opensymphony.xwork2.ActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class LoginAction {
	private static final long serialVersionUID = 1L;


	private IAdminService adminService;

	private Admin admin;
	private Map<String, Object> session;

	public String login() throws Exception {
		System.out.println("Admin login action execute...........");

		Admin dbAdmin = adminService.getAdmin(admin.getUsername());	//这里和用户的get方法不一致，可以改成相同
//		if(adminDaoManager.getAdmin(admin.getUsername()) instanceof Admin) {
//			
//			System.out.println("true");
//		}
//		System.out.println(dbAdmin.getUsername());
		if (dbAdmin != null && dbAdmin.getPassword().equals(admin.getPassword())){
			
			System.out.println(dbAdmin.getUsername() + "   " + dbAdmin.getPassword());
			if (session == null) {
				session = new HashMap<String, Object>();
			}
			session.put("currentAdmin", dbAdmin);
			return "login_success";
		}
		System.out.println("登陆失败");
		return "index";
	}

	public String logout() throws Exception {
		
		session.remove("currentUser");
		return "logout";
	}
	
	
	public void setSession(Map<String, Object> session) {

		this.session = session;
	}


	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	public IAdminService getAdminService() {
		return adminService;
	}

	public void setAdminService(IAdminService adminService) {
		this.adminService = adminService;
	}
}
