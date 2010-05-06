package com.goodfriend.daomanager;

import java.util.List;

import com.goodfriend.model.Placard;

public interface IPlacardDaoManager {
	public void addPlacard(Placard placard);
	public Placard getPlacard(Integer id);
	public Placard getPlacard(String title);
	public List<Placard> getPlacards();
	public void updateUser(Placard placard);
	public void deleteUser(Placard placard);
}
