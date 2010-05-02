package com.goodfriend.dao.impl;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.goodfriend.dao.IReplyDAO;
import com.goodfriend.model.Reply;

/**
 * A data access object (DAO) providing persistence and search support for Reply
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.goodfriend.model.Reply
 * @author 
 */

public class ReplyDAO extends HibernateDaoSupport implements IReplyDAO {
	private static final Log log = LogFactory.getLog(ReplyDAO.class);
	// property constants
	public static final String CONTENT = "content";

	protected void initDao() {
		// do nothing
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IReplyDAO#save(com.goodfriend.model.Reply)
	 */
	public void save(Reply transientInstance) {
		log.debug("saving Reply instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IReplyDAO#delete(com.goodfriend.model.Reply)
	 */
	public void delete(Reply persistentInstance) {
		log.debug("deleting Reply instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IReplyDAO#findById(java.lang.Integer)
	 */
	public Reply findById(java.lang.Integer id) {
		log.debug("getting Reply instance with id: " + id);
		try {
			Reply instance = (Reply) getHibernateTemplate().get(
					"com.goodfriend.model.Reply", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Reply> findByExample(Reply instance) {
		log.debug("finding Reply instance by example");
		try {
			List<Reply> results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Reply> findByProperty(String propertyName, Object value) {
		log.debug("finding Reply instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Reply as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Reply> findByContent(Object content) {
		return findByProperty(CONTENT, content);
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IReplyDAO#findAll()
	 */
	@SuppressWarnings("unchecked")
	public List<Reply> findAll() {
		log.debug("finding all Reply instances");
		try {
			String queryString = "from Reply";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Reply merge(Reply detachedInstance) {
		log.debug("merging Reply instance");
		try {
			Reply result = (Reply) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Reply instance) {
		log.debug("attaching dirty Reply instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Reply instance) {
		log.debug("attaching clean Reply instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static IReplyDAO getFromApplicationContext(ApplicationContext ctx) {
		return (IReplyDAO) ctx.getBean("ReplyDAO");
	}
}