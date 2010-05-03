package com.goodfriend.dao.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.goodfriend.dao.IAlbumDAO;
import com.goodfriend.model.Album;
import com.goodfriend.model.Item;
import com.goodfriend.model.flex.FAlbum;
import com.goodfriend.model.flex.FItem;

/**
 * A data access object (DAO) providing persistence and search support for Album
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.goodfriend.model.Album
 * @author 
 */

public class AlbumDAO extends HibernateDaoSupport implements IAlbumDAO {
	private static final Log log = LogFactory.getLog(AlbumDAO.class);
	// property constants
	public static final String TITLE = "title";

	protected void initDao() {
		// do nothing
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IAlbumDAO#save(com.goodfriend.model.Album)
	 */
	public void save(Album transientInstance) {
		log.debug("saving Album instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IAlbumDAO#delete(com.goodfriend.model.Album)
	 */
	public void delete(Album persistentInstance) {
		log.debug("deleting Album instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IAlbumDAO#findById(java.lang.Integer)
	 */
	public Album findById(java.lang.Integer id) {
		log.debug("getting Album instance with id: " + id);
		try {
			Album instance = (Album) getHibernateTemplate().get(
					"com.goodfriend.model.Album", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Album> findByExample(Album instance) {
		log.debug("finding Album instance by example");
		try {
			List<Album> results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Album> findByProperty(String propertyName, Object value) {
		log.debug("finding Album instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Album as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Album> findByTitle(Object title) {
		return findByProperty(TITLE, title);
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IAlbumDAO#findAll()
	 */
	@SuppressWarnings("unchecked")
	public List<Album> findAll() {
		log.debug("finding all Album instances");
		try {
			String queryString = "from Album";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Album merge(Album detachedInstance) {
		log.debug("merging Album instance");
		try {
			Album result = (Album) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Album instance) {
		log.debug("attaching dirty Album instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Album instance) {
		log.debug("attaching clean Album instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
	
	///////////////////////////苗欣begin///////////////////////////////
	public List<FAlbum> findAllFlex(){
		List<Album> temp = findAll();
		List<FAlbum> result = new ArrayList<FAlbum>();
		FAlbum album;
		for(int i = 0; i <temp.size(); i++){
			album = new FAlbum();
			album.setIdAlbum(temp.get(i).getIdAlbum());
			album.setItemId(temp.get(i).getItem().getIdItem());
			album.setTitle(temp.get(i).getTitle());
			album.setCover(temp.get(i).getCover());
			album.setDescription(temp.get(i).getDescription());
			System.out.println(temp.get(i).getIdAlbum());
			result.add(album);
		}
		return result;
	}
	
	public FAlbum findByIdFlex(int id){
		Album a = findById(id);
		FAlbum album = new FAlbum();
		album.setIdAlbum(a.getIdAlbum());
		album.setItemId(a.getItem().getIdItem());
		album.setTitle(a.getTitle());
		album.setCover(a.getCover());
		album.setDescription(a.getDescription());
		return album;
	}
	
	public void saveFlex(FAlbum fAlbum, FItem fItem){
		Item item = new Item();
		item.setRecordTime(new Timestamp(fItem.getRecordTime().getTime()));
		
		Album album = new Album();
		album.setItem(item);
		album.setCover(fAlbum.getCover());
		album.setDescription(fAlbum.getDescription());
		album.setTitle(fAlbum.getTitle());
		System.out.println(album.getTitle());
		save(album);
	}
	
	//////////////////////////////end//////////////////////////////////

	public static IAlbumDAO getFromApplicationContext(ApplicationContext ctx) {
		return (IAlbumDAO) ctx.getBean("AlbumDAO");
	}
}