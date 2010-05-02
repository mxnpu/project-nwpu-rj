package com.goodfriend.model;

import java.sql.Timestamp;

/**
 * Placard entity. 
 * @author
 */

public class Placard implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	// Fields

	private Integer idPlacard;
	private String title;
	private String content;
	private Timestamp recordTime;
	private String publish;

	// Constructors

	/** default constructor */
	public Placard() {
	}

	/** minimal constructor */
	public Placard(String title) {
		this.title = title;
	}

	/** full constructor */
	public Placard(String title, String content, Timestamp recordTime,
			String publish) {
		this.title = title;
		this.content = content;
		this.recordTime = recordTime;
		this.publish = publish;
	}

	// Property accessors

	public Integer getIdPlacard() {
		return this.idPlacard;
	}

	public void setIdPlacard(Integer idPlacard) {
		this.idPlacard = idPlacard;
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

	public Timestamp getRecordTime() {
		return this.recordTime;
	}

	public void setRecordTime(Timestamp recordTime) {
		this.recordTime = recordTime;
	}

	public String getPublish() {
		return this.publish;
	}

	public void setPublish(String publish) {
		this.publish = publish;
	}

}