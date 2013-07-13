package net.kongyunblog.service;

import java.util.List;

import net.kongyunblog.domain.UserFile;


public interface UserFileService {
	
	public void save(UserFile userFile);
	
	public int getCount();
	
	public UserFile get(long id);
	
	public void delete(long id);
	
	public List<UserFile> list(int pageNow, int pageSize);

	public void update(UserFile userFile);

}
