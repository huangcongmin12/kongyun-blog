package net.kongyunblog.web.admin;

import java.util.List;

import net.kongyunblog.domain.Category;
import net.kongyunblog.service.CategoryService;
import net.kongyunblog.tools.Page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("admin/nav")
public class CategoryController {

	@Autowired
	private CategoryService categoryService;

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add() {
		return "admin/nav/add";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public ModelAndView add(Category category) {
		if (category.getName() == null || category.getName() == "") {
			return new ModelAndView("admin/nav/add", "msg", "名称不能为空！");
		} else {
			categoryService.save(category);
			return new ModelAndView(
					"admin/nav/add",
					"success",
					"<script type='text/javascript'>alert('提示信息：新增成功！');window.location.reload();</script>");
		}
	}

	@RequestMapping(value = "/list/{pageNow}", method = RequestMethod.GET)
	public ModelAndView list(@PathVariable("pageNow") int pageNow) {
		ModelAndView mav = new ModelAndView();
		Page page = new Page(pageNow, Page.DEFAUL_SIZE,
				categoryService.getAllCount());
		List<Category> list = categoryService.listPage(pageNow,
				Page.DEFAUL_SIZE);
		mav.addObject("page", page);
		mav.addObject("category", list);
		mav.setViewName("admin/nav/list");
		return mav;
	}

	@RequestMapping(value = "/{id}/delete", method = RequestMethod.DELETE)
	@ResponseBody
	public ModelMap delete(@PathVariable("id") long id) {
		ModelMap modelMap = new ModelMap();
		categoryService.delete(id);
		modelMap.addAttribute("success", "true");
		return modelMap;
	}

	@RequestMapping(value = "/{id}/edit", method = RequestMethod.GET)
	public ModelAndView edit(@PathVariable("id") long id) {
		return new ModelAndView("admin/nav/update", "c",
				categoryService.get(id));
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView update(Category category) {
		categoryService.update(category);
		ModelAndView mav = new ModelAndView();
		mav.addObject(
				"success",
				"<script type='text/javascript'>if (confirm('提示信息：保存成功,  是否返回导航列表 ？')) {location=window.location.href ='admin/nav/list/1'}</script>");
		Category c = categoryService.get(category.getId());
		mav.addObject("category", c);
		mav.setViewName("admin/nav/update");
		return mav;
	}

}
