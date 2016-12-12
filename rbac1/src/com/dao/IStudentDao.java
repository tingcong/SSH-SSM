package com.dao;
import java.util.List;

import com.bean.Students;
import com.dao.base.IBaseDao;

public interface IStudentDao extends IBaseDao<Students,Integer>{

	public List<Students> getlist();
	public Students getradom();
}
