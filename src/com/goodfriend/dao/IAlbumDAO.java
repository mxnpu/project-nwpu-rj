package com.goodfriend.dao;

import java.util.List;

import com.goodfriend.model.Album;

public interface IAlbumDAO {

	public abstract void save(Album transientInstance);

	public abstract void delete(Album persistentInstance);

	public abstract Album findById(java.lang.Integer id);

	public abstract List<Album> findAll();

}