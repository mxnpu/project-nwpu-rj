package com.goodfriend.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.goodfriend.model.Blog;
import com.goodfriend.model.Message;
import com.goodfriend.model.Statement;
import com.goodfriend.model.User;
import com.goodfriend.service.IBlogService;
import com.goodfriend.service.IFriendService;
import com.goodfriend.service.ILatestMsgService;
import com.goodfriend.service.IStatementService;
import com.goodfriend.service.IUserService;

/**
 * The service module class for the friends' latest message.
 * 
 * @author xurunhua
 * @CreateTime 2010.05.24
 * @LastModifiedtime 2010.05.24
 */
public class LatestMsgService implements ILatestMsgService {
    
    IFriendService friendService;
    IStatementService statementService;
    IBlogService blogService;
    IUserService userService;
    
    /**
     * Get the latest message of the current user's friends.
     * 
     * @param userId the id of the current user.
     * @param deadlint the deadline of the message which wanted.
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
	    List<Statement> stmtTemp = statementService.getStatementsByDeadline(id, deadline);
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
	    msg.setRecordTime(stmt.getItem().getRecordTime());
	    
	    latestMsg.add(msg);
	}
	
	for (Blog blog : blogs) {
	    Message msg = new Message();
	    msg.setType("blog");
	    msg.setTitle(blog.getTitle());
	    msg.setContent(blog.getContent());
	    msg.setOwner(blog.getItem().getUser());
	    msg.setRecordTime(blog.getItem().getRecordTime());
	    
	    latestMsg.add(msg);
	}
	
	// sort the message by the record time.
	Collections.sort(latestMsg);
	
	return latestMsg;
    }

    /**
     * @return the friendService
     */
    public IFriendService getFriendService() {
        return friendService;
    }

    /**
     * @param friendService the friendService to set
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
     * @param statementService the statementService to set
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
     * @param blogService the blogService to set
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
     * @param userService the userService to set
     */
    public void setUserService(IUserService userService) {
        this.userService = userService;
    }

}
