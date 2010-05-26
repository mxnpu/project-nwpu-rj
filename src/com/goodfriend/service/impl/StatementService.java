package com.goodfriend.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.goodfriend.dao.IItemDAO;
import com.goodfriend.dao.IStatementDAO;
import com.goodfriend.dao.IUserDAO;
import com.goodfriend.model.Item;
import com.goodfriend.model.Statement;
import com.goodfriend.model.User;
import com.goodfriend.service.IStatementService;

/**
 * Offer the service for the user's statement.
 * 
 * @author xurunhua
 * @CreateTime : 2010.05.14
 * @LastModifyTime : 2010.05.17
 */
public class StatementService implements IStatementService {

    private IStatementDAO statementDao;
    private IItemDAO itemDao;
    private IUserDAO userDao;

    /**
     * Save a Statement to database.
     * 
     * @param statement
     *            the statement you wanted to be store
     * @param userId
     *            the statement belong to who
     */
    public void addStatement(Statement statement, Integer userId) {
	// Get a user whom the statement belong to
	User user = userDao.findById(userId);
	Item item = new Item();
	item.setUser(user);
	item.setRecordTime(new Timestamp(new Date().getTime()));
	item.getStatements().add(statement);
	statement.setItem(item);

	statementDao.save(statement);
    }

    /**
     * Delete a statement from the database.
     * 
     * @param statement
     *            the statement which user want to delete.
     */
    public void deleteStatement(Statement statement) {
	statement = getStatement(statement.getId());
	Item item = statement.getItem();
	item.setUser(null);
	itemDao.delete(item);
    }

    /**
     * Get a statement from the database by the statement's id.
     * 
     * @param id
     *            the statement's id you wanted.
     */
    public Statement getStatement(Integer id) {
	Statement statement = null;
	statement = statementDao.findById(id);
	return statement;
    }

    /**
     * Get a user's all statements.
     * 
     * @param userId
     *            the user's id.
     */
    public List<Statement> getStatements(Integer userId) {
	List<Statement> statements = new ArrayList<Statement>();
	List<Statement> allStatements = statementDao.findAll();
	for (Statement temp : allStatements) {
	    Integer id = temp.getItem().getUser().getIdUser();
	    if (id.equals(userId)) {
		statements.add(temp);
	    }
	}
	return statements;
    }

    /**
     * Return the latest statement of one user.
     * 
     * @param userId
     *            the user id which you want to get his or her latest statement.
     * @return the latest statement.
     */
    public Statement getLatestStatement(Integer userId) {
	Statement statement = null;
	List<Statement> statements = this.getStatements(userId);
	long maxTime = 0;
	for (Statement temp : statements) {
	    long time = temp.getItem().getRecordTime().getTime();
	    if (time > maxTime) {
		maxTime = time;
		statement = temp;
	    }
	}

	return statement;
    }

    /**
     * Get all the statement by the limitation of the user and deadline.
     * 
     * @param userId
     *            the id of the user's statement.
     * @param deadline
     *            the limited time of the needed statement.
     * @return the statements list according to the requirement.
     */
    public List<Statement> getStatementsByDeadline(Integer userId,
	    Timestamp deadline) {
	List<Statement> statements = new ArrayList<Statement>();
	List<Statement> userStatements = getStatements(userId); // get the
								// user's
								// statements.

	long deadlineTime = deadline.getTime();

	// if the statement is after the deadline time and get it.
	for (Statement temp : userStatements) {
	    long time = temp.getItem().getRecordTime().getTime();
	    if (time > deadlineTime) {
		statements.add(temp);
	    }
	}

	return statements;
    }

    /**
     * Update a statement.
     * 
     * @param the
     *            statement you want to update.
     */
    public void updateStatement(Statement statement) {
	statementDao.attachDirty(statement);
    }

    public void setItemDao(IItemDAO itemDao) {
	this.itemDao = itemDao;
    }

    public IItemDAO getItemDao() {
	return itemDao;
    }

    public void setStatementDao(IStatementDAO statementDao) {
	this.statementDao = statementDao;
    }

    public IStatementDAO getStatementDao() {
	return statementDao;
    }

    public void setUserDao(IUserDAO userDao) {
	this.userDao = userDao;
    }

    public IUserDAO getUserDao() {
	return userDao;
    }

}
