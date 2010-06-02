package com.goodfriend.model;

import java.io.Serializable;

/**
 * Gossip entity. 
 * @author 
 */

public class Gossip implements Serializable, Comparable<Gossip> {

	// Fields

	private static final long serialVersionUID = 1L;
	private Integer idGossip;
	private Item item;
	private User user;	// who give the gossip
	private String content;

	// Constructors

	/** default constructor */
	public Gossip() {
	}

	/** minimal constructor */
	public Gossip(Item item, User user) {
		this.item = item;
		this.user = user;
	}

	/** full constructor */
	public Gossip(Item item, User user, String content) {
		this.item = item;
		this.user = user;
		this.content = content;
	}

	// Property accessors

	public Integer getIdGossip() {
		return this.idGossip;
	}

	@SuppressWarnings("unused")
	private void setIdGossip(Integer idGossip) {
		this.idGossip = idGossip;
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

	/* (non-Javadoc)
	 * @see java.lang.Comparable#compareTo(java.lang.Object)
	 */
	public int compareTo(Gossip o) {
	    long time1 = getItem().getRecordTime().getTime();
	    long time2 = o.getItem().getRecordTime().getTime();
	    
	    if (time1 < time2) {
		return 1;
	    }
	    else if (time1 > time2) {
		return -1;
	    }
	    else {
		return 0;
	    }
	}

}