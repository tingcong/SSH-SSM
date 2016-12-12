package com.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Menu entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "menu", catalog = "rbac")
public class Menu implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer PId;
	private String name;
	private String link;
	private String iconSkin;

	// Constructors

	/** default constructor */
	public Menu() {
	}

	/** minimal constructor */
	public Menu(Integer PId, String name) {
		this.PId = PId;
		this.name = name;
	}

	/** full constructor */
	public Menu(Integer PId, String name, String link, String iconSkin) {
		this.PId = PId;
		this.name = name;
		this.link = link;
		this.iconSkin = iconSkin;
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

	@Column(name = "p_id", nullable = false)
	public Integer getPId() {
		return this.PId;
	}

	public void setPId(Integer PId) {
		this.PId = PId;
	}

	@Column(name = "name", nullable = false, length = 20)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "link")
	public String getLink() {
		return this.link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	@Column(name = "iconSkin", length = 20)
	public String getIconSkin() {
		return this.iconSkin;
	}

	public void setIconSkin(String iconSkin) {
		this.iconSkin = iconSkin;
	}

}