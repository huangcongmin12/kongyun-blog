package net.kongyunblog.dao;

import java.util.List;
import java.util.Map;

import net.kongyunblog.domain.Link;


public interface LinkDao {
	
	void insert(Link link);
	
	int selectCount();
	
	void delete(long id);

	void update(Link link);
	
	Link selectLinkById(long id);
	
	List<Link> selectPage(Map<String, Object> params);
	
	List<Link> selectOrder();
}
