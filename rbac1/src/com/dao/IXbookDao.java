package com.dao;

import java.util.List;

import com.bean.Xbook;
import com.dao.base.IBaseDao;

public interface IXbookDao extends IBaseDao<Xbook, Integer>{

		public List<Xbook> getlist(Integer id);
}
