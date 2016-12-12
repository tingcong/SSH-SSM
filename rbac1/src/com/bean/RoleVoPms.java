package com.bean;

public class RoleVoPms {
	
	private Integer roleId;
	private String roleName;
	private String roleInfo;
	private Integer pmsId;
	private String pmsName;
	private String pmsInfo;
	public RoleVoPms(){
		
	}
	public RoleVoPms(Integer roleId, String roleName, String roleInfo,
			Integer pmsId, String pmsName, String pmsInfo) {
		super();
		this.roleId = roleId;
		this.roleName = roleName;
		this.roleInfo = roleInfo;
		this.pmsId = pmsId;
		this.pmsName = pmsName;
		this.pmsInfo = pmsInfo;
	}
	public RoleVoPms(String pmsName) {
		super();
		this.pmsName = pmsName;
	}
	public RoleVoPms(Integer roleId,Integer pmsId,
			String pmsName) {
		super();
		this.roleId = roleId;
		this.pmsId = pmsId;
		this.pmsName = pmsName;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public Integer getPmsId() {
		return pmsId;
	}
	public void setPmsId(Integer pmsId) {
		this.pmsId = pmsId;
	}
	public String getPmsName() {
		return pmsName;
	}
	public void setPmsName(String pmsName) {
		this.pmsName = pmsName;
	}
	public String getPmsInfo() {
		return pmsInfo;
	}
	public void setPmsInfo(String pmsInfo) {
		this.pmsInfo = pmsInfo;
	}
	public String getRoleInfo() {
		return roleInfo;
	}
	public void setRoleInfo(String roleInfo) {
		this.roleInfo = roleInfo;
	}
	
}
