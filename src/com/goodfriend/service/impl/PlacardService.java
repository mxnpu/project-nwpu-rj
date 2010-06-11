package com.goodfriend.service.impl;

import java.util.List;

import com.goodfriend.dao.IPlacardDAO;
import com.goodfriend.model.Placard;
import com.goodfriend.service.IPlacardService;

/**
 * The service module of placard service.
 * 
 * @CreateTime 2010.05.03
 * @LastModifyTime 2010.05.12
 */
public class PlacardService implements IPlacardService {

	private IPlacardDAO placrdDao;

	/**
	 * Add a placard.
	 * 
	 * @param placard
	 *            the placard you want to add.
	 */
	public void addPlacard(Placard placard) {
		placrdDao.save(placard);
	}

	/**
	 * Delete a placard.
	 * 
	 * @param placard
	 *            the placard you want to delete.
	 */
	public void deleteUser(Placard placard) {
		placrdDao.delete(placard);
	}

	/**
	 * Get a placard.
	 * 
	 * @param id
	 *            the of the placard you want to get.
	 * @return the placard you want.
	 */
	public Placard getPlacard(Integer id) {
		return placrdDao.findById(id);
	}

	/**
	 * Get the placards by title.
	 * 
	 * @param title
	 *            the title of placard you want to add.
	 * @return the placard you want.
	 */
	public Placard getPlacard(String title) {
		List<Placard> placards = placrdDao.findByTitle(title);
		Placard placard = null;
		if (placards != null && placards.size() > 0) {
			placard = placards.get(0);
		}
		return placard;
	}

	/**
	 * Get all placards by title.
	 * 
	 * @return the list of placards you want.
	 */
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
