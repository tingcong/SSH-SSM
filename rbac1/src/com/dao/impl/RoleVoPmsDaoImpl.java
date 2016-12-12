package com.dao.impl;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.bean.RoleVoPms;
import com.dao.IRoleVoPmsDao;
import com.dao.base.BaseDaoImpl;
@Repository
public class RoleVoPmsDaoImpl extends BaseDaoImpl<RoleVoPms,Integer> implements IRoleVoPmsDao{
	//main网页权限表
	@Override
	public List<RoleVoPms> getListRoleVoPms(){
		StringBuffer sb = new StringBuffer();
		sb.append("select new com.bean.RoleVoPms(role.roleId,role.roleName,permission.pmsId,permission.pmsName,permission.pmsInfo) ");
		sb.append("from Role role,Permission permission,RolePermission role_permission ");
		sb.append("where role.roleId=role_permission.roleId ");
		sb.append("and permission.pmsId=role_permission.pmsId ");
		sb.append("group by role.roleName");
		String hql = sb.toString();
		return super.getListByHQL(hql);
	}

	@Override
	public List<RoleVoPms> getPmsName(Integer roleId) {
		StringBuffer sb = new StringBuffer();
		sb.append("select new com.bean.RoleVoPms(permission.pmsName) ");
		sb.append("from Role role,Permission permission,RolePermission role_permission ");
		sb.append("where role_permission.roleId="+roleId );
		sb.append("and role.roleId="+roleId );
		sb.append("and permission.pmsId=role_permission.pmsId");
		String hql = sb.toString();
		System.out.println("hql执行...");
		return super.getListByHQL(hql);
	}



	
}
