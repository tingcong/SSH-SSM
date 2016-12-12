package com.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.bean.Role;
import com.bean.UserRole;
import com.dao.IUserRoleDao;
import com.dao.base.BaseDaoImpl;
@Repository
public class UserRoleDaoImpl extends BaseDaoImpl<UserRole,Integer> implements IUserRoleDao{
	@Override
	public List<UserRole> getListRole() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public String delUserRole(String[] ids) {
		Session session = getSession().getSessionFactory().getCurrentSession();
		String hql = "delete UserRole user_role where userId in(:id)";
		for(String id:ids){
			int query = session.createQuery(hql).setString("id", id).executeUpdate();
		}
		System.out.println("UserRole删除成功");
		return null;
	}
	@Override
	public String addUserRole(Integer userId) {
		Session session = getSession().getSessionFactory().getCurrentSession();
		String sql = "insert into user_role(user_id,role_id) values("+userId+",2);";
		SQLQuery query = session.createSQLQuery(sql);
		query.executeUpdate();
		System.out.println("增加角色成功");
		return null;
	}
	@Override
	public String modifyUserRole(Integer uid,Integer rid) {
		Session session = getSession().getSessionFactory().getCurrentSession();
		String hql = "update UserRole user_role set user_role.roleId="+rid+" where user_role.userId="+uid;
		Query query = session.createQuery(hql);
		int i = query.executeUpdate();
		if(i>0)
			return "ok";
		return "error";
	}
	@Override
	public String UserRoleAdd(Integer userId, Integer roleId) {
		Session session = getSessionFactory().getCurrentSession();
		StringBuffer sb = new StringBuffer();
		sb.append("insert into user_role(user_id,role_id) ");
		sb.append("values("+userId+","+roleId+");");
		String sql = sb.toString();;
		SQLQuery query = session.createSQLQuery(sql);
		query.executeUpdate();
		return null;
	}
	@Override
	public String roleDel(Integer id) {
		Session session = getSessionFactory().getCurrentSession();
		String hql = "delete from UserRole ur where ur.userId="+id;
		int i = session.createQuery(hql).executeUpdate();
		if(i>0)
			return "ok";
		return "error";
	}
	@Override
	public List<UserRole> getRoleIdCount() {
		Session session = getSessionFactory().getCurrentSession();
		String hql = "select count(*) as IdCount from UserRole user_role group by user_role.roleId";
		List query = session.createQuery(hql).list();
		return query;
	}



	
}
