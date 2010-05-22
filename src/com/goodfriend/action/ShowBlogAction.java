package com.goodfriend.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.goodfriend.model.Blog;
import com.goodfriend.service.IBlogService;
import com.opensymphony.xwork2.ActionContext;

/**
 * 用户查看自己已写的日志时使用
 * @author Miao Xin
 * 创建时间：2010/05/15
 * 最后修改时间：2010/05/15
 */
public class ShowBlogAction implements ServletRequestAware{
	
	private IBlogService blogService;
	
	private Blog blog;

	private HttpServletRequest request;
	
	public String showBlog(){
		
		int id = Integer.parseInt(request.getParameter("id"));
		blog = blogService.getBlog(id);
		
		return "success";
	}
	

	public Blog getBlog() {
		return blog;
	}

	public void setBlog(Blog blog) {
		this.blog = blog;
	}


	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		
	}
	
	public IBlogService getBlogService() {
		return blogService;
	}


	public void setBlogService(IBlogService blogService) {
		this.blogService = blogService;
	}

}
