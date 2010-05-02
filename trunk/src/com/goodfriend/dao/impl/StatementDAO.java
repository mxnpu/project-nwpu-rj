package com.goodfriend.dao.impl;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.goodfriend.dao.IStatementDAO;
import com.goodfriend.model.Statement;

/**
 * A data access object (DAO) providing persistence and search support for
 * Statement entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.goodfriend.model.Statement
 * @author 
 */

public class StatementDAO extends HibernateDaoSupport implements IStatementDAO {
	private static final Log log = LogFactory.getLog(StatementDAO.class);
	// property constants
	public static final String CONTENT = "content";

	protected void initDao() {
		// do nothing
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IStatementDAO#save(com.goodfriend.model.Statement)
	 */
	public void save(Statement transientInstance) {
		log.debug("saving Statement instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IStatementDAO#delete(com.goodfriend.model.Statement)
	 */
	public void delete(Statement persistentInstance) {
		log.debug("deleting Statement instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IStatementDAO#findById(java.lang.Integer)
	 */
	public Statement findById(java.lang.Integer id) {
		log.debug("getting Statement instance with id: " + id);
		try {
			Statement instance = (Statement) getHibernateTemplate().get(
					"com.goodfriend.model.Statement", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Statement> findByExample(Statement instance) {
		log.debug("finding Statement instance by example");
		try {
			List<Statement> results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Statement> findByProperty(String propertyName, Object value) {
		log.debug("finding Statement instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Statement as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Statement> findByContent(Object content) {
		return findByProperty(CONTENT, content);
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IStatementDAO#findAll()
	 */
	@SuppressWarnings("unchecked")
	public List<Statement> findAll() {
		log.debug("finding all Statement instances");
		try {
			String queryString = "from Statement";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Statement merge(Statement detachedInstance) {
		log.debug("merging Statement instance");
		try {
			Statement result = (Statement) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Statement instance) {
		log.debug("attaching dirty Statement instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Statement instance) {
		log.debug("attaching clean Statement instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static IStatementDAO getFromApplicationContext(ApplicationContext ctx) {
		return (IStatementDAO) ctx.getBean("StatementDAO");
	}
}