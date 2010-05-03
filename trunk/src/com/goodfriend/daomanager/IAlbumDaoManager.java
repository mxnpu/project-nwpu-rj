package com.goodfriend.daomanager;

import java.util.List;

import com.goodfriend.model.Album;


public interface IAlbumDaoManager {
	public void addAlbum(Album album);
	public void deleteAlbum(Album album);
	public void updateAlbum(Album album);
	public List<Album> getAllAlbums();
	public List<Album> getAlbumByProperty(String propertyName, Object value);
}
