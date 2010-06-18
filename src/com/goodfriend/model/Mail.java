package com.goodfriend.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

/**
 * Mail entity. 
 * @author 
 */

public class Mail implements Serializable {

    // Fields

    private static final long serialVersionUID = 1L;
    private Integer id;
    private User fromUser;
    private User toUser;
    private Timestamp time = new Timestamp(new Date().getTime());
    private String title;
    private String content;
    private Boolean opened = false;


    /** default constructor */
    public Mail() {
    }

    /** minimal constructor */
    public Mail(User toUser, Timestamp time, Boolean opened) {
        this.toUser = toUser;
        this.time = time;
        this.opened = opened;
    }

    /** full constructor */
    public Mail(User fromUser, User toUser, Timestamp time, String title, String content, Boolean opened) {
        this.fromUser = fromUser;
        this.toUser = toUser;
        this.time = time;
        this.title = title;
        this.content = content;
        this.opened = opened;
    }

    // Property accessors

    public Integer getId() {
	return this.id;
    }

    public void setId(Integer id) {
	this.id = id;
    }

    public Timestamp getTime() {
        return this.time;
    }
    
    public void setTime(Timestamp time) {
	this.time = time;
    }

    public String getTitle() {
	return this.title;
    }

    public void setTitle(String title) {
	this.title = title;
    }

    public String getContent() {
	return this.content;
    }

    public void setContent(String content) {
	this.content = content;
    }

    public Boolean getOpened() {
	return this.opened;
    }

    public void setOpened(Boolean opened) {
	this.opened = opened;
    }

    /**
     * @param toUser the toUser to set
     */
    public void setToUser(User toUser) {
	this.toUser = toUser;
    }

    /**
     * @return the toUser
     */
    public User getToUser() {
	return toUser;
    }

    /**
     * @param fromUser the fromUser to set
     */
    public void setFromUser(User fromUser) {
	this.fromUser = fromUser;
    }

    /**
     * @return the fromUser
     */
    public User getFromUser() {
	return fromUser;
    }
    
    
    public boolean equals(Mail mail){
    	return false;
    }

}