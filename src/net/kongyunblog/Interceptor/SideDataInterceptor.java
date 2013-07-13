package net.kongyunblog.Interceptor;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.kongyunblog.service.ArticleService;
import net.kongyunblog.service.CategoryService;
import net.kongyunblog.service.LinkService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


/**
 * 处理边界数据
 * 
 * @author huangcongmin
 * @date 2013-3-19
 */
public class SideDataInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private ArticleService articleService;
	@Autowired
	private LinkService linkService;
	@Autowired
	private CategoryService categoryService;

	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		String path = request.getContextPath();
		if (modelAndView != null && !path.startsWith("/admin")) {
			modelAndView.addObject("link", linkService.listOrder());
			modelAndView.addObject("category", categoryService.list());
			modelAndView.addObject("article_new", articleService.listByNew(5));
			List<HashMap<String, Object>> archives = articleService.archivesByMonth(); 
			modelAndView.addObject("archives", archives);
		}
		super.postHandle(request, response, handler, modelAndView);
	}
}
