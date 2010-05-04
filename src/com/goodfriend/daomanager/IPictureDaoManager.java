package com.goodfriend.daomanager;

import java.util.List;

import com.goodfriend.model.Album;
import com.goodfriend.model.Picture;

public interface IPictureDaoManager {
	public void addPicture(Picture picture);
	public Picture getPicture(Integer id);
	public List<Picture> getAllPictures();
	public List<Picture> getAlbumPictures(Album album);
	public void deletePicture(Picture picture);
	public void updatePicture(Picture picture);
}
