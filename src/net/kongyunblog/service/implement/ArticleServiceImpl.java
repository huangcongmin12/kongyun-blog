package net.kongyunblog.service.implement;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.kongyunblog.dao.ArticleDao;
import net.kongyunblog.dao.CategoryDao;
import net.kongyunblog.domain.Article;
import net.kongyunblog.domain.Category;
import net.kongyunblog.service.ArticleService;
import net.kongyunblog.tools.DateHelper;
import net.kongyunblog.tools.SplitHelper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



/**
 * 
 * @author huangcongmin
 * @date 2013-3-17
 */
@Service
@Transactional
public class ArticleServiceImpl implements ArticleService {
	
	@Autowired private ArticleDao articleDao;
	@Autowired private CategoryDao categoryDao;
	
	public Article get(Long article_id) {
		return articleDao.selectActicleById(article_id);
	}

	public int getAllCount() {
		return articleDao.selectCount();
	}

	public void save(Article article) {
		Date date = new Date();
		article.setCreateTime(date);
		article.setModifyTime(date);
		article.setCover(SplitHelper.subString(article.getContent(), 456));
		articleDao.insert(article);
		article.setUrl("articles/" + article.getId() + "/show");
		articleDao.updateUrl(article);
		Category category = categoryDao.selectById(article.getCategory().getId());
		category.setActicleNum(category.getActicleNum() + 1);
		categoryDao.updateArticleNum(category);
	}

	public void delete(Long article_id) {
		articleDao.delete(article_id);
	}

	public void update(Article article) {
		article.setModifyTime(new Date());
		articleDao.update(article);
	}
	
	public void addViewCount(Article article) {
		articleDao.updateViewCount(article);
	}
	
	public List<Article> list(int index, int pageSize) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("index", (index-1)*pageSize);
		params.put("size", pageSize);
		return articleDao.selectByPage(params);
	}

	public List<Article> listByNew(int size) {
		return articleDao.selectByNew(size);
	}


	public List<Article> listByCategoryId(Long category_id, int index,int pageSize) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("category_id", category_id);
		params.put("index", (index-1)*pageSize);
		params.put("size", pageSize);
		return articleDao.selectByCategoryId(params);
	}


	public int getCountByCategoryId(Long category_id) {
		return articleDao.selectByCategoryIdCount(category_id);
	}

	public Article getPre(Long id) {
		return articleDao.selectPre(id);
	}

	public Article getAfter(Long id) {
		return articleDao.selectAfter(id);
	}
	
	/* (non-Javadoc) 按月归档
	 * @see cn.edu.gxu.bioinformatics.service.ArticleService#archivesByMonth()
	 */
	public List<HashMap<String, Object>> archivesByMonth(){
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		for(HashMap<String, Object> map : articleDao.archivesByMonth()) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
			Date d = null;
			try {
				d = sdf.parse((String) map.get("date"));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			map.put("y_m", DateHelper.getYear_Month(d));
			list.add(map);
		}
		return list;
	}

	public List<Article> listByMonth(String date, int index, int size) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("date", date);
		params.put("index", (index-1)*size);
		params.put("size", size);
		return articleDao.listByMonth(params);
	}

	public int getCountByMonth(String date) {
		return articleDao.getCountByMonth(date);
	}

}
