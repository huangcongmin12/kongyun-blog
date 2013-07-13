package net.kongyunblog.service;

import java.util.List;

import net.kongyunblog.domain.Role;


/**
 *
 * @author huangcongmin
 * @date 2013-3-13
 */
public interface RoleService {
	
	public Role get(Long id);
	
	public List<Role> getAll();

}
