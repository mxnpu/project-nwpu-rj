package com.goodfriend.dao;

import java.util.List;

import com.goodfriend.model.Item;

public interface IItemDAO {
	public abstract void save(Item transientInstance);
	public abstract void delete(Item persistentInstance);
	public abstract Item findById(java.lang.Integer id);
	public abstract List<Item> findByExample(Item instance);
	public abstract List<Item> findByProperty(String propertyName, Object value);
	public abstract List<Item> findAll();
	public abstract Item merge(Item detachedInstance);
	public abstract void attachDirty(Item instance);
	public abstract void attachClean(Item instance);
}