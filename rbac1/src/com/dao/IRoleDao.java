package com.dao;

import java.util.List;

import com.bean.Role;
import com.dao.base.IBaseDao;

public interface IRoleDao extends IBaseDao<Role,Integer>{
	public List<Role> getListRole();
	
	public String getRoleName(Integer RoleId);
	
	public List<Role> roleAdd(String roleName,String roleInfo);
	
	public boolean checkRoleName(String roleName);
	
	public String roleDel(String[] ids);


}
