package com.goodfriend.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import com.goodfriend.dao.IGossipDAO;
import com.goodfriend.dao.IItemDAO;
import com.goodfriend.dao.IUserDAO;
import com.goodfriend.model.Gossip;
import com.goodfriend.model.Item;
import com.goodfriend.model.Message;
import com.goodfriend.model.Reply;
import com.goodfriend.model.User;
import com.goodfriend.service.IGossipService;
import com.goodfriend.service.IReplyService;

/**
 * Give the service for the user's gossip.
 * 
 * @time 2010.05.15
 */
public class GossipService implements IGossipService {

    private static final int LATEST_GOSSIP_NUM = 5;

    private IGossipDAO gossipDao;
    private IReplyService replyService;
    private IItemDAO itemDao;
    private IUserDAO userDao;

    /**
     * Add a gossip to the user.
     * 
     * @param gossip
     *            the gossip which you give.
     * @param userId
     *            the user who give the gossip.
     * @param toUserId
     *            the user you give the gossip to.
     */
    public void addGossip(Gossip gossip, Integer userId, Integer fromUserId) {
	User user = userDao.findById(userId);
	Item item = new Item();
	item.setUser(user);
	item.setRecordTime(new Timestamp(new Date().getTime()));
	item.getGossips().add(gossip);
	gossip.setItem(item);

	User fromUser = userDao.findById(fromUserId);
	gossip.setUser(fromUser);

	gossipDao.save(gossip);
    }

    /**
     * Delete a gossip from the database.
     * 
     * @param the
     *            gossip you want to delete.
     */
    public void deleteGossip(Gossip gossip) {
	gossip = getGossip(gossip.getIdGossip());

	gossip.setUser(null);

	Item item = gossip.getItem();
	item.setUser(null);

	itemDao.delete(item);
    }

    /**
     * Get a gossip from the database by the gossip's id
     * 
     * @param the
     *            gossip you want to get.
     */
    public Gossip getGossip(Integer id) {
	Gossip gossip = null;
	gossip = gossipDao.findById(id);
	return gossip;
    }

    /**
     * Get a user's all gossips.
     * 
     * @param userId
     *            the user who you want to display the gossip list.
     */
    public List<Gossip> getGossips(Integer userId) {
	List<Gossip> gossips = new ArrayList<Gossip>();
	List<Gossip> allGossips = gossipDao.findAll();
	for (Gossip temp : allGossips) {
	    Integer id = temp.getItem().getUser().getIdUser();
	    if (id.equals(userId)) {
		gossips.add(temp);
	    }
	}
	return gossips;
    }

    /**
     * Get a user's latest 5 gossips.
     * 
     * @param userId
     *            the user who you want to display the gossip list.
     */
    public List<Gossip> getLatestGossips(Integer userId) {
	List<Gossip> latestGossips = new ArrayList<Gossip>();
	List<Gossip> gossips = getGossips(userId);

	// sort the gossips.
	Collections.sort(gossips);

	// Get the latest five gossip.
	if (LATEST_GOSSIP_NUM >= gossips.size()) {
	    for (int i = 0; i < gossips.size(); i++) {
		latestGossips.add(gossips.get(i));
	    }
	} else {
	    for (int i = 0; i < LATEST_GOSSIP_NUM; i++) {
		latestGossips.add(gossips.get(i));
	    }
	}

	return latestGossips;
    }

    /**
     * Get the gossip list by one page.
     * 
     * @param userId the id of user who have the gossip
     * @param pageNow the page of the current.
     * @param pageSize the gossip number of one page.
     */
    public List<Message> getGossipByPage(Integer userId, int pageNow, int pageSize) {
	List<Gossip> gossips = new ArrayList<Gossip>();

	List<Gossip> allGossips = getGossips(userId);
	Collections.sort(allGossips);
	
	
	if (pageNow * pageSize - pageSize > allGossips.size()) {
	    gossips.addAll(allGossips);
	} else if (pageNow * pageSize > allGossips.size()) {
	    gossips.addAll(allGossips.subList(pageNow * pageSize - pageSize,
		    allGossips.size()));
	} else {
	    gossips.addAll(allGossips.subList(pageNow * pageSize - pageSize,
		    pageNow * pageSize));
	}	
	
	// decoration the gossip to message.
	List<Message> messages = new ArrayList<Message>();
	for (Gossip temp : gossips) {
	    Message message = new Message();
	    message.setTitle(temp.getIdGossip().toString());
	    message.setContent(temp.getContent());
	    message.setOwner(temp.getUser());
	    message.setType("gossip");
	    message.setRecordTime(temp.getItem().getRecordTime());
	    message.setItem(temp.getItem());
	    
	    List<Reply> replies = replyService.getReplies(temp.getItem().getIdItem());
	    message.setReplies(replies);
	    
	    messages.add(message);
	}
	
	// sort the message by the record time.
	Collections.sort(messages);
	
	return messages;
    }

    /**
     * Get the total page size of the user's all gossip.
     * 
     * @param userId the of the user.
     * @param pageSize the size of the page.
     */
    public int getTotalPage(Integer userId, int pageSize) {
	List<Gossip> allGossips = getGossips(userId);

	return (int) Math.ceil(allGossips.size() / (double)pageSize);
    }

    /**
     * Update a gossip.
     * 
     * @param the
     *            gossip you want to update.
     */
    public void updateGossip(Gossip gossip) {
	gossipDao.attachDirty(gossip);
    }

    public void setGossipDao(IGossipDAO gossipDao) {
	this.gossipDao = gossipDao;
    }

    public IGossipDAO getGossipDao() {
	return gossipDao;
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

    /**
     * @return the replyService
     */
    public IReplyService getReplyService() {
        return replyService;
    }

    /**
     * @param replyService the replyService to set
     */
    public void setReplyService(IReplyService replyService) {
        this.replyService = replyService;
    }
    
    
}
