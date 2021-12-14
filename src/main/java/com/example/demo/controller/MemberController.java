package com.example.demo.controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	@PostMapping("login")
	@ResponseBody
	public String login(HttpSession session,MemberVO memberVO) {
		System.out.println(memberVO);	
		JSONObject jo=new JSONObject();
		
		if(memberVO.getId() ==null || memberVO.getId().equals("") || 
				memberVO.getPw()==null || memberVO.getPw().equals("")) {
			jo.put("msg", "아이디와 비밀번호는 필수 항목입니다.");
			return jo.toJSONString();
		}
		
		
		try {
			MemberVO vo=memberService.login(memberVO);
			if(vo!=null) {
				session.setAttribute("memberVO", memberVO);			
				jo.put("id", vo.getId());
			}else {
				jo.put("msg", "아이디와 비밀번호를 확인해주세요");
			}
		}catch(DataAccessException e) {
			jo.put("msg", e.getMessage());
		}		
		
		return jo.toJSONString();
	}
	
	@PostMapping("logout")
	@ResponseBody
	public String logout(HttpSession session) {
		JSONObject jo=new JSONObject();
		
		try {
			session.invalidate();
			
			jo.put("msg", "완료");
		}catch(Exception e) {
			jo.put("msg", e.getMessage());
		}
		
		return jo.toJSONString();
	}

}

