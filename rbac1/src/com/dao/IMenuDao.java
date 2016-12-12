package com.dao;

import java.util.List;

import com.bean.Menu;
import com.dao.base.IBaseDao;

public interface IMenuDao extends IBaseDao<Menu,Integer>{
	public List<Menu> getListMenu();
	
	public List<Menu> getListMenuByPms(String ids);
}
