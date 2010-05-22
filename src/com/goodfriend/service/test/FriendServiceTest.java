package com.goodfriend.service.test;

import static org.junit.Assert.fail;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.goodfriend.model.Blog;
import com.goodfriend.model.User;
import com.goodfriend.service.IBlogService;
import com.goodfriend.service.IFriendService;
import com.goodfriend.service.IUserService;

public class FriendServiceTest {

	ApplicationContext ctx;
	IUserService userService;
	IFriendService friendService;
	
	
	@Before
	public void setUp() throws Exception {
		ctx = new ClassPathXmlApplicationContext("beans-test.xml");
		friendService = (IFriendService) ctx.getBean("friendService");
		userService = (IUserService)ctx.getBean("userService");
	}

	@After
	public void tearDown() throws Exception {
		ctx = null;
		friendService = null;
		userService = null;
	}
	
	@Test
	public void testGetFriends(){
		User user = userService.getUser(1);
		List<User> list = friendService.getFriends(user);
	}
}
