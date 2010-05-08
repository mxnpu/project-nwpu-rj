package com.goodfriend.dao.impl;

import java.sql.Timestamp;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.goodfriend.dao.IAlbumDAO;
import com.goodfriend.model.Album;
import com.goodfriend.model.Item;
import com.goodfriend.model.flex.FAlbum;
import com.goodfriend.model.flex.FItem;
import com.goodfriend.service.IUserService;

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

	public void save(Album transientInstance) {
		log.debug("saving Album instance");
		Session session;
		try {
			session = getSessionFactory().openSession();
			session.beginTransaction();
			session.save(transientInstance);
			session.getTransaction().commit();
			session.close();
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Album persistentInstance) {
		log.debug("deleting Album instance");
		Session session;
		try {
			session = getSessionFactory().openSession();
			session.beginTransaction();
			session.delete(persistentInstance);
			session.getTransaction().commit();
			session.close();
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Album findById(java.lang.Integer id) {
		log.debug("getting Album instance with id: " + id);
		Session session;
		try {
			session = getSessionFactory().openSession();
			session.beginTransaction();
			Album instance = (Album) session.get("com.goodfriend.model.Album", id);
			session.getTransaction().commit();
			session.close();
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
		Session session;
		try {
			session = getSessionFactory().openSession();
			session.beginTransaction();
			String queryString = "from Album as model where model."
				+ propertyName + "= ?";
			Query queryObject = session.createQuery(queryString);
			Object[] values = new Object[] {value};
			if (values != null) {
				for (int i = 0; i < values.length; i++) {
					queryObject.setParameter(i, values[i]);
				}
			}
			List<Album> lists =  queryObject.list();
			session.getTransaction().commit();
			session.close();
			return lists;
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Album> findByTitle(Object title) {
		return findByProperty(TITLE, title);
	}

	@SuppressWarnings("unchecked")
	public List<Album> findAll() {
		log.debug("finding all Album instances");
		Session session;
		try {
			session = getSessionFactory().openSession();
			session.beginTransaction();
			String queryString = "from Album";
			List<Album> lists = (List<Album>) session.createQuery(queryString);
			session.getTransaction().commit();
			session.close();
			
			return lists;
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Album merge(Album detachedInstance) {
		log.debug("merging Album instance");
		Session session;
		try {
			session = getSessionFactory().openSession();
			session.beginTransaction();
			Album result = (Album)session.merge(detachedInstance);
			session.getTransaction().commit();
			session.close();
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Album instance) {
		log.debug("attaching dirty Album instance");
		Session session;
		try {
			session = getSessionFactory().openSession();
			session.beginTransaction();
			session.saveOrUpdate(instance);
			session.getTransaction().commit();
			session.close();
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Album instance) {
		log.debug("attaching clean Album instance");
		Session session;
		try {
			session = getSessionFactory().openSession();
			session.beginTransaction();
			session.lock(instance,LockMode.NONE);
			session.getTransaction().commit();
			session.close();
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static IAlbumDAO getFromApplicationContext(ApplicationContext ctx) {
		return (IAlbumDAO) ctx.getBean("AlbumDAO");
	}
	
	public void saveAlbumFlex(FAlbum fAlbum, FItem fItem){
		Album album = new Album();
		Item item = new Item();
		item.setRecordTime(new Timestamp(fItem.getRecordTime().getTime()));
		
		
		ApplicationContext ctx = new ClassPathXmlApplicationContext("beans-test.xml");
		IUserService userService = (IUserService) ctx.getBean("userService");
		item.setUser(userService.getUser(1));
		album.setItem(item);
		album.setCover(fAlbum.getCover());
		album.setTitle(fAlbum.getTitle());
		
		save(album);
	}
}