package com.goodfriend.dao.impl;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.goodfriend.dao.IGossipDAO;
import com.goodfriend.model.Gossip;

/**
 * A data access object (DAO) providing persistence and search support for
 * Gossip entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.goodfriend.model.Gossip
 * @author 
 */

public class GossipDAO extends HibernateDaoSupport implements IGossipDAO {
	private static final Log log = LogFactory.getLog(GossipDAO.class);
	// property constants
	public static final String CONTENT = "content";

	protected void initDao() {
		// do nothing
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IGossipDAO#save(com.goodfriend.model.Gossip)
	 */
	public void save(Gossip transientInstance) {
		log.debug("saving Gossip instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IGossipDAO#delete(com.goodfriend.model.Gossip)
	 */
	public void delete(Gossip persistentInstance) {
		log.debug("deleting Gossip instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IGossipDAO#findById(java.lang.Integer)
	 */
	public Gossip findById(java.lang.Integer id) {
		log.debug("getting Gossip instance with id: " + id);
		try {
			Gossip instance = (Gossip) getHibernateTemplate().get(
					"com.goodfriend.model.Gossip", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Gossip> findByExample(Gossip instance) {
		log.debug("finding Gossip instance by example");
		try {
			List<Gossip> results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Gossip> findByProperty(String propertyName, Object value) {
		log.debug("finding Gossip instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Gossip as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Gossip> findByContent(Object content) {
		return findByProperty(CONTENT, content);
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IGossipDAO#findAll()
	 */
	@SuppressWarnings("unchecked")
	public List<Gossip> findAll() {
		log.debug("finding all Gossip instances");
		try {
			String queryString = "from Gossip";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Gossip merge(Gossip detachedInstance) {
		log.debug("merging Gossip instance");
		try {
			Gossip result = (Gossip) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Gossip instance) {
		log.debug("attaching dirty Gossip instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Gossip instance) {
		log.debug("attaching clean Gossip instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static IGossipDAO getFromApplicationContext(ApplicationContext ctx) {
		return (IGossipDAO) ctx.getBean("GossipDAO");
	}
}