package com.goodfriend.service;

import java.util.List;

import com.goodfriend.model.Gossip;
/**
 * The the service component for the gossip.
 * 
 * @author xurunhua
 * @version 
 * Last modify time : 2010.05.12 
 */
public interface IGossipService {
	public void addGossip(Gossip gossip);
	public Gossip getGossip(Integer id);
	public List<Gossip> getGossips(String userId);
	public void updateGossip(Gossip gossip);
	public void deleteGossip(Gossip gossip);
}