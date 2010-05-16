package com.goodfriend.service;

import java.util.List;

import com.goodfriend.model.Reply;

/**
 * The the service module for the reply.
 * 
 * @author xurunhua
 * @version 
 * Last modify time : 2010.05.12 
 */
public interface IReplyService {
	public void addReply(Reply reply, Integer itemId, Integer fromUserId);
	public Reply getReply(Integer id);
	public List<Reply> getReplies(Integer itemid);
	public void updateReply(Reply reply);
	public void deleteReply(Reply reply);
}
