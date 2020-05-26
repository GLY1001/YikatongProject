package com.win.web.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.io.ResolverUtil.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.win.po.Manager;
import com.win.po.User;
import com.win.service.ManagerService;
import com.win.service.UserService;
/*
 * 登录controller类
 */
@Controller
public class UserController {
	
	//依赖注入
	@Autowired
	private UserService userService;
	
	@Autowired
	private ManagerService managerService;
	
	/**
	 * 用户登录：判断用户权限登录，普通用户和管理员
	 */
	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public String login(String username, String password, Model model, HttpSession session, 
			HttpServletRequest request){
		
		try {//传值的编码格式
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String kind = request.getParameter("kind"); //获取登录页用户类别，管理员/普通用户
		System.out.println(kind);
		if(kind.equals("普通用户")){
			// 普通用户方法
			User user = userService.findUser(username, password);
			if(user != null ){
				// 将用户对象添加到Session
				session.setAttribute("USER_SESSION", user);
				session.setAttribute("PASSWORD_SESSION", password);
				request.getSession().setAttribute("sfrzh", password);//获取密码的session
				//跳转到普通用户的个人信息页
				return "commonuser";
			}
			
		}else if (kind.equals("管理员")) {
			//管理员方法
			Manager manager = managerService.findManager(username, password);
			if(manager != null){
				session.setAttribute("manageruser", manager);
				session.setAttribute("PASSWORD_SESSION", password);
				return "index"; //跳转到首页
			}
		}
		//若登录密码或账号错误，向登录页传错误信息提示
		model.addAttribute("msg", "账号或密码错误，请重新输入！");
        // 返回到登录页面
		return "login";
	}
	
	/**
	 * 退出登录
	 */
	@RequestMapping(value = "/logout.action")
	public String logout(HttpSession session) {
	    // 清除Session
	    session.invalidate();
	    // 重定向到登录页面的跳转方法
	    return "redirect:login.action";
	}
	/**
	 * 向用户登陆页面跳转
	 */
	@RequestMapping(value = "/login.action", method = RequestMethod.GET)
	public String toLogin() {
	    return "login";
	}

}
