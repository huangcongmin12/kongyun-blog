package net.kongyunblog.dao;

import java.util.List;
import java.util.Map;

import net.kongyunblog.domain.Category;


public interface CategoryDao {
	
	List<Category> selectCategory();

	List<Category> selectCategoryPage(Map<String, Object> params);
	
	void insert(Category category);
	
	int selectCount();
	
	void delete(long id);
	
	Category selectById(long id);
	
	void updateURL(Category category);

	void updateArticleNum(Category category);
	
	void update(Category category);
	
	List<Category> selectCateByType(int type);
	
}
