package com.goodfriend.service;

import java.sql.Timestamp;
import java.util.List;

import com.goodfriend.model.Statement;

/**
 * The the service component for the statement.
 * 
 * 
 * @version 
 * @CreateTime : 2010.05.12 
 * @LastModifyTime : 2010.05.23 
 */
public interface IStatementService {
	public void addStatement(Statement statement, Integer userId);
	public Statement getStatement(Integer id);
	public List<Statement> getStatements(Integer userId);
	public void updateStatement(Statement statement);
	public void deleteStatement(Statement statement);
	public Statement getLatestStatement(Integer userId);
	public List<Statement> getStatementsByDeadline(Integer userId);
}
