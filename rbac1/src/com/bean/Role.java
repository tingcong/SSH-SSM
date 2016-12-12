package com.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Role entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "role", catalog = "rbac")
public class Role implements java.io.Serializable {

	// Fields

	private Integer roleId;
	private String roleName;
	private String roleInfo;

	// Constructors

	/** default constructor */
	public Role() {
	}

	/** minimal constructor */
	public Role(String roleName) {
		this.roleName = roleName;
	}

	/** full constructor */
	public Role(String roleName, String roleInfo) {
		this.roleName = roleName;
		this.roleInfo = roleInfo;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "role_id", unique = true, nullable = false)
	public Integer getRoleId() {
		return this.roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	@Column(name = "role_name", nullable = false)
	public String getRoleName() {
		return this.roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	@Column(name = "role_info")
	public String getRoleInfo() {
		return this.roleInfo;
	}

	public void setRoleInfo(String roleInfo) {
		this.roleInfo = roleInfo;
	}

}