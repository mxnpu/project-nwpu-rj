package com.goodfriend.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.goodfriend.dao.IBlogDAO;
import com.goodfriend.model.Blog;
import com.goodfriend.model.User;
import com.goodfriend.util.BlogComparator;

import edu.emory.mathcs.backport.java.util.Collections;

/**
 * A data access object (DAO) providing persistence and search support for Blog
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.goodfriend.model.Blog
 * @author 
 */

public class BlogDAO extends HibernateDaoSupport implements IBlogDAO {
	private static final Log log = LogFactory.getLog(BlogDAO.class);
	// property constants
	public static final String TITLE = "title";
	public static final String CONTENT = "content";

	protected void initDao() {
		// do nothing
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IBlogDAO#save(com.goodfriend.model.Blog)
	 */
	public void save(Blog transientInstance) {
		log.debug("saving Blog instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IBlogDAO#delete(com.goodfriend.model.Blog)
	 */
	public void delete(Blog persistentInstance) {
		log.debug("deleting Blog instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IBlogDAO#findById(java.lang.Integer)
	 */
	public Blog findById(java.lang.Integer id) {
		log.debug("getting Blog instance with id: " + id);
		try {
			Blog instance = (Blog) getHibernateTemplate().get(
					"com.goodfriend.model.Blog", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Blog> findByExample(Blog instance) {
		log.debug("finding Blog instance by example");
		try {
			List<Blog> results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Blog> findByProperty(String propertyName, Object value) {
		log.debug("finding Blog instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Blog as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Blog> findByTitle(Object title) {
		return findByProperty(TITLE, title);
	}

	public List<Blog> findByContent(Object content) {
		return findByProperty(CONTENT, content);
	}

	/* (non-Javadoc)
	 * @see com.goodfriend.dao.impl.IBlogDAO#findAll()
	 */
	@SuppressWarnings("unchecked")
	public List<Blog> findAll() {
		log.debug("finding all Blog instances");
		try {
			String queryString = "from Blog";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Blog merge(Blog detachedInstance) {
		log.debug("merging Blog instance");
		try {
			Blog result = (Blog) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Blog instance) {
		log.debug("attaching dirty Blog instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Blog instance) {
		log.debug("attaching clean Blog instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static IBlogDAO getFromApplicationContext(ApplicationContext ctx) {
		return (IBlogDAO) ctx.getBean("BlogDAO");
	}

	//方法需要改进！！
	public List<Blog> findByPage(User user, int index, int size) {
		// TODO Auto-generated method stub
		List<Blog> allBlogs = findAll();
		//将日志按时间排序
		Collections.sort(allBlogs, new BlogComparator());
		List<Blog> tempList = new ArrayList<Blog>();
		List<Blog> result = new ArrayList<Blog>();
		for (int i = 0; i < allBlogs.size(); i++){
			if (allBlogs.get(i).getItem().getUser().getUserName().equals(user.getUserName())){
				//替换掉所有的html标签  
//				allBlogs.get(i).setContent(allBlogs.get(i).getContent().replaceAll("<[^<]+?>", ""));
				tempList.add(allBlogs.get(i));
			}
		}
		if (index * size - size > tempList.size()){
			return result;
		}else if (index * size > tempList.size()){
			return tempList.subList(index * size - size, tempList.size());
		}else{
			result = tempList.subList(index * size - size, index * size);
			return result;
		}
	}
	
	public int getTotalPage(User user, int pageSize){
		List<Blog> allBlogs = findAll();
		
		int count = 0;
		for (int i = 0; i < allBlogs.size(); i++){
			if (allBlogs.get(i).getItem().getUser().getUserName().equals(user.getUserName())){
				
				count++;
			}
		}
		return (int)Math.ceil(count / (double)pageSize);
	}
}