package com.goodfriend.model;

import java.util.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.DateFormat;


/**
 * Mail entity. @author MyEclipse Persistence Tools
 */

public class Mail  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private User userByFromUser;
     private User userByToUser;
     private Timestamp time = new Timestamp(new Date().getTime());
     private String title;
     private String content;
     private Boolean opened = false;


    // Constructors

    /** default constructor */
    public Mail() {
    }

	/** minimal constructor */
    public Mail(User userByToUser, Timestamp time, Boolean opened) {
        this.userByToUser = userByToUser;
        this.time = time;
        this.opened = opened;
    }
    
    /** full constructor */
    public Mail(User userByFromUser, User userByToUser, Timestamp time, String title, String content, Boolean opened) {
        this.userByFromUser = userByFromUser;
        this.userByToUser = userByToUser;
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

    public User getUserByFromUser() {
        return this.userByFromUser;
    }
    
    public void setUserByFromUser(User userByFromUser) {
        this.userByFromUser = userByFromUser;
    }

    public User getUserByToUser() {
        return this.userByToUser;
    }
    
    public void setUserByToUser(User userByToUser) {
        this.userByToUser = userByToUser;
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
   








}