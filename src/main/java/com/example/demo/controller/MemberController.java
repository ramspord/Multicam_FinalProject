package com.example.demo.controller;

import java.util.Random;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.MemberService;
import com.example.demo.service.UserSha256;
import com.example.demo.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@PostMapping("contact")
	public String contact(HttpServletRequest request, MemberVO memberVO) {  
		
		System.out.println("회원가입 폼 넘어온 값 "+memberVO);
		
		String encryPassword = UserSha256.encrypt(memberVO.getPw());
		memberVO.setPw(encryPassword);
		System.out.println(memberVO.getPw());
		
	
		
		if(memberVO.getId() ==null || memberVO.getId().equals("") || 
				memberVO.getPw()==null || memberVO.getPw().equals("") 
				|| memberVO.getName()==null || memberVO.getName().equals("")) {
			System.out.println("여기서 오류");
			return "바";
		}
		
		
		try {
			memberService.contact(memberVO);
			return "index";
		}catch(DataAccessException e) {
			System.out.println(e.getMessage());
			return "ok";
		}
	}
	
	@PostMapping("login")
	public String login(HttpServletRequest request, HttpSession session,MemberVO memberVO) {
		session = request.getSession();
		System.out.println("login memberVO " + memberVO);	
		JSONObject jo=new JSONObject();
		
		if(memberVO.getId() ==null || memberVO.getId().equals("") || 
				memberVO.getPw()==null || memberVO.getPw().equals("")) {
			jo.put("msg", "아이디와 비밀번호는 필수 항목입니다.");
			return jo.toJSONString();
		}
		
		String encryPassword = UserSha256.encrypt(memberVO.getPw());
		memberVO.setPw(encryPassword);
		System.out.println(memberVO.getPw());
		
		try {
			MemberVO vo=memberService.login(memberVO);
			if(vo!=null) {
				session.setAttribute("memberVO", vo);
				System.out.println("vo "+vo);
				jo.put("id", vo.getId());
				jo.put("pw", vo.getPw());
				if(jo.size()>0) {
					return "redirect:/";	
				}
			}else {
				jo.put("msg", "아이디와 비밀번호를 확인해주세요");
			}
		}catch(DataAccessException e) {
			System.out.println(e.getMessage());
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

	@RequestMapping("/")
	public String main(HttpServletRequest request, HttpSession session, ModelMap model, MemberVO memberVO) {
		session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("memberVO");
		System.out.println("index.do memberVO : "+ memberVO);
		if(memberVO== null ) {
			model.addAttribute("loginSign", "N");
		}else {
			model.addAttribute("loginSign", "Y");
			model.addAttribute("session", memberVO.getId());
		}
		return "index";
	}

	 private String certified_key() {
			Random random = new Random();
			StringBuffer sb = new StringBuffer();
			int num = 0;

			do {
				num = random.nextInt(75) + 48;
				if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
					sb.append((char) num);
				} else {
					continue;
				}

			} while (sb.length() < 10);
			return sb.toString();
		}

}

