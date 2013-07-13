package net.kongyunblog.dao;

import java.util.List;
import java.util.Map;

import net.kongyunblog.domain.Manager;


/**
 *
 * @author huangcongmin
 * @date 2013-3-13
 */
public interface ManagerDao {
	
	Manager selectManagerByID(Long id);
	
	void insertManager(Manager manager);
	
	void deleteManager(Long id);
	
	void updateManager(Manager manager);
	
	Manager selectByName(String name);

	List<Manager> selectManagerByPage(Map<String, Object> params);
	
	int getCount();

	Manager selectByEmail(String email);
	
	void updateManagerPassword(Manager manager);
}
