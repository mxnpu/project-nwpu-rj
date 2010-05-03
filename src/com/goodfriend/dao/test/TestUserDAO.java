package com.goodfriend.dao.test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.goodfriend.dao.IUserDAO;
import com.goodfriend.model.User;

public class TestUserDAO {
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"beans-test.xml");
		IUserDAO userDao = (IUserDAO) ctx.getBean("userDAOProxy");
		User user = new User();
		user.setUserName("testSave");
		user.setPassword("testSave");
		user.setRealName("testSave");
		userDao.save(user);
		List<User> users = userDao.findAll();
		for (User temp : users) {
			System.out.print(temp.getIdUser()+":");
			System.out.println(temp.getUserName());
		}
	}

}
