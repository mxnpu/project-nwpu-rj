package com.goodfriend.model;

/**
 * Blog entity. 
 * @author 
 */

public class Blog implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 1L;
	private Integer id;
	private Item item;
	private String title;
	private String content;

	// Constructors

	/** default constructor */
	public Blog() {
	}

	/** minimal constructor */
	public Blog(Item item, String title) {
		this.item = item;
		this.title = title;
	}

	/** full constructor */
	public Blog(Item item, String title, String content) {
		this.item = item;
		this.title = title;
		this.content = content;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	@SuppressWarnings("unused")
	private void setId(Integer id) {
		this.id = id;
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

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}