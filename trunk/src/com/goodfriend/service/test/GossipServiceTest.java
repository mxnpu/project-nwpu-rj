/**
 * 
 */
package com.goodfriend.service.test;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.goodfriend.model.Gossip;
import com.goodfriend.model.User;
import com.goodfriend.service.IGossipService;
import com.goodfriend.service.IUserService;

/**
 * The JUnit test case for the statement service module.
 * 
 * @author xurunhua
 * @time 2010.05.15
 */
public class GossipServiceTest {

    ApplicationContext ctx;
    IGossipService gossipService;
    IUserService userService;

    /**
     * @throws java.lang.Exception
     */
    @Before
    public void setUp() throws Exception {
	ApplicationContext ctx = new ClassPathXmlApplicationContext(
		"beans-test.xml");
	gossipService = (IGossipService) ctx.getBean("gossipService");
	userService = (IUserService) ctx.getBean("userService");
    }

    /**
     * @throws java.lang.Exception
     */
    @After
    public void tearDown() throws Exception {
	gossipService = null;
	userService = null;
	ctx = null;
    }

    /**
     * Test method for
     * {@link com.goodfriend.service.impl.GossipService#addGossip(com.goodfriend.model.Gossip, java.lang.Integer, java.lang.Integer)}
     * .
     */
    @Test
    public void testAddGossip() {
	User user = userService.getUser("xurunhua");
	User fromUser = userService.getUser("xiaoxu");

	for (int i = 1; i < 6; i++) {
	    Gossip gossip = new Gossip();
	    gossip.setContent("这是" + i + "条留言测试");
	    gossipService.addGossip(gossip, user.getIdUser(), fromUser.getIdUser());
	}

    }

    /**
     * Test method for
     * {@link com.goodfriend.service.impl.GossipService#deleteGossip(com.goodfriend.model.Gossip)}
     * .
     */
    @Test
    public void testDeleteGossip() {
	Gossip gossip = gossipService.getGossip(5);
	gossipService.deleteGossip(gossip);
    }

    /**
     * Test method for
     * {@link com.goodfriend.service.impl.GossipService#getGossip(java.lang.Integer)}
     * .
     */
    @Test
    public void testGetGossip() {
	for (int i = 1; i < 6; i++) {
	    Gossip gossip = gossipService.getGossip(i);
	    System.out.println(gossip.getContent());
	}
	
    }

    /**
     * Test method for
     * {@link com.goodfriend.service.impl.GossipService#getGossips(java.lang.Integer)}
     * .
     */
    @Test
    public void testGetGossips() {
	User user = userService.getUser(1);
	List<Gossip> gossips = gossipService.getGossips(user.getIdUser());
	for (Gossip temp: gossips) {
	    System.out.println(temp.getContent());
	    System.out.println("from " + temp.getUser().getUserName());
	    System.out.println("to " + temp.getItem().getUser().getUserName());
	}
    }

    /**
     * Test method for
     * {@link com.goodfriend.service.impl.GossipService#updateGossip(com.goodfriend.model.Gossip)}
     * .
     */
    @Test
    public void testUpdateGossip() {
	Gossip gossip = gossipService.getGossip(1);
	gossip.setContent("这是1条留言测试--更新过");
	gossipService.updateGossip(gossip);
    }

}
