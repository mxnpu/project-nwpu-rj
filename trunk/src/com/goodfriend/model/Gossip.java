package com.goodfriend.model;

/**
 * Gossip entity. 
 * @author 
 */

public class Gossip implements java.io.Serializable {

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

}