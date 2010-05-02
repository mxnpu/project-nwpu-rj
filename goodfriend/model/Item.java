package com.goodfriend.model;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Item entity. 
 * @author 
 */

public class Item implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	// Fields

	private Integer idItem;
	private Timestamp recordTime;
	private Set<Gossip> gossips = new HashSet<Gossip>(0);
	private Set<Picture> pictures = new HashSet<Picture>(0);
	private Set<Statement> statements = new HashSet<Statement>(0);
	private Set<User> users = new HashSet<User>(0);
	private Set<Blog> blogs = new HashSet<Blog>(0);
	private Set<Reply> replies = new HashSet<Reply>(0);
	private Set<Album> albums = new HashSet<Album>(0);

	// Constructors

	/** default constructor */
	public Item() {
	}

	/** full constructor */
	public Item(Timestamp recordTime, Set<Gossip> gossips, Set<Picture> pictures,
			Set<Statement> statements, Set<User> users, Set<Blog> blogs, Set<Reply> replies, Set<Album> albums) {
		this.recordTime = recordTime;
		this.gossips = gossips;
		this.pictures = pictures;
		this.statements = statements;
		this.users = users;
		this.blogs = blogs;
		this.replies = replies;
		this.albums = albums;
	}

	// Property accessors

	public Integer getIdItem() {
		return this.idItem;
	}

	public void setIdItem(Integer idItem) {
		this.idItem = idItem;
	}

	public Timestamp getRecordTime() {
		return this.recordTime;
	}

	public void setRecordTime(Timestamp recordTime) {
		this.recordTime = recordTime;
	}

	public Set<Gossip> getGossips() {
		return this.gossips;
	}

	public void setGossips(Set<Gossip> gossips) {
		this.gossips = gossips;
	}

	public Set<Picture> getPictures() {
		return this.pictures;
	}

	public void setPictures(Set<Picture> pictures) {
		this.pictures = pictures;
	}

	public Set<Statement> getStatements() {
		return this.statements;
	}

	public void setStatements(Set<Statement> statements) {
		this.statements = statements;
	}

	public Set<User> getUsers() {
		return this.users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	public Set<Blog> getBlogs() {
		return this.blogs;
	}

	public void setBlogs(Set<Blog> blogs) {
		this.blogs = blogs;
	}

	public Set<Reply> getReplies() {
		return this.replies;
	}

	public void setReplies(Set<Reply> replies) {
		this.replies = replies;
	}

	public Set<Album> getAlbums() {
		return this.albums;
	}

	public void setAlbums(Set<Album> albums) {
		this.albums = albums;
	}

}