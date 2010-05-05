package com.goodfriend.model;

/**
 * Picture entity. 
 * @author 
 */

public class Picture implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 1L;
	private Integer id;
	private Album album;
	private Item item;
	private String introduction;
	private String path;

	// Constructors

	/** default constructor */
	public Picture() {
	}

	/** minimal constructor */
	public Picture(Item item) {
		this.item = item;
	}

	/** full constructor */
	public Picture(Album album, Item item, String introduction, String path) {
		this.album = album;
		this.item = item;
		this.introduction = introduction;
		this.path = path;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	@SuppressWarnings("unused")
	private void setId(Integer id) {
		this.id = id;
	}

	public Album getAlbum() {
		return this.album;
	}

	public void setAlbum(Album album) {
		this.album = album;
	}

	public Item getItem() {
		return this.item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public String getIntroduction() {
		return this.introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getPath() {
		return this.path;
	}

	public void setPath(String path) {
		this.path = path;
	}

}