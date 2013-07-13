package net.kongyunblog.dao;

import java.util.List;

import net.kongyunblog.domain.Role;


public interface RoleDao {
	
	Role selectRoleById(Long id);
	
	List<Role> selectAll();
	
}
