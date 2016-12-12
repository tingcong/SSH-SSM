package com.dao;

import java.util.List;

import com.bean.Book;
import com.dao.base.IBaseDao;

public interface IBookDao extends IBaseDao<Book,Integer>{
	public List<Book> getListBook();
	
	public List<Book> getBookGenre();
	public List<Book> getGenreCount();
	public String jieshu(Integer id,String name);
	public String huanshu(Integer ordNum);

	public String totalModify(Integer id,Integer total);
	public String priceModify(Integer id,double price);
	public String delbooks(String[] ids);
	public String addbook(Integer id, String name, String number,
			Integer total, Integer amount,double price);
	public String checkbid(Integer id);


}
