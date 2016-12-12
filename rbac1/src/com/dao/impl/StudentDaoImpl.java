package com.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bean.Book;
import com.bean.Students;
import com.dao.IBookDao;
import com.dao.IStudentDao;
import com.dao.base.BaseDaoImpl;
@Repository
public class StudentDaoImpl extends BaseDaoImpl<Students,Integer> implements IStudentDao{

	@Override
	public List<Students> getlist() {
		// TODO Auto-generated method stub
		return super.getListByHQL("from Students");
	}

	@Override
	public Students getradom() {
		// TODO Auto-generated method stub
		return super.getBySQL("select * from Students order by rand() limit 1");
	}

}
