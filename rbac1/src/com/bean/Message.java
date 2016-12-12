package com.bean;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Message entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "message", catalog = "rbac")
public class Message implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer userId;
	private String tt;
	private String ctt;
	private String sender;
	private Timestamp time;
	private Integer senderId;
	private Integer statu;

	// Constructors

	/** default constructor */
	public Message() {
	}

	/** minimal constructor */
	public Message(Integer userId, Integer senderId, Integer statu) {
		this.userId = userId;
		this.senderId = senderId;
		this.statu = statu;
	}

	/** full constructor */
	public Message(Integer userId, String tt, String ctt, String sender,
			Timestamp time, Integer senderId, Integer statu) {
		this.userId = userId;
		this.tt = tt;
		this.ctt = ctt;
		this.sender = sender;
		this.time = time;
		this.senderId = senderId;
		this.statu = statu;
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

	@Column(name = "user_id", nullable = false)
	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	@Column(name = "tt")
	public String getTt() {
		return this.tt;
	}

	public void setTt(String tt) {
		this.tt = tt;
	}

	@Column(name = "ctt", length = 65535)
	public String getCtt() {
		return this.ctt;
	}

	public void setCtt(String ctt) {
		this.ctt = ctt;
	}

	@Column(name = "sender", length = 30)
	public String getSender() {
		return this.sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	@Column(name = "time", length = 19)
	public Timestamp getTime() {
		return this.time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	@Column(name = "sender_id", nullable = false)
	public Integer getSenderId() {
		return this.senderId;
	}

	public void setSenderId(Integer senderId) {
		this.senderId = senderId;
	}

	@Column(name = "statu", nullable = false)
	public Integer getStatu() {
		return this.statu;
	}

	public void setStatu(Integer statu) {
		this.statu = statu;
	}

}