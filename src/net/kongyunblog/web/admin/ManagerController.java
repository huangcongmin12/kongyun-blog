package net.kongyunblog.web.admin;

import java.util.List;

import net.kongyunblog.domain.Manager;
import net.kongyunblog.domain.Role;
import net.kongyunblog.service.ManagerService;
import net.kongyunblog.service.RoleService;
import net.kongyunblog.tools.EmailHelper;
import net.kongyunblog.tools.Page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


/**
 * ManagerController
 * @author huangcongmin
 * @date 2013-3-15
 */
@Controller
@RequestMapping("/admin/manager")
public class ManagerController {

	@Autowired private ManagerService managerService;
	@Autowired private RoleService roleService;

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView add() {
		List<Role> roles = roleService.getAll();
		return new ModelAndView("admin/manager/add", "role", roles);
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public ModelAndView add(Manager manager) {
		ModelAndView mav = new ModelAndView();
		List<Role> roles = roleService.getAll();
		mav.addObject("role", roles);
		mav.setViewName("admin/manager/add");
		if(!EmailHelper.emailFormat(manager.getEmail())){
			mav.addObject("msg", "请填写正确的邮箱格式");	
		}else {
			if (managerService.getByName(manager.getName()) == null) {
				if (managerService.getByEmail(manager.getEmail()) == null) {
					managerService.save(manager);
					mav.addObject(
							"success",
							"<script type='text/javascript'>alert('提示信息：新增成功！');window.location.reload();</script>");
				} else {
					mav.addObject("msg", "该邮箱已被使用，请更换");
				}
			} else {
				mav.addObject("msg", "帐号已存在，请更换");
			}
		}
		return mav;
	}
	
	@RequestMapping(value = "/list/{pageNow}", method = RequestMethod.GET)
	public ModelAndView list(@PathVariable("pageNow") int pageNow) {
		ModelAndView mav =  new ModelAndView();
		Page page = new Page(pageNow,Page.DEFAUL_SIZE,managerService.getCount());
		List<Manager> managers = managerService.listPage(pageNow, Page.DEFAUL_SIZE);
		mav.addObject("manager", managers);
		mav.addObject("page", page);
		mav.setViewName("admin/manager/list");
		return mav;
	}
	
	@RequestMapping(value= "{id}/delete", method = RequestMethod.DELETE)
	@ResponseBody
	public ModelMap delete(@PathVariable("id") Long id) {
		ModelMap modelMap = new ModelMap();
		managerService.delete(id);
		modelMap.addAttribute("success", "true");
		return modelMap;
	}
	
	@RequestMapping(value = "/{id}/edit", method = RequestMethod.GET)
	public ModelAndView edit(@PathVariable("id") Long id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("manager", managerService.get(id));
		List<Role> roles = roleService.getAll();
		mav.addObject("role", roles);
		mav.setViewName("admin/manager/update");
		return mav;
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView update(Manager manager) {
		System.out.println("=============="+manager.getStatus());
		ModelAndView mav = new ModelAndView();
		managerService.update(manager);
		mav.addObject("success","<script type='text/javascript'>if (confirm('提示信息：保存成功, 是否返回友链列表 ？')) {location=window.location.href ='admin/manager/list/1'}</script>");
		Manager m = managerService.get(manager.getId());
		mav.addObject("manager", m);
		List<Role> roles = roleService.getAll();
		mav.addObject("role", roles);
		mav.setViewName("admin/manager/update");
		return mav;
	}
	
	@RequestMapping(value = "/reset", method = RequestMethod.GET)
	public String reset() {
		return "admin/manager/reset";
	}
	
	@RequestMapping(value = "/reset", method = RequestMethod.POST)
	public ModelAndView reset(Manager manager,String passwordOld) {
		ModelAndView mav = new ModelAndView();
		Manager managerDb = managerService.get(manager.getId());
		if(managerDb.getPassword().equals(passwordOld)) {
			managerService.resetPWD(manager);
			mav.addObject("success","<script type='text/javascript'>alert('提示信息：修改密码成功！');</script>");
		} else {
			mav.addObject("msg", "原始密码不正确");
		}
		mav.setViewName("admin/manager/reset");
		return mav;
	}

}
