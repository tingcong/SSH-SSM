package com.dao;

import java.util.List;

import com.bean.Role;
import com.bean.UserRole;
import com.dao.base.IBaseDao;

public interface IUserRoleDao extends IBaseDao<UserRole,Integer>{
	public List<UserRole> getListRole();
	public String addUserRole(Integer userId);

	public String delUserRole(String[] ids);//批量用户角色删除
	
	public String roleDel(Integer id);
	
	public String modifyUserRole(Integer uid,Integer rid);//用户角色修改
	
	//用户管理：增加角色
	public String UserRoleAdd(Integer userId,Integer roleId);
	
	public List<UserRole> getRoleIdCount();
}
