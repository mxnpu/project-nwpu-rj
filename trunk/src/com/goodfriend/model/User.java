package com.goodfriend.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;


/**
 * User entity. 
 * @author 
 */

public class User  implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	// Fields    

     private Integer idUser;
     private Item item;
     private String userName;
     private String password;
     private String realName;
     private String gender;
     private Date birthday;
     private String phone;
     private String email;
     private String hoby;
     private String photo;
     private Set<Friends> friendsesForFriendId = new HashSet<Friends>(0);
     private Set<Reply> replies = new HashSet<Reply>(0);
     private Set<Friends> friendsesForUserId = new HashSet<Friends>(0);
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
    public User(Item item, String userName, String password, String realName,
    		String gender, Date birthday, String phone, String email, 
    		String hoby, String photo, Set<Friends> friendsesForFriendId, 
    		Set<Reply> replies, Set<Friends> friendsesForUserId, Set<Gossip> gossips) {
        this.item = item;
        this.userName = userName;
        this.password = password;
        this.realName = realName;
        this.gender = gender;
        this.birthday = birthday;
        this.phone = phone;
        this.email = email;
        this.hoby = hoby;
        this.photo = photo;
        this.friendsesForFriendId = friendsesForFriendId;
        this.replies = replies;
        this.friendsesForUserId = friendsesForUserId;
        this.gossips = gossips;
    }

   
    // Property accessors

    public Integer getIdUser() {
        return this.idUser;
    }
    
    public void setIdUser(Integer idUser) {
        this.idUser = idUser;
    }

    public Item getItem() {
        return this.item;
    }
    
    public void setItem(Item item) {
        this.item = item;
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

    public Set<Friends> getFriendsesForFriendId() {
        return this.friendsesForFriendId;
    }
    
    public void setFriendsesForFriendId(Set<Friends> friendsesForFriendId) {
        this.friendsesForFriendId = friendsesForFriendId;
    }

    public Set<Reply> getReplies() {
        return this.replies;
    }
    
    public void setReplies(Set<Reply> replies) {
        this.replies = replies;
    }

    public Set<Friends> getFriendsesForUserId() {
        return this.friendsesForUserId;
    }
    
    public void setFriendsesForUserId(Set<Friends> friendsesForUserId) {
        this.friendsesForUserId = friendsesForUserId;
    }

    public Set<Gossip> getGossips() {
        return this.gossips;
    }
    
    public void setGossips(Set<Gossip> gossips) {
        this.gossips = gossips;
    }

}