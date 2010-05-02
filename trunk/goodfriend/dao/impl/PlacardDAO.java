package com.goodfriend.dao.impl;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.goodfriend.dao.IPlacardDAO;
import com.goodfriend.model.Placard;

/**
 * A data access object (DAO) providing persistence and search support for
 * Placard entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.goodfriend.model.Placard
 * @author
 */

public class PlacardDAO extends HibernateDaoSupport implements IPlacardDAO {
	private static final Log log = LogFactory.getLog(PlacardDAO.class);
	// property constants
	public static final String TITLE = "title";
	public static final String CONTENT = "content";
	public static final String PUBLISH = "publish";

	protected void initDao() {
		// do nothing
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IPlacardDAO#save(com.goodfriend.model.Placard)
	 */
	public void save(Placard transientInstance) {
		log.debug("saving Placard instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IPlacardDAO#delete(com.goodfriend.model.Placard)
	 */
	public void delete(Placard persistentInstance) {
		log.debug("deleting Placard instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IPlacardDAO#findById(java.lang.Integer)
	 */
	public Placard findById(java.lang.Integer id) {
		log.debug("getting Placard instance with id: " + id);
		try {
			Placard instance = (Placard) getHibernateTemplate().get(
					"com.goodfriend.model.Placard", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Placard> findByExample(Placard instance) {
		log.debug("finding Placard instance by example");
		try {
			List<Placard> results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Placard> findByProperty(String propertyName, Object value) {
		log.debug("finding Placard instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Placard as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Placard> findByTitle(Object title) {
		return findByProperty(TITLE, title);
	}

	public List<Placard> findByContent(Object content) {
		return findByProperty(CONTENT, content);
	}

	public List<Placard> findByPublish(Object publish) {
		return findByProperty(PUBLISH, publish);
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IPlacardDAO#findAll()
	 */
	@SuppressWarnings("unchecked")
	public List<Placard> findAll() {
		log.debug("finding all Placard instances");
		try {
			String queryString = "from Placard";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Placard merge(Placard detachedInstance) {
		log.debug("merging Placard instance");
		try {
			Placard result = (Placard) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Placard instance) {
		log.debug("attaching dirty Placard instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Placard instance) {
		log.debug("attaching clean Placard instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static IPlacardDAO getFromApplicationContext(ApplicationContext ctx) {
		return (IPlacardDAO) ctx.getBean("PlacardDAO");
	}
}