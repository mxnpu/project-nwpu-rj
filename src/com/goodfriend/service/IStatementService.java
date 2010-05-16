package com.goodfriend.service;

import java.util.List;

import com.goodfriend.model.Statement;

/**
 * The the service component for the statement.
 * 
 * @author xurunhua
 * @version 
 * Last modify time : 2010.05.12 
 */
public interface IStatementService {
	public void addStatement(Statement statement, Integer userId);
	public Statement getStatement(Integer id);
	public List<Statement> getStatements(Integer userId);
	public void updateStatement(Statement statement);
	public void deleteStatement(Statement statement);
}
