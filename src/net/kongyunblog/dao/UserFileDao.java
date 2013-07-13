package net.kongyunblog.dao;

import java.util.List;
import java.util.Map;

import net.kongyunblog.domain.UserFile;


public interface UserFileDao {
	
	void insert(UserFile userFile);
	
	int getCount();
	
	UserFile selectFileById(long id);
	
	void delete(long id);
	
	List<UserFile> selectByPage(Map<String, Object> params);

	void update(UserFile userFile);

}
