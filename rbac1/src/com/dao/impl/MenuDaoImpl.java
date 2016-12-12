package com.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.bean.Menu;
import com.dao.IMenuDao;
import com.dao.base.BaseDaoImpl;
@Repository
public class MenuDaoImpl extends BaseDaoImpl<Menu,Integer> implements IMenuDao{
	@Override
	public List<Menu> getListMenu(){
		return super.getListByHQL("from Menu");
	}

	@Override
	public List<Menu> getListMenuByPms(String ids) {
		// TODO Auto-generated method stub
		//System.out.println("进入impl，ids："+ids[0]);
		return super.getListByHQL("from Menu where id in("+ids+")");
	}	
}
