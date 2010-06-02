package com.goodfriend.service;

import com.goodfriend.model.Mail;
import com.goodfriend.model.User;

public interface IMailService {

	public void save(Mail mail);
	
	public void addFriendRequest(int toUser, User fromUser);
	
//	public Mail getById()
}
