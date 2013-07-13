package net.kongyunblog.domain;

import java.io.Serializable;

/**
 * Manager Entity
 * @author huangcongmin
 * @date 2013-3-12
 */
@SuppressWarnings("serial")
public class Manager implements Serializable{
	
	private Long id;					// id
	private String name;				// 管理员名称
	private String password;			// 密码
	private String email;				// 邮箱
	private Integer status;				// 状态
	private Role role;					// 角色
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}

}
