package com.goodfriend.dao;

import java.util.List;

import com.goodfriend.model.Statement;

public interface IStatementDAO {

	public abstract void save(Statement transientInstance);

	public abstract void delete(Statement persistentInstance);

	public abstract Statement findById(java.lang.Integer id);
	
	public abstract List<Statement> findAll();

}