package com.goodfriend.action;

import java.util.List;
import java.util.Map;

import com.goodfriend.model.Message;
import com.goodfriend.model.User;
import com.goodfriend.service.ILatestMsgService;
import com.goodfriend.service.IUserService;
import com.opensymphony.xwork2.ActionContext;

/**
 * The Home Action of the request.
 * 
 * @CreateTime 2010.05.29
 * @LastModifiedtime 2010.05.29
 */
public class HomeAction {
    private IUserService userService;
    private ILatestMsgService messageService;
    
    public String home() {
	Map<String, Object> arguments = ActionContext.getContext().getParameters();
	Map<String, Object> session = ActionContext.getContext().getSession();
	// get the parameters.
	String[] userIds = (String[]) arguments.get("userId");
	Integer userId = Integer.parseInt(userIds[0].trim()); 

	User user = userService.getUser(userId);	
	session.put("user", user);
	
	List<Message> gossipMessage = messageService.getHomeGossipMsg(userId);
	session.put("gossipMsg", gossipMessage);
	
	List<Message> blogMessages = messageService.getHomeBlogMsg(userId);
	session.put("blogMsg", blogMessages);
	
	return "success";
    }

    /**
     * @param userService the userService to set
     */
    public void setUserService(IUserService userService) {
	this.userService = userService;
    }

    /**
     * @return the userService
     */
    public IUserService getUserService() {
	return userService;
    }

    /**
     * @return the messageService
     */
    public ILatestMsgService getMessageService() {
        return messageService;
    }

    /**
     * @param messageService the messageService to set
     */
    public void setMessageService(ILatestMsgService messageService) {
        this.messageService = messageService;
    }
    
    
}
