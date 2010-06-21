package com.goodfriend.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

/**
 * Placard entity.
 * 
 * @author
 */

public class Placard implements Serializable, Comparable<Placard>{
    private static final long serialVersionUID = 1L;
    // Fields

    private Integer idPlacard;
    private String title;
    private String content;
    private Timestamp recordTime = new Timestamp(new Date().getTime());
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

    @SuppressWarnings("unused")
    private void setIdPlacard(Integer idPlacard) {
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


    /* (non-Javadoc)
     * @see java.lang.Comparable#compareTo(java.lang.Object)
     */
    public int compareTo(Placard o) {
	long time1 = this.getRecordTime().getTime();
	long time2 = o.getRecordTime().getTime();

	if (time1 < time2) {
	    return 1;
	} else if (time1 > time2) {
	    return -1;
	} else {
	    return 0;
	}
    }
    
    @SuppressWarnings("deprecation")
    public String getTime() {
	return this.recordTime.toLocaleString();
    }

}