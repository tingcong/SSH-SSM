package com.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Students entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "students", catalog = "student")
public class Students implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;

	// Constructors

	/** default constructor */
	public Students() {
	}

	/** minimal constructor */
	public Students(Integer id) {
		this.id = id;
	}

	/** full constructor */
	public Students(Integer id, String name) {
		this.id = id;
		this.name = name;
	}

	// Property accessors
	@Id
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "name")
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

}