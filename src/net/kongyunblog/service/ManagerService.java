package net.kongyunblog.service;

import java.util.List;

import net.kongyunblog.domain.Manager;


/**
 *
 * @author huangcongmin
 * @date 2013-3-13
 */
public interface ManagerService {
	
	public Manager get(Long id);
	
	public boolean save(Manager manager);
	
	public void delete(Long id);
	
	public void update(Manager manager);
	
	public void resetPWD(Manager manager);
	
	public Manager getByName(String name);
	
	public Manager getByEmail(String email);
	
	public boolean loginByEmail(String email, String password);
	
	public boolean loginByName(String name, String password);

	public List<Manager> listPage(int pageNow, int pageSize);
	
	public int getCount();
}
