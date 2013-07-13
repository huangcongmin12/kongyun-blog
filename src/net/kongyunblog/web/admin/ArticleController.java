package net.kongyunblog.web.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.kongyunblog.domain.Article;
import net.kongyunblog.domain.Manager;
import net.kongyunblog.service.ArticleService;
import net.kongyunblog.service.CategoryService;
import net.kongyunblog.tools.Page;
import net.kongyunblog.tools.SplitHelper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


/**
 * ArticleController
 * @author huangcongmin
 * @date 2013-3-18
 */
@Controller
@RequestMapping("admin/news")
public class ArticleController {

	@Autowired private ArticleService articleService;
	@Autowired private CategoryService categoryService;

	@RequestMapping(value = "/list/{index}", method = RequestMethod.GET)
	public ModelAndView list(@PathVariable("index") int index) {
		ModelAndView mav = new ModelAndView();
		Page page = new Page(index, Page.DEFAUL_SIZE,articleService.getAllCount());
		List<Article> articles = articleService.list(index, Page.DEFAUL_SIZE);
		mav.addObject("page", page);
		mav.addObject("article", articles);
		mav.setViewName("admin/news/list");
		return mav;
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView add() {
		return new ModelAndView("admin/news/add", "category", categoryService.list());
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public ModelAndView add(Article article, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		article.setTitle(SplitHelper.subString(article.getTitle(), 44));
		Manager manager = (Manager) request.getSession().getAttribute("sessionManager");
		article.setAuthorId(manager.getId());
		articleService.save(article);
		mav.addObject("category", categoryService.list());
		mav.addObject("success", "<script type='text/javascript'>alert('提示信息：发布文章成功！');</script>");
		mav.setViewName("admin/news/add");
		return mav;
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public ModelMap delete(@PathVariable("id") long id) {
		ModelMap modelMap = new ModelMap();
		articleService.delete(id);
		modelMap.addAttribute("success", "true");
		return modelMap;
	}
	
	@RequestMapping(value = "/{id}/edit", method = RequestMethod.GET)
	public ModelAndView edit(@PathVariable("id") long id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("category", categoryService.list());
		Article article = articleService.get(id);
		mav.addObject("article", article);
		mav.setViewName("admin/news/update");
		return mav;
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView update(Article article) {
		ModelAndView mav = new ModelAndView();
		articleService.update(article);
		mav.addObject("msg","<script type='text/javascript'>if (confirm('提示信息：保存成功, 是否返回文章列表 ？')) {location=window.location.href ='admin/news/list/1'}</script>");
		mav.addObject("category", categoryService.list());
		Article a = articleService.get(article.getId());
		mav.addObject("article", a);
		mav.setViewName("admin/news/update");
		return mav;
	}

}
