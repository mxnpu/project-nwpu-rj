package com.goodfriend.action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.goodfriend.model.Blog;
import com.goodfriend.model.Reply;
import com.goodfriend.model.User;
import com.goodfriend.service.IBlogService;
import com.goodfriend.service.IReplyService;
import com.opensymphony.xwork2.ActionContext;

import edu.emory.mathcs.backport.java.util.Collections;

/**
 * 负责日志的添加 删除 和修改等操作
 * 创建日期：2010/05/26
 */
public class BlogAction implements ServletRequestAware{

	private IBlogService blogService;
	
	private IReplyService replyService;


	//当修改某一篇日志的时候使用下面三个对象
	private int id;
	private String title;
	private String content;
	
	//发布的留言内容
	private String replyContent;
	
	//当查看某一篇日志的时候使用该对象
	private Blog blog;
	
	private int pageNow = 1;
	
	private int pageSize = 5;
	
	private List<Blog> blogs;
	
	private List<Reply> replyList = new ArrayList<Reply>();
	
	private int totalPage;
	
	private HttpServletRequest request;
	
	//显示所有日志
	public String showBlogs() throws Exception{
		User user = (User)ActionContext.getContext().getSession().get("currentUser");
		blogs = blogService.getBlogsByPage(user, pageNow, pageSize);
		Collections.sort(blogs);
		totalPage = blogService.getTotalPage(user, pageSize);
		return "success";
	}
	
	//显示某一篇日志
	public String showBlog(){
		int id = Integer.parseInt(request.getParameter("id"));
		blog = blogService.getBlog(id);
		
		if (request.getParameter("state").equals("show")){
			Iterator<Reply> it = blog.getItem().getReplies().iterator();
			replyList.clear();
			while(it.hasNext()){
				replyList.add(it.next());
			}
			return "showBlog";
		}else if (request.getParameter("state").equals("edit")){
			return "editBlog";
		}
		return "fail";
	}
	
	//发布一篇新日志
	public String publish() throws Exception{
		User user = (User)ActionContext.getContext().getSession().get("currentUser");
		Blog blog = new Blog();
		blog.setTitle(title);
		blog.setContent(content);
		blogService.addBlog(blog, user);
		return "success";
	}
	
	public String deleteBlog(){
		int id = Integer.parseInt(request.getParameter("id"));
		Blog blog = blogService.getBlog(id);
		blogService.deleteBlog(blog);
		return "success";
	}
	
	public String addBlogReply(){
		int id = Integer.parseInt(request.getParameter("id"));
		
		Blog blog = blogService.getBlog(id);
		Reply reply = new Reply();
		reply.setContent(replyContent);
		User user = (User)ActionContext.getContext().getSession().get("currentUser");
//		reply.setUser(user);
//		reply.setItem(blog.getItem());
		replyService.addReply(reply, blog.getItem().getIdItem(), user.getIdUser());
		
		return "success";
	}
	
	//更新一篇日志
	public String updateBlog(){
		blogService.updateBlog(id, title, content);
		return "success";
	}
	
	public IBlogService getBlogService() {
		return blogService;
	}

	public void setBlogService(IBlogService blogService) {
		this.blogService = blogService;
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

	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		request = arg0;
	}

	public Blog getBlog() {
		return blog;
	}

	public void setBlog(Blog blog) {
		this.blog = blog;
	}

	public List<Reply> getReplyList() {
		return replyList;
	}

	public void setReplyList(List<Reply> replyList) {
		this.replyList = replyList;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public IReplyService getReplyService() {
		return replyService;
	}

	public void setReplyService(IReplyService replyService) {
		this.replyService = replyService;
	}

	
	
}
