package com.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bean.Xbook;
import com.dao.IXbookDao;
import com.dao.base.BaseDaoImpl;
@Repository
public class XbookDaoImpl extends BaseDaoImpl<Xbook, Integer> implements IXbookDao{

	@Override
	public List<Xbook> getlist(Integer id) {
		// TODO Auto-generated method stub
		return super.getListByHQL("from Xbook where bid="+id);
	}

}
