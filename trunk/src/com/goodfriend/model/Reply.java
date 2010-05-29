package com.goodfriend.model;

import java.sql.Timestamp;

/**
 * Reply entity. 
 * @author 
 */

public class Reply implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	// Fields

	private Integer idReply;
	private Item item;
	private User user;
	private String content;
	private Timestamp recordTime;

	// Constructors

	/** default constructor */
	public Reply() {
	}

	/** full constructor */
	public Reply(Item item, User user, String content) {
		this.item = item;
		this.user = user;
		this.content = content;
	}

	// Property accessors

	public Integer getIdReply() {
		return this.idReply;
	}

	@SuppressWarnings("unused")
	private void setIdReply(Integer idReply) {
		this.idReply = idReply;
	}

	public Item getItem() {
		return this.item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * @param recordTime the recordTime to set
	 */
	public void setRecordTime(Timestamp recordTime) {
	    this.recordTime = recordTime;
	}

	/**
	 * @return the recordTime
	 */
	public Timestamp getRecordTime() {
	    return recordTime;
	}
	
	/**
	 * @return the time
	 */
	@SuppressWarnings("deprecation")
	public String getTime() {
	    return this.recordTime.toLocaleString();
	}

}