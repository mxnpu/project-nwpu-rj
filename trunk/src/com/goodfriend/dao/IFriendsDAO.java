package com.goodfriend.dao;

import java.util.List;

import com.goodfriend.model.Friends;

public interface IFriendsDAO {
	public abstract void save(Friends transientInstance);
	public abstract void delete(Friends persistentInstance);
	public abstract Friends findById(java.lang.Integer id);
	public abstract List<Friends> findByExample(Friends instance);
	public abstract List<Friends> findByProperty(String propertyName,Object value);
	public abstract List<Friends> findBySuccess(Object success);
	public abstract List<Friends> findByGroup(Object group);
	public abstract List<Friends> findAll();
	public abstract Friends merge(Friends detachedInstance);
	public abstract void attachDirty(Friends instance);
	public abstract void attachClean(Friends instance);
}