package com.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.bean.UserVoRole;
import com.dao.IUserVoRoleDao;
import com.dao.base.BaseDaoImpl;
@Repository
public class UserVoRoleDaoImpl extends BaseDaoImpl<UserVoRole,Integer> implements IUserVoRoleDao{
	//main网页用户表
	@Override
	public List<UserVoRole> getListUserVoRole(){
		StringBuffer sb = new StringBuffer();
		sb.append("select new com.bean.UserVoRole(user.userId,user.userName,user.userPwd,user.userInfo,role.roleId,role.roleName) ");
		sb.append("from User user,Role role,UserRole user_role ");
		sb.append("where user.userId=user_role.userId ");
		sb.append("and role.roleId=user_role.roleId");
		String hql = sb.toString();
		return super.getListByHQL(hql);
	}

	@Override
	public List<UserVoRole> getRoleNumber() {
		StringBuffer sb = new StringBuffer();
		sb.append("select role.roleName,count(*) as num ");
		sb.append("from User user,Role role,UserRole user_role ");
		sb.append("where role.roleId=user_role.roleId,user.userId=user_role.userId ");
		sb.append("group by role.roleName");
		String hql = sb.toString();
		return super.getListBySQL(hql);
	}

	@Override
	public List<UserVoRole> getRoleName(String userName) {
			StringBuffer sb = new StringBuffer();
			sb.append("select new com.bean.UserVoRole(role.roleName) ");
			sb.append("from User user,Role role,UserRole user_role ");
			sb.append("where user.userName='"+userName+"' ");
			sb.append("and user.userId=user_role.userId ");
			sb.append("and user_role.roleId = role.roleId");
			String hql =  sb.toString();
			
			return super.getListByHQL(hql);
		
	}

	@Override
	public List<UserVoRole> getRoleId(String userName) {
		StringBuffer sb = new StringBuffer();
		sb.append("select new com.bean.UserVoRole(role.roleId) ");
		sb.append("from User user,Role role,UserRole user_role ");
		sb.append("where user.userName='"+userName+"' ");
		sb.append("and user.userId=user_role.userId ");
		sb.append("and user_role.roleId = role.roleId");
		String hql =  sb.toString();
		
		return super.getListByHQL(hql);

	}



	
}
