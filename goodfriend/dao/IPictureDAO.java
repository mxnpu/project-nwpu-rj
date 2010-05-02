package com.goodfriend.dao;

import java.util.List;

import com.goodfriend.model.Picture;

public interface IPictureDAO {

	public abstract void save(Picture transientInstance);

	public abstract void delete(Picture persistentInstance);

	public abstract Picture findById(java.lang.Integer id);

	public abstract List<Picture> findAll();

}