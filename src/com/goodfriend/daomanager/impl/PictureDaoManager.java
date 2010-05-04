package com.goodfriend.daomanager.impl;

import java.util.List;

import com.goodfriend.dao.IPictureDAO;
import com.goodfriend.daomanager.IPictureDaoManager;
import com.goodfriend.model.Album;
import com.goodfriend.model.Picture;

public class PictureDaoManager implements IPictureDaoManager {
	
	private IPictureDAO pictureDao;

	public void addPicture(Picture picture) {
		
	}

	public void deletePicture(Picture picture) {
		// TODO Auto-generated method stub

	}

	public List<Picture> getAlbumPictures(Album album) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Picture> getAllPictures() {
		// TODO Auto-generated method stub
		return null;
	}

	public Picture getPicture(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	public void updatePicture(Picture picture) {
		// TODO Auto-generated method stub

	}

	public void setPictureDao(IPictureDAO pictureDao) {
		this.pictureDao = pictureDao;
	}

	public IPictureDAO getPictureDao() {
		return pictureDao;
	}

}
