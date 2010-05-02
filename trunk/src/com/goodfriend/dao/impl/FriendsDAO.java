package com.goodfriend.dao.impl;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.goodfriend.dao.IFriendsDAO;
import com.goodfriend.model.Friends;

/**
 * A data access object (DAO) providing persistence and search support for
 * Friends entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.goodfriend.model.Friends
 * @author 
 */

public class FriendsDAO extends HibernateDaoSupport implements IFriendsDAO {
	private static final Log log = LogFactory.getLog(FriendsDAO.class);
	// property constants
	public static final String SUCCESS = "success";
	public static final String GROUP = "group";

	protected void initDao() {
		// do nothing
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IFriends#save(com.goodfriend.model.Friends)
	 */
	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IFriendsDAO#save(com.goodfriend.model.Friends)
	 */
	public void save(Friends transientInstance) {
		log.debug("saving Friends instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IFriends#delete(com.goodfriend.model.Friends)
	 */
	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IFriendsDAO#delete(com.goodfriend.model.Friends)
	 */
	public void delete(Friends persistentInstance) {
		log.debug("deleting Friends instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IFriends#findById(java.lang.Integer)
	 */
	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IFriendsDAO#findById(java.lang.Integer)
	 */
	public Friends findById(java.lang.Integer id) {
		log.debug("getting Friends instance with id: " + id);
		try {
			Friends instance = (Friends) getHibernateTemplate().get(
					"com.goodfriend.model.Friends", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Friends> findByExample(Friends instance) {
		log.debug("finding Friends instance by example");
		try {
			List<Friends> results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Friends> findByProperty(String propertyName, Object value) {
		log.debug("finding Friends instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Friends as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Friends> findBySuccess(Object success) {
		return findByProperty(SUCCESS, success);
	}

	public List<Friends> findByGroup(Object group) {
		return findByProperty(GROUP, group);
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IFriends#findAll()
	 */
	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IFriendsDAO#findAll()
	 */
	@SuppressWarnings("unchecked")
	public List<Friends> findAll() {
		log.debug("finding all Friends instances");
		try {
			String queryString = "from Friends";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Friends merge(Friends detachedInstance) {
		log.debug("merging Friends instance");
		try {
			Friends result = (Friends) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Friends instance) {
		log.debug("attaching dirty Friends instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Friends instance) {
		log.debug("attaching clean Friends instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static IFriendsDAO getFromApplicationContext(ApplicationContext ctx) {
		return (IFriendsDAO) ctx.getBean("FriendsDAO");
	}
}