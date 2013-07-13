package net.kongyunblog.service.implement;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.kongyunblog.dao.CategoryDao;
import net.kongyunblog.domain.Category;
import net.kongyunblog.service.CategoryService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	private CategoryDao categoryDao;
	
	public void save(Category category) {
		if(category.getRank()==null){
			category.setRank(0);
		}
		categoryDao.insert(category);
		category.setUrl("articles/"+category.getId()+"/list/1");
		categoryDao.updateURL(category);
	}
	
	public int getAllCount() {
		return categoryDao.selectCount();
	}

	public List<Category> list() {
		return categoryDao.selectCategory();
	}

	public List<Category> listPage(int pageNow, int pageSize) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("index", (pageNow-1)*pageSize);
		params.put("size", pageSize);
		return categoryDao.selectCategoryPage(params);
	}

	public void delete(long id) {
		categoryDao.delete(id);
	}

	public Category get(long id) {
		return categoryDao.selectById(id);
	}

	public void update(Category category) {
		categoryDao.update(category);
	}

	public List<Category> getCateByType(int type) {
		return categoryDao.selectCateByType(type);
	}

	

}
