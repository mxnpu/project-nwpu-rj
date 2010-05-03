package com.goodfriend.model.flex;

import java.util.Date;

public class FItem implements java.io.Serializable{
	
	private static final long serialVersionUID = 1L;

	private int idItem;
	
	private Date recordTime;
	
	public FItem(){
		
	}
	
	public int getIdItem() {
		return idItem;
	}

	public void setIdItem(int idItem) {
		this.idItem = idItem;
	}

	public Date getRecordTime() {
		return recordTime;
	}

	public void setRecordTime(Date recordTime) {
		this.recordTime = recordTime;
	}


}
