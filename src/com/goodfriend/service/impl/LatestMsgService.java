package com.goodfriend.service.impl;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import com.goodfriend.service.IBlogService;
import com.goodfriend.service.IFriendService;
import com.goodfriend.service.ILatestMsgService;
import com.goodfriend.service.IStatementService;

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

    /**
     * Get the latest message of the current user's friends.
     * 
     * @param userId the id of the current user.
     * @param deadlint the deadline of the message which wanted.
     * 
     * @return the Map of all the message including the statement, gossip etc.
     */
    public Map<String, Object> getLastestMsg(Integer userId, Timestamp deadline) {
	Map<String, Object> latestMsg = new HashMap<String, Object>();
	
	
	
	
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

}
