package net.kongyunblog.service;

import java.util.List;

import net.kongyunblog.domain.Category;


public interface CategoryService {
	
	public List<Category> list();

	public List<Category> listPage(int pageNow,int pageSize);
	
	public void save(Category category);
	
	public int getAllCount();
	
	public void delete(long id);
	
	public Category get(long id);
	
	public void update(Category category);
	
	public List<Category> getCateByType(int type);

}
