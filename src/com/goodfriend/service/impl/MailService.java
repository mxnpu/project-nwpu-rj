package com.goodfriend.service.impl;

import com.goodfriend.dao.impl.MailDAO;
import com.goodfriend.dao.impl.UserDAO;
import com.goodfriend.model.Mail;
import com.goodfriend.model.User;
import com.goodfriend.service.IMailService;

public class MailService implements IMailService {

	private MailDAO mailDao;
	
	private UserDAO userDao;
	
	public void save(Mail mail) {
		// TODO Auto-generated method stub
		mailDao.save(mail);
	}

	/**
	 * 向数据库中添加一个好友请求, 用户下次登录以后通知用户
	 */
	public void addFriendRequest(int toUser, User fromUser) {
		Mail mail = new Mail();
		User user = userDao.findById(toUser);
		mail.setFromUser(fromUser);
		mail.setToUser(user);
		mail.setTitle("好友请求");
		mail.setContent("用户<a href='#'>" + fromUser.getUserName() + "</a>请求添加您为好友。");
		mailDao.save(mail);
	}

	public MailDAO getMailDao() {
		return mailDao;
	}

	public void setMailDao(MailDAO mailDao) {
		this.mailDao = mailDao;
	}

	public UserDAO getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDAO userDao) {
		this.userDao = userDao;
	}
	
}
