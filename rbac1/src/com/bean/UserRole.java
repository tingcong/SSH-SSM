package com.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * UserRole entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "user_role", catalog = "rbac")
public class UserRole implements java.io.Serializable {

	// Fields

	private Integer userId;
	private Integer roleId;

	// Constructors

	/** default constructor */
	public UserRole() {
	}

	/** full constructor */
	public UserRole(Integer userId, Integer roleId) {
		this.userId = userId;
		this.roleId = roleId;
	}

	// Property accessors
	@Id
	@Column(name = "user_id", unique = true, nullable = false)
	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	@Column(name = "role_id", nullable = false)
	public Integer getRoleId() {
		return this.roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

}