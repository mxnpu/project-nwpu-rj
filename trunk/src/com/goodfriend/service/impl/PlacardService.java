package com.goodfriend.service.impl;

import java.util.List;

import com.goodfriend.dao.IPlacardDAO;
import com.goodfriend.model.Placard;
import com.goodfriend.service.IPlacardService;

/**
 * A Database Access Object which manage the placard information.
 * 
 * @author xurunhua
 */
public class PlacardService implements IPlacardService {
	
	private IPlacardDAO placrdDao;

	public void addPlacard(Placard placard) {
		placrdDao.save(placard);
	}

	public void deleteUser(Placard placard) {
		placrdDao.delete(placard);
	}

	public Placard getPlacard(Integer id) {
		return placrdDao.findById(id);
	}

	public Placard getPlacard(String title) {
		List<Placard> placards = placrdDao.findByTitle(title);
		Placard placard = null;
		if(placards != null && placards.size() > 0) {
			placard = placards.get(0);
		}
		return placard;
	}

	public List<Placard> getPlacards() {
		return placrdDao.findAll();
	}

	public void updateUser(Placard placard) {
		placrdDao.attachDirty(placard);
	}

	public void setPlacrdDao(IPlacardDAO placrdDao) {
		this.placrdDao = placrdDao;
	}

	public IPlacardDAO getPlacrdDao() {
		return placrdDao;
	}

}
