package com.goodfriend.service.impl;


import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import com.goodfriend.dao.IBlogDAO;
import com.goodfriend.model.Blog;
import com.goodfriend.model.Item;
import com.goodfriend.model.User;
import com.goodfriend.service.IBlogService;

/**
 * Blog的数据库操作类 
 * 
 * @author Miao Xin
 * 创建时间：2010/05/12
 * 最后修改时间：2010/05/13
 *
 */
public class BlogService implements IBlogService {
	
	private IBlogDAO blogDao;
	
	public IBlogDAO getBlogDao() {
		return blogDao;
	}

	public void setBlogDao(IBlogDAO blogDao) {
		this.blogDao = blogDao;
	}

	public void addBlog(Blog blog, User user) {
		// TODO Auto-generated method stub
		Item item = new Item();
		item.setRecordTime(new Timestamp(new Date().getTime()));
		item.setUser(user);
		
		blog.setItem(item);
		blogDao.save(blog);
	}

	public void deleteBlog(Blog blog) {
		// TODO Auto-generated method stub
		blogDao.delete(blog);
	}

	public List<Blog> getAllBlogs() {
		// TODO Auto-generated method stub
		return null;
	}
	
	public List<Blog> getBlogsByPage(User user, int index, int pageSize){
		return blogDao.findByPage(user, index, pageSize);
	}

	public List<Blog> getBlogByProperty(String propertyName, Object value) {
		// TODO Auto-generated method stub
		return null;
	}

	public void updateBlog(Blog blog) {
		// TODO Auto-generated method stub

	}
	
	public int getTotalPage(User user, int pageSize){
		return blogDao.getTotalPage(user, pageSize);
	}
}
