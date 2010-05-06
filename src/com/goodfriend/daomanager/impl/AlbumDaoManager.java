package com.goodfriend.daomanager.impl;

import java.util.List;

import com.goodfriend.dao.IAlbumDAO;
import com.goodfriend.daomanager.IAlbumDaoManager;
import com.goodfriend.model.Album;

public class AlbumDaoManager implements IAlbumDaoManager {
	
	private IAlbumDAO albumDao;
	
	public void addAlbum(Album album) {
		albumDao.save(album);
	}

	public void deleteAlbum(Album album) {
		albumDao.delete(album);
	}

	public List<Album> getAlbumByProperty(String propertyName, Object value) {
		List<Album> albums = albumDao.findByProperty(propertyName, value);
		return albums;
	}

	public List<Album> getAllAlbums() {
		List<Album> albums = albumDao.findAll();
		return albums;
	}

	public void updateAlbum(Album album) {
		albumDao.attachDirty(album);
	}

	public void setAlbumDao(IAlbumDAO albumDao) {
		this.albumDao = albumDao;
	}

	public IAlbumDAO getAlbumDao() {
		return albumDao;
	}
	
	

}
