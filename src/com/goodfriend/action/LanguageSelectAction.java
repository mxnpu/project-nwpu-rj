/**
 * 
 */
package com.goodfriend.action;

import java.util.Locale;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

/**
 * The Home Action of the request.
 * 
 * @CreateTime 2010.06.05
 * @LastModifiedtime 2010.06.09
 */
public class LanguageSelectAction {

    public String select() {
	return "login";
    }
    
    public String index() {
	Map<String, Object> session = ActionContext.getContext().getSession();
	session.put("WW_TRANS_I18N_LOCALE", Locale.US);
	return "login";
    }
}
