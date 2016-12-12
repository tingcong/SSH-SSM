package com.dao;

import java.util.List;

import com.bean.Message;
import com.dao.base.IBaseDao;

public interface IMessageDao extends IBaseDao<Message,Integer>{
	
	public List<Message> getListMessage();
	
	public List<Message> getListMessage(Integer userId);
	
	public String send(Integer userId,String tt,String ctt,String sender,Integer senderId);

}
