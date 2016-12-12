package com.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bean.Bbk;
import com.bean.Book;
import com.bean.Lishi;
import com.bean.Menu;
import com.bean.Message;
import com.bean.Notice;
import com.bean.Permission;
import com.bean.Role;
import com.bean.RolePermission;
import com.bean.RoleVoPms;
import com.bean.Students;
import com.bean.User;
import com.bean.UserRole;
import com.bean.UserVoRole;
import com.bean.Xbook;
import com.dao.IBbkDao;
import com.dao.IBookDao;
import com.dao.ILishiDao;
import com.dao.IMenuDao;
import com.dao.IMessageDao;
import com.dao.INoticeDao;
import com.dao.IPerDao;
import com.dao.IRoleDao;
import com.dao.IRoleVoPmsDao;
import com.dao.IRpDao;
import com.dao.IStudentDao;
import com.dao.IUserDao;
import com.dao.IUserRoleDao;
import com.dao.IUserVoRoleDao;
import com.dao.IXbookDao;

@Transactional
@Service
public class LibraryService {

	@Autowired
	// 用户
	private IUserDao userDaoImpl;

	public List<User> getListUser() {
		return userDaoImpl.getListUser();
	}

	public List<User> getUser(String name) {
		return userDaoImpl.getUser(name);
	}

	public void addUser(User user) {

	}

	// 用户增加：注册
	public List<User> addUser(String userName, String pwd) {
		return userDaoImpl.addUser(userName, pwd);
	}

	// 用户增加：管理
	public String userAdd(Integer userId, String userName, String userPwd,
			String userInfo) {
		return userDaoImpl.userAdd(userId, userName, userPwd, userInfo);
	}
	//信息修改
	public String infoModify(Integer id,String userInfo){
		return userDaoImpl.infoModify(id, userInfo);
	}
	public String save(String userName,String userPwd){
		return userDaoImpl.save(userName, userPwd);
	}
	//检查id存在不
	public String checkId(Integer id){
		return userDaoImpl.checkId(id);
	}
	public String checkName(String name) {
		return userDaoImpl.checkName(name);

	}

	public String login(String name, String pwd) {
		return userDaoImpl.login(name, pwd);
	}

	// 用户批量删除
	public String delUser(String[] ids) {
		return userDaoImpl.delUser(ids);
	}
	//单个用户删除
	public String userDel(Integer id){
		return userDaoImpl.userDel(id);
	}

	// 获得用户IdByName
	public Integer getUserIdByName(String name) {
		return userDaoImpl.getUserIdByName(name);
	}

	@Autowired
	private IBookDao bookDaoImpl;

	public List<Book> getListBook() {
		return bookDaoImpl.getListBook();
	}
	
	public List<Book> getBookGenre() {
		return bookDaoImpl.getBookGenre();
	}
	public List<Book> getGenreCount() {
		return bookDaoImpl.getGenreCount();
	}
	public String jieshu(Integer id,String name){
		return bookDaoImpl.jieshu(id, name);
	}
	public String huanshu(Integer ordNum){
		return bookDaoImpl.huanshu(ordNum);
	}
	
	@Autowired
	private IBbkDao bbkDaoImpl;
	public List<Bbk> getListBbk(){
		return bbkDaoImpl.getListBbk();
	}
	@Autowired
	// 角色
	private IRoleDao roleDaoImpl;

	public List<Role> getListRole() {
		return roleDaoImpl.getListRole();
	}
	public String getRoleName(Integer RoleId) {
		return roleDaoImpl.getRoleName(RoleId);
	}
	public List<Role> roleAdd(String roleName, String roleInfo) {
		return roleDaoImpl.roleAdd(roleName, roleInfo);
	}
	public boolean checkRoleName(String roleName) {
		return roleDaoImpl.checkRoleName(roleName);
	}
	public String roleDel(String[] ids) {
		return roleDaoImpl.roleDel(ids);
	}
	
	
	
	public String totalModify(Integer id,Integer total){
		return bookDaoImpl.totalModify(id, total);
	}
	public String priceModify(Integer id,double price){
		return bookDaoImpl.priceModify(id, price);
	}
	public String addbook(Integer id, String name, String number,
			Integer total, Integer amount, double price){
		return bookDaoImpl.addbook(id, name, number, total, amount, price);
	}
	public String checkbid(Integer id){
		return bookDaoImpl.checkbid(id);
	}
	// 图书批量删除
		public String delbooks(String[] ids) {
			return bookDaoImpl.delbooks(ids);
		}
	@Autowired
	// user_role
	private IUserRoleDao userRoleDaoImpl;

	// 角色批量删除
	public String delUserRole(String[] ids) {
		return userRoleDaoImpl.delUserRole(ids);
	}
	//角色单个删除
	public String roleDel(Integer id) {
		return userRoleDaoImpl.roleDel(id);
	}

	// 角色增加
	public String addUserRole(Integer userId) {
		return userRoleDaoImpl.addUserRole(userId);
	}

	// 角色修改
	public String modifyUserRole(Integer uid, Integer rid) {
		return userRoleDaoImpl.modifyUserRole(uid, rid);
	}
	
	//用户管理：角色增加
	public String UserRoleAdd(Integer userId, Integer roleId) {
		return userRoleDaoImpl.UserRoleAdd(userId, roleId);
	}
	public List<UserRole> getRoleIdCount() {
		return userRoleDaoImpl.getRoleIdCount();
	}
	
	@Autowired
	// user、role属性映射类
	private IUserVoRoleDao userVoRoleImpl;

	public List<UserVoRole> getListUserVoRole() {
		return userVoRoleImpl.getListUserVoRole();
	}
	public List<UserVoRole> getRoleNumber() {
		return userVoRoleImpl.getRoleNumber();
	}
	public List<UserVoRole> getRoleName(String userName) {
		return userVoRoleImpl.getRoleName(userName);
	}
	public List<UserVoRole> getRoleId(String userName) {
		return userVoRoleImpl.getRoleId(userName);
	}

	//permisson
	@Autowired
	private IPerDao perDaoImpl;
	public List<Permission> getListPer(){
		return perDaoImpl.getListPer();
	}
	public Integer getPidByName(String pmsName) {
		return perDaoImpl.getPidByName(pmsName);
	}

	//Rp
	@Autowired
	private IRpDao rpDaoImpl;
	public String pmsDel(Integer roleId, Integer pmsId) {
		return rpDaoImpl.pmsDel(roleId, pmsId);
	}
	public String pmsAdd(Integer roleId, Integer pmsId){
		return rpDaoImpl.pmsAdd(roleId, pmsId);
	}
	public String pmsExist(Integer roleId, Integer pmsId) {
		return rpDaoImpl.pmsExist(roleId, pmsId);
	}
	public String pmsDel(String[] ids) {
		return rpDaoImpl.pmsDel(ids);
	}
	public List<RolePermission> getPmsId(Integer roleId) {
		return rpDaoImpl.getPmsId(roleId);
	}
	//RoleVoPms
	@Autowired
	private IRoleVoPmsDao roleVoPmsDaoImpl;
	public List<RoleVoPms> getListRoleVoPms(){
		return roleVoPmsDaoImpl.getListRoleVoPms();
	}
	public List<RoleVoPms> getPmsName(Integer roleId) {
		return roleVoPmsDaoImpl.getPmsName(roleId);
	}
	//Notice
	@Autowired
	private INoticeDao noticeDaoImpl;
	public List<Notice> getListNotice(){
		return noticeDaoImpl.getListNotice();
	}
	//通过id得到notice数组
	public List<Notice> getNtById(Integer id){
		return noticeDaoImpl.getNtById(id);
	}
	//修改公告
	public String modifyNt(Integer id, String tt, String ctt) {
		return noticeDaoImpl.modifyNt(id, tt, ctt);
	}
	//增加
	public String ntAdd(String tt, String ctt,String publisher) {
		return noticeDaoImpl.ntAdd(tt, ctt,publisher);
	}
	
	@Autowired
	private IMenuDao menuDaoImpl;
	public List<Menu> getListMenu(){
		return menuDaoImpl.getListMenu();
	}
	public List<Menu> getListMenuByPms(String ids) {
		return menuDaoImpl.getListMenuByPms(ids);
	}
	@Autowired
	private IMessageDao messageDaoImpl;
	public List<Message> getListMessage() {
		return messageDaoImpl.getListMessage();
	}
	public List<Message> getListMessage(Integer userId) {
		return messageDaoImpl.getListMessage(userId);
	}
	public String send(Integer userId,String tt,String ctt,String sender,Integer senderId) {
		return messageDaoImpl.send(userId, tt, ctt, sender, senderId);
	}
	@Autowired
	private ILishiDao ilishiDaoImpl;
	public String add(Integer id,Integer sid,String sname){
		return ilishiDaoImpl.add(id, sid, sname);
		
	}
	public List<Lishi> getlishi(){
		return ilishiDaoImpl.getlishi();
	}
	public List gettongji(){
		return ilishiDaoImpl.gettongji();
	}
	@Autowired
	private IXbookDao ixbookDaoImpl;
	public List<Xbook> getlist(Integer id){
		return ixbookDaoImpl.getlist(id);
	}
	@Autowired
	private IStudentDao istudentDaoImpl;
	public List<Students> getlist(){
		return istudentDaoImpl.getlist();
	}
	public Students getradom(){
		return istudentDaoImpl.getradom();
	}

}
