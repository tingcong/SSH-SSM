package com.dao;

import java.util.List;

import com.bean.Permission;
import com.dao.base.IBaseDao;

public interface IPerDao extends IBaseDao<Permission,Integer>{
	public List<Permission> getListPer();
	public Integer getPidByName(String pmsName);
	


}
