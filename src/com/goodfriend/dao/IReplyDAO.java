package com.goodfriend.dao;

import java.util.List;

import com.goodfriend.model.Reply;

public interface IReplyDAO {

	public abstract void save(Reply transientInstance);

	public abstract void delete(Reply persistentInstance);

	public abstract Reply findById(java.lang.Integer id);

	public abstract List<Reply> findAll();

}