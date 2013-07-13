package net.kongyunblog.service;

import java.util.List;

import net.kongyunblog.domain.Link;


public interface LinkService {
	
	public void delete(long id);
	
	public void save(Link link);
	
	public int getCount();
	
	public void update(Link link);
	
	public Link get(long id);
	
	public List<Link> listPage(int pageNow, int pageSize);
	
	public List<Link> listOrder();

}
