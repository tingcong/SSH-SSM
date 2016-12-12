package com.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bean.Bbk;
import com.dao.IBbkDao;
import com.dao.base.BaseDaoImpl;
@Repository
public class BbkDaoImpl extends BaseDaoImpl<Bbk,Integer> implements IBbkDao{
	@Override
	public List<Bbk> getListBbk(){
		return super.getListByHQL("from Bbk bbk");
	}
}
