package com.goodfriend.dao;

import java.util.List;

import com.goodfriend.model.Reply;

public interface IReplyDAO {
	public abstract void save(Reply transientInstance);
	public abstract void delete(Reply persistentInstance);
	public abstract Reply findById(java.lang.Integer id);
	public abstract List<Reply> findByExample(Reply instance);
	public abstract List<Reply> findByProperty(String propertyName, Object value);
	public abstract List<Reply> findByContent(Object content);
	public abstract List<Reply> findAll();
	public abstract Reply merge(Reply detachedInstance);
	public abstract void attachDirty(Reply instance);
	public abstract void attachClean(Reply instance);

}