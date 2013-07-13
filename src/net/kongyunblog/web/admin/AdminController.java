package net.kongyunblog.web.admin;

import javax.servlet.http.HttpServletRequest;

import net.kongyunblog.domain.Manager;
import net.kongyunblog.service.ManagerService;
import net.kongyunblog.tools.EmailHelper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


/**
 * AdminController
 * @author huangcongmin
 * @date 2013-3-13
 */
@Controller
@RequestMapping("/")
public class AdminController {
	
	@Autowired private ManagerService managerService;
	
	@RequestMapping(value = "administrator/login", method = RequestMethod.GET)
	public String login() {
		return "admin/login";
	}
	
	/**
	 * 用户登录
	 * @author huangcongmin
	 * @date 2013-3-14
	 * @param email
	 * @param password
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "administrate/login", method = RequestMethod.POST)
	public ModelAndView login(@RequestParam("email") String email, 
			@RequestParam("password") String password, HttpServletRequest request)  {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/login");
		if(email==null||email=="") {
			mav.addObject("msg", "邮箱/登陆账号不能为空");
			return mav;
		} 
		if(password==null||password=="") {
			mav.addObject("msg", "登录密码不能为空");
			return mav;
		}
		if(EmailHelper.emailFormat(email)) {
			if(managerService.loginByEmail(email, password)) {
				Manager manager = managerService.getByEmail(email);
				request.getSession().setAttribute("sessionManager", manager);
				mav.setViewName("admin/index");
			}
			else {
				mav.addObject("msg", "邮箱或密码不正确");
			}
		}
		else {
			if(managerService.loginByName(email, password)) {
				Manager m = managerService.getByName(email);
				request.getSession().setAttribute("sessionManager", m);
				mav.setViewName("admin/index");
			}
			else {
				mav.addObject("msg", "帐号或密码不正确");
			}
		}
		return mav;
	}
	
	
	/**
	 * 注销登录
	 * @author huangcongmin
	 * @date 2013-3-14
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "admin/loginOut", method = RequestMethod.GET)
	public String loginOut(HttpServletRequest request) {
		request.getSession().removeAttribute("sessionManager");
		return "admin/login";
	}
	
}
