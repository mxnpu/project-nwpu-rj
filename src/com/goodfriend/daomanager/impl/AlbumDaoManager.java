package com.goodfriend.daomanager.impl;

import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.goodfriend.dao.IAlbumDAO;
import com.goodfriend.daomanager.IAlbumDaoManager;
import com.goodfriend.model.Album;

public class AlbumDaoManager implements IAlbumDaoManager {
	
	private IAlbumDAO albumDao;
	
	@Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
	public void addAlbum(Album album) {
		albumDao.save(album);
	}

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
	public void deleteAlbum(Album album) {
		albumDao.delete(album);
	}

	@Transactional(readOnly = false)
	public List<Album> getAlbumByProperty(String propertyName, Object value) {
		List<Album> albums = albumDao.findByProperty(propertyName, value);
		return albums;
	}

	@Transactional(readOnly = false)
	public List<Album> getAllAlbums() {
		List<Album> albums = albumDao.findAll();
		return albums;
	}

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
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
