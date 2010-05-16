package com.goodfriend.service.impl;

import java.util.List;

import com.goodfriend.dao.IItemDAO;
import com.goodfriend.dao.IReplyDAO;
import com.goodfriend.dao.IUserDAO;
import com.goodfriend.model.Reply;
import com.goodfriend.service.IReplyService;

/**
 * The reply service module of the system.
 * 
 * @author xurunhua
 * @time 2010.05.15
 */
public class ReplyService implements IReplyService {

    private IReplyDAO replyDao;
    private IItemDAO itemDao;
    private IUserDAO userDao;

    public void addReply(Reply reply, Integer itemid, Integer fromUserId) {
	
    }

    public void deleteReply(Reply reply) {
    }

    public List<Reply> getReplies(Integer itemId) {
	return null;
    }

    public Reply getReply(Integer id) {
	return null;
    }

    public void updateReply(Reply reply) {

    }

    public void setReplyDao(IReplyDAO replyDao) {
	this.replyDao = replyDao;
    }

    public IReplyDAO getReplyDao() {
	return replyDao;
    }

    /**
     * @param itemDao
     *            the itemDao to set
     */
    public void setItemDao(IItemDAO itemDao) {
	this.itemDao = itemDao;
    }

    /**
     * @return the itemDao
     */
    public IItemDAO getItemDao() {
	return itemDao;
    }

    /**
     * @param userDao the userDao to set
     */
    public void setUserDao(IUserDAO userDao) {
	this.userDao = userDao;
    }

    /**
     * @return the userDao
     */
    public IUserDAO getUserDao() {
	return userDao;
    }

}
