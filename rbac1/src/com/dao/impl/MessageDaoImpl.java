package com.dao.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.bean.Message;
import com.bean.Permission;
import com.dao.IMessageDao;
import com.dao.IPerDao;
import com.dao.base.BaseDaoImpl;
@Repository
public class MessageDaoImpl extends BaseDaoImpl<Message,Integer> implements IMessageDao{

	@Override
	public List<Message> getListMessage() {
		// TODO Auto-generated method stub
		return super.getListByHQL("from Message");
	}

	@Override
	public List<Message> getListMessage(Integer userId) {
		return super.getListByHQL("from Message where userId="+userId);
	}

	@Override
	public String send(Integer userId,String tt,String ctt,String sender,Integer senderId) {
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = fm.format(new Date());
		Session session = getSessionFactory().getCurrentSession();
		String sql = "insert into message(user_id,tt,ctt,sender,time,sender_id) values("
				   +userId+",'"+tt+"','"+ctt+"','"+sender+"','"+date+"',"+senderId+");";
		int i = session.createSQLQuery(sql).executeUpdate();
		if(i>0)
			return "ok";
		return "error";
	}
	

	
}
