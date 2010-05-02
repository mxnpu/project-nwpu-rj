package com.goodfriend.dao.test;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.goodfriend.dao.impl.UserDAO;
import com.goodfriend.model.User;

public class UserDAOTest {

	UserDAO userDao;
	ApplicationContext ctx;
	
	@Before
	public void setUp() throws Exception {
		ctx = new ClassPathXmlApplicationContext("applicationContextForTest.xml");
		userDao = (UserDAO) ctx.getBean("UserDAO");
	}

	@After
	public void tearDown() throws Exception {
		userDao = null;
		ctx = null;
	}

	@Test
	public void testSave() {
		User user = new User();
		user.setUserName("testSave");
		user.setPassword("testSave");
		user.setRealName("testSave");
		userDao.save(user);
		User user1 = userDao.findByUserName(user.getUserName()).get(0);
		User user2 = userDao.findByUserName(user.getUserName()).get(0);
		assertEquals(user1.getIdUser(), user2.getIdUser());
	}

	@Test
	public void testDelete() {
		User user1 = new User();
		user1.setUserName("testDelete");
		user1.setPassword("testDelete");
		user1.setRealName("testDelete");
		userDao.save(user1);
		userDao.delete(user1);
		List<User> users = userDao.findByUserName("testDelete");
		int count = users.size();
		assertEquals(0, count);
	}

	@Test
	public void testFindById() {
		User user = new User();
		user.setUserName("testFindById");
		user.setPassword("testFindById");
		user.setRealName("testFindById");
		userDao.save(user);
		User user2 = userDao.findByExample(user).get(0);
		User user1 = userDao.findById(user2.getIdUser());
		userDao.delete(user);
		assertEquals(user2.getIdUser(),user1.getIdUser());
	}

	@Test
	public void testFindByUserName() {
		User user = new User();
		user.setUserName("testFindByUserName");
		user.setPassword("testFindByUserName");
		user.setRealName("testFindByUserName");
		userDao.save(user);
		User user1 = userDao.findByExample(user).get(0);
		User user2 = userDao.findByUserName(user.getUserName()).get(0);
		userDao.delete(user);
		assertEquals(user1.getIdUser(), user2.getIdUser());
	}

	@Test
	public void testFindAll() {
		User user = new User();
		user.setUserName("testFindAll");
		user.setPassword("testFindAll");
		user.setRealName("testFindAll");
		int sizeBefore = userDao.findAll().size();
		userDao.save(user);
		int sizeAfter = userDao.findAll().size();
		userDao.delete(user);
		
		assertEquals(sizeBefore, sizeAfter - 1);
		
	}

}
