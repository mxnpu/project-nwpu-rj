package com.goodfriend.service;

import java.util.List;

import com.goodfriend.model.Blog;
import com.goodfriend.model.User;

/**
 * 
 * 
 * @author Miao Xin
 * 创建时间：2010/05/12 
 * 最后修改时间：2010/05/15
 */
public interface IBlogService {
	
	public void addBlog(Blog blog, User user);
	
	public void deleteBlog(Blog blog);
	
	public void updateBlog(Blog blog);
	
	public List<Blog> getAllBlogs();
	
	public List<Blog> getBlogsByPage(User user, int index, int pageSize);
	
	public List<Blog> getBlogByProperty(String propertyName, Object value);
	
	public Blog getBlog(int id);
	
	public int getTotalPage(User user, int pageSize);
	
	public void updateBlog(int id, String title, String content);
}
