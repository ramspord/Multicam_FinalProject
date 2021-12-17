package com.example.demo.controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.MemberService;
import com.example.demo.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@PostMapping("memberInsert")
	public String memberInsert(HttpServletRequest request, MemberVO memberVO) {
		
		System.out.println("회원가입 폼 넘어온 값 "+memberVO);
		
		if(memberVO.getId() ==null || memberVO.getId().equals("") || 
				memberVO.getPw()==null || memberVO.getPw().equals("") 
				|| memberVO.getName()==null || memberVO.getName().equals("")) {
			
			return "바";
		}
		
		
		try {
			memberService.memberInsert(memberVO);
			return "index";
		}catch(DataAccessException e) {
			return "ok";
		}
	}
	
	@RequestMapping(value="login")
	public String login(HttpServletRequest request, HttpSession session,MemberVO memberVO ) {
		System.out.println(memberVO);
		session = request.getSession();
		JSONObject jo=new JSONObject();
		
		if(memberVO.getId() ==null || memberVO.getId().equals("") || 
				memberVO.getPw()==null || memberVO.getPw().equals("")) {
			jo.put("msg", "id와 pw는 필수입니다");
			return jo.toJSONString();
		}
		
		try {
			MemberVO vo=memberService.login(memberVO);
			System.out.println("ASD");
			System.out.println("vo :"+vo);
			if(vo!=null) {
				session.setAttribute("memberVO", vo);
				jo.put("id", vo.getId());
				jo.put("pw", vo.getPw());
				jo.put("user_type", vo.getUser_type());
				if(jo.size()>0) {
					return "redirect:/";
				}
			}else {
				jo.put("msg", "id와 pw를 확인하세요");
			}
		}catch(DataAccessException e) {
			System.out.println("zxc");
			jo.put("msg", e.getMessage());
		}		
		
		return jo.toJSONString();
	}
	
	@PostMapping("logout")
	public String logout(HttpSession session) {
		JSONObject jo=new JSONObject();
		
		try {
			session.invalidate();
			
			return "redirect:/";
		}catch(Exception e) {
			jo.put("msg", e.getMessage());
		}
		
		return jo.toJSONString();
	}

}
