package com.goodfriend.admin.dto;
/**
 * This is the Admin dto class.
 * the function is to select the useful parampter to the admin model
 * @author haiqian
 * 生成时间：2010.5.8
 * 最后修改：2010.5.8
 */
public class AdminDTO {

	private String username;
	private String password;
	private String confirmPassword;
	private String real_name;
	private String phone;
	private String email;
	private String address;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	public String getReal_name() {
		return real_name;
	}
	public void setReal_name(String realName) {
		real_name = realName;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
}
