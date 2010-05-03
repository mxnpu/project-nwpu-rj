package com.goodfriend.dao;

import java.util.List;

import com.goodfriend.model.Gossip;

public interface IGossipDAO {
	public abstract void save(Gossip transientInstance);
	public abstract void delete(Gossip persistentInstance);
	public abstract Gossip findById(java.lang.Integer id);
	public abstract List<Gossip> findByExample(Gossip instance);
	public abstract List<Gossip> findByProperty(String propertyName,
			Object value);
	public abstract List<Gossip> findByContent(Object content);
	public abstract List<Gossip> findAll();
	public abstract Gossip merge(Gossip detachedInstance);
	public abstract void attachDirty(Gossip instance);
	public abstract void attachClean(Gossip instance);

}