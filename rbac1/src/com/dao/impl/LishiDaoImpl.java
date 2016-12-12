package com.dao.impl;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.bean.Lishi;
import com.dao.ILishiDao;
import com.dao.base.BaseDaoImpl;
@Repository
public class LishiDaoImpl extends BaseDaoImpl<Lishi,Integer> implements ILishiDao{

	@Override
	public String add(Integer id, Integer sid, String sname) {
		// TODO Auto-generated method stub
		Session session = getSessionFactory().getCurrentSession();
		StringBuffer sb = new StringBuffer();
		sb.append("insert into lishi values(NULL," + sid + ",'" + sname + "');");
		String sql = sb.toString();
		SQLQuery query = session.createSQLQuery(sql);
		query.executeUpdate();
		return null;
	}

	@Override
	public List<Lishi> getlishi() {
		// TODO Auto-generated method stub
		return super.getListByHQL("from Lishi");
	}

	@Override
	public List gettongji() {
		System.out.println("test");
		List list = super.getListBySQL("select id,sid,sname,count(sid) from lishi group by sid ");
		/*Session session = getSessionFactory().getCurrentSession();
		String sql = "select id,sid,sname,count(sid) from lishi group by sid";
		List query = session.createQuery(sql).list();
		return query;*/
		return list;
	}

}
