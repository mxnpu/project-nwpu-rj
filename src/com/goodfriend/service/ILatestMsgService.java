package com.goodfriend.service;

import java.sql.Timestamp;
import java.util.List;

import com.goodfriend.model.Message;

/**
 * The service module interface 
 * for the friends' latest message.
 * 
 * @author xurunhua
 * @CreateTime 2010.05.24
 * @LastModifiedtime 2010.05.24
 */
public interface ILatestMsgService {
    public List<Message> getLastestMsg(Integer userId, Timestamp deadline);
    public List<Message> getHomeMsg(Integer userId);
}
