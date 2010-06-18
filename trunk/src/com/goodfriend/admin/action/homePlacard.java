package com.goodfriend.admin.action;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.apache.struts2.interceptor.SessionAware;

import com.goodfriend.model.Placard;
import com.goodfriend.service.IPlacardService;
import com.opensymphony.xwork2.ActionSupport;

public class homePlacard extends ActionSupport implements SessionAware {
	
	private List<Placard> placardLists;
	private IPlacardService placardService;
	private Map<String, Object> session;
	
	/**
	 * 显示布告列表
	 * 
	 * @return
	 */
	public String list() {
		if(placardService.getPlacards().size() > 8){
			placardLists = placardService.getPlacards().subList(placardService.getPlacards().size()-8,placardService.getPlacards().size());
		}
		else{
			placardLists = placardService.getPlacards();
		}
		return "Placard_list";
	}

	
	public void setSession(Map<String, Object> session) {
		
		this.session = session;
	}

	public List<Placard> getPlacardLists() {
		return placardLists;
	}

	public void setPlacardLists(List<Placard> placardLists) {
		this.placardLists = placardLists;
	}

	public IPlacardService getPlacardService() {
		return placardService;
	}

	public void setPlacardService(IPlacardService placardService) {
		this.placardService = placardService;
	}

}
