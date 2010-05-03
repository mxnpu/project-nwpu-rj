package com.goodfriend.dao;

import java.util.List;

import com.goodfriend.model.Blog;

public interface IBlogDAO {
	public abstract void save(Blog transientInstance);
	public abstract void delete(Blog persistentInstance);
	public abstract Blog findById(java.lang.Integer id);
	public abstract List<Blog> findByExample(Blog instance);
	public abstract List<Blog> findByProperty(String propertyName, Object value);
	public abstract List<Blog> findByTitle(Object title);
	public abstract List<Blog> findByContent(Object content);
	public abstract List<Blog> findAll();
	public abstract Blog merge(Blog detachedInstance);
	public abstract void attachDirty(Blog instance);
	public abstract void attachClean(Blog instance);
}