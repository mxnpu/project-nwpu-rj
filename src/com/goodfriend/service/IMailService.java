package com.goodfriend.service;

import java.util.List;

import com.goodfriend.model.Mail;
import com.goodfriend.model.User;

public interface IMailService {

    public void save(Mail mail);

    public void addFriendRequest(int toUser, User fromUser);

    public List<Mail> getFriendRequest(User user);

    public void mailOpened(int mailID);

    public List<Mail> getAllMails(User user);

    public void addGossipMail(User toUser, User formUser, String content);

    public void addReplyMail(User toUser, User formUser, String content);

    // public Mail getById()
}
