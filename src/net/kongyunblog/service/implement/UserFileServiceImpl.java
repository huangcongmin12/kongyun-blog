package net.kongyunblog.service.implement;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.kongyunblog.dao.UserFileDao;
import net.kongyunblog.domain.UserFile;
import net.kongyunblog.service.UserFileService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class UserFileServiceImpl implements UserFileService {
	
	@Autowired
	private UserFileDao userFileDao;

	public int getCount() {
		return userFileDao.getCount();
	}

	public UserFile get(long id) {
		return userFileDao.selectFileById(id);
	}

	public void delete(long id) {
		userFileDao.delete(id);
	}

	public void save(UserFile userFile) {
		userFileDao.insert(userFile);
	}

	public List<UserFile> list(int pageNow, int pageSize) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("index", (pageNow-1)*pageSize);
		params.put("size", pageSize);
		return userFileDao.selectByPage(params);
	}

	public void update(UserFile userFile) {
		userFileDao.update(userFile);
	}

}
