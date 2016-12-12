package com.bean;

public class UserVoRole {
	
	private Integer userId;
	private String userName;
	private String userPwd;
	private String userInfo;
	private Integer roleId;
	private String roleName;
	
	
	
	public UserVoRole(){
		
	}
public UserVoRole(String roleName) {
	super();
	this.roleName = roleName;
	}
public UserVoRole(Integer roleId) {
	super();
	this.roleId = roleId;
	}


	public UserVoRole(Integer userId, String userName, String userPwd,
			String userInfo, Integer roleId, String roleName) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.userInfo = userInfo;
		this.roleId = roleId;
		this.roleName = roleName;
		
	}




	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserInfo() {
		return userInfo;
	}
	public void setUserInfo(String userInfo) {
		this.userInfo = userInfo;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

}
