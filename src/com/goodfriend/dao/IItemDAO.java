package com.goodfriend.dao;

import java.util.List;

import com.goodfriend.model.Item;

public interface IItemDAO {

	public abstract void save(Item transientInstance);

	public abstract void delete(Item persistentInstance);

	public abstract Item findById(java.lang.Integer id);

	public abstract List<Item> findAll();

}