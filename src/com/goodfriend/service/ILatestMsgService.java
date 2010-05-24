package com.goodfriend.service;

import java.sql.Timestamp;
import java.util.Map;

/**
 * The service module interface 
 * for the friends' latest message.
 * 
 * @author xurunhua
 * @CreateTime 2010.05.24
 * @LastModifiedtime 2010.05.24
 */
public interface ILatestMsgService {
    public Map<String, Object> getLastestMsg(Integer userId, Timestamp deadline);
}
