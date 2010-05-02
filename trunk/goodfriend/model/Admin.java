package com.goodfriend.model;

/**
 * Admin entity. 
 * 
 * @author
 */

public class Admin implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	// Fields

	private Integer idAdmin;
	private String username;
	private String password;
	private String realName;
	private String phone;
	private String email;
	private String address;

	// Constructors

	/** default constructor */
	public Admin() {
	}

	/** full constructor */
	public Admin(String username, String password, String realName,
			String phone, String email, String address) {
		this.username = username;
		this.password = password;
		this.realName = realName;
		this.phone = phone;
		this.email = email;
		this.address = address;
	}

	// Property accessors

	public Integer getIdAdmin() {
		return this.idAdmin;
	}

	public void setIdAdmin(Integer idAdmin) {
		this.idAdmin = idAdmin;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
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

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

}