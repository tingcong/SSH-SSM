package com.bean;

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * RolePermissionId entity. @author MyEclipse Persistence Tools
 */
@Embeddable
public class RolePermissionId implements java.io.Serializable {

	// Fields

	private Integer roleId;
	private Integer pmsId;

	// Constructors

	/** default constructor */
	public RolePermissionId() {
	}

	/** full constructor */
	public RolePermissionId(Integer roleId, Integer pmsId) {
		this.roleId = roleId;
		this.pmsId = pmsId;
	}

	// Property accessors

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

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof RolePermissionId))
			return false;
		RolePermissionId castOther = (RolePermissionId) other;

		return ((this.getRoleId() == castOther.getRoleId()) || (this
				.getRoleId() != null && castOther.getRoleId() != null && this
				.getRoleId().equals(castOther.getRoleId())))
				&& ((this.getPmsId() == castOther.getPmsId()) || (this
						.getPmsId() != null && castOther.getPmsId() != null && this
						.getPmsId().equals(castOther.getPmsId())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getRoleId() == null ? 0 : this.getRoleId().hashCode());
		result = 37 * result
				+ (getPmsId() == null ? 0 : this.getPmsId().hashCode());
		return result;
	}

}