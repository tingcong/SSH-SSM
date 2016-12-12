package com.dao.impl;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.bean.Permission;
import com.bean.RolePermission;
import com.dao.IRpDao;
import com.dao.base.BaseDaoImpl;
@Repository
public class RpDaoImpl extends BaseDaoImpl<RolePermission,Integer> implements IRpDao{

	@Override
	public String pmsDel(Integer roleId, Integer pmsId) {
		Session session = getSession().getSessionFactory().getCurrentSession();
		String hql = "delete from RolePermission role_permission where role_permission.roleId="+roleId+" and role_permission.pmsId="+pmsId;
		int i = session.createQuery(hql).executeUpdate();
		if(i>0)
		return "ok";
		return "error";
	}

	@Override
	public String pmsAdd(Integer roleId, Integer pmsId) {
		Session session = getSession().getSessionFactory().getCurrentSession();
		String sql = "insert into role_permission(role_id,pms_id) values("+roleId+","+pmsId+");";
		SQLQuery query = session.createSQLQuery(sql);
		query.executeUpdate();
		return null;
	}

	@Override
	public String pmsExist(Integer roleId, Integer pmsId) {
		Session session = getSession().getSessionFactory().getCurrentSession();
		String hql = "from RolePermission where roleId="+roleId+" and pmsId="+pmsId;
		
		try{
			List query = session.createQuery(hql).list();
			if(!query.get(0).equals("")){
				String str = (query.get(0)).toString();
				System.out.println("存在");
			}
			return "exist";
				
		}catch(Exception e){
			return "ok";
		}
		
	}

	@Override
	public String pmsDel(String[] ids) {
		Session session = getSessionFactory().getCurrentSession();
		String hql = "delete RolePermission where roleId in(:id)";
		for (String id : ids) {
			@SuppressWarnings("unused")
			int query = session.createQuery(hql).setString("id", id)
					.executeUpdate();
		}
		return "ok";
	}
	
	@Override
	public List<RolePermission> getPmsId(Integer roleId) {
		Session session = getSessionFactory().getCurrentSession();
		String hql = "select pmsId from RolePermission where roleId="+roleId;
		List query = session.createQuery(hql).list();
		return query;
	}
	
	
}
