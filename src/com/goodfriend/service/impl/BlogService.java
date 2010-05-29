package com.goodfriend.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.goodfriend.dao.IBlogDAO;
import com.goodfriend.dao.IUserDAO;
import com.goodfriend.model.Blog;
import com.goodfriend.model.Item;
import com.goodfriend.model.User;
import com.goodfriend.service.IBlogService;

/**
 * Blog的数据库操作类
 * 
 * @author Miao Xin 创建时间：2010/05/12 最后修改时间：2010/05/13
 * 
 */
public class BlogService implements IBlogService {

    private IBlogDAO blogDao;
    private IUserDAO userDao;

    public void addBlog(Blog blog, User user) {

	Item item = new Item();
	item.setRecordTime(new Timestamp(new Date().getTime()));
	item.setUser(user);

	blog.setItem(item);
	blogDao.save(blog);
    }

    public void deleteBlog(Blog blog) {

	blogDao.delete(blog);
    }

    public List<Blog> getAllBlogs() {
	List<Blog> blogs = blogDao.findAll();

	return blogs;
    }

    public List<Blog> getBlogsByPage(User user, int index, int pageSize) {
	return blogDao.findByPage(user, index, pageSize);
    }

    public List<Blog> getBlogByProperty(String propertyName, Object value) {
	return null;
    }

    public void updateBlog(Blog blog) {
	blogDao.attachDirty(blog);
    }

    public void updateBlog(int id, String title, String content) {
	Blog blog = blogDao.findById(id);
	blog.setTitle(title);
	blog.setContent(content);
	blogDao.attachDirty(blog);
    }
    
    /**
     * Get one user's all blogs.
     * 
     * @param userId the blogs own to.
     * @return the list of the one user's blog which are wanted.
     */
    public List<Blog> getBlogsByUser(Integer userId) {
	List<Blog> blogs = new ArrayList<Blog>();
	
	List<Blog> allBlogs = getAllBlogs();
	for (Blog temp : allBlogs) {
	    Integer id = temp.getItem().getUser().getIdUser();
	    
	    if (id.equals(userId)) {
		blogs.add(temp);
	    }
	}
	
	return blogs;
    }

    /**
     * Get the blogs of the user by the deadline
     * 
     * @param userId
     *            the id of the user.
     * @param deadlint
     *            the deadline of the blog wanted.
     */
    public List<Blog> getBlogsByDeadline(Integer userId, Timestamp deadline) {
	List<Blog> blogs = new ArrayList<Blog>();

	List<Blog> allBlogs = getBlogsByUser(userId);
	long deadlineTime = deadline.getTime();

	if (allBlogs != null && allBlogs.size() > 0) {
	    for (Blog temp : allBlogs) {
		
		long time = temp.getItem().getRecordTime().getTime();
		if (time > deadlineTime) {
		    String content = temp.getContent().replaceAll("<[^<]+?>", "");
		    temp.setContent(content);
		    blogs.add(temp);
		}
	    }
	}

	return blogs;
    }

    public int getTotalPage(User user, int pageSize) {
	return blogDao.getTotalPage(user, pageSize);
    }

    public Blog getBlog(int id) {

	return blogDao.findById(id);
    }

    public IBlogDAO getBlogDao() {
	return blogDao;
    }

    public void setBlogDao(IBlogDAO blogDao) {
	this.blogDao = blogDao;
    }

    /**
     * @param userDao
     *            the userDao to set
     */
    public void setUserDao(IUserDAO userDao) {
	this.userDao = userDao;
    }

    /**
     * @return the userDao
     */
    public IUserDAO getUserDao() {
	return userDao;
    }
}
