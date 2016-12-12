package com.dao;

import java.util.List;

import com.bean.Lishi;
import com.dao.base.IBaseDao;

public interface ILishiDao extends IBaseDao<Lishi, Integer>{

	public String add(Integer id,Integer sid,String sname);
	public List<Lishi> getlishi();
	public List gettongji();
}
