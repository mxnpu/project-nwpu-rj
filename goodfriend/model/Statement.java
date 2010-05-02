package com.goodfriend.model;

/**
 * Statement entity. 
 * @author 
 */

public class Statement implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 1L;
	private Integer id;
	private Item item;
	private String content;

	// Constructors

	/** default constructor */
	public Statement() {
	}

	/** full constructor */
	public Statement(Item item, String content) {
		this.item = item;
		this.content = content;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Item getItem() {
		return this.item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}