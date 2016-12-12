package com.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.bean.Permission;
import com.dao.IPerDao;
import com.dao.base.BaseDaoImpl;
@Repository
public class PerDaoImpl extends BaseDaoImpl<Permission,Integer> implements IPerDao{
	@Override
	public List<Permission> getListPer(){
		return super.getListByHQL("from Permission permission");
	}

	@Override
	public Integer getPidByName(String pmsName) {
		Session session = getSession().getSessionFactory().getCurrentSession();
		String hql = "select permission.pmsId from Permission permission where permission.pmsName='"+pmsName+"'";
		List query = session.createQuery(hql).list();
		return (Integer) query.get(0);
	}


	
}
