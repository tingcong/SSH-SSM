package com.myssm.bean;

import java.util.Date;

import javax.persistence.*;

import com.alibaba.fastjson.annotation.JSONField;

@Table(name = "pre_student")
public class PreStudent {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String name;

	private String mobile;

	private String email;

	private String qq;

	private String channel;

	private String msgsrc;

	private String school;

	private String major;

	private String grade;

	private String clazz;

	private String intention;

	@JSONField(format = "yyyy/MM/dd")
	private Date createtime;

	private String creator;

	private Integer state;

	/**
	 * @return id
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return mobile
	 */
	public String getMobile() {
		return mobile;
	}

	/**
	 * @param mobile
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	/**
	 * @return email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return qq
	 */
	public String getQq() {
		return qq;
	}

	/**
	 * @param qq
	 */
	public void setQq(String qq) {
		this.qq = qq;
	}

	/**
	 * @return channel
	 */
	public String getChannel() {
		return channel;
	}

	/**
	 * @param channel
	 */
	public void setChannel(String channel) {
		this.channel = channel;
	}

	/**
	 * @return msgsrc
	 */
	public String getMsgsrc() {
		return msgsrc;
	}

	/**
	 * @param msgsrc
	 */
	public void setMsgsrc(String msgsrc) {
		this.msgsrc = msgsrc;
	}

	/**
	 * @return school
	 */
	public String getSchool() {
		return school;
	}

	/**
	 * @param school
	 */
	public void setSchool(String school) {
		this.school = school;
	}

	/**
	 * @return major
	 */
	public String getMajor() {
		return major;
	}

	/**
	 * @param major
	 */
	public void setMajor(String major) {
		this.major = major;
	}

	/**
	 * @return grade
	 */
	public String getGrade() {
		return grade;
	}

	/**
	 * @param grade
	 */
	public void setGrade(String grade) {
		this.grade = grade;
	}

	/**
	 * @return clazz
	 */
	public String getClazz() {
		return clazz;
	}

	/**
	 * @param clazz
	 */
	public void setClazz(String clazz) {
		this.clazz = clazz;
	}

	/**
	 * @return intention
	 */
	public String getIntention() {
		return intention;
	}

	/**
	 * @param intention
	 */
	public void setIntention(String intention) {
		this.intention = intention;
	}

	/**
	 * @return createtime
	 */
	public Date getCreatetime() {
		return createtime;
	}

	/**
	 * @param createtime
	 */
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	/**
	 * @return creator
	 */
	public String getCreator() {
		return creator;
	}

	/**
	 * @param creator
	 */
	public void setCreator(String creator) {
		this.creator = creator;
	}

	/**
	 * @return state
	 */
	public Integer getState() {
		return state;
	}

	/**
	 * @param state
	 */
	public void setState(Integer state) {
		this.state = state;
	}
}