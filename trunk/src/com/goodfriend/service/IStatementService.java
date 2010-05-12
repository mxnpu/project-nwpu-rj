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
	public void addGossip(Statement statement);
	public Statement getStatement(Integer id);
	public List<Statement> getStatements(String userId);
	public void updateGossip(Statement statement);
	public void deleteGossip(Statement statement);
}
