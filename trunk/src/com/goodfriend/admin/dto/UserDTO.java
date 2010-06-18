package com.goodfriend.admin.dto;

import java.sql.Timestamp;
import java.util.Date;

public class UserDTO {

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
	private Timestamp lastLogoutTime;
	
	public Integer getIdUser() {
		return idUser;
	}
	public void setIdUser(Integer idUser) {
		this.idUser = idUser;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHoby() {
		return hoby;
	}
	public void setHoby(String hoby) {
		this.hoby = hoby;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public Timestamp getLastLogoutTime() {
		return lastLogoutTime;
	}
	public void setLastLogoutTime(Timestamp lastLogoutTime) {
		this.lastLogoutTime = lastLogoutTime;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
