package com.goodfriend.action;

import java.util.Map;

import com.goodfriend.model.User;
import com.opensymphony.xwork2.ActionContext;

/**
 * Latest Message Action Class
 * Get the current user's friends latest message of all,
 * including the gossip, the statement, the blog.
 * 
 * @author xurunhua
 * @CreateTime 2010.05.24
 * @LastModifiedtime 2010.05.24
 */
public class LatestMessageAction {
    
    
    /**
     * Get the user's friends latest message by the AJAX.
     * 
     * @return the success flag;
     */
    public String getLatestMsg() {
	// Get the current user
	Map<String, Object> session = ActionContext.getContext().getSession();
	User currentUser = (User)session.get("currentUser");
	
	
	
	return "success";
    }
}
