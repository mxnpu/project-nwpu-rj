package com.goodfriend.dao;

import java.util.List;

import com.goodfriend.model.Friends;

public interface IFriendsDAO {

	public abstract void save(Friends transientInstance);

	public abstract void delete(Friends persistentInstance);

	public abstract Friends findById(java.lang.Integer id);

	public abstract List<Friends> findAll();

}