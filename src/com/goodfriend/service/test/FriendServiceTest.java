package com.goodfriend.service.test;

import static org.junit.Assert.fail;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.goodfriend.model.Friends;
import com.goodfriend.model.User;
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
	userService = (IUserService) ctx.getBean("userService");
    }

    @After
    public void tearDown() throws Exception {
	ctx = null;
	friendService = null;
	userService = null;
    }

    @Test
    public void testGetFriends() {
	User user = userService.getUser(1);
	List<User> list = friendService.getFriends(user);
    }

    /**
     * Test method for
     * {@link com.goodfriend.service.impl.FriendService#deleteFriend(com.goodfriend.model.Friends)}
     * .
     */
    @Test
    public void testDeleteFriend() {
	Friends friend = friendService.getFriend(4);
	friendService.deleteFriend(friend);
    }

    /**
     * Test method for
     * {@link com.goodfriend.service.impl.FriendService#updateFriend(com.goodfriend.model.Friends)}
     * .
     */
    @Test
    public void testUpdateFriend() {
	fail("Not yet implemented"); // TODO
    }
    
    /**
     * Test method for {@link com.goodfriend.service.impl.FriendService#addFriend(com.goodfriend.model.Friends)}.
     */
    @Test
    public void testAddFriend() {
	fail("Not yet implemented"); // TODO
    }
}
