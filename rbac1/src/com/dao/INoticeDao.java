package com.dao;

import java.sql.Timestamp;
import java.util.List;

import com.bean.Notice;
import com.dao.base.IBaseDao;

public interface INoticeDao extends IBaseDao<Notice,Integer>{
	public List<Notice> getListNotice();
	//通过id得到notice数组
	public List<Notice> getNtById(Integer id);
	
	public String modifyNt(Integer id,String tt,String ctt);
	//新增
	public String ntAdd(String tt,String ctt,String publisher);
	
	
	


}
