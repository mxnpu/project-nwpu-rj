package com.goodfriend.action;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import com.goodfriend.model.Statement;
import com.goodfriend.model.User;
import com.goodfriend.service.IStatementService;
import com.opensymphony.xwork2.ActionContext;

/**
 * Statement process Action Class
 * 
 * @author xurunhua
 * @CreateTime 2010.05.23
 * @LastModifiedtime 2010.05.23
 */
public class StatementAction {
    
    private IStatementService statementService;
    private InputStream inputStream;

    /**
     * update a statement by AJAX.
     * 
     * @return success
     */
    public String updateStatement() {
	Map<String, Object> parameters = ActionContext.getContext().getParameters();
	Map<String, Object> session = ActionContext.getContext().getSession();
	// get the parameters.
	String[] parameter = (String[]) parameters.get("statement");
	String newStatement = parameter[0];
	// get the current user.
	User currentUser = (User)session.get("currentUser");
	
	// create a statement and set the content.
	Statement statement = new Statement();
	statement.setContent(newStatement);
	
	// add the statement to the databases;
	statementService.addStatement(statement, currentUser.getIdUser());
	
	// return the new string.
	toInStream(newStatement);
	
	return "success";
    }
    
    /**
     * Get the user's latest statement.
     * Using the AJAX.
     * 
     * @return the success flag.
     */
    public String getLatestStatement() {
	Map<String, Object> session = ActionContext.getContext().getSession();
	User currentUser = (User) session.get("currentUser");
	Statement statement = statementService.getLatestStatement(currentUser.getIdUser());
	
	// Get the latest the statement.
	String latestStatement = "";
	if (statement != null ) {
	    latestStatement = statement.getContent();
	}
	
	if (latestStatement != null && !latestStatement.equals("")) {
	    toInStream(latestStatement);
	}
	else {
	    toInStream("Lazy Person without any left.");
	}
	
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
     * @param statementService the statementService to set
     */
    public void setStatementService(IStatementService statementService) {
	this.statementService = statementService;
    }

    /**
     * @return the statementService
     */
    public IStatementService getStatementService() {
	return statementService;
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
