package com.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.bean.User;
import com.dao.IUserDao;
import com.dao.base.BaseDaoImpl;

@Repository
public class UserDaoImpl extends BaseDaoImpl<User, Integer> implements IUserDao {
	@Override
	public List<User> getListUser() {
		return super.getListByHQL("from User user");

	}

	@SuppressWarnings("unchecked")
	public boolean login(String username) {
		// TODO Auto-generated method stub
		if (username == null) {
			username = "";
		}

		List<User> list = null;
		String hql = "select userName , password from TUser as user where user.userName='"
				+ username;

		try {
			Session session = getSessionFactory().getCurrentSession();
			Query query = session.createQuery(hql);
			System.out.println("@@@@@@@@@");
			list = query.list();

		} catch (DataAccessException e) {
			// TODO: handle exception
			return false;
		}

		if (list.isEmpty()) {
			return false;
		}
		return true;
	}

	@Override
	public List<User> getUser(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> addUser(String name, String pwd) {
		Session session = getSessionFactory().getCurrentSession();
		String sql = "insert into user(user_name,user_pwd) values('" + name
				+ "','" + pwd + "');";

		SQLQuery query = session.createSQLQuery(sql);

		query.executeUpdate(); // 1
		return null;

	}

	@Override
	public String checkName(String name) {
		Session session = getSessionFactory().getCurrentSession();
		String hql = "from User user where user.userName='" + name + "'";
		try {

			@SuppressWarnings("rawtypes")
			List query = session.createQuery(hql).list();
			if (!query.get(0).equals("")) {
				String str = (query.get(0)).toString();
				System.out.println(name + "。用户名存在！");
				System.out.println(str);
			}

			System.out.println("nonononoooooooonono");
			return "no";

		} catch (Exception e) {
			System.out.println("可用！");
			System.out.println("yessssssssssssss");
			return "yes";

		}

		// int c = query.executeUpdate();

	}

	@Override
	public String checkId(Integer id) {
		Session session = getSessionFactory().getCurrentSession();
		String hql = "from User user where user.userId=" + id;
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

	@Override
	public List<User> checkPwd(String pwd) {
		// TODO Auto-generated method stub

		return null;
	}

	@Override
	public String login(String name, String pwd) {
		// TODO Auto-generated method stub
		Session session = getSessionFactory().getCurrentSession();
		String hql = "from User user where user.userName='" + name
				+ "'and user.userPwd='" + pwd + "'";
		try {
			@SuppressWarnings("rawtypes")
			List query = session.createQuery(hql).list();
			System.out.println(name+pwd);
			query.get(0);
			System.out.println("ok");
			return "ok";
		} catch (Exception e) {
			System.out.println("error!");
			return "error";
		}
	}

	// 批量删除
	@Override
	public String delUser(String[] ids) {
		Session session = getSessionFactory().getCurrentSession();
		String hql = "delete User user where userId in(:id)";
		for (String id : ids) {
			@SuppressWarnings("unused")
			int query = session.createQuery(hql).setString("id", id)
					.executeUpdate();
		}
		System.out.println("ok!");
		return null;
	}

	// 获得用户ID
	@Override
	public Integer getUserIdByName(String name) {
		Session session = getSession().getSessionFactory().getCurrentSession();
		String hql = "select user.userId from User user where user.userName='"
				+ name + "'";
		@SuppressWarnings("rawtypes")
		List id = session.createQuery(hql).list();
		System.out.println((Integer) id.get(0));
		return (Integer) id.get(0);
	}

	// 用户管理：增加
	@Override
	public String userAdd(Integer userId, String userName, String userPwd,
			String userInfo) {
		Session session = getSessionFactory().getCurrentSession();
		StringBuffer sb = new StringBuffer();
		sb.append("insert into user(user_id,user_name,user_pwd,user_info) ");
		sb.append("values(" + userId + ",'" + userName + "','" + userPwd
				+ "','" + userInfo + "');");
		String sql = sb.toString();
		;
		SQLQuery query = session.createSQLQuery(sql);
		query.executeUpdate();
		return null;
	}
	@Override
	public String userDel(Integer id){
		Session session = getSessionFactory().getCurrentSession();
		String hql = "delete from User user where user.userId="+id;
		int i = session.createQuery(hql).executeUpdate();
		if(i>0)
			return "ok";
		return "error";
		
	}

	@Override
	public String infoModify(Integer id,String userInfo) {
		Session session = getSession().getSessionFactory().getCurrentSession();
		String hql = "update User user set user.userInfo= '"+userInfo+"' where user.userId="+id;
		int i = session.createQuery(hql).executeUpdate();
		if(i>0)
			return "ok";
		return "error";
	}
	@Override
	public String save(String userName,String userPwd) {
		// TODO Auto-generated method stub
		Session session = getSession().getSessionFactory().getCurrentSession();
		String hql = "update User user set user.userPwd='"+userPwd+"' where user.userName='"+userName+"'";
		int i = session.createQuery(hql).executeUpdate();
		if(i>0){
			return "xgcg";
			}
		return null;
	}
}
