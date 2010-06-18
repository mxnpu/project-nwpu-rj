package com.goodfriend.service;

import java.util.List;

import com.goodfriend.model.Placard;

public interface IPlacardService {
	public void addPlacard(Placard placard);
	public Placard getPlacard(Integer id);
	public Placard getPlacard(String title);
	public List<Placard> getPlacards();
	public void updatePlacard(Placard placard);
	public void deletePlacard(Placard placard);
	public void updatePlacard(Integer integer, Placard placard);
	public List<Placard> getLatestPlacards();
}
