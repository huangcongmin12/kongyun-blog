package net.kongyunblog.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.kongyunblog.domain.Manager;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


public class AuthInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception exception)
			throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		Manager manager = (Manager) request.getSession()
				.getAttribute("sessionManager");
		if (manager != null&& (manager.getRole().getRole().equals("manager") || manager
						.getRole().getRole().equals("admin"))) {
			return true;
		} else {
			request.getRequestDispatcher("/administrator/login").forward(request, response);
			return false;
		}
	}

}
