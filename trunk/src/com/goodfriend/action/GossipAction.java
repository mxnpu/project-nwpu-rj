/**
 * 
 */
package com.goodfriend.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.goodfriend.model.Gossip;
import com.goodfriend.model.Message;
import com.goodfriend.model.Reply;
import com.goodfriend.model.User;
import com.goodfriend.service.IGossipService;
import com.goodfriend.service.ILatestMsgService;
import com.goodfriend.service.IReplyService;
import com.goodfriend.service.IUserService;
import com.opensymphony.xwork2.ActionContext;

/**
 * The Gossp Action of the request.
 * 
 * @author xurunhua
 * @CreateTime 2010.05.29
 * @LastModifiedtime 2010.05.29
 */
public class GossipAction {

    private IGossipService gossipService;
    private ILatestMsgService messageService;
    private IUserService userService;
    private IReplyService replyService;
    private InputStream inputStream;

    private int pageNow = 1;
    private int pageSize = 6;
    private int totalPage;
    private List<Message> messages;

    /**
     * Get a user's all gossip.
     * 
     * @return
     */
    public String getAllGossip() {
	Map<String, Object> arguments = ActionContext.getContext()
		.getParameters();
	String[] userIds = (String[]) arguments.get("userId");
	Integer userId = Integer.parseInt(userIds[0]);

	// Get the one page's gossips.
	setMessages(gossipService.getGossipByPage(userId, pageNow, pageSize));
	setTotalPage(gossipService.getTotalPage(userId, pageSize));

	return "success";
    }

    /**
     * Add a gossip by the usual method.
     * 
     * @return
     */
    public String addGossipCommon() {
	Map<String, Object> arguments = ActionContext.getContext()
		.getParameters();
	String[] contents = (String[]) arguments.get("gossip");
	String content = contents[0];
	String[] userIds = (String[]) arguments.get("userIdHidden");
	Integer userId = Integer.parseInt(userIds[0]);
	Map<String, Object> session = ActionContext.getContext().getSession();
	User currentUser = (User) session.get("currentUser");

	// if it is the reply to a gossip.
	if (content.indexOf(":") != -1 && content.startsWith("回复")) {
	    int index = content.indexOf(":");
	    content = content.substring(index + 1);

	    String[] gossipIds = (String[]) arguments.get("gossipIdHidden");
	    if (gossipIds.length > 0) {
		Integer gossipId = Integer.parseInt(gossipIds[0]);

		Gossip gossip = gossipService.getGossip(gossipId);
		Reply reply = new Reply();
		reply.setContent(content);
		reply.setRecordTime(new Timestamp(new Date().getTime()));

		// add the reply to the databases;
		replyService.addReply(reply, gossip.getItem().getIdItem(),
			currentUser.getIdUser());
	    }
	} else {
	    // create a new gossip
	    Gossip gossip = new Gossip();
	    gossip.setContent(content);

	    // add the new gossip
	    gossipService.addGossip(gossip, userId, currentUser.getIdUser());

	}

	// Get the one page's gossips.
	setPageNow(1);
	setMessages(gossipService.getGossipByPage(userId, pageNow, pageSize));
	setTotalPage(gossipService.getTotalPage(userId, pageSize));

	return "success";
    }

    /**
     * Delete the one user's gossip.
     * 
     * @return
     */
    public String delGossipCommon() {
	Map<String, Object> arguments = ActionContext.getContext()
		.getParameters();
	String[] gossipIds = (String[]) arguments.get("gossipId");
	Integer gossipId = Integer.parseInt(gossipIds[0]);
	String[] userIds = (String[]) arguments.get("userId");
	Integer userId = Integer.parseInt(userIds[0]);

	// Get the gossip and delete it.
	Gossip gossipDel = gossipService.getGossip(gossipId);
	gossipService.deleteGossip(gossipDel);

	// Get the one page's gossips.
	setPageNow(1);
	setMessages(gossipService.getGossipByPage(userId, pageNow, pageSize));
	setTotalPage(gossipService.getTotalPage(userId, pageSize));

	return "success";
    }

    /**
     * Delete the reply of one user's gossip.
     * 
     * @return
     */
    public String delGossipReplyCommon() {
	Map<String, Object> arguments = ActionContext.getContext()
		.getParameters();
	String[] replyIds = (String[]) arguments.get("replyId");
	Integer replyId = Integer.parseInt(replyIds[0]);
	String[] userIds = (String[]) arguments.get("userId");
	Integer userId = Integer.parseInt(userIds[0]);
	
	// Get the reply in database and delete it.
	Reply reply = replyService.getReply(replyId);
	replyService.deleteReply(reply);

	// Get the one page's gossips.
	setPageNow(1);
	setMessages(gossipService.getGossipByPage(userId, pageNow, pageSize));
	setTotalPage(gossipService.getTotalPage(userId, pageSize));
	
	return "success";
    }

    /**
     * Get a user's all gossip by page.
     * 
     * @return
     */
    public String getGossipByPage() {
	Map<String, Object> session = ActionContext.getContext().getSession();
	User user = (User) session.get("user");

	setMessages(gossipService.getGossipByPage(user.getIdUser(), pageNow,
		pageSize));
	return "success";
    }

    /**
     * Add a user's gossip by AJAX.
     * 
     * @return
     */
    public String addGossip() {
	Map<String, Object> arguments = ActionContext.getContext()
		.getParameters();
	String[] userIds = (String[]) arguments.get("userId");
	Integer userId = Integer.parseInt(userIds[0]);
	String[] contents = (String[]) arguments.get("content");
	String content = contents[0];

	// if it is the reply to a gossip.
	if (content.indexOf(":") != -1 && content.startsWith("回复")) {
	    int index = content.indexOf(":");
	    content = content.substring(index + 1);

	    String[] gossipIds = (String[]) arguments.get("gossipId");
	    String gossipId = gossipIds[0];

	    return addGossipReply(content, gossipId);
	}

	Map<String, Object> session = ActionContext.getContext().getSession();
	User currentUser = (User) session.get("currentUser");

	// create a new gossip
	Gossip gossip = new Gossip();
	gossip.setContent(content);

	// add the new gossip
	gossipService.addGossip(gossip, userId, currentUser.getIdUser());

	// get the latest gossip.
	List<Message> latestGossips = messageService.getHomeMsg(userId);
	String response = prepareData(latestGossips);

	toInStream(response);

	return "success";
    }

    /**
     * Add a reply to one gossip by AJAX
     * 
     * @return the success.
     */
    private String addGossipReply(String content, String gossipId) {
	Map<String, Object> session = ActionContext.getContext().getSession();
	User currentUser = (User) session.get("currentUser");
	Integer id = Integer.parseInt(gossipId);

	Gossip gossip = gossipService.getGossip(id);
	Reply reply = new Reply();
	reply.setContent(content);
	reply.setRecordTime(new Timestamp(new Date().getTime()));

	// add the reply to the databases;
	replyService.addReply(reply, gossip.getItem().getIdItem(), currentUser
		.getIdUser());

	List<Reply> replies = replyService.getReplies(gossip.getItem()
		.getIdItem());

	id = Integer.parseInt(gossipId);

	String response = prepareGossipReplyData(replies, id);
	toInStream(response);

	return "success";
    }

    /**
     * Get the gossip replies by AJAX
     * 
     * @return
     */
    public String getGossipReplies() {
	Map<String, Object> arguments = ActionContext.getContext()
		.getParameters();
	String[] gossipIds = (String[]) arguments.get("gossipId");
	Integer gossipId = Integer.parseInt(gossipIds[0]);

	Gossip gossip = gossipService.getGossip(gossipId);
	List<Reply> replies = replyService.getReplies(gossip.getItem()
		.getIdItem());

	String response = prepareGossipReplyData(replies, gossipId);

	toInStream(response);

	return "success";
    }

    /**
     * Delete a user's gossip by AJAX
     * 
     * @return
     */
    public String delGossip() {
	Map<String, Object> arguments = ActionContext.getContext()
		.getParameters();
	String[] gossipIds = (String[]) arguments.get("gossipId");
	Integer gossipId = Integer.parseInt(gossipIds[0]);
	String[] userIds = (String[]) arguments.get("userId");
	Integer userId = Integer.parseInt(userIds[0]);

	// Get the gossip and delete it.
	Gossip gossipDel = gossipService.getGossip(gossipId);
	gossipService.deleteGossip(gossipDel);

	// get the latest gossip list.
	List<Message> latestGossips = messageService.getHomeMsg(userId);
	String response = prepareData(latestGossips);

	toInStream(response);

	return "success";
    }

    /**
     * Delete a gossip's reply by AJAX.
     * 
     * @return
     */
    public String delGossipReply() {
	Map<String, Object> arguments = ActionContext.getContext()
		.getParameters();
	String[] gossipIds = (String[]) arguments.get("gossipId");
	Integer gossipId = Integer.parseInt(gossipIds[0]);
	String[] replyIds = (String[]) arguments.get("replyId");
	Integer replyId = Integer.parseInt(replyIds[0]);

	// Get the reply in database and delete it.
	Reply reply = replyService.getReply(replyId);
	replyService.deleteReply(reply);

	// show the replies after the delete.
	Gossip gossip = gossipService.getGossip(gossipId);
	List<Reply> replies = replyService.getReplies(gossip.getItem()
		.getIdItem());

	String response = prepareGossipReplyData(replies, gossipId);

	toInStream(response);

	return "success";
    }

    /**
     * Prepare the replies of one gossip data to client.
     * 
     * @param replies
     *            one gossip's all replies.
     * @param gossipId
     * @return the string of replies in format.
     */
    private String prepareGossipReplyData(List<Reply> replies, Integer gossipId) {
	StringBuffer repliesStr = new StringBuffer();
	repliesStr.append("reply_" + gossipId + "&*");

	Map<String, Object> session = ActionContext.getContext().getSession();
	User currentUser = (User) session.get("currentUser");

	for (int i = 0; i < replies.size(); i++) {
	    Reply temp = replies.get(i);
	    repliesStr.append(temp.getUser().getUserName());
	    repliesStr.append("~!");
	    repliesStr.append(temp.getIdReply());
	    repliesStr.append("~!");
	    repliesStr.append(temp.getContent());
	    repliesStr.append("~!");
	    repliesStr.append(temp.getTime());
	    repliesStr.append("~!");
	    repliesStr.append(temp.getUser().getIdUser());
	    repliesStr.append("~!");
	    repliesStr.append(currentUser.getIdUser());
	    if (i != replies.size() - 1) {
		repliesStr.append("#!");
	    }
	}

	return repliesStr.toString();
    }

    /**
     * Prepare the data for the client.
     * 
     * @return
     */
    private String prepareData(List<Message> latestGossips) {
	// Get the response to the client.
	StringBuffer responseBuffer = new StringBuffer();
	responseBuffer.append("gossip&*");

	Map<String, Object> session = ActionContext.getContext().getSession();
	User currentUser = (User) session.get("currentUser");

	for (int i = 0; i < latestGossips.size(); i++) {
	    Message temp = latestGossips.get(i);
	    responseBuffer.append(temp.getOwner().getUserName());
	    responseBuffer.append("~!");
	    responseBuffer.append(temp.getOwner().getIdUser().toString());
	    responseBuffer.append("~!");
	    responseBuffer.append(temp.getTitle());
	    responseBuffer.append("~!");
	    responseBuffer.append(temp.getContent());
	    responseBuffer.append("~!");
	    responseBuffer.append(temp.getItem().getTime());
	    responseBuffer.append("~!");
	    responseBuffer.append(currentUser.getIdUser());
	    responseBuffer.append("~!");
	    responseBuffer.append(temp.getOwner().getPhoto());
	    if (i != latestGossips.size() - 1) {
		responseBuffer.append("#!");
	    }
	}

	return responseBuffer.toString();
    }

    /**
     * Put the string into the input stream to the client.
     * 
     * @param str
     */
    private void toInStream(String str) {
	try {

	    setInputStream(new ByteArrayInputStream(str.getBytes("utf-8")));

	} catch (UnsupportedEncodingException e) {
	    e.printStackTrace();
	}

    }

    /**
     * @param gossipService
     *            the gossipService to set
     */
    public void setGossipService(IGossipService gossipService) {
	this.gossipService = gossipService;
    }

    /**
     * @return the gossipService
     */
    public IGossipService getGossipService() {
	return gossipService;
    }

    /**
     * @param inputStream
     *            the inputStream to set
     */
    public void setInputStream(InputStream inputStream) {
	this.inputStream = inputStream;
    }

    /**
     * @return the inputStream
     */
    public InputStream getInputStream() {
	return inputStream;
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
     * @param messageService
     *            the messageService to set
     */
    public void setMessageService(ILatestMsgService messageService) {
	this.messageService = messageService;
    }

    /**
     * @return the messageService
     */
    public ILatestMsgService getMessageService() {
	return messageService;
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
     * @param pageNow
     *            the pageNow to set
     */
    public void setPageNow(int pageNow) {
	this.pageNow = pageNow;
    }

    /**
     * @return the pageNow
     */
    public int getPageNow() {
	return pageNow;
    }

    /**
     * @param pageSize
     *            the pageSize to set
     */
    public void setPageSize(int pageSize) {
	this.pageSize = pageSize;
    }

    /**
     * @return the pageSize
     */
    public int getPageSize() {
	return pageSize;
    }

    /**
     * @param totalPage
     *            the totalPage to set
     */
    public void setTotalPage(int totalPage) {
	this.totalPage = totalPage;
    }

    /**
     * @return the totalPage
     */
    public int getTotalPage() {
	return totalPage;
    }

    /**
     * @param messages
     *            the messages to set
     */
    public void setMessages(List<Message> messages) {
	this.messages = messages;
    }

    /**
     * @return the messages
     */
    public List<Message> getMessages() {
	return messages;
    }

}
