package com.goodfriend.admin.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.goodfriend.admin.dto.AdminDTO;
import com.goodfriend.model.Admin;
import com.goodfriend.service.IAdminService;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 
 * @author haiqian
 * Last modify:2010.5.9
 */
public class ManagerAdminAction extends ActionSupport implements SessionAware{
		
	private static final long serialVersionUID = 1L;
	private static final String FAILED = "Admin_failed";
	private Map<String, Object> session;

//	private static final String 

	private AdminDTO adminDTO;	//在注册的时候用传输类，这样就不会有垃圾信息的问题，如密码验证
	private IAdminService adminService;
	private List<Admin> adminLists;
	private int id;
	private Admin admin;	//update的时候用
	
	/**
	 * 显示管理员列表
	 * @return
	 */
	public String list() {
		
		adminLists = adminService.getAdmins();
		return "Admin_list";
	}
	
	/**
	 * 删除管理员
	 * @return
	 */
	public String delete() {
		
		adminService.deleteUser(adminService.getAdmin(id));
		return "del_success";
	}
	
	/**
	 * 更新管理员信息输入表项
	 * @return
	 */
	public String updateInput() {
		
		admin = adminService.getAdmin(id);
		session.put("idAdmin", id);
		return "update_input";
	}
	/**
	 * 查看管理员信息输入表项
	 * @return
	 */
	public String viewAdminInfo() {
		
		admin = adminService.getAdmin(id);
		session.put("idAdmin", id);
		return "view_admin_info";
	}
	
	/**
	 * 更新管理员信息
	 * @return
	 */
	public String update() {
		
		adminService.updateAdmin((Integer)session.get("idAdmin"), admin);
		//System.out.println(session.get("idAdmin").toString());
		int tempId = (Integer)session.get("idAdmin");
		int currentId = (Integer)session.get("currentAdminId");
		if(tempId == currentId){
			
			session.put("currentAdmin", admin);
		}
		return "update_success";
		//
	}
	
	/**
	 * 添加管理员
	 * @return
	 * @throws Exception
	 */
	public String addInput() throws Exception {
		
		if (!adminService.isAdminExist(adminDTO.getUsername())) {
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

			adminService.addAdmin(admin);
			System.out.println("添加管理员： " + admin.getUsername() + " 成功");

		}
		return "add_success";
	}


	public AdminDTO getAdminDTO() {
		return adminDTO;
	}


	public void setAdminDTO(AdminDTO adminDTO) {
		this.adminDTO = adminDTO;
	}

	public IAdminService getAdminService() {
		return adminService;
	}


	public void setAdminService(IAdminService adminService) {
		this.adminService = adminService;
	}
	public List<Admin> getAdminLists() {
		return adminLists;
	}
	public void setAdminLists(List<Admin> adminLists) {
		this.adminLists = adminLists;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public void setSession(Map<String, Object> session) {
		
		this.session = session;
	}

}
