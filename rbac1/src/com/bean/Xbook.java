package com.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Xbook entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "xbook", catalog = "rbac")
public class Xbook implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer bid;
	private String name;
	private String auther;
	private String introduce;

	// Constructors

	/** default constructor */
	public Xbook() {
	}

	/** full constructor */
	public Xbook(Integer bid, String name, String auther, String introduce) {
		this.bid = bid;
		this.name = name;
		this.auther = auther;
		this.introduce = introduce;
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

	@Column(name = "bid")
	public Integer getBid() {
		return this.bid;
	}

	public void setBid(Integer bid) {
		this.bid = bid;
	}

	@Column(name = "name")
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "auther")
	public String getAuther() {
		return this.auther;
	}

	public void setAuther(String auther) {
		this.auther = auther;
	}

	@Column(name = "introduce")
	public String getIntroduce() {
		return this.introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

}