package com.goodfriend.dao;

import java.util.List;

import com.goodfriend.model.Statement;

public interface IStatementDAO {
	public abstract void save(Statement transientInstance);
	public abstract void delete(Statement persistentInstance);
	public abstract Statement findById(java.lang.Integer id);
	public abstract List<Statement> findByExample(Statement instance);
	public abstract List<Statement> findByProperty(String propertyName,
			Object value);
	public abstract List<Statement> findByContent(Object content);
	public abstract List<Statement> findAll();
	public abstract Statement merge(Statement detachedInstance);
	public abstract void attachDirty(Statement instance);
	public abstract void attachClean(Statement instance);

}