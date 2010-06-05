package com.goodfriend.model;

/**
 * Friends entity. 
 * @author 
 */

public class Friends implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 1L;
	private Integer idFriends;
	private User userFriend; // owner's friend
	private User user; // owner
	private String success;
	private String group;

	// Constructors

	/** default constructor */
	public Friends() {
	}

	/** minimal constructor */
	public Friends(User userFriend, User user) {
		this.userFriend = userFriend;
		this.user = user;
	}

	/** full constructor */
	public Friends(User userFriend, User user, String success,
			String group) {
		this.userFriend = userFriend;
		this.user = user;
		this.success = success;
		this.group = group;
	}

	// Property accessors

	public Integer getIdFriends() {
		return this.idFriends;
	}

	@SuppressWarnings("unused")
	private void setIdFriends(Integer idFriends) {
		this.idFriends = idFriends;
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

	public void setUserFriend(User userFriend) {
		this.userFriend = userFriend;
	}

	public User getUserFriend() {
		return userFriend;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public User getUser() {
		return user;
	}
	
	public boolean equals(Friends friend){
		if (this.getUser().equals(friend.getUser()) && this.getUserFriend().equals(friend.getUserFriend())){
			return true;
		}else if (this.getUser().equals(friend.getUserFriend()) && this.getUserFriend().equals(friend.getUser())){
			return true;
		}
		return false;
	}

}