package com.goodfriend.service.impl;

import java.util.List;

import com.goodfriend.dao.IGossipDAO;
import com.goodfriend.model.Gossip;
import com.goodfriend.service.IGossipService;

public class GossipService implements IGossipService {
	
	private IGossipDAO gossipDao;

	public void addGossip(Gossip gossip) {
		// TODO Auto-generated method stub

	}

	public void deleteGossip(Gossip gossip) {
		// TODO Auto-generated method stub

	}

	public Gossip getGossip(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Gossip> getGossips(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	public void updateGossip(Gossip gossip) {
		// TODO Auto-generated method stub

	}

	public void setGossipDao(IGossipDAO gossipDao) {
		this.gossipDao = gossipDao;
	}

	public IGossipDAO getGossipDao() {
		return gossipDao;
	}

}
