package com.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Permission entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "permission", catalog = "rbac")
public class Permission implements java.io.Serializable {

	// Fields

	private Integer pmsId;
	private String pmsName;
	private String pmsInfo;
	private String menuIds;
	private Integer PId;

	// Constructors

	/** default constructor */
	public Permission() {
	}

	/** minimal constructor */
	public Permission(Integer pmsId, String pmsName, Integer PId) {
		this.pmsId = pmsId;
		this.pmsName = pmsName;
		this.PId = PId;
	}

	/** full constructor */
	public Permission(Integer pmsId, String pmsName, String pmsInfo,
			String menuIds, Integer PId) {
		this.pmsId = pmsId;
		this.pmsName = pmsName;
		this.pmsInfo = pmsInfo;
		this.menuIds = menuIds;
		this.PId = PId;
	}

	// Property accessors
	@Id
	@Column(name = "pms_id", unique = true, nullable = false)
	public Integer getPmsId() {
		return this.pmsId;
	}

	public void setPmsId(Integer pmsId) {
		this.pmsId = pmsId;
	}

	@Column(name = "pms_name", nullable = false)
	public String getPmsName() {
		return this.pmsName;
	}

	public void setPmsName(String pmsName) {
		this.pmsName = pmsName;
	}

	@Column(name = "pms_info")
	public String getPmsInfo() {
		return this.pmsInfo;
	}

	public void setPmsInfo(String pmsInfo) {
		this.pmsInfo = pmsInfo;
	}

	@Column(name = "menu_ids")
	public String getMenuIds() {
		return this.menuIds;
	}

	public void setMenuIds(String menuIds) {
		this.menuIds = menuIds;
	}

	@Column(name = "p_id", nullable = false)
	public Integer getPId() {
		return this.PId;
	}

	public void setPId(Integer PId) {
		this.PId = PId;
	}

}