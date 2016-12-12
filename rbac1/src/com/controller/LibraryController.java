package com.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bean.Bbk;
import com.bean.Book;
import com.bean.Menu;
import com.bean.Message;
import com.bean.Permission;
import com.bean.Role;
import com.bean.RolePermission;
import com.bean.RoleVoPms;
import com.bean.User;
import com.bean.UserRole;
import com.bean.UserVoRole;
import com.bean.Notice;
import com.bean.Xbook;
import com.service.LibraryService;
import com.util.EmailUtil;
import com.util.StrUtil;

@Controller
@RequestMapping("/home")
public class LibraryController extends BaseController {
	@Autowired
	private LibraryService libraryService;
	
	@RequestMapping("/menu")
	public String menu() {
		System.out.println("进入menu........");
		return "/menu";
	}
	@RequestMapping("/getmenu")
	public void getmenu(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		List<Menu> listm = libraryService.getListMenu();
		super.printJSON(listm, req, rsp);
	}
	@RequestMapping("/getMenuByPms")
	public void getMenuByPms(String ids,HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		List<Menu> listm = libraryService.getListMenuByPms(ids);
		System.out.println("进入getMenuByPms，"+ids);
		super.printJSON(listm, req, rsp);
	}


	@RequestMapping("/test")
	public void test(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		System.out.println("进入test........");
		List<User> listUser = libraryService.getListUser();
		// JSONArray arr = JSONArray.fromObject(listUser);
		super.printJSON(listUser, req, rsp);
	}
	

	@RequestMapping("/user")
	public String showUser() {
		System.out.println("进入user........");
		return "/user_admin";
	}
	@RequestMapping("/js")
	public void jieshu(Integer id, String name, HttpServletRequest req,
			HttpServletResponse rsp) throws IOException {
		if(name==null||"".equals(name)){
			super.print("error", req, rsp);
		}
		else{
		libraryService.jieshu(id, name);
		super.print("ok", req, rsp);
		}
	}

	
	@RequestMapping("/hs")
	public void huanshu(Integer ordNum,HttpServletRequest req,
			HttpServletResponse rsp) throws IOException {
		libraryService.huanshu(ordNum);
		super.print("okok", req, rsp);
	}
	// 用户管理：增加
	@RequestMapping("/userAdd")
	@ResponseBody
	// 返回字符串
	public String userAdd(Integer userId, String userName, String userPwd,
			String userInfo, Integer roleId) {
		String biz = "checkName";
		String c = libraryService.checkId(userId);
		if (check(userName, biz) == "no")
			return "no";
		if (c == "no")

			return "IdExist";
		System.out.println(userId + "..." + userName);
		System.out.println("userAdd........");
		// UserVoRole res = JSONObject.toJavaObject(result, UserVoRole.class);
		libraryService.userAdd(userId, userName, userPwd, userInfo);
		libraryService.UserRoleAdd(userId, roleId);
		System.out.println("可以了");
		return "ok";
	}

	@RequestMapping("/bookAdd")
	@ResponseBody
	// 返回字符串
	public String bookAdd(Integer id, String name, String number,
			Integer total, Integer amount,double price,Date pdate) {
		String biz = "checkName";
		String c = libraryService.checkbid(id);
		if (check(name, biz) == "no")
			return "no";
		if (c == "no")

			return "IdExist";
		// UserVoRole res = JSONObject.toJavaObject(result, UserVoRole.class);
		libraryService.addbook(id, name, number, total, amount, price);
		return "ok";
	}
	// 用户删除
	@RequestMapping("/delUser")
	@ResponseBody
	// 返回字符串
	public String delUser(String ids) {
		System.out.println("delUser........");
		libraryService.delUser(ids.split(","));// split把ids字符串分割成字符串数组
		libraryService.delUserRole(ids.split(","));
		System.out.println("可以了");
		return "ok";

	}
	
	@RequestMapping("/delbooks")
	@ResponseBody
	// 返回字符串
	public String delbooks(String ids) {
		libraryService.delbooks(ids.split(","));
		return "ok";

	}
	@RequestMapping("/book1")
	public String showB(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		
		return "/bookadmin1";
	}
	@RequestMapping("/getRole")
	public void getRole(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		System.out.println("进入getRole........");
		List<Role> listRole = libraryService.getListRole();
		super.printJSON(listRole, req, rsp);
	}

	@RequestMapping("/urDel")
	public void urDel(Integer userId, HttpServletRequest req,
			HttpServletResponse rsp) throws IOException {
		System.out.println("进入urDel........");
		System.out.println("userId:" + userId);
		String u = libraryService.userDel(userId);
		String r = libraryService.roleDel(userId);
		if (u == "ok" && r == "ok")
			super.print("ok", req, rsp);
		else
			super.print("error", req, rsp);
	}
	//密码修改
	@RequestMapping("/xiu")
	public void save(String userName,String userPwd,HttpServletRequest req, HttpServletResponse rsp) throws IOException{
		libraryService.save(userName, userPwd);
		
		super.print("xgcg", req, rsp);
		
	}

	@RequestMapping("/testSelect")
	@ResponseBody
	public String testSelect(Integer userId, String userName, String userPwd,
			String userInfo, Integer roleId, String roleName, String field,
			HttpServletRequest req, HttpServletResponse rsp) {
		System.out.println("进入testSelect....." + field);
		if (field.equals("roleId")) {
			return libraryService.modifyUserRole(userId, roleId);
		}
		if (field.equals("userInfo")) {
			return libraryService.infoModify(userId, userInfo);
		}
		return null;

	}
	
	
	@RequestMapping("/testSelect1")
	@ResponseBody
	public String testSelect1(Integer id, String name, String number,
			Integer total, Integer amount,double price, String field,
			HttpServletRequest req, HttpServletResponse rsp) {
		System.out.println("进入testSelect....." + field);
		if (field.equals("total")) {
			return libraryService.totalModify(id, total);
		}
		if (field.equals("price")) {
			return libraryService.priceModify(id, price);
		}
		return null;

	}

	@RequestMapping("/getur")
	public void getur(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		System.out.println("进入getur........");
		List<UserVoRole> listur = libraryService.getListUserVoRole();
		super.printJSON(listur, req, rsp);
	}

	@RequestMapping("/uf")
	public String uf(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		return "/userform";
	}

	@RequestMapping("/book")
	public String showBook(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		System.out.println("进入book......");
		return "/book_admin";
	}
	
	@RequestMapping("/books")
	public String showmBook(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		System.out.println("进入book......");
		return "/books";
	}

	@RequestMapping("/bbklist")
	public String bbklist(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		System.out.println("进入bblist......");
		List<Bbk> listBbk = libraryService.getListBbk();
		super.printJSON(listBbk, req, rsp);
		return null;
	}

	@RequestMapping("/blist")
	public String blist(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		System.out.println("进入blist......");
		List<Book> listBook = libraryService.getListBook();
		super.printJSON(listBook, req, rsp);
		return null;
	}
	
	@RequestMapping("/bblist")
	public String bblist(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		System.out.println("进入booklist......");
		List<Book> listBook = libraryService.getListBook();
		super.printJSON(listBook, req, rsp);
		return null;
	}

	@RequestMapping("/info")
	public String showBook() {
		System.out.println("进入info.....");
		return "/info";
	}

	// 注册
	@RequestMapping("/reg")
	public String reg() {
		System.out.println("进入reg.....");
		return "/reg";
	}

	// 登录
	@RequestMapping("/login")
	public void login(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		System.out.println("进入login.....");
		String userName = req.getParameter("userName").trim();
		String pwd = req.getParameter("pwd").trim();
		HttpSession session=req.getSession();
		/*User user=new User(userName, pwd);
				String currentUser=libraryService.login(userName, pwd);
				session.setAttribute("currentUser", currentUser);*/

		String key = libraryService.login(userName, pwd);
		System.out.println(userName+pwd);
		System.out.println("key=" + key);
		if (key == "ok")
			super.print(userName, req, rsp);
		else
			super.print(key, req, rsp);

	}

	@RequestMapping("/main")
	public String showHome() {
		System.out.println("进入main.....");
		return "/main";
	}

	// 注册，验证用户名是否存在，密码格式是否正确
	@RequestMapping("/check")
	@ResponseBody
	public String check(String userName, String biz) {
		if (biz.equals("checkName")) {
			String words = libraryService.checkName(userName.trim());
			return words;
			// super.printJSON(words, req, rsp);//有双引号
		}
		return null;
	}

	// 用户修改
	@RequestMapping("/userModify")
	public void userModify(int id, HttpServletRequest req,
			HttpServletResponse rsp) throws IOException {
		String userName = req.getParameter("userName").trim();
		String pwd = req.getParameter("pwd").trim();
		String words = libraryService.checkName(userName);
		super.print(words, req, rsp);
		// super.printJSON(words, req, rsp);//有双引号

	}

	// main页面显示用户
	@RequestMapping("/showName")
	public void saveName(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		String userName = req.getParameter("userName").trim();
		req.getSession().setAttribute("userName", userName);

	}

	// 用户注册
	@RequestMapping("/userReg")
	public String userReg(String userName, String pwd, HttpServletRequest req,
			HttpServletResponse rsp) {
		System.out.println("进入reg.....");
		req.getSession().setAttribute("userName", userName);
		req.getSession().setAttribute("pwd", pwd);
		libraryService.addUser(userName, pwd);
		Integer id = libraryService.getUserIdByName(userName);
		libraryService.addUserRole(id);
		return null;
	}

	@RequestMapping("/pms")
	public String pms(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		System.out.println("进入book......");
		return "/per_admin";
	}

	@RequestMapping("/getPms")
	public void getPms(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		List<Permission> listPms = libraryService.getListPer();
		System.out.println("进入getPms");
		super.printJSON(listPms, req, rsp);

	}

	// 权限列表
	@RequestMapping("/getRp")
	public void getPer(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		List<RoleVoPms> listRp = libraryService.getListRoleVoPms();
		super.printJSON(listRp, req, rsp);

	}

	@RequestMapping("/getPmsName")
	public void getPmsName(Integer roleId, HttpServletRequest req,
			HttpServletResponse rsp) throws IOException {
		List<RoleVoPms> listPName = libraryService.getPmsName(roleId);
		System.out.println("进入getPmsName");
		super.printJSON(listPName, req, rsp);
	}

	// 权限删除
	@RequestMapping("/pmsDel")
	public void pmsDel(Integer roleId, String pmsName, HttpServletRequest req,
			HttpServletResponse rsp) throws IOException {
		Integer pmsId = libraryService.getPidByName(pmsName);
		libraryService.pmsDel(roleId, pmsId);
		System.out.println("pms删除成功...");
		super.print("ok", req, rsp);
	}

	// 角色权限增加
	@RequestMapping("/pmsAdd")
	@ResponseBody
	public String pmsAdd(Integer roleId, Integer pmsId, HttpServletRequest req,
			HttpServletResponse rsp) throws IOException {
		// Integer pmsId = libraryService.getPidByName(pmsName);
		String str = libraryService.pmsExist(roleId, pmsId);
		if (str.equals("exist"))
			return "exist";
		else {
			libraryService.pmsAdd(roleId, pmsId);
			System.out.println("pms增加成功...");
			return "ok";
		}
	}

	// 公告ntmodify
	@RequestMapping("/notice")
	public String Notice(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		System.out.println("notice...");
		return "/notice";
	}

	@RequestMapping("/ctt")
	public String ntmodify(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		System.out.println("ntmodify...");
		return "/ntmodify";
	}

	// 公告
	@RequestMapping("/getNotice")
	public void getNotice(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException {
		List<Notice> listNt = libraryService.getListNotice();
		/*
		 * for(Notice lctt:listNt){ String ctt = lctt.getContent(); String
		 * ctt_txt = StrUtil.Html2Text(ctt).trim(); lctt.setContent(ctt_txt); }
		 */
		System.out.println("进入getNotice...");
		super.printJSON(listNt, req, rsp);
	}

	// 公告内容
	@RequestMapping("/modifyNt")
	public void getCtt(Integer id, String tt, String ctt,
			HttpServletRequest req, HttpServletResponse rsp) throws IOException {
		libraryService.modifyNt(id, tt, ctt);
		super.print("ok", req, rsp);
	}

	// 发布
	@RequestMapping("/ntAdd")
	public void ntAdd(String tt, String ctt, String publisher,
			HttpServletRequest req, HttpServletResponse rsp) throws IOException {
		System.out.println("ntAdd");
		libraryService.ntAdd(tt, ctt, publisher);
		super.print("ok", req, rsp);
	}

	// 通过id得到notice数组
	@RequestMapping("/oneNt")
	public void oneNt(Integer id, HttpServletRequest req,
			HttpServletResponse rsp) throws IOException {
		List<Notice> listNt = libraryService.getNtById(id);
		super.printJSON(listNt, req, rsp);
	}
	@RequestMapping("/ana")
	public String ana() {

		return "/ana";
	}
	// role分类数量
		@RequestMapping("/roleNumber")
		public void roleNumber(Integer id, HttpServletRequest req,
				HttpServletResponse rsp) throws IOException {
			List<UserVoRole> listRn = libraryService.getRoleNumber();
			super.printJSON(listRn, req, rsp);
		}
		
		@RequestMapping("/IdCount")
		public void IdCount(HttpServletRequest req,
				HttpServletResponse rsp) throws IOException {
			List<UserRole> listIc = libraryService.getRoleIdCount();
			super.printJSON(listIc, req, rsp);
		}
		@RequestMapping("/getBookGenre")
		public void getBookGenre(HttpServletRequest req,
				HttpServletResponse rsp) throws IOException {
			List<Book> listBg = libraryService.getBookGenre();
			//System.out.println(listBg.toString());
			super.printJSON(listBg, req, rsp);
		}
		@RequestMapping("/getGenreCount")
		public void getGenreCount(HttpServletRequest req,
				HttpServletResponse rsp) throws IOException {
			List<Book> listBg = libraryService.getGenreCount();
			//System.out.println(listBg.toString());
			super.printJSON(listBg, req, rsp);
		}
		@RequestMapping("/nt")
		public String nt() {

			return "/nt";
		}

		
		@RequestMapping("/getRoleName")
		public void getRoleName(String userName,HttpServletRequest req,
				HttpServletResponse rsp) throws IOException {
			List<UserVoRole> listRn = libraryService.getRoleName(userName);
			//System.out.println(listBg.toString());
			if(listRn==null)
				super.printJSON("no", req, rsp);
			else
			super.printJSON(listRn, req, rsp);

		}
		//@RequestMapping("/getRoleId")
		public Integer getRoleId(String userName){
			List<UserVoRole> listRi = libraryService.getRoleId(userName);
			return listRi.get(0).getRoleId();
		}
		@RequestMapping("/getPmsId")
		public void getPmsId(String userName,HttpServletRequest req,
				HttpServletResponse rsp) throws IOException {
			List<RolePermission> listRi = libraryService.getPmsId(getRoleId(userName));
			//System.out.println(listBg.toString());
			if(listRi==null)
				super.printJSON("no", req, rsp);
			else
			super.printJSON(listRi, req, rsp);

		}
		
		@RequestMapping("/roleAdd")
		@ResponseBody
		public String roleAdd(String roleName,String roleInfo,HttpServletRequest req,
				HttpServletResponse rsp) throws IOException {
			if(libraryService.checkRoleName(roleName)==true){
				libraryService.roleAdd(roleName, roleInfo);
				System.out.println("Role增加成功");
				return "ok";
			}
				return "no";
		}
		
		@RequestMapping("/roleDel")
		@ResponseBody
		public String roleDel(String[] ids,HttpServletRequest req,
				HttpServletResponse rsp) throws IOException {
			libraryService.roleDel(ids);
			return libraryService.pmsDel(ids);
		}
		
		
		@RequestMapping("/quest")
		public String quest(HttpServletRequest req,
				HttpServletResponse rsp) throws IOException {
			return "/quest";
		}
		
		@RequestMapping("/msg")
		public String msg(HttpServletRequest req,
				HttpServletResponse rsp) throws IOException {
			return "/msg";
		}
		
		@RequestMapping("/getMsg")
		public void getMsg(String userName,HttpServletRequest req,
				HttpServletResponse rsp) throws IOException {
			Integer userId = getUserIdByName(userName);
			List<Message> listMsg = libraryService.getListMessage(userId);
			super.printJSON(listMsg, req, rsp);
		}
		
		public Integer getUserIdByName(String userName){
			Integer id = libraryService.getUserIdByName(userName);
			return id;
		}
		
		@RequestMapping("/send")
		public void send(String userName,String tt,String ctt,String sender,HttpServletRequest req,
				HttpServletResponse rsp) throws IOException {
			Integer userId = getUserIdByName(userName);
			Integer sendId = getUserIdByName(sender);
			libraryService.send(userId, tt, ctt, sender, sendId);
			super.print("ok", req, rsp);
		}
		@RequestMapping("/xiangqing")
		public void getxiangqing(Integer id,HttpServletRequest req, HttpServletResponse rsp)
				throws IOException {
			System.out.println(id);
			List<Xbook> list = libraryService.getlist(id);
			super.printJSON(list, req, rsp);
		}
		@RequestMapping("/sendemail")
		public String send(HttpServletRequest req,
				HttpServletResponse rsp) {
			System.out.println("send");
			return "/email";
		}
		@RequestMapping("/random")
		public void send1(HttpServletRequest req,
				HttpServletResponse rsp) {
			System.out.println("send");
		}
		@RequestMapping("/email")
		public @ResponseBody String email(String youxiang,String biaoti,String neirong){
			System.out.println("email");
			String str=" /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/ ";
			Pattern pattern = Pattern.compile("^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$");
			Matcher matcher = pattern.matcher(youxiang);
			if(matcher.matches()==false){
				return "3";
			}
			try {
				System.out.println(neirong);
				EmailUtil.send(youxiang,biaoti,neirong,null,null);
				System.out.println("邮件发送成功！");
				return "1";
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("邮件发送失败！");
				return "0";
			}
		}

}
