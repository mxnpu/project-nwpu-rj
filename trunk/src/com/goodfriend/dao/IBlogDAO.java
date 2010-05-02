package com.goodfriend.dao;

import java.util.List;

import com.goodfriend.model.Blog;

public interface IBlogDAO {

	public abstract void save(Blog transientInstance);

	public abstract void delete(Blog persistentInstance);

	public abstract Blog findById(java.lang.Integer id);

	public abstract List<Blog> findAll();

}