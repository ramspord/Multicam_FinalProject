package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {

	@RequestMapping("index")
	public String indexForm() {
		return "index";
	}
	
	@RequestMapping("adminPage")
	public String adminPage() {
		return "adminPage";
	}
	
	@RequestMapping("loginPage")
	public String loginPage() {
		return "login";
	}
	
	
	@RequestMapping("adminpage_summary")
	public String adminpage_summary() {
		return "adminPage_Summary";
	}
	

	
}
