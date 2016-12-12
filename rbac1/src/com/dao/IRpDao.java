package com.dao;

import java.util.List;

import com.bean.Permission;
import com.bean.RolePermission;
import com.dao.base.IBaseDao;

public interface IRpDao extends IBaseDao<RolePermission,Integer>{
	//public List<RolePermission> getListPer();
	public String pmsDel(Integer roleId,Integer pmsId);
	//权限增加
	public String pmsAdd(Integer roleId,Integer pmsId);
	//权限存在判断
	public String pmsExist(Integer roleId,Integer pmsId);
	
	public String pmsDel(String[] ids);
	
	public List<RolePermission> getPmsId(Integer roleId);

}
