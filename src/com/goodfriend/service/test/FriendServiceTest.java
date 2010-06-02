package com.goodfriend.service.test;



import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.goodfriend.dao.IFriendsDAO;
import com.goodfriend.model.User;
import com.goodfriend.service.IFriendService;
import com.goodfriend.service.IUserService;

public class FriendServiceTest {


	ApplicationContext ctx;
	IUserService userService;
	IFriendService friendService;
	
	IFriendsDAO friendDao;
	
	
	@Before
	public void setUp() throws Exception {
		ctx = new ClassPathXmlApplicationContext("beans-test.xml");
		friendService = (IFriendService) ctx.getBean("friendService");
		userService = (IUserService)ctx.getBean("userService");
		
		friendDao = (IFriendsDAO)ctx.getBean("friendsDAO");
	}


	@After
	public void tearDown() throws Exception {
		ctx = null;
		friendService = null;
		userService = null;
		friendDao = null;
	}
	
	@Test
	public void testGetFriends(){
		User user = userService.getUser(1);
		List<User> list = friendService.getFriends(user);
		list.get(0);
	}
	
	@Test
	public void testDeleteFriends(){
//		User user = userService.getUser(1);
//		friendService.deleteFriend(user, 4);
		friendService.deleteFriend(friendDao.findById(3));
	}
}