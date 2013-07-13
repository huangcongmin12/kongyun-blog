package net.kongyunblog.web.admin;

import java.util.List;

import net.kongyunblog.domain.Link;
import net.kongyunblog.service.LinkService;
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
@RequestMapping("admin/link")
public class LinkController {
	
	@Autowired
	private LinkService linkService;
	
	@RequestMapping(value = "/list/{pageNow}", method = RequestMethod.GET)
	public ModelAndView list(@PathVariable("pageNow") int pageNow) {
		ModelAndView mav = new ModelAndView();
		Page page = new Page(pageNow, Page.DEFAUL_SIZE, linkService.getCount());
		List<Link> links = linkService.listPage(pageNow, Page.DEFAUL_SIZE);
		mav.addObject("page", page);
		mav.addObject("link", links);
		mav.setViewName("admin/link/list");
		return mav;
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add() {
		return "admin/link/add";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public ModelAndView add(Link link) {
		ModelAndView mav = new ModelAndView();
		if(link.getRank()==null) {
				link.setRank(0);
		}
		if(link.getName()==null||link.getName()=="") {
			mav.addObject("msg","名称不能为空！");
		}
		else if(link.getUrl()==null||link.getUrl()=="") {
			mav.addObject("msg","链接地址不能为空！");
		}
		else {
			linkService.save(link);
			mav.addObject("success", "<script type='text/javascript'>alert('提示信息：新增成功！');window.location.reload();</script>");
		}
		mav.setViewName("admin/link/add");
		return mav;
	}
	
	@RequestMapping(value = "/{id}/delete", method = RequestMethod.DELETE)
	@ResponseBody
	public ModelMap delete(@PathVariable("id") long id) {
		ModelMap modelMap = new ModelMap();
		linkService.delete(id);
		modelMap.addAttribute("success", "true");
		return modelMap;
	}
	
	@RequestMapping(value = "/{id}/edit", method = RequestMethod.GET)
	public ModelAndView edit(@PathVariable("id") long id) {
		return new ModelAndView("admin/link/update","link",linkService.get(id));
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView update( Link link) {
		ModelAndView mav = new ModelAndView();
		linkService.update(link);
		mav.addObject("success","<script type='text/javascript'>if (confirm('提示信息：保存成功, 是否返回友链列表 ？')) {location=window.location.href ='admin/link/list/1'}</script>");
		Link l = linkService.get(link.getId());
		mav.addObject("link", l);
		mav.setViewName("admin/link/update");
		return mav;
	}
	
}
