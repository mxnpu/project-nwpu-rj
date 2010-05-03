package com.goodfriend.dao;

import java.util.List;

import com.goodfriend.model.User;

public interface IUserDAO {
	public abstract void save(User transientInstance);
	public abstract void delete(User persistentInstance);
	public abstract User findById(java.lang.Integer id);
	public abstract List<User> findByExample(User instance);
	public abstract List<User> findByProperty(String propertyName, Object value);
	public abstract List<User> findByUserName(Object userName);
	public abstract List<User> findByPassword(Object password);
	public abstract List<User> findByRealName(Object realName);
	public abstract List<User> findByGender(Object gender);
	public abstract List<User> findByPhone(Object phone);
	public abstract List<User> findByEmail(Object email);
	public abstract List<User> findByHoby(Object hoby);
	public abstract List<User> findByPhoto(Object photo);
	public abstract List<User> findAll();
	public abstract User merge(User detachedInstance);
	public abstract void attachDirty(User instance);
	public abstract void attachClean(User instance);

}