package com.goodfriend.service.test;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.goodfriend.dao.IItemDAO;
import com.goodfriend.model.Item;
import com.goodfriend.model.Reply;
import com.goodfriend.model.User;
import com.goodfriend.service.IReplyService;
import com.goodfriend.service.IUserService;

public class ReplyServiceTest {

	ApplicationContext ctx;
	IReplyService replyService;
	IUserService userService;
	IItemDAO itemDao;

	@Before
	public void setUp() throws Exception {
		ctx = new ClassPathXmlApplicationContext("beans-test.xml");
		replyService = (IReplyService) ctx.getBean("replyService");
		userService = (IUserService) ctx.getBean("userService");
		itemDao = (IItemDAO) ctx.getBean("itemDAO");
	}

	@After
	public void tearDown() throws Exception {
		ctx = null;
		replyService = null;
		userService = null;
		itemDao = null;
	}

	@Test
	public void testAddReply() {
		Item item = itemDao.findById(1);
		User user = userService.getUser("xiaoxu");
		for (int i = 6; i < 10; i++) {
			Reply reply = new Reply();
			reply.setContent("这是第" + i + "条回复");
			replyService.addReply(reply, item.getIdItem(), user.getIdUser());
		}
	}

	@Test
	public void testDeleteReply() {
		Reply reply = replyService.getReply(8);
		replyService.deleteReply(reply);
	}

	@Test
	public void testGetReplies() {
		List<Reply> replies = replyService.getReplies(1);
		for (Reply temp : replies) {
			System.out.println(temp.getContent());
			System.out.println("From " + temp.getUser().getUserName());
			System.out.println("To " + temp.getItem().getUser().getUserName());
		}
	}

	@Test
	public void testGetReply() {
		Reply temp = replyService.getReply(1);
		System.out.println(temp.getContent());
		System.out.println("From " + temp.getUser().getUserName());
		System.out.println("To " + temp.getItem().getUser().getUserName());
	}

	@Test
	public void testUpdateReply() {
		Reply temp = replyService.getReply(1);
		System.out.println("====before modify=");
		System.out.println(temp.getContent());
		System.out.println("From " + temp.getUser().getUserName());
		System.out.println("To " + temp.getItem().getUser().getUserName());
		System.out.println("====after modify=====");
		temp.setContent(temp.getContent() + "修改过");
		replyService.updateReply(temp);
		System.out.println(temp.getContent());
		System.out.println("From " + temp.getUser().getUserName());
		System.out.println("To " + temp.getItem().getUser().getUserName());
	}

}
