package com.goodfriend.daomanager;

import java.util.List;

import com.goodfriend.model.Admin;

public interface IAminDaoManager {
	public void addAdmin(Admin admin);
	public Admin getAdmin(Integer id);
	public Admin getAdmin(String adminName);
	public List<Admin> getAdmins();
	public void updateAdmin(Admin admin);
	public void deleteUser(Admin admin);
	public boolean isAdminExist(String adminName);
}
