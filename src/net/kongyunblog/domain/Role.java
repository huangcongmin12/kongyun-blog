package net.kongyunblog.domain;

import java.io.Serializable;

/**
 * Role Entity
 * @author huangcongmin
 * @date 2013-3-12
 */
@SuppressWarnings("serial")
public class Role implements Serializable{

	private Long id;			// id
	private String name;		// 角色名称
	private String role;		// 角色
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
}
