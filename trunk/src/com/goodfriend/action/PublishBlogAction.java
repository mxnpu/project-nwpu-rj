package com.goodfriend.action;

import com.goodfriend.model.Blog;
import com.goodfriend.service.IBlogService;
import com.goodfriend.service.IUserService;

/**
 * 负责处理发布blog的Action
 * 
 * @author Miao Xin
 * 创建时间：2010/05/12
 * 最后修改时间：2010/05/12
 *
 */
public class PublishBlogAction {
	
	private IBlogService blogService;
	
	private IUserService userService;
	
	private String title;
	
	private String content;
	
	public IUserService getUserService() {
		return userService;
	}



	public void setUserService(IUserService userService) {
		this.userService = userService;
	}


	
	public String publish() throws Exception{
		Blog blog = new Blog();
		blog.setTitle(title);
		blog.setContent(content);
		blogService.addBlog(blog, userService.getUser(1));
		
		return "success";
	}
	
	
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}


	public IBlogService getBlogService() {
		return blogService;
	}

	public void setBlogService(IBlogService blogService) {
		this.blogService = blogService;
	}


}
