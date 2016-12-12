package com.dao;

import java.util.List;

import com.bean.RoleVoPms;
import com.dao.base.IBaseDao;

public interface IRoleVoPmsDao extends IBaseDao<RoleVoPms,Integer>{
	//权限和角色表
	public List<RoleVoPms> getListRoleVoPms();
	//权限管理
	public List<RoleVoPms> getPmsName(Integer roleId);
	

}
