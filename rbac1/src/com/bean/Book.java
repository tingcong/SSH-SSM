package com.bean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * Book entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "book", catalog = "rbac")
public class Book implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String number;
	private Integer amount;
	private Integer total;
	private Double price;
	@JSONField(format = "yyyy-MM-dd")
	private Date pdate;
	private String genre;

	// Constructors

	/** default constructor */
	public Book() {
	}

	/** minimal constructor */
	public Book(String name, String number, Double price, Date pdate) {
		this.name = name;
		this.number = number;
		this.price = price;
		this.pdate = pdate;
	}

	/** full constructor */
	public Book(String name, String number, Integer amount, Integer total,
			Double price, Date pdate, String genre) {
		this.name = name;
		this.number = number;
		this.amount = amount;
		this.total = total;
		this.price = price;
		this.pdate = pdate;
		this.genre = genre;
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

	@Column(name = "name", nullable = false)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "number", nullable = false)
	public String getNumber() {
		return this.number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	@Column(name = "amount")
	public Integer getAmount() {
		return this.amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	@Column(name = "total")
	public Integer getTotal() {
		return this.total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	@Column(name = "price", nullable = false, precision = 10, scale = 3)
	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "pdate", nullable = false, length = 10)
	public Date getPdate() {
		return this.pdate;
	}

	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}

	@Column(name = "genre", length = 20)
	public String getGenre() {
		return this.genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

}