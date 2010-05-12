package com.goodfriend.service.impl;

import java.util.List;

import com.goodfriend.dao.IReplyDAO;
import com.goodfriend.model.Reply;
import com.goodfriend.service.IReplyService;

public class ReplyService implements IReplyService {
	
	private IReplyDAO replyDao;

	public void addReply(Reply reply) {
		// TODO Auto-generated method stub

	}

	public void deleteReply(Reply reply) {
		// TODO Auto-generated method stub

	}

	public List<Reply> getReplies(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	public Reply getReply(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	public void updateReply(Reply reply) {
		// TODO Auto-generated method stub

	}

	public void setReplyDao(IReplyDAO replyDao) {
		this.replyDao = replyDao;
	}

	public IReplyDAO getReplyDao() {
		return replyDao;
	}

}
