package com.goodfriend.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.goodfriend.dao.impl.MailDAO;
import com.goodfriend.dao.impl.UserDAO;
import com.goodfriend.model.Mail;
import com.goodfriend.model.User;
import com.goodfriend.service.IMailService;

public class MailService implements IMailService {
	
	//主题为好友请求的站内信   用户查看好友页面时会显示该种类型的站内信
	public static final String FRIEND_REQUEST = "好友请求";

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
		//如果已经存在一个相同的请求  则不再向数据库添加
		List<Mail> mails = mailDao.findByProperty("fromUser", fromUser);
		for(int i = 0; i < mails.size(); i++){
			if (mails.get(i).getToUser().getIdUser() == toUser && 
					mails.get(i).getTitle().equals(FRIEND_REQUEST) &&
					!mails.get(i).getOpened()){
				return;
			}
		}
		
		Mail mail = new Mail();
		User user = userDao.findById(toUser);
		mail.setFromUser(fromUser);
		mail.setToUser(user);
		mail.setTitle(FRIEND_REQUEST);
		mail.setContent("用户<a href='home?userId=" + fromUser.getIdUser() + "'>" + fromUser.getUserName() + "</a>请求添加您为好友。");
		mailDao.merge(mail);
	}
	
	/**
	 * 获得对一个用户的所有好友申请
	 * @param user 
	 * @return 一个站内信数组
	 */
	public List<Mail> getFriendRequest(User user){
		List<Mail> result = new ArrayList<Mail>();
		
		List<Mail> list = mailDao.findByProperty("toUser", user);
		for(int i = 0; i < list.size(); i++){
			if (list.get(i).getTitle().equals(FRIEND_REQUEST) && !list.get(i).getOpened()){
				result.add(list.get(i));
			}
		}
		
		return result;
	}
	
	/**
	 * 修改某条站内信使它处于已打开的状态
	 * @param mailID
	 */
	public void mailOpened(int mailID){
		Mail mail = mailDao.findById(mailID);
		mail.setOpened(true);
		mailDao.attachDirty(mail);
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
