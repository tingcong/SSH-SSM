package com.bean;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.Table;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * Bbk entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "bbk", catalog = "rbac")
public class Bbk implements java.io.Serializable {

	// Fields

	private Integer ordNum;
	private Integer id;
	private String name;
	@JSONField(format = "yyyy-MM-dd HH:mm")
	private Timestamp borrowTime;

	// Constructors

	/** default constructor */
	public Bbk() {
	}

	/** full constructor */
	public Bbk(Integer id, String name, Timestamp borrowTime) {
		this.id = id;
		this.name = name;
		this.borrowTime = borrowTime;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "ordNum", unique = true, nullable = false)
	public Integer getOrdNum() {
		return this.ordNum;
	}

	public void setOrdNum(Integer ordNum) {
		this.ordNum = ordNum;
	}

	@Column(name = "id", nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "name", nullable = false)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "borrowTime", nullable = false, length = 19)
	public Timestamp getBorrowTime() {
		return this.borrowTime;
	}

	public void setBorrowTime(Timestamp borrowTime) {
		this.borrowTime = borrowTime;
	}

}