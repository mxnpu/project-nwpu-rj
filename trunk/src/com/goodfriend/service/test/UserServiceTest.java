package com.goodfriend.service.test;

import static org.junit.Assert.fail;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.goodfriend.model.Friends;
import com.goodfriend.model.User;
import com.goodfriend.service.IUserService;

public class UserServiceTest {
	ApplicationContext ctx;
	IUserService userDao;

	@Before
	public void setUp() throws Exception {
		ctx = new ClassPathXmlApplicationContext("beans-test.xml");
		userDao = (IUserService) ctx.getBean("userDaoManager");
	}

	@After
	public void tearDown() throws Exception {
		ctx = null;
		userDao = null;
	}

	@Test
	public void testAddUser() {
		User user1 = new User();
		user1.setUserName("username1");
		user1.setRealName("username1");
		user1.setPassword("username1");
		User user2 = new User();
		user2.setUserName("username2");
		user2.setRealName("username2");
		user2.setPassword("username2");
		User user3 = new User();
		user3.setUserName("username3");
		user3.setRealName("username3");
		user3.setPassword("username3");
		Friends friend1 = new Friends();
		friend1.setUser(user1);
		friend1.setUserFriend(user2);
		Friends friend2 = new Friends();
		friend2.setUser(user1);
		friend2.setUserFriend(user3);
		userDao.addUser(user1);
	}

	@Test
	public void testDeleteUser() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetUserInteger() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetUserString() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetUsers() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdateUser() {
		fail("Not yet implemented");
	}

	@Test
	public void testSetUserDao() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetUserDao() {
		fail("Not yet implemented");
	}

	@Test
	public void testIsUserExist() {
		fail("Not yet implemented");
	}

}
