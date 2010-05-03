package com.goodfriend.dao;

import java.util.List;

import com.goodfriend.model.Picture;

public interface IPictureDAO {
	public abstract void save(Picture transientInstance);
	public abstract void delete(Picture persistentInstance);
	public abstract Picture findById(java.lang.Integer id);
	public abstract List<Picture> findByExample(Picture instance);
	public abstract List<Picture> findByProperty(String propertyName,
			Object value);
	public abstract List<Picture> findByIntroduction(Object introduction);
	public abstract List<Picture> findByPath(Object path);
	public abstract List<Picture> findAll();
	public abstract Picture merge(Picture detachedInstance);
	public abstract void attachDirty(Picture instance);
	public abstract void attachClean(Picture instance);

}