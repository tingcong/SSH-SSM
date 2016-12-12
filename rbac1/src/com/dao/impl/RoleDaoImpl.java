package com.dao.impl;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.bean.Role;
import com.dao.IRoleDao;
import com.dao.base.BaseDaoImpl;
@Repository
public class RoleDaoImpl extends BaseDaoImpl<Role,Integer> implements IRoleDao{
	@Override
	public List<Role> getListRole(){
		return super.getListByHQL("from Role role");
	}
	@Override
	public String getRoleName(Integer RoleId) {
		Session session = getSessionFactory().getCurrentSession();
		String hql = "select role.roleName from Role role where role.roleId="+RoleId;
		List query = session.createQuery(hql).list();
		return (String) query.get(0);
	}
	@Override
	public List<Role> roleAdd(String roleName, String roleInfo) {
		Session session = getSessionFactory().getCurrentSession();
		String sql = "insert into role(role_name,role_info) values('" + roleName
				+ "','" + roleInfo + "');";
		SQLQuery query = session.createSQLQuery(sql);
		query.executeUpdate(); // 1
		return null;
	}
	@Override
	public boolean checkRoleName(String roleName) {
		Session session = getSessionFactory().getCurrentSession();
		String hql = "from Role role where role.roleName='" + roleName+"'";
		try {
			
			@SuppressWarnings("rawtypes")
			List query = session.createQuery(hql).list();
			query.get(0);
			return false;
		} catch (Exception e) {
			return true;
		}
	}
	@Override
	public String roleDel(String[] ids) {
		Session session = getSessionFactory().getCurrentSession();
		String hql = "delete Role where roleId in(:id)";
		for (String id : ids) {
			@SuppressWarnings("unused")
			int query = session.createQuery(hql).setString("id", id)
					.executeUpdate();
		}
		System.out.println("ok!");
		return "ok";
	}
}
