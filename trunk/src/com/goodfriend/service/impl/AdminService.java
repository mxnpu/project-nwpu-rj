package com.goodfriend.service.impl;

import java.util.List;

import com.goodfriend.dao.IAdminDAO;
import com.goodfriend.model.Admin;
import com.goodfriend.service.IAdminService;

/**
 * The service module for the administrator.
 * 
 * @author xurunhua
 * @CreateTime 2010.05.03
 * @LastModifyTime 2010.05.12
 */
public class AdminService implements IAdminService {

	private IAdminDAO adminDao;

	/**
	 * Add a administrator to database
	 * 
	 * @param admin
	 *            the administrator wanted to be added.
	 */
	public void addAdmin(Admin admin) {
		adminDao.save(admin);
	}

	/**
	 * Delete a administrator from database
	 * 
	 * @param admin
	 *            the administrator wanted to be deleted.
	 */
	public void deleteUser(Admin admin) {
		adminDao.delete(admin);
	}

	/**
	 * Get a administrator from the database by the Id.
	 * 
	 * @param id
	 *            the id of the administrator in database.
	 * @return the Administrator which you queried.
	 */
	public Admin getAdmin(Integer id) {
		Admin admin = adminDao.findById(id);
		return admin;
	}

	/**
	 * Get a administrator form the database by the administator's user name
	 * 
	 * @param adminName
	 *            the name which you want query.
	 * @return the administrator which you queried.
	 */
	public Admin getAdmin(String adminName) {
		List<Admin> admins = adminDao.findByUsername(adminName);
		Admin admin = null;
		if (admins != null && admins.size() > 0) {
			admin = admins.get(0);
		}
		return admin;
	}

	/**
	 * Get all the administrators.
	 * 
	 * @return all the administrators.
	 */
	public List<Admin> getAdmins() {
		List<Admin> admins = adminDao.findAll();
		return admins;
	}

	/**
	 * Judge the administrator is exist or not by user name.
	 * 
	 * @param the
	 *            adminName the user name of the administrator.
	 * @return true if the name is exist, or false.
	 */
	public boolean isAdminExist(String adminName) {
		boolean isExist = false;
		List<Admin> admins = adminDao.findAll();
		for (Admin admin : admins) {
			if (admin.getUsername().equals(adminName)) {
				isExist = true;
				break;
			}
		}
		return isExist;
	}

	/**
	 * Update the administrator
	 * 
	 * @param admin
	 *            the administrator you want to update.
	 */
	public void updateAdmin(Admin admin) {
		adminDao.attachDirty(admin);
	}

	public void updateAdmin(int id, Admin  admin) {
		
		Admin oldAdmin = adminDao.findById(id);
		oldAdmin.setAddress(admin.getAddress());
		oldAdmin.setEmail(admin.getEmail());
		oldAdmin.setPassword(admin.getPassword());
		oldAdmin.setPhone(admin.getPhone());
		oldAdmin.setRealName(admin.getRealName());
		oldAdmin.setUsername(admin.getUsername());
		adminDao.attachDirty(oldAdmin);
	}
	
	public void setAdminDao(IAdminDAO adminDao) {
		this.adminDao = adminDao;
	}

	public IAdminDAO getAdminDao() {
		return adminDao;
	}

}
