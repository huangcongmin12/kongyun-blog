package net.kongyunblog.web;

import net.kongyunblog.domain.Article;
import net.kongyunblog.service.ArticleService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


/**
 * ArticleShowController
 * @author huangcongmin
 * @date 2013-3-10
 */
@Controller
@RequestMapping("/articles")
public class ArticleShowController {
	
	@Autowired private ArticleService articleService;
	
	
	/**
	 * 显示文章
	 * @author huangcongmin
	 * @date 2013-3-10
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/{id}/show", method = RequestMethod.GET)
	public ModelAndView show(@PathVariable("id") long id) {
		ModelAndView mav = new ModelAndView();
		Article article = articleService.get(id);
		if(article==null) {
			mav.setViewName("default/error");
		}
		else {
			article.setViewCount(article.getViewCount() + 1 );
			articleService.addViewCount(article);
			mav.addObject("article", article);
			mav.addObject("preArticle", articleService.getPre(id));
			mav.addObject("afterArticle", articleService.getAfter(id));
			mav.setViewName("default/article/show");
		}
		return mav;
	}
	

}
