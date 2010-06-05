package com.goodfriend.model;

import java.util.HashSet;
import java.util.Set;

/**
 * Album entity. 
 * @author 
 */

public class Album implements java.io.Serializable {

	// Fields
	
	private static final long serialVersionUID = 1L;
	private Integer idAlbum;
	private Item item;
	private String title;
	private String path;
	private String description;

	// Constructors

	/** default constructor */
	public Album() {
	}

	/** minimal constructor */
	public Album(Item item) {
		this.item = item;
	}

	/** full constructor */
	public Album(Item item, String title) {
		this.item = item;
		this.title = title;
	}

	// Property accessors

	public Integer getIdAlbum() {
		return this.idAlbum;
	}

	@SuppressWarnings("unused")
	private void setIdAlbum(Integer idAlbum) {
		this.idAlbum = idAlbum;
	}

	public Item getItem() {
		return this.item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	
	@Override
	public String toString(){
		return "path:" + path + "\ndescription:" + description + "\nrecordTime:" + item.getRecordTime();
	}
	
}