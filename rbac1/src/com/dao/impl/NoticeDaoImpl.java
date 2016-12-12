package com.dao.impl;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.bean.Notice;
import com.dao.INoticeDao;
import com.dao.base.BaseDaoImpl;
@Repository
public class NoticeDaoImpl extends BaseDaoImpl<Notice,Integer> implements INoticeDao{
	@Override
	public List<Notice> getListNotice(){
		return super.getListByHQL("from Notice");
	}
	
	//通过id得到notice数组
	@Override
	public List<Notice> getNtById(Integer id) {
		// TODO Auto-generated method stub
		return super.getListByHQL("from Notice where id="+id);
	}

	@Override
	public String modifyNt(Integer id, String tt, String ctt) {
		Session session = getSessionFactory().getCurrentSession();
		String hql = "update Notice set title='"+tt+"',content='"+ctt+"' where id="+id;
		int i = session.createQuery(hql).executeUpdate();
		if(i>0)
			return "ok";
		return "error";
	}
//新增
	@Override
	public String ntAdd(String tt, String ctt,String publisher) {
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = fm.format(new Date());

		Session session = getSessionFactory().getCurrentSession();
		String sql = "insert into notice(title,content,pubdate,publisher) values('"+tt+"','"+ctt+"','"+date+"','"+publisher+"');";
		SQLQuery query = session.createSQLQuery(sql);
		query.executeUpdate();
		return "ok";
	}

}
