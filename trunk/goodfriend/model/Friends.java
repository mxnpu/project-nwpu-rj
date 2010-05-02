package com.goodfriend.model;

/**
 * Friends entity. 
 * @author 
 */

public class Friends implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 1L;
	private Integer idFriends;
	private User userByFriendId; // owner's friend
	private User userByUserId; // owner
	private String success;
	private String group;

	// Constructors

	/** default constructor */
	public Friends() {
	}

	/** minimal constructor */
	public Friends(User userByFriendId, User userByUserId) {
		this.userByFriendId = userByFriendId;
		this.userByUserId = userByUserId;
	}

	/** full constructor */
	public Friends(User userByFriendId, User userByUserId, String success,
			String group) {
		this.userByFriendId = userByFriendId;
		this.userByUserId = userByUserId;
		this.success = success;
		this.group = group;
	}

	// Property accessors

	public Integer getIdFriends() {
		return this.idFriends;
	}

	public void setIdFriends(Integer idFriends) {
		this.idFriends = idFriends;
	}

	public User getUserByFriendId() {
		return this.userByFriendId;
	}

	public void setUserByFriendId(User userByFriendId) {
		this.userByFriendId = userByFriendId;
	}

	public User getUserByUserId() {
		return this.userByUserId;
	}

	public void setUserByUserId(User userByUserId) {
		this.userByUserId = userByUserId;
	}

	public String getSuccess() {
		return this.success;
	}

	public void setSuccess(String success) {
		this.success = success;
	}

	public String getGroup() {
		return this.group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

}