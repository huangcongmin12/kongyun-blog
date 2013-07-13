package net.kongyunblog.web;

import javax.servlet.http.HttpServletRequest;

import net.kongyunblog.service.ArticleService;
import net.kongyunblog.tools.PageHelper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


/**
 * MainController
 * @author huangcongmin
 * @date 2013-3-10
 */
@Controller
@RequestMapping("/")
public class MainController {
	
	@Autowired private ArticleService articleService;
	

	/**
	 * @author huangcongmin
	 * @date 2013-3-10
	 * @return
	 */
	@RequestMapping(value = "/*", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView mav =new ModelAndView();
		mav.addObject("article", articleService.list(1, 4));
		mav.addObject("page", new PageHelper(1,8,articleService.getAllCount(),request.getContextPath() + "/index/"));
		mav.setViewName("default/index");
		return mav;
	}
	
	/**
	 * @author huangcongmin
	 * @date 2013-3-10
	 * @return
	 */
	@RequestMapping(value = "/index/{index}", method = RequestMethod.GET)
	public ModelAndView indexList(@PathVariable("index") int index,HttpServletRequest request) {
		String path = request.getContextPath() + "/index/";
		ModelAndView mav =new ModelAndView();
		mav.addObject("article", articleService.list(index, 4));
		mav.addObject("page", new PageHelper(index,4,articleService.getAllCount(),path));
		mav.setViewName("default/index");
		return mav;
	}

}
