package com.goodfriend.dao;

import java.util.List;

import com.goodfriend.model.Gossip;

public interface IGossipDAO {

	public abstract void save(Gossip transientInstance);

	public abstract void delete(Gossip persistentInstance);

	public abstract Gossip findById(java.lang.Integer id);

	public abstract List<Gossip> findAll();

}