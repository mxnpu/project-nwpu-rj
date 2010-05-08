package com.goodfriend.service;

import java.util.List;

import com.goodfriend.model.Album;
import com.goodfriend.model.Picture;

public interface IPictureService {
	public void addPicture(Picture picture);
	public Picture getPicture(Integer id);
	public List<Picture> getAllPictures();
	public List<Picture> getAlbumPictures(Album album);
	public void deletePicture(Picture picture);
	public void updatePicture(Picture picture);
}
