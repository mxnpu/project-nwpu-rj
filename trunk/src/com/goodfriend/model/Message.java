/**
 * 
 */
package com.goodfriend.model;

import java.sql.Timestamp;

/**
 * The message model for the latest message service module.
 * 
 * @author xurunhua
 * @CreateTime 2010.05.26
 * @LastModifiedtime 2010.05.26
 */
public class Message implements Comparable<Message> {

    private String type;
    private String title;
    private String content;
    private User owner;
    private Timestamp recordTime;

    /**
     * @return the type
     */
    public String getType() {
	return type;
    }

    /**
     * @param type
     *            the type to set
     */
    public void setType(String type) {
	this.type = type;
    }

    /**
     * @return the title
     */
    public String getTitle() {
	return title;
    }

    /**
     * @param title
     *            the title to set
     */
    public void setTitle(String title) {
	this.title = title;
    }

    /**
     * @return the content
     */
    public String getContent() {
	return content;
    }

    /**
     * @param content
     *            the content to set
     */
    public void setContent(String content) {
	this.content = content;
    }

    /**
     * @return the owner
     */
    public User getOwner() {
	return owner;
    }

    /**
     * @param owner
     *            the owner to set
     */
    public void setOwner(User owner) {
	this.owner = owner;
    }

    /**
     * @return the recordTime
     */
    public Timestamp getRecordTime() {
	return recordTime;
    }

    /**
     * @param recordTime
     *            the recordTime to set
     */
    public void setRecordTime(Timestamp recordTime) {
	this.recordTime = recordTime;
    }

    /*
     * (non-Javadoc)
     * 
     * @see java.lang.Comparable#compareTo(java.lang.Object)
     */
    public int compareTo(Message o) {
	
	long time1 = this.getRecordTime().getTime();
	long time2 = o.getRecordTime().getTime();

	if (time1 < time2) {
	    return 1;
	} else if (time1 > time2) {
	    return -1;
	} else {
	    return 0;
	}
    }

}
