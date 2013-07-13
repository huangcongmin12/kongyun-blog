package net.kongyunblog.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.kongyunblog.domain.Article;


/**
 *
 *
 * @author huangcongmin
 * @date 2013-3-20
 */
public interface ArticleDao {

	void insert(Article article);

	void delete(long article_id);

	void update(Article article);

	void updateUrl(Article article);

	void updateViewCount(Article article);

	Article selectActicleById(long article_id);

	List<Article> selectByPage(Map<String, Object> params);

	int selectCount();

	List<Article> selectByNew(int size);

	List<Article> selectByCategoryId(Map<String, Object> params);

	int selectByCategoryIdCount(Long category_id);

	Article selectPre(Long id);

	Article selectAfter(Long id);

	List<HashMap<String, Object>> archivesByMonth();

	List<Article> listByMonth(Map<String, Object> params);

	int getCountByMonth(String date);

}
