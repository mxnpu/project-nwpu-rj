package com.goodfriend.dao.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
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
import com.goodfriend.model.User;
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
	
	public static final String DEFAULT_ALBUM = "default album";
	
	private UserDAO userDAO;

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
//		album.setCover(fAlbum.getCover());
		album.setTitle(fAlbum.getTitle());
		
		save(album);
	}
	
	//新建一个相册
	public void createAlbum(int userID, String title){
		Album album = new Album();
		Item item = new Item();
		User user = userDAO.findById(userID);
		item.setUser(user);
		album.setItem(item);
		album.setTitle(title);
		//创建相册的时候它的path属性为""
		album.setPath("");
		save(album);
	}
	
	//获得一个用户的所有相册名称
	public List<String> getAlbumTitles(int userID){		
		List<Album> albums = findAll();
		List<String> titles = new ArrayList<String>();
		for (int i = 0; i < albums.size(); i++){
			if (albums.get(i).getItem().getUser().getIdUser() == userID){
				if (!titles.contains(albums.get(i).getTitle())){
					titles.add(albums.get(i).getTitle());
				}
			}
		}
		return titles;
	}
	//保存一张图片到数据库
	public void saveImage(int userID, String groupName, String path){
		User user = userDAO.findById(userID);
		
		Album album = new Album();
		Item item = new Item();
		item.setUser(user);
		album.setTitle(groupName);
		album.setPath(path);
		album.setItem(item);
		album.setDescription("");
		save(album);
	}
	
	//根据相册名称返回相册中的所有图片
	public List<Album> getImagesByAlbumName(int userID, String albumName){
		List<Album> albums = findAll();
		List<Album> result = new ArrayList<Album>();
		for (int i = 0; i < albums.size(); i++){
			if (albums.get(i).getItem().getUser().getIdUser() == userID){
				if (albums.get(i).getTitle().equals(albumName) && !albums.get(i).getPath().equals("")){
					result.add(albums.get(i));
				}
			}
		}
		return result;
	}
	
	//根据相册名删除相册  把该相册下的所有图片转移到default album相册下
	public void removeAlbum(int userID, String albumName){
		List<Album> albums = this.findByProperty("title", albumName);
		Album album;
		for (int i = 0; i < albums.size(); i++){
			album = albums.get(i);
			if (album.getItem().getUser().getIdUser() == userID){
				if (!albums.get(i).getPath().equals("")){
					if (album.getTitle().equals(albumName)){
						album.setTitle(DEFAULT_ALBUM);
						attachDirty(album);
					}
				}else{
					delete(album);
				}
			}
		}
	}
	
	//删除一张图片信息
	public void deleteImage(int userID, String albumName, String path){
		List<Album> albums = this.findByProperty("title", albumName);
		Album album;
		for (int i = 0; i < albums.size(); i++){
			album = albums.get(i);
			if (album.getItem().getUser().getIdUser() == userID){
				//传递过来的path是完整路径  数据库中保存的只是文件名
				if (path.contains(album.getPath())){
					delete(album);
					break;
				}
			}
		}
	}
	
	//更新图片描述
	public void updateDescription(int userID, String albumName, String path, String description){
		List<Album> albums = this.findByProperty("title", albumName);
		Album album;
		for (int i = 0; i < albums.size(); i++){
			album = albums.get(i);
			if (album.getItem().getUser().getIdUser() == userID){
				//传递过来的path是完整路径  数据库中保存的只是文件名
				if (path.contains(album.getPath())){
					album.setDescription(description);
					attachDirty(album);
					break;
				}
			}
		}
	}
	
	//改变一张图片所属的相册
	public void moveImage(int userID, String fromAlbum, String toAlbum, String path){
		List<Album> albums = this.findByProperty("title", fromAlbum);
		Album album;
		for (int i = 0; i < albums.size(); i++){
			album = albums.get(i);
			if (album.getItem().getUser().getIdUser() == userID){
				//传递过来的path是完整路径  数据库中保存的只是文件名
				if (path.contains(album.getPath())){
					album.setTitle(toAlbum);
					attachDirty(album);
					break;
				}
			}
		}
	}
	
	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	
}