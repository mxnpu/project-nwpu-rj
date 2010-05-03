package com.goodfriend.dao;

import java.util.List;

import com.goodfriend.model.Album;

public interface IAlbumDAO {
	public abstract void save(Album transientInstance);
	public abstract void delete(Album persistentInstance);
	public abstract Album findById(java.lang.Integer id);
	public abstract List<Album> findByExample(Album instance);
	public abstract List<Album> findByProperty(String propertyName, Object value);
	public abstract List<Album> findByTitle(Object title);
	public abstract List<Album> findAll();
	public abstract Album merge(Album detachedInstance);
	public abstract void attachDirty(Album instance);
	public abstract void attachClean(Album instance);
}