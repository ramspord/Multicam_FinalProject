package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {

	/*
	 * @RequestMapping("index") public String index() { return "index"; }
	 */
	
	@RequestMapping("loginPage")
	public String loginPage() {
		return "login";
	}
	
}
