package com.goodfriend.dao;

import java.util.List;

import com.goodfriend.model.Placard;

public interface IPlacardDAO {
	public abstract void save(Placard transientInstance);
	public abstract void delete(Placard persistentInstance);
	public abstract Placard findById(java.lang.Integer id);
	public abstract List<Placard> findByExample(Placard instance);
	public abstract List<Placard> findByProperty(String propertyName,
			Object value);
	public abstract List<Placard> findByTitle(Object title);
	public abstract List<Placard> findByContent(Object content);
	public abstract List<Placard> findByPublish(Object publish);
	public abstract List<Placard> findAll();
	public abstract Placard merge(Placard detachedInstance);
	public abstract void attachDirty(Placard instance);
	public abstract void attachClean(Placard instance);

}