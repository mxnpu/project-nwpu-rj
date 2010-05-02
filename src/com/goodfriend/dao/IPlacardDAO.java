package com.goodfriend.dao;

import java.util.List;

import com.goodfriend.model.Placard;

public interface IPlacardDAO {

	public abstract void save(Placard transientInstance);

	public abstract void delete(Placard persistentInstance);

	public abstract Placard findById(java.lang.Integer id);

	public abstract List<Placard> findAll();

}