package com.goodfriend.dao.impl;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.goodfriend.dao.IMailDAO;
import com.goodfriend.model.Mail;

/**
 * A data access object (DAO) providing persistence and search support for Mail
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.goodfriend.model.Mail
 * @author 
 */

public class MailDAO extends HibernateDaoSupport implements IMailDAO {
	private static final Log log = LogFactory.getLog(MailDAO.class);
	// property constants
	public static final String TITLE = "title";
	public static final String CONTENT = "content";

	protected void initDao() {
		// do nothing
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IMailDAO#save(com.goodfriend.model.Mail)
	 */
	public void save(Mail transientInstance) {
		log.debug("saving Mail instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IMailDAO#delete(com.goodfriend.model.Mail)
	 */
	public void delete(Mail persistentInstance) {
		log.debug("deleting Mail instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IMailDAO#findById(java.lang.Integer)
	 */
	public Mail findById(java.lang.Integer id) {
		log.debug("getting Mail instance with id: " + id);
		try {
			Mail instance = (Mail) getHibernateTemplate().get(
					"com.goodfriend.model.Mail", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IMailDAO#findByExample(com.goodfriend.model.Mail)
	 */
	@SuppressWarnings("unchecked")
	public List<Mail> findByExample(Mail instance) {
		log.debug("finding Mail instance by example");
		try {
			List<Mail> results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IMailDAO#findByProperty(java.lang.String, java.lang.Object)
	 */
	@SuppressWarnings("unchecked")
	public List<Mail> findByProperty(String propertyName, Object value) {
		log.debug("finding Mail instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Mail as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IMailDAO#findByTitle(java.lang.Object)
	 */
	public List<Mail> findByTitle(Object title) {
		return findByProperty(TITLE, title);
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IMailDAO#findByContent(java.lang.Object)
	 */
	public List<Mail> findByContent(Object content) {
		return findByProperty(CONTENT, content);
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IMailDAO#findAll()
	 */
	@SuppressWarnings("unchecked")
	public List<Mail> findAll() {
		log.debug("finding all Mail instances");
		try {
			String queryString = "from Mail";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IMailDAO#merge(com.goodfriend.model.Mail)
	 */
	public Mail merge(Mail detachedInstance) {
		log.debug("merging Mail instance");
		try {
			Mail result = (Mail) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IMailDAO#attachDirty(com.goodfriend.model.Mail)
	 */
	public void attachDirty(Mail instance) {
		log.debug("attaching dirty Mail instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IMailDAO#attachClean(com.goodfriend.model.Mail)
	 */
	public void attachClean(Mail instance) {
		log.debug("attaching clean Mail instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static IMailDAO getFromApplicationContext(ApplicationContext ctx) {
		return (IMailDAO) ctx.getBean("MailDAO");
	}
}