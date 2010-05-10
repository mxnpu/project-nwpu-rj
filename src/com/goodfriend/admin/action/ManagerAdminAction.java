package com.goodfriend.admin.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.goodfriend.admin.dto.AdminDTO;
import com.goodfriend.model.Admin;
import com.goodfriend.service.IAminDaoManager;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 
 * @author haiqian
 * Last modify:2010.5.9
 */
public class ManagerAdminAction extends ActionSupport {
		
	private static final String SUCCESS = "success";
	private static final String FAILED = "failed";

	private AdminDTO adminDTO;
	private IAminDaoManager adminDaoManager;
	
	public String add() throws Exception {
		
//System.out.println(adminDTO.getUsername());
//for(Admin a : adminDaoManager.getAdmins()) {
//	
//	System.out.println(a.getUsername());
//}
		if (!adminDaoManager.isAdminExist(adminDTO.getUsername())) {
			Admin admin = new Admin();
			if (adminDTO.getUsername() != null && !adminDTO.getUsername().equals("")) {
				admin.setUsername(adminDTO.getUsername());
			} else {
				return FAILED;
			}
			if (adminDTO.getPassword() != null && adminDTO.getConfirmPassword() != null
					&& !adminDTO.getPassword().equals("")
					&& adminDTO.getPassword().equals(adminDTO.getConfirmPassword())) {
				admin.setPassword(adminDTO.getPassword());
			} else {
				return FAILED;
			}
			if (adminDTO.getReal_name() != null && !adminDTO.getReal_name().equals("")) {
				admin.setRealName(adminDTO.getReal_name());
			} else {
				return FAILED;
			}
			if (adminDTO.getPhone() != null) {
				admin.setPhone(adminDTO.getPhone());
			} else {
				admin.setPhone("");
			}

			if (adminDTO.getEmail() != null) {
				admin.setEmail(adminDTO.getEmail());
			} else {
				admin.setEmail("");
			}
			if (adminDTO.getAddress() != null) {
				admin.setAddress(adminDTO.getAddress());
			} else {
				admin.setAddress("");
			}

			adminDaoManager.addAdmin(admin);
			System.out.println("添加管理员： " + admin.getUsername() + " 成功");

		}
		return SUCCESS;
	}


	public AdminDTO getAdminDTO() {
		return adminDTO;
	}


	public void setAdminDTO(AdminDTO adminDTO) {
		this.adminDTO = adminDTO;
	}


	public IAminDaoManager getAdminDaoManager() {
		return adminDaoManager;
	}

	public void setAdminDaoManager(IAminDaoManager adminDaoManager) {
		this.adminDaoManager = adminDaoManager;
	}



}
