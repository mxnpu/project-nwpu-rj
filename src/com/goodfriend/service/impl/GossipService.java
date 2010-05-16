package com.goodfriend.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.goodfriend.dao.IGossipDAO;
import com.goodfriend.dao.IItemDAO;
import com.goodfriend.dao.IUserDAO;
import com.goodfriend.model.Gossip;
import com.goodfriend.model.Item;
import com.goodfriend.model.User;
import com.goodfriend.service.IGossipService;

/**
 * Give the service for the user's gossip.
 * 
 * @author xurunhua
 * @time 2010.05.15
 */
public class GossipService implements IGossipService {
	
	private IGossipDAO gossipDao;
	private IItemDAO itemDao;
	private IUserDAO userDao;

	/**
	 * Add a gossip to the user.
	 * 
	 * @param gossip the gossip which you give.
	 * @param userId the user who give the gossip.
	 * @param toUserId the user you give the gossip to.
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
	 * @param the gossip you want to delete.
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
	 * @param the gossip you want to get.
	 */
	public Gossip getGossip(Integer id) {
	    Gossip gossip = null;
	    gossip = gossipDao.findById(id);
	    return gossip;
	}

	/**
	 * Get a user's all gossips.
	 * 
	 * @param userId the user who you want to display the gossip list.
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
	 * Update a gossip.
	 * 
	 * @param the gossip you want to update.
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
	 * @param itemDao the itemDao to set
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
