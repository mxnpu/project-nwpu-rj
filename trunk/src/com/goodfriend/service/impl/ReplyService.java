package com.goodfriend.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.goodfriend.dao.IItemDAO;
import com.goodfriend.dao.IReplyDAO;
import com.goodfriend.dao.IUserDAO;
import com.goodfriend.model.Item;
import com.goodfriend.model.Reply;
import com.goodfriend.model.User;
import com.goodfriend.service.IReplyService;

/**
 * The reply service module of the system.
 * 
 * @author xurunhua
 * @CreateTime 2010.05.14
 * @LastModifyTime 2010.05.17
 */
public class ReplyService implements IReplyService {

	private IReplyDAO replyDao;
	private IItemDAO itemDao;
	private IUserDAO userDao;

	/**
	 * Add a reply.
	 * 
	 * @param reply
	 *            the reply you want to add.
	 * @param itemid
	 *            the item your reply want to add.
	 * @param fromUserId
	 *            the reply who replied.
	 */
	public void addReply(Reply reply, Integer itemid, Integer fromUserId) {
		User fromUser = userDao.findById(fromUserId);
		Item item = itemDao.findById(itemid);
		reply.setItem(item);
		item.getReplies().add(reply);
		reply.setUser(fromUser);
		fromUser.getReplies().add(reply);

		replyDao.save(reply);
	}
	
	public void addReply(Reply reply){
		
	}

	/**
	 * Delete a reply.
	 * 
	 * @param reply
	 *            the reply you want to delete.
	 */
	public void deleteReply(Reply reply) {
		reply = getReply(reply.getIdReply());
		reply.setItem(null);
		reply.setUser(null);
		
		replyDao.delete(reply);
	}

	/**
	 * Get all replies you want by the item id.
	 * 
	 * @param itemId
	 *            the item id which you want get all the replies.
	 */
	public List<Reply> getReplies(Integer itemId) {
		List<Reply> replies = new ArrayList<Reply>();
		List<Reply> allReplies = replyDao.findAll();
		for (Reply temp : allReplies) {
			if (temp.getItem().getIdItem().equals(itemId)) {
				replies.add(temp);
			}
		}

		return replies;
	}

	/**
	 * Get a reply from the database by the id.
	 * 
	 * @param id
	 *            the id of the reply you want.
	 */
	public Reply getReply(Integer id) {
		Reply reply = null;
		reply = replyDao.findById(id);
		return reply;
	}

	/**
	 * Update a reply.
	 * 
	 * @param reply
	 *            the reply you want to update.
	 */
	public void updateReply(Reply reply) {
		replyDao.attachDirty(reply);
	}

	/**
	 * @param replyDao
	 *            the replyDao to set
	 */
	public void setReplyDao(IReplyDAO replyDao) {
		this.replyDao = replyDao;
	}

	/**
	 * @return the replyDao
	 */
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
	 * @param userDao
	 *            the userDao to set
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
