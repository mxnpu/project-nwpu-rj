package com.goodfriend.action;

import java.util.List;

import com.goodfriend.model.Blog;
import com.goodfriend.model.User;
import com.goodfriend.service.IBlogService;
import com.goodfriend.service.IUserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import edu.emory.mathcs.backport.java.util.Collections;

/**
 * 分页显示某个用户的所有日志
 * 
 * @author Miao Xin
 * 创建时间：2010/05/13
 * 最后修改时间：2010/05/13
 *
 */
public class ShowAllBlogsAction extends ActionSupport{

	private IBlogService blogService;
	
	//测试使用
	private IUserService userService;
	
	private int pageNow = 1;
	
	private int pageSize = 5;
	
	private List<Blog> blogs;
	
	private int totalPage;
	

	public String showBlogs() throws Exception{
		User user = (User)ActionContext.getContext().getSession().get("currentUser");
		blogs = blogService.getBlogsByPage(user, pageNow, pageSize);
		Collections.sort(blogs);
		totalPage = blogService.getTotalPage(user, pageSize);
		return "success";
	}
	
	public int getPageNow() {
		return pageNow;
	}

	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	public IBlogService getBlogService() {
		return blogService;
	}

	public void setBlogService(IBlogService blogService) {
		this.blogService = blogService;
	}

	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
	

	public List<Blog> getBlogs() {
		return blogs;
	}

	public void setBlogs(List<Blog> blogs) {
		this.blogs = blogs;
	}
	
	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}


}
