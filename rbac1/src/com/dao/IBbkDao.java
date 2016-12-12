package com.dao;

import java.util.List;

import com.bean.Bbk;

import com.dao.base.IBaseDao;

public interface IBbkDao extends IBaseDao<Bbk,Integer>{
	public List<Bbk> getListBbk();
}
