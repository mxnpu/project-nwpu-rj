/**
 * 
 */
package com.goodfriend.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import com.goodfriend.service.IMailService;
import com.opensymphony.xwork2.ActionContext;

/**
 * Mail process Action Class
 *
 * @CreateTime 2010.06.22
 * @LastModifiedtime 2010.06.22
 */
public class MailAction {
    private IMailService mailService;
    private InputStream inputStream;
    
    public String deleteMail() {
	Map<String, Object> arguments = ActionContext.getContext()
	.getParameters();
	String[] strid = (String[]) arguments.get("mailId");
	int mailID = Integer.parseInt(strid[0].trim());
	mailService.mailOpened(mailID);	
	
	toInStream("success");
	return "success";
    }
    
    /**
     * Put the string into the input stream to the client.
     * 
     * @param str
     */
    private void toInStream(String str) {
	try {

	    setInputStream(new ByteArrayInputStream(str.getBytes("utf-8")));

	} catch (UnsupportedEncodingException e) {
	    e.printStackTrace();
	}

    }

    /**
     * @param mailService the mailService to set
     */
    public void setMailService(IMailService mailService) {
	this.mailService = mailService;
    }

    /**
     * @return the mailService
     */
    public IMailService getMailService() {
	return mailService;
    }

    /**
     * @param inputStream the inputStream to set
     */
    public void setInputStream(InputStream inputStream) {
	this.inputStream = inputStream;
    }

    /**
     * @return the inputStream
     */
    public InputStream getInputStream() {
	return inputStream;
    }

}
