package com.goodfriend.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.goodfriend.model.Blog;
import com.goodfriend.model.Gossip;
import com.goodfriend.model.Message;
import com.goodfriend.model.Reply;
import com.goodfriend.model.Statement;
import com.goodfriend.model.User;
import com.goodfriend.service.IBlogService;
import com.goodfriend.service.IFriendService;
import com.goodfriend.service.IGossipService;
import com.goodfriend.service.ILatestMsgService;
import com.goodfriend.service.IReplyService;
import com.goodfriend.service.IStatementService;
import com.goodfriend.service.IUserService;

/**
 * The service module class for the friends' latest message.
 * 
 * @CreateTime 2010.05.24
 * @LastModifiedtime 2010.05.24
 */
public class LatestMsgService implements ILatestMsgService {

    IFriendService friendService;
    IStatementService statementService;
    IBlogService blogService;
    IUserService userService;
    IReplyService replyService;
    IGossipService gossipService;

    /**
     * Get the latest message of the current user's friends.
     * 
     * @param userId
     *            the id of the current user.
     * @param deadlint
     *            the deadline of the message which wanted.
     * 
     * @return the List of all the message including the statement, gossip etc.
     */
    public List<Message> getLastestMsg(Integer userId, Timestamp deadline) {
	List<Message> latestMsg = new ArrayList<Message>();

	// Get the current user.
	User currentUser = userService.getUser(userId);
	// Get the current user's all friends.
	List<User> friends = friendService.getFriends(currentUser);

	List<Statement> statements = new ArrayList<Statement>();
	List<Blog> blogs = new ArrayList<Blog>();

	// loop the list of friends to get the needed message.
	for (User temp : friends) {
	    // Get the user's id.
	    Integer id = temp.getIdUser();
	    List<Statement> stmtTemp = statementService
		    .getStatementsByDeadline(id, deadline);
	    List<Blog> blogTemp = blogService.getBlogsByDeadline(id, deadline);

	    blogs.addAll(blogTemp);
	    statements.addAll(stmtTemp);
	}

	for (Statement stmt : statements) {
	    Message msg = new Message();
	    msg.setType("statement");
	    msg.setTitle("");
	    msg.setContent(stmt.getContent());
	    msg.setOwner(stmt.getItem().getUser());
	    msg.setItem(stmt.getItem());
	    msg.setRecordTime(stmt.getItem().getRecordTime());

	    // Get the message's reply list
	    List<Reply> replies = replyService.getReplies(stmt.getItem()
		    .getIdItem());
	    msg.setReplies(replies);

	    latestMsg.add(msg);
	}

	for (Blog blog : blogs) {
	    Message msg = new Message();
	    msg.setType("blog");
	    msg.setMsgId(blog.getId().toString());
	    msg.setTitle(blog.getTitle());

	    String content;
	    if (blog.getContent().length() < 250) {
		content = blog.getContent();
		if (content.length() != 0) {
		    content += "...";
		}
	    } else {
		content = blog.getContent().substring(0, 250) + "...";
	    }
	    msg.setContent(content);

	    msg.setOwner(blog.getItem().getUser());
	    msg.setItem(blog.getItem());
	    msg.setRecordTime(blog.getItem().getRecordTime());

	    // Get the message's reply list
	    List<Reply> replies = replyService.getReplies(blog.getItem()
		    .getIdItem());
	    msg.setReplies(replies);

	    latestMsg.add(msg);
	}

	// sort the message by the record time.
	Collections.sort(latestMsg);

	return latestMsg;
    }

    /**
     * Get the gossip message and their replies for the home page.
     * 
     * @param userId
     *            the gossip of who,
     * @return the user's gossip list include the reply.
     */
    public List<Message> getHomeGossipMsg(Integer userId) {
	List<Message> messages = new ArrayList<Message>();

	List<Gossip> gossips = gossipService.getLatestGossips(userId);
	for (Gossip temp : gossips) {
	    Message message = new Message();
	    message.setTitle(temp.getIdGossip().toString());
	    message.setContent(temp.getContent());
	    message.setOwner(temp.getUser());
	    message.setType("gossip");
	    message.setRecordTime(temp.getItem().getRecordTime());
	    message.setItem(temp.getItem());

	    List<Reply> replies = replyService.getReplies(temp.getItem()
		    .getIdItem());
	    message.setReplies(replies);

	    messages.add(message);
	}

	// sort the message by the record time.
	Collections.sort(messages);

	return messages;
    }

    /**
     * Get the blog message and their replies for the home page.
     * 
     * @param userId
     *            the gossip of who,
     * @return the user's gossip list include the reply.
     */
    public List<Message> getHomeBlogMsg(Integer userId) {
	List<Message> messages = new ArrayList<Message>();

	List<Blog> allUserBlogs = blogService.getBlogsByUser(userId);
	Collections.sort(allUserBlogs);
	int startIndex = 0;
	int endIndex = 2;
	List<Blog> latestBlogs;
	if (allUserBlogs.size() > endIndex - startIndex + 1) {
	    latestBlogs = allUserBlogs.subList(startIndex, endIndex);
	} else {
	    latestBlogs = allUserBlogs;
	}

	for (Blog blog : latestBlogs) {
	    Message msg = new Message();
	    msg.setType("blog");

	    String content;
	    if (blog.getContent().length() < 250) {
		content = blog.getContent().replaceAll("<[^<]+?>", "");
		;
		if (content.length() != 0) {
		    content += "...";
		}
	    } else {
		content = blog.getContent().replaceAll("<[^<]+?>", "")
			.substring(0, 250)
			+ "...";
	    }
	    msg.setContent(content);

	    msg.setMsgId(blog.getId().toString());
	    msg.setItem(blog.getItem());
	    msg.setOwner(blog.getItem().getUser());
	    msg.setRecordTime(blog.getItem().getRecordTime());
	    List<Reply> replies = replyService.getReplies(blog.getItem()
		    .getIdItem());
	    msg.setReplies(replies);
	    msg.setTitle(blog.getTitle());

	    messages.add(msg);
	}

	return messages;
    }

    /**
     * @return the friendService
     */
    public IFriendService getFriendService() {
	return friendService;
    }

    /**
     * @param friendService
     *            the friendService to set
     */
    public void setFriendService(IFriendService friendService) {
	this.friendService = friendService;
    }

    /**
     * @return the statementService
     */
    public IStatementService getStatementService() {
	return statementService;
    }

    /**
     * @param statementService
     *            the statementService to set
     */
    public void setStatementService(IStatementService statementService) {
	this.statementService = statementService;
    }

    /**
     * @return the blogService
     */
    public IBlogService getBlogService() {
	return blogService;
    }

    /**
     * @param blogService
     *            the blogService to set
     */
    public void setBlogService(IBlogService blogService) {
	this.blogService = blogService;
    }

    /**
     * @return the userService
     */
    public IUserService getUserService() {
	return userService;
    }

    /**
     * @param userService
     *            the userService to set
     */
    public void setUserService(IUserService userService) {
	this.userService = userService;
    }

    /**
     * @return the replyService
     */
    public IReplyService getReplyService() {
	return replyService;
    }

    /**
     * @param replyService
     *            the replyService to set
     */
    public void setReplyService(IReplyService replyService) {
	this.replyService = replyService;
    }

    /**
     * @return the gossipService
     */
    public IGossipService getGossipService() {
	return gossipService;
    }

    /**
     * @param gossipService
     *            the gossipService to set
     */
    public void setGossipService(IGossipService gossipService) {
	this.gossipService = gossipService;
    }

}
