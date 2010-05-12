package com.goodfriend.service.test;

import static org.junit.Assert.fail;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.goodfriend.model.Blog;
import com.goodfriend.service.IBlogService;
import com.goodfriend.service.IUserService;

public class BlogServiceTest {
	ApplicationContext ctx;
	IBlogService blogService;
	IUserService userService;
	
	Blog blog;
	
	@Before
	public void setUp() throws Exception {
		ctx = new ClassPathXmlApplicationContext("beans-test.xml");
		blogService = (IBlogService) ctx.getBean("blogService");
		userService = (IUserService)ctx.getBean("userService");
	}

	@After
	public void tearDown() throws Exception {
		ctx = null;
		blogService = null;
		userService = null;
		blog = null;
	}

	@Test
	public void testAddBlog() {
		blog = new Blog();
		blog.setTitle("title");
		blog.setContent("content");
		
		blogService.addBlog(blog, userService.getUser(1));
	}
	
	@Test
	public void testDeleteBlog(){
		fail("");
	}
	
	
}
