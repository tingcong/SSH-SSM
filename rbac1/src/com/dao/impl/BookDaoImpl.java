package com.dao.impl;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.bean.Book;
import com.dao.IBookDao;
import com.dao.base.BaseDaoImpl;
@Repository
public class BookDaoImpl extends BaseDaoImpl<Book,Integer> implements IBookDao{
	@Override
	public List<Book> getListBook(){
		return super.getListByHQL("from Book book");
	}
	
	
	
	@Override
	public List<Book> getBookGenre() {
		Session session = getSessionFactory().getCurrentSession();
		String hql = "select count(*) from Book book group by book.genre";
		List query = session.createQuery(hql).list();
		return query;
	}
	@Override
	public List<Book> getGenreCount() {
		Session session = getSessionFactory().getCurrentSession();
		String hql = "select book.genre from Book book group by book.genre";
		List query = session.createQuery(hql).list();
		return query;
	}
	@Override
	public String jieshu(Integer id, String name) {
		// TODO Auto-generated method stub
		Session session = getSessionFactory().getCurrentSession();
		
		/*String hql = "update Book book set book.amount = " + (amount-1) + "where book.id =" + id;
		String hql = "insert into bbk values(NULL,'" + id + "','" + name + "',NULL);";*/
		StringBuffer sb = new StringBuffer();
		sb.append("insert into bbk values(NULL," + id + ",'" + name + "',NULL);");
		String sql = sb.toString();
		
		SQLQuery query = session.createSQLQuery(sql);
		query.executeUpdate();
		
		
		return null;
	}

	@Override
	public String huanshu(Integer ordNum){
		// TODO Auto-generated method stub
		Session session = getSessionFactory().getCurrentSession();
		String hql = "delete from bbk where ordNum = '" + ordNum + "'";
		SQLQuery query = session.createSQLQuery(hql.toString());
		query.executeUpdate();
		return null;
	}
	@Override
	public String totalModify(Integer id,Integer total) {
		Session session = getSession().getSessionFactory().getCurrentSession();
		System.out.println(id);
		System.out.println(total);
		String hql = "update Book book set book.total= '"+total+"' where book.id="+id;
		int i = session.createQuery(hql).executeUpdate();
		if(i>0)
			return "ok";
		return "error";
	}
	@Override
	public String delbooks(String[] ids) {
		
		Session session = getSessionFactory().getCurrentSession();
		String hql = "delete Book book where id in(:id)";
		for (String id : ids) {
			@SuppressWarnings("unused")
			int query = session.createQuery(hql).setString("id", id)
					.executeUpdate();
		}
		System.out.println("ok!");
		return null;
	}
	@Override
	public String priceModify(Integer id, double price) {
		// TODO Auto-generated method stub
		Session session = getSession().getSessionFactory().getCurrentSession();
		System.out.println(id);
		System.out.println(price);
		String hql = "update Book book set book.price= '"+price+"' where book.id="+id;
		int i = session.createQuery(hql).executeUpdate();
		if(i>0)
			return "ok";
		return "error";
	}
	@Override
	public String addbook(Integer id, String name, String number,
			Integer total, Integer amount, double price) {
		Session session = getSessionFactory().getCurrentSession();
		StringBuffer sb = new StringBuffer();
		sb.append("insert into book (id,name,number,total,amount,price) ");
		sb.append("values(" + id + ",'" + name + "','" + number
				+ "','" + total + "','" + amount + "','" + price + "');");
		String sql = sb.toString();
		;
		SQLQuery query = session.createSQLQuery(sql);
		query.executeUpdate();
		return null;
	}
	@Override
	public String checkbid(Integer id) {
		Session session = getSessionFactory().getCurrentSession();
		String hql = "from Book book where book.id=" + id;
		try {
			@SuppressWarnings("rawtypes")
			List query = session.createQuery(hql).list();
			if (!query.get(0).equals("")) {
				String str = (query.get(0)).toString();
				System.out.println(id + ",ID存在！");
				System.out.println(str);
			}
			System.out.println("Id存在！");
			return "no";
		} catch (Exception e) {
			System.out.println("可用！");
			System.out.println("yessssssssssssss");
			return "yes";
		}
	}
}

