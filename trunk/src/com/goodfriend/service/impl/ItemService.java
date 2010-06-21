/**
 * 
 */
package com.goodfriend.service.impl;

import com.goodfriend.dao.IItemDAO;
import com.goodfriend.model.Item;
import com.goodfriend.service.IItemService;

/**
 * @author lenovo
 *
 */
public class ItemService implements IItemService {
    
    private IItemDAO itemDAO;

    /* (non-Javadoc)
     * @see com.goodfriend.service.IItemService#findItemById(java.lang.Integer)
     */
    public Item getItemById(Integer id) {
	Item item = itemDAO.findById(id);
	return item;
    }

    /**
     * @param itemDAO the itemDAO to set
     */
    public void setItemDAO(IItemDAO itemDAO) {
	this.itemDAO = itemDAO;
    }

    /**
     * @return the itemDAO
     */
    public IItemDAO getItemDAO() {
	return itemDAO;
    }

}
