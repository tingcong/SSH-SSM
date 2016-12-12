package com.dao;

import java.util.List;

import com.bean.User;
import com.dao.base.IBaseDao;

public interface IUserDao extends IBaseDao<User,Integer>{
	public List<User> getListUser();
	public List<User> getUser(String name);
	public List<User> addUser(String name,String pwd);//增加用户:注册
	public Integer getUserIdByName(String name);//根据name获得用户ID
	public String delUser(String[] ids);//用户批量删除
	public String userDel(Integer id);//单个用户删除
	public String checkName(String name);//注册用户名检查
	public List<User> checkPwd(String pwd);//注册密码检查
	public String login(String name,String pwd);//登录验证
	//用户增加：管理
	public String userAdd(Integer userId,String userName,String userPwd,String userInfo);
	public String checkId(Integer id);
	//用户信息修改
	public String infoModify(Integer id,String userInfo);
	public String save(String userName,String userPwd);
}
