package com.goodfriend.dao;

import java.util.List;

import com.goodfriend.model.Admin;

public interface IAdminDAO {

	public abstract void save(Admin transientInstance);

	public abstract void delete(Admin persistentInstance);

	public abstract Admin findById(java.lang.Integer id);

	public abstract List<Admin> findAll();

}