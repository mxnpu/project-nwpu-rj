package com.goodfriend.dao;

import java.util.List;

import com.goodfriend.model.User;

public interface IUserDAO {

	public abstract void save(User transientInstance);

	public abstract void delete(User persistentInstance);

	public abstract User findById(java.lang.Integer id);

	public abstract List<User> findAll();
	
	public List<User> findByUserName(Object userName);

}