package com.goodfriend.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 1L;
	private Integer idUser;
	private String userName;
	private String password;
	private String realName;
	private String gender;
	private Date birthday;
	private String phone;
	private String email;
	private String hoby;
	private String photo;
	// the items which user have
	private Set<Item> items = new HashSet<Item>(0);		
	// the user's friends
	private Set<Friends> friends = new HashSet<Friends>(0);
	// the replies which user reply to other.
	private Set<Reply> replies = new HashSet<Reply>(0);	
	// the users who the current user belong to
	private Set<Friends> friendsForOther = new HashSet<Friends>(0);
	// the gossips which the user to his friend.
	private Set<Gossip> gossips = new HashSet<Gossip>(0);	
	
	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String userName, String password, String realName) {
		this.userName = userName;
		this.password = password;
		this.realName = realName;
	}

	/** full constructor */
	public User(String userName, String password, String realName,
			String gender, Date birthday, String phone, String email,
			String hoby, String photo, Set<Item> items, Set<Friends> friends,
			Set<Reply> replies, Set<Friends> friendsForOther, Set<Gossip> gossips) {
		this.userName = userName;
		this.password = password;
		this.realName = realName;
		this.gender = gender;
		this.birthday = birthday;
		this.phone = phone;
		this.email = email;
		this.hoby = hoby;
		this.photo = photo;
		this.items = items;
		this.friends = friends;
		this.replies = replies;
		this.friendsForOther = friendsForOther;
		this.gossips = gossips;
	}

	// Property accessors

	public Integer getIdUser() {
		return this.idUser;
	}

	@SuppressWarnings("unused")
	private void setIdUser(Integer idUser) {
		this.idUser = idUser;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRealName() {
		return this.realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getGender() {
		return this.gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHoby() {
		return this.hoby;
	}

	public void setHoby(String hoby) {
		this.hoby = hoby;
	}

	public String getPhoto() {
		return this.photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public Set<Item> getItems() {
		return this.items;
	}

	public void setItems(Set<Item> items) {
		this.items = items;
	}

	public Set<Reply> getReplies() {
		return this.replies;
	}

	public void setReplies(Set<Reply> replies) {
		this.replies = replies;
	}

	public Set<Gossip> getGossips() {
		return this.gossips;
	}

	public void setGossips(Set<Gossip> gossips) {
		this.gossips = gossips;
	}

	public void setFriends(Set<Friends> friends) {
		this.friends = friends;
	}

	public Set<Friends> getFriends() {
		return friends;
	}

	public void setFriendsForOther(Set<Friends> friendsForOther) {
		this.friendsForOther = friendsForOther;
	}

	public Set<Friends> getFriendsForOther() {
		return friendsForOther;
	}

}