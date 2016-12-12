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
 * Notice entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "notice", catalog = "rbac")
public class Notice implements java.io.Serializable {

	// Fields

	private Integer id;
	private String title;
	private String content;
	@JSONField(format = "yyyy-MM-dd HH:mm:ss")
	private Timestamp pubdate;
	private String publisher;

	// Constructors

	/** default constructor */
	public Notice() {
	}

	/** minimal constructor */
	public Notice(String title, Timestamp pubdate, String publisher) {
		this.title = title;
		this.pubdate = pubdate;
		this.publisher = publisher;
	}

	/** full constructor */
	public Notice(String title, String content, Timestamp pubdate,
			String publisher) {
		this.title = title;
		this.content = content;
		this.pubdate = pubdate;
		this.publisher = publisher;
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

	@Column(name = "title", nullable = false, length = 50)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "content", length = 65535)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name = "pubdate", nullable = false, length = 19)
	public Timestamp getPubdate() {
		return this.pubdate;
	}

	public void setPubdate(Timestamp pubdate) {
		this.pubdate = pubdate;
	}

	@Column(name = "publisher", nullable = false, length = 50)
	public String getPublisher() {
		return this.publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

}