package com.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * RolePermission entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "role_permission", catalog = "rbac")
public class RolePermission implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer roleId;
	private Integer pmsId;

	// Constructors

	/** default constructor */
	public RolePermission() {
	}

	/** full constructor */
	public RolePermission(Integer roleId, Integer pmsId) {
		this.roleId = roleId;
		this.pmsId = pmsId;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "role_id", nullable = false)
	public Integer getRoleId() {
		return this.roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	@Column(name = "pms_id", nullable = false)
	public Integer getPmsId() {
		return this.pmsId;
	}

	public void setPmsId(Integer pmsId) {
		this.pmsId = pmsId;
	}

}