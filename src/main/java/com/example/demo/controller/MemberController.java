package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.service.MemberService;
import com.example.demo.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
	@RequestMapping("login")
	public String login(MemberVO memberVO, RedirectAttributes rttr, HttpServletRequest req) {
		
		System.out.println("로그인값 " + memberVO);
		
		HttpSession session = req.getSession();
		MemberVO login = memberService.login(memberVO);
		System.out.println("로그인 가지온 값 " + login);
		
		if(login == null) {
			//System.out.println(login);
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			return "login";
		}else {
			session.setAttribute("member", login);
			System.out.println(login);
			return "index";
		}	
		
	}
	
}
