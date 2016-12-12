package com.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * User entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "user", catalog = "rbac")
public class User implements java.io.Serializable {

	// Fields

	private Integer userId;
	private String userName;
	private String userPwd;
	private String userInfo;
	//private String userMenu;

	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String userName, String userPwd) {
		this.userName = userName;
		this.userPwd = userPwd;
	}

	/** full constructor */
	public User(String userName, String userPwd, String userInfo,
			String userMenu) {
		this.userName = userName;
		this.userPwd = userPwd;
		this.userInfo = userInfo;
		//this.userMenu = userMenu;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "user_id", unique = true, nullable = false)
	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	@Column(name = "user_name", nullable = false)
	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Column(name = "user_pwd", nullable = false)
	public String getUserPwd() {
		return this.userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	@Column(name = "user_info")
	public String getUserInfo() {
		return this.userInfo;
	}

	public void setUserInfo(String userInfo) {
		this.userInfo = userInfo;
	}

	/*@Column(name = "user_menu", length = 100)
	public String getUserMenu() {
		return this.userMenu;
	}

	public void setUserMenu(String userMenu) {
		this.userMenu = userMenu;
	}*/

}