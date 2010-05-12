package com.goodfriend.service.impl;

import java.util.List;

import com.goodfriend.dao.IStatementDAO;
import com.goodfriend.model.Statement;
import com.goodfriend.service.IStatementService;

public class StatementService implements IStatementService {
	
	private IStatementDAO statementDao;

	public void addGossip(Statement statement) {
		// TODO Auto-generated method stub

	}

	public void deleteGossip(Statement statement) {
		// TODO Auto-generated method stub

	}

	public Statement getStatement(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Statement> getStatements(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	public void updateGossip(Statement statement) {
		// TODO Auto-generated method stub

	}

	public void setStatementDao(IStatementDAO statementDao) {
		this.statementDao = statementDao;
	}

	public IStatementDAO getStatementDao() {
		return statementDao;
	}

}
