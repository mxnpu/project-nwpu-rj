package com.goodfriend.admin.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.goodfriend.admin.dto.PlacardDTO;
import com.goodfriend.model.Admin;
import com.goodfriend.model.Placard;
import com.goodfriend.service.IPlacardService;
import com.goodfriend.service.impl.AdminService;
import com.opensymphony.xwork2.ActionSupport;

public class ManagerPlacardAction extends ActionSupport implements SessionAware {

	private static final String FAILED = "failed";
	private int id;
	private Placard placard = new Placard();
	private PlacardDTO placardDTO;
	private List<Placard> placardLists;
	private IPlacardService placardService;
	private Map<String, Object> session;

	public String addInput() throws Exception {

		if (placardDTO.getTitle() != null && !placardDTO.getTitle().equals("")) {

			placard.setTitle(placardDTO.getTitle());
		} else {
			return FAILED;
		}

		if (placardDTO.getContent() != null) {

			placard.setContent(placardDTO.getContent());
		} else {
			placard.setContent("");
			;
		}

		if (placardDTO.getPublish() != null) {

			placard.setPublish(placardDTO.getPublish());
		} else {
			placard.setPublish("");
			;
		}

		if (placardDTO.getRecordTime() != null) {

			placard.setRecordTime(placardDTO.getRecordTime());
		} else {
			placard.setPublish("");
			;
		}

		placardService.addPlacard(placard);

		System.out.println("添加布告： " + placard.getTitle() + " 成功");

		return "add_success";
	}

	/**
	 * 删除布告项
	 * 
	 * @return
	 */
	public String delete() {

		placardService.deletePlacard(placardService.getPlacard(id));
		return "del_success";
	}
	
	/**
	 * 查看布告信息输入表项
	 * 
	 * @return
	 */
	public String viewPlacard() {

		placard = placardService.getPlacard(id);
		session.put("idPlacard", id);
		return "view_placard_info";
	}
	
	public int getId() {
		return id;
	}

	public Placard getPlacard() {
		return placard;
	}

	public PlacardDTO getPlacardDTO() {
		return placardDTO;
	}

	public List<Placard> getPlacardLists() {
		return placardLists;
	}

	public IPlacardService getPlacardService() {
		return placardService;
	}

	/**
	 * 显示布告列表
	 * 
	 * @return
	 */
	public String list() {

		placardLists = placardService.getPlacards();
		return "Placard_list";
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setPlacard(Placard placard) {
		this.placard = placard;
	}

	public void setPlacardDTO(PlacardDTO placardDTO) {
		this.placardDTO = placardDTO;
	}

	public void setPlacardLists(List<Placard> placardLists) {
		this.placardLists = placardLists;
	}

	public void setPlacardService(IPlacardService placardService) {
		this.placardService = placardService;
	}

	public void setSession(Map<String, Object> session) {

		this.session = session;
	}
	
	/**
	 * 更新布告信息
	 * 
	 * @return
	 */
	public String update() {

		placardService.updatePlacard((Integer)session.get("idPlacard"), placard);
		return "update_success";
	}

	/**
	 * 更新布告信息输入表项
	 * 
	 * @return
	 */
	public String updateInput() {

		placard = placardService.getPlacard(id);
		session.put("idPlacard", id);
		return "update_input";
	}

	
}
