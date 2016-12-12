package com.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Lishi entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "lishi", catalog = "student")
public class Lishi implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer sid;
	private String sname;

	// Constructors

	/** default constructor */
	public Lishi() {
	}

	/** full constructor */
	public Lishi(Integer sid, String sname) {
		this.sid = sid;
		this.sname = sname;
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

	@Column(name = "sid")
	public Integer getSid() {
		return this.sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	@Column(name = "sname")
	public String getSname() {
		return this.sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

}