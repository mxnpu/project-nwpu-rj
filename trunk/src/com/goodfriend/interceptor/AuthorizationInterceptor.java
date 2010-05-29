package com.goodfriend.interceptor;

import java.util.Map;

import com.goodfriend.model.User;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * The Intercepter of the authorization.
 * 
 * @author xurunhua
 * @CreateTime 2010.05.27
 * @LastModifiedtime 2010.05.27
 */
public class AuthorizationInterceptor extends AbstractInterceptor {
    private static final long serialVersionUID = 1L;

    /*
     * (non-Javadoc)
     * 
     * @see
     * com.opensymphony.xwork2.interceptor.AbstractInterceptor#intercept(com
     * .opensymphony.xwork2.ActionInvocation)
     */
    @Override
    public String intercept(ActionInvocation invocation) throws Exception {
	Map<String, Object> session = invocation.getInvocationContext().getSession();
	User currentUser = (User) session.get("currentUser");
	
	if (currentUser == null || currentUser.getUserName() == null 
		|| currentUser.getUserName().equals("")) {
	    
	    return "login";
	}
	else {
	    return invocation.invoke();
	}
    }

}
