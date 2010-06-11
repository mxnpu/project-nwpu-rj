package com.goodfriend.service;

import java.util.List;

import com.goodfriend.model.Gossip;
import com.goodfriend.model.Message;
/**
 * The the service component for the gossip.
 * 
 * 
 * @version 
 * Last modify time : 2010.05.12 
 */
public interface IGossipService {
	public void addGossip(Gossip gossip, Integer userId, Integer fromUserId);
	public Gossip getGossip(Integer id);
	public List<Gossip> getGossips(Integer userId);
	public void updateGossip(Gossip gossip);
	public void deleteGossip(Gossip gossip);
	public List<Gossip> getLatestGossips(Integer userId);
	public List<Message> getGossipByPage(Integer userId, int pageNow, int pageSize);
	public int getTotalPage(Integer userId, int pageSize);
}
