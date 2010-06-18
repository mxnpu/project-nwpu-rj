package com.goodfriend.admin.dto;

import java.sql.Timestamp;
/**
 * placard的传输类
 * @author Administrator
 *
 */
public class PlacardDTO {

	private Integer idPlacard;
	private String title;
	private String content;
	private Timestamp recordTime;
	private String publish;
	
	public Integer getIdPlacard() {
		return idPlacard;
	}
	public void setIdPlacard(Integer idPlacard) {
		this.idPlacard = idPlacard;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getRecordTime() {
		return recordTime;
	}
	public void setRecordTime(Timestamp recordTime) {
		this.recordTime = recordTime;
	}
	public String getPublish() {
		return publish;
	}
	public void setPublish(String publish) {
		this.publish = publish;
	}
}
