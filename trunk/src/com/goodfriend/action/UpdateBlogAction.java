package com.goodfriend.action;

import com.goodfriend.service.IBlogService;
import com.opensymphony.xwork2.ActionContext;

public class UpdateBlogAction {
	
	private IBlogService blogService;

	private int id;
	
	private String title;
	
	private String content;
	
	public String updateBlog(){
		blogService.updateBlog(id, title, content);
		return "success";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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
