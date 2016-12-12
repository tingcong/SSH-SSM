package com.dao;

import java.util.List;

import com.bean.UserVoRole;
import com.dao.base.IBaseDao;

public interface IUserVoRoleDao extends IBaseDao<UserVoRole,Integer>{
	//用户和角色表
	public List<UserVoRole> getListUserVoRole();
	//统计role各类数量
	public List<UserVoRole> getRoleNumber();
	
	public List<UserVoRole> getRoleName(String userName);
	
	public List<UserVoRole> getRoleId(String userName);
	

}
