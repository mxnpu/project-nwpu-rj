package com.goodfriend.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

/**
 * Process the action of editing the photo.
 *
 * @CreateTime 2010.05.18
 * @LastModifyTime 2010.05.20
 */
public class PhotoEditAction {
    
    Map<String, Object> paramaters = ActionContext.getContext().getParameters();
    
    public String editPhoto() {
	return "edit";
    }
    
    public String changePhoto() {
	
	return "";
    }
}
