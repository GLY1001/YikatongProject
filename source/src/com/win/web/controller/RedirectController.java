package com.win.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RedirectController {
	@GetMapping("/index.action")
	public String index(){
		return "index";
	}
	
	@GetMapping("/teacher.action")
	public String teacher(){
		return "teacher";
	}
	
	@GetMapping("/student.action")
	public String student(){
		return "student";
	}
	
	@GetMapping("/manager.action")
	public String search(){
		return "search";
	}
}
