package com.goodfriend.dao;

import java.util.List;

import com.goodfriend.model.Admin;

public interface IAdminDAO {
	public abstract void save(Admin transientInstance);
	public abstract void delete(Admin persistentInstance);
	public abstract Admin findById(java.lang.Integer id);
	public abstract List<Admin> findByExample(Admin instance);
	public abstract List<Admin> findByProperty(String propertyName, Object value);
	public abstract List<Admin> findByUsername(Object username);
	public abstract List<Admin> findByPassword(Object password);
	public abstract List<Admin> findByRealName(Object realName);
	public abstract List<Admin> findByPhone(Object phone);
	public abstract List<Admin> findByEmail(Object email);
	public abstract List<Admin> findByAddress(Object address);
	public abstract List<Admin> findAll();
	public abstract Admin merge(Admin detachedInstance);
	public abstract void attachDirty(Admin instance);
	public abstract void attachClean(Admin instance);

}