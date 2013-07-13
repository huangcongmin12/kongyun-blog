package net.kongyunblog.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.kongyunblog.domain.Article;
import net.kongyunblog.service.ArticleService;
import net.kongyunblog.service.CategoryService;
import net.kongyunblog.tools.PageHelper;
import net.kongyunblog.tools.PageHelperForParams;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


/**
 * ArticleListController
 * 
 * @author huangcongmin
 * @date 2013-3-10
 */
@Controller
@RequestMapping("/articles")
public class ArticleListController {
	
	@Autowired private ArticleService articleService;
	@Autowired private CategoryService categoryService;
	
	/**
	 * 按分类列表
	 * 
	 * @author huangcongmin
	 * @date 2013-3-10
	 * @param type
	 * @param pageNow
	 * @return
	 */
	@RequestMapping(value = "/{category_id}/list/{index}", method = RequestMethod.GET)
	public ModelAndView show(@PathVariable("category_id") Long category_id, @PathVariable("index") int index) {
		ModelAndView mav = new ModelAndView();
		PageHelper page = new PageHelper(index,4, articleService.getCountByCategoryId(category_id), "");
		List<Article> articles = articleService.listByCategoryId(category_id, index , 4);
		mav.addObject("page", page);
		mav.addObject("article", articles);
		mav.addObject("category_title", categoryService.get(category_id));
		mav.setViewName("default/article/listbycategory");
		return mav;
	}
	
	@RequestMapping(value = "/listbymonth/{index}", method = RequestMethod.GET)
	public ModelAndView listByMonth(@PathVariable("index") int index, @RequestParam("date") String date,
			HttpServletRequest request) {
		String path = request.getContextPath() + "/articles/listbymonth/";
		ModelAndView mav = new ModelAndView();
		PageHelperForParams page = new PageHelperForParams(index,4,articleService.getCountByMonth(date),path,date);
		List<Article> articles = articleService.listByMonth(date, index, 4);
		mav.addObject("page", page);
		mav.addObject("article", articles);
		mav.addObject("date", date);
		mav.setViewName("default/article/listbymonth");
		return mav;
	}
	
	
	/**
	 * 文章列表
	 *
	 * @author huangcongmin
	 * @date 2013-3-20
	 * @param index
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/list/{index}", method = RequestMethod.GET)
	public ModelAndView list(@PathVariable("index") int index,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String path = request.getContextPath() + "/articles/list/";
		List<Article> articles = articleService.list(index,8);
		PageHelper page = new PageHelper(index, 8, articleService.getAllCount(),path);
		mav.addObject("article", articles);
		mav.addObject("page", page);
		mav.setViewName("default/article/list");
		return mav;
	}
	
	

}
