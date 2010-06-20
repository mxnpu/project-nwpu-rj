package com.goodfriend.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.goodfriend.model.Reply;
import com.goodfriend.model.User;
import com.goodfriend.service.IReplyService;
import com.opensymphony.xwork2.ActionContext;

/**
 * The Reply Action of the request.
 * 
 * @author xurunhua
 * @CreateTime 2010.05.27
 * @LastModifiedtime 2010.05.27
 */
public class ReplyAction {
    
    private IReplyService replyService;
    private InputStream inputStream;
    
    public String replyAjax() {
	Map<String, Object> parameters = ActionContext.getContext().getParameters();
	Map<String, Object> session = ActionContext.getContext().getSession();
	// get the parameters.
	String[] replies = (String[]) parameters.get("replyContent");
	String replyContent = replies[0];
	String[] repliesId = (String[]) parameters.get("replyItem");
	String replyId = repliesId[0];
	Integer itemId = Integer.parseInt(replyId);
	// get the current user.
	User currentUser = (User)session.get("currentUser");
	
	// Create the reply the Object.
	Reply reply = new Reply();
	reply.setContent(replyContent);
	reply.setRecordTime(new Timestamp(new Date().getTime()));

	// Add the data to the database;
	replyService.addReply(reply, itemId, currentUser.getIdUser());

	String response = prepareData(itemId);
	toInStream(response);
	
	return "success";
    }
    
    public String deleteReply() {
	Map<String, Object> parameters = ActionContext.getContext().getParameters();
	String[] replyIds = (String[]) parameters.get("replyId");
	String[] itemIds = (String[]) parameters.get("itemId");
	Integer replyId = Integer.parseInt(replyIds[0].trim());
	Integer itemId = Integer.parseInt(itemIds[0].trim());
	
	// Get the reply and delete it;
	Reply reply = replyService.getReply(replyId);
	replyService.deleteReply(reply);
	
	String response = prepareData(itemId);
	toInStream(response);
	
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
     * Prepare the data for the client.
     * 
     * @return
     */
    private String prepareData(Integer itemId) {
	// Get the response to the client.
	StringBuffer responseBuffer = new StringBuffer();
	List<Reply> replyList = replyService.getReplies(itemId);
	for (int i=0; i < replyList.size(); i++) {
	    String user = replyList.get(i).getUser().getUserName();
	    responseBuffer.append(user);
	    responseBuffer.append("%$");
	    String replyId = replyList.get(i).getIdReply().toString();
	    responseBuffer.append(replyId);
	    responseBuffer.append("%$");
	    String replyCon = replyList.get(i).getContent();
	    responseBuffer.append(replyCon);
	    responseBuffer.append("%$");
	    String recordTime = replyList.get(i).getTime();
	    responseBuffer.append(recordTime);
	    responseBuffer.append("%$");
	    String userId = replyList.get(i).getUser().getIdUser().toString();
	    responseBuffer.append(userId);
	    responseBuffer.append("%$");
	    String photo = replyList.get(i).getUser().getPhoto();
	    responseBuffer.append(photo);
	    if (i != replyList.size()-1) {
		responseBuffer.append("@&");
	    }
	}
	
	return responseBuffer.toString();
    }
    
    /**
     * @param replyService the replyService to set
     */
    public void setReplyService(IReplyService replyService) {
	this.replyService = replyService;
    }

    /**
     * @return the replyService
     */
    public IReplyService getReplyService() {
	return replyService;
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
