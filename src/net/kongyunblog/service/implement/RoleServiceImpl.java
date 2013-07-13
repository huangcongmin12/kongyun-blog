package net.kongyunblog.service.implement;

import java.util.List;

import net.kongyunblog.dao.RoleDao;
import net.kongyunblog.domain.Role;
import net.kongyunblog.service.RoleService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



/**
 * 
 * @author huangcongmin
 * @date 2013-3-12
 */
@Service
@Transactional
public class RoleServiceImpl implements RoleService{
	
	@Autowired private RoleDao roleDao;

	public Role get(Long id) {
		return roleDao.selectRoleById(id);
	}

	public List<Role> getAll() {
		return roleDao.selectAll();
	}

}
