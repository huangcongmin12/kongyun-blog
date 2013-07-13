package net.kongyunblog.service.implement;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.kongyunblog.dao.ManagerDao;
import net.kongyunblog.domain.Manager;
import net.kongyunblog.service.ManagerService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * 
 * @author huangcongmin
 * @date 2013-3-13
 */
@Service
@Transactional
public class ManagerServiceImpl implements ManagerService {
	
	@Autowired private ManagerDao managerDao;

	public Manager get(Long id) {
		return managerDao.selectManagerByID(id);
	}

	public int getCount() {
		return managerDao.getCount();
	}
	
	public boolean save(Manager manager) {
		boolean result = true;
		if (managerDao.selectByName(manager.getName())==null&&managerDao.selectByEmail(manager.getEmail())==null) {
			managerDao.insertManager(manager);
		} 
		else {
			result = false;
		}
			
		return result;
	}

	public void delete(Long id) {
		managerDao.deleteManager(id);
	}

	public void update(Manager manager) {
		managerDao.updateManager(manager);
	}
	
	public void resetPWD(Manager manager) {
		managerDao.updateManagerPassword(manager);
	}
	
	public Manager getByName(String name) {
		return managerDao.selectByName(name);
	}
	
	public Manager getByEmail(String email) {
		return managerDao.selectByEmail(email);
	}
	
	public List<Manager> listPage(int pageNow, int pageSize) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("index", (pageNow-1)*pageSize);
		params.put("size",pageSize);
		return managerDao.selectManagerByPage(params);
	}

	
	public boolean loginByEmail(String email, String password) {
		Manager manager = managerDao.selectByEmail(email);
		if(manager!=null&&password.equals(manager.getPassword())) {
			return true;
		}
		else {
			return false;
		}
	}
	
	
	public boolean loginByName(String name, String password) {
		Manager manager = managerDao.selectByName(name);
		if(manager!=null&&password.equals(manager.getPassword())) {
			return true;
		}
		else {
			return false;
		}
	}


}
