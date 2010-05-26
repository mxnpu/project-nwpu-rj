package com.goodfriend.action;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.goodfriend.model.Message;
import com.goodfriend.model.User;
import com.goodfriend.service.ILatestMsgService;
import com.opensymphony.xwork2.ActionContext;

/**
 * Latest Message Action Class Get the current user's friends latest message of
 * all, including the gossip, the statement, the blog.
 * 
 * @author xurunhua
 * @CreateTime 2010.05.24
 * @LastModifiedtime 2010.05.24
 */
public class LatestMessageAction {

    ILatestMsgService latestMsgService;
    
    List<Message> msgs;

    /**
     * Get the user's friends latest message by the AJAX.
     * 
     * @return the success flag;
     */
    public String getLatestMsg() {
	// Get the current user
	Map<String, Object> session = ActionContext.getContext().getSession();
	User currentUser = (User) session.get("currentUser");

	Timestamp deadlineTime = null;
	deadlineTime = currentUser.getLastLogoutTime();
	// if the deadline is null, give a default time stamp.
	if (deadlineTime == null) {
	    deadlineTime = new Timestamp(new Date().getTime() - (24*3600*1000));
	}
	
	msgs = latestMsgService.getLastestMsg(currentUser
		.getIdUser(), deadlineTime);
	
	// put the message to the index page.
	ActionContext.getContext().getSession().put("msg", msgs);
	return "success";
    }

    /**
     * @return the latestMsgService
     */
    public ILatestMsgService getLatestMsgService() {
	return latestMsgService;
    }

    /**
     * @param latestMsgService
     *            the latestMsgService to set
     */
    public void setLatestMsgService(ILatestMsgService latestMsgService) {
	this.latestMsgService = latestMsgService;
    }

    /**
     * @return the msgs
     */
    public List<Message> getMsgs() {
        return msgs;
    }

    /**
     * @param msgs the msgs to set
     */
    public void setMsgs(List<Message> msgs) {
        this.msgs = msgs;
    }

}
