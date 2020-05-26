package com.win.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.win.po.Manager;
import com.win.po.User;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub
		// 获取请求的URL
		String url = request.getRequestURI();
		// URL:除了登录请求外，其他的URL都进行拦截控制
		//普通用户
		if (url.indexOf("/login.action") >= 0) {
			return true;
		}
		
		// 获取Session
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("USER_SESSION");
		Manager manager = (Manager) session.getAttribute("manageruser");
		// 判断Session中是否有用户数据，如果有，则返回true,继续向下执行
		if (user != null) {
			return true;
		}
		if(manager != null){
			return true;
		}
		// 不符合条件的给出提示信息，并转发到登录页面
		request.setAttribute("msg", "您还没有登录，请先登录！");
		request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
		return false;
	}

}
