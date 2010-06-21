package com.goodfriend.model;

/**
 * Statement entity. 
 * @author 
 */

public class Statement implements java.io.Serializable, Comparable<Statement> {

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

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	/* (non-Javadoc)
	 * @see java.lang.Comparable#compareTo(java.lang.Object)
	 */
	public int compareTo(Statement o) {
	    long time1 = this.getItem().getRecordTime().getTime();
		long time2 =o.getItem().getRecordTime().getTime();

		if (time1 < time2) {
		    return 1;
		} else if (time1 > time2) {
		    return -1;
		} else {
		    return 0;
		}
	}

}