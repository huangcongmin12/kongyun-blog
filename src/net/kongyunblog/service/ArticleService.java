package net.kongyunblog.service;

import java.util.HashMap;
import java.util.List;

import net.kongyunblog.domain.Article;


public interface ArticleService {
	
	public void save(Article article);
	
	public void delete(Long article_id);
	
	public void update(Article article);
	
	public void addViewCount(Article article);
	
	public Article get(Long article_id);
	
	public List<Article> list(int index, int pageSize);

	public int getAllCount();

	public List<Article> listByNew(int size);
	
	public int getCountByCategoryId(Long category_id);
	
	public List<Article> listByCategoryId(Long category_id, int index, int pageSize);
	
	public Article getPre(Long id);
	
	public Article getAfter(Long id);
	
	public List<HashMap<String, Object>> archivesByMonth();
	
	public List<Article> listByMonth(String date, int index, int size);
	
	public 	int getCountByMonth(String date);
	
}
